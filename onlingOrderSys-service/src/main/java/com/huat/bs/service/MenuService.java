//创建时间：2018年3月30日,下午9:47:18
package com.huat.bs.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.huat.bs.bean.Category;
import com.huat.bs.bean.Collects;
import com.huat.bs.bean.CollectsExample;
import com.huat.bs.bean.Menu;
import com.huat.bs.bean.MenuExample;
import com.huat.bs.bean.MenuExample.Criteria;
import com.huat.bs.bean.Orderitem;
import com.huat.bs.dao.CategoryMapper;
import com.huat.bs.dao.CollectsMapper;
import com.huat.bs.dao.MenuMapper;
import com.huat.bs.dao.UserMapper;
import com.huat.bs.redis.JedisClient;
import com.huat.bs.util.RedisUtilsIO;

import cn.itcast.commons.CommonUtils;

@Service
@SuppressWarnings("all")
public class MenuService extends RedisUtilsIO<Menu> {
	@Autowired
	private MenuMapper menuMapper;
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private CollectsMapper collectsMapper;
	
	@Autowired
	private JedisClient jedisClient;
	@Value("${INDEX_CONTENT_REDIS_KEY}")
	private String INDEX_CONTENT_REDIS_KEY;

	// 添加菜品
	public void adminAddMenu(Menu form) {

		System.out.println("查看数据：" + form);
		// 设置主键
		form.setMid(CommonUtils.uuid().substring(0, 8));
		form.setCreatetime(new Date());
		form.setSalecount(0);
		form.setMstate(1);
		menuMapper.insertSelective(form);
		System.out.println("插入成功");
	}

	// 查询所有菜单
	public List<Menu> adminLookMenu() {
		MenuExample example = new MenuExample();
		example.setOrderByClause("createtime desc");
		return menuMapper.selectByExample(example);
	}

	// 查询菜谱，按分类号,以及订单状态
	public List<Menu> adminLookMenu(Integer mcId, String orderbySome, String uid) {
		// 分类号
		MenuExample example = new MenuExample();
		Criteria criteria = example.createCriteria();
		// 排序，选择对结果按哪个字段进行升序或降序排序
		// Star传过来是想查询出所有的被收藏菜品，不能进行排序
		String Star = "";
		if (orderbySome.equals("Star")) {
			System.out.println("Star..........................................");
			if (StringUtils.isBlank(uid))
				return null;
			return findStarMenuList(uid);
			/*
			 * Star=orderbySome; orderbySome="createtime";
			 */

		}
		System.out.println("service排序依据：" + orderbySome);
		if (StringUtils.isBlank(orderbySome)) {
			example.setOrderByClause("createtime desc");
		} else {
			example.setOrderByClause(orderbySome + "  desc");
		}

		// 订单状态，只查询状态为1的
		criteria.andMstateEqualTo(1);
		// 这里开始执行查询我的收藏
		if (orderbySome.equals("Star")) {
			if (StringUtils.isBlank(uid))
				return null;

		}
		if (mcId == null || mcId.equals("") || mcId == -100) {
			// 按状态查询
			System.out.println("按状态查询：" + mcId);
			return menuMapper.selectByExample(example);
		} else {
			// 同时按状态和分类号查询
			criteria.andMcIdEqualTo(mcId);
			System.out.println("按状态和分类查询：" + mcId);
			return menuMapper.selectByExample(example);
		}

	}

	// 查询被该用户收藏的菜品
	public List<Menu> findStarMenuList(String uid) {
		System.out.println("进入被收藏列表调用的方法....");
		CollectsExample example1 = new CollectsExample();
		CollectsExample.Criteria criteria1 = example1.createCriteria();
		criteria1.andUidEqualTo(uid);
		List<Collects> collectList = collectsMapper.selectByExample(example1);
		List<String> mids = new ArrayList<String>();
		for (Collects c : collectList) {
			if (c == null)
				break;
			// 先查询
			Integer cstate = c.getCstate();
			if (cstate == 1) {
				System.out.println("被收藏的列表");
				mids.add(c.getMid());
			}
		}
		MenuExample example2 = new MenuExample();
		Criteria criteria2 = example2.createCriteria();
		criteria2.andMstateEqualTo(1);// 只查询菜单状态为1的
		example2.setOrderByClause("createtime desc");
		criteria2.andMidIn(mids);
		List<Menu> menuList = menuMapper.selectByExample(example2);
		return menuList;
	}

	// 按主键查询菜单
	public Menu getMenuById(String mid) {
		return menuMapper.selectByPrimaryKey(mid);
	}

	// 更新单个菜单
	public void updateMenu(Menu menu) {
		System.out.println("更新菜单");
		menuMapper.updateByPrimaryKeySelective(menu);
	}

	// 批量更新菜品信息
	public void updateMenu(List<Orderitem> orderItemList) {
		for (Orderitem orderItem : orderItemList) {
			Menu menu = orderItem.getMenu();
			menu.setSalecount(menu.getSalecount() + orderItem.getCount());
			updateMenu(menu);
		}

	}

	// 按名称查询菜品
	public List<Menu> findMenuByName(String mname) {
		MenuExample example = new MenuExample();
		Criteria criteria = example.createCriteria();
		criteria.andMnameEqualTo(mname);
		List<Menu> menuList = menuMapper.selectByExample(example);
		return menuList;
	}

	// 查询
	public List<Menu> searchMenuList(String context) {
		if (StringUtils.isBlank(context)) {
			return null;
		}
		MenuExample example = new MenuExample();
		example.setOrderByClause("mid desc");
		Criteria criteria = example.createCriteria();
		criteria.andMnameLike("%" + context + "%");
		List<Menu> menuList = menuMapper.selectByExample(example);
		return menuList;
	}

	// 根据菜单Id获得记录，要求返回一个集合
	public List<Menu> findMenuByMid(String mid) {
		Menu menu = menuMapper.selectByPrimaryKey(mid);
		List<Menu> menuList = new ArrayList<Menu>();

		if (menu != null) {
			menuList.add(menu);
			for (Menu m : menuList) {
				System.out.println("获得菜单所属的分类，，，进来没...");
				if (m == null) {
					break;
				}
				Category category = categoryMapper.selectByPrimaryKey(m.getMcId());
				m.setCategory(category);
			}
			return menuList;
		}
		return null;
	}

}
