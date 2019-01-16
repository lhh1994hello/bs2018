//创建时间：2018年3月30日,下午4:36:24
package com.huat.bs.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.huat.bs.bean.Category;
import com.huat.bs.bean.CategoryExample;
import com.huat.bs.bean.CategoryExample.Criteria;
import com.huat.bs.bean.Menu;
import com.huat.bs.bean.MenuExample;
import com.huat.bs.dao.CategoryMapper;
import com.huat.bs.dao.MenuMapper;
import com.huat.bs.redis.JedisClient;
import com.huat.bs.util.RedisUtilsIO;

@Service
@SuppressWarnings("all")
public class CategoryService extends RedisUtilsIO<Category> {
	// 有效的菜品数据
	private static final String categoryListActive="categoryListActive";
	private static final String categoryListActiveWithParam="categoryListActiveWithParam";
	private static final String categoryListNoCare="categoryListNoCare";
	@Autowired
	private MenuService menuService;
 	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private MenuMapper menuMapper;

	@Autowired
	private JedisClient jedisClient;
	@Value("${INDEX_CONTENT_REDIS_KEY}")
	private String INDEX_CONTENT_REDIS_KEY;

	// 查询所有菜品分类,只查有效的
	public List<Category> getAllCategoryWithState() {
		/*List<Category> listfromRedis = getListfromRedis(jedisClient, INDEX_CONTENT_REDIS_KEY, categoryListActive);
		if(listfromRedis!=null&&listfromRedis.size()>0){
			return listfromRedis;
		}*/
		// 应该根据分类号的装填进行查询，
		CategoryExample example = new CategoryExample();
		Criteria criteria = example.createCriteria();
		criteria.andCstateEqualTo(1);
		List<Category> cateGoryList = categoryMapper.selectByExample(example);
		/*if(cateGoryList!=null&&cateGoryList.size()>0){
			String jsonString = JSON.toJSONString(cateGoryList);
			setToRedisList(jedisClient, INDEX_CONTENT_REDIS_KEY, categoryListActive, jsonString);	
		}*/
		return cateGoryList;
	}

	// 查询所有菜品分类,只查有效的,和上边功能一样，
	public List<Category> getAllCategoryWithState(Integer cstate) {
		/*List<Category> listfromRedis = getListfromRedis(jedisClient, INDEX_CONTENT_REDIS_KEY, categoryListActiveWithParam);
		if(listfromRedis!=null&&listfromRedis.size()>0){
			return listfromRedis;
		}*/
		// 应该根据分类号的装填进行查询，
		CategoryExample example = new CategoryExample();
		Criteria criteria = example.createCriteria();
		criteria.andCstateEqualTo(cstate);
		List<Category> cateGoryList = categoryMapper.selectByExample(example);
		/*if(cateGoryList!=null&&cateGoryList.size()>0){
			String jsonString = JSON.toJSONString(cateGoryList);
			setToRedisList(jedisClient, INDEX_CONTENT_REDIS_KEY, categoryListActiveWithParam, jsonString);
		}*/
		return cateGoryList;
	}

	// 查询所有分类，
	public List<Category> getAllCategoryList() {
		/*List<Category> listfromRedis = getListfromRedis(jedisClient, INDEX_CONTENT_REDIS_KEY, categoryListNoCare);
		if(listfromRedis!=null&&listfromRedis.size()>0){
			return listfromRedis;
		}*/
		List<Category> categoryList = categoryMapper.selectByExample(null);

		// 遍历，为每个订单分类添加菜信息
		for (Category category : categoryList) {
			List<Menu> menuList = getMenuListByCid(category.getCid());
			category.setMenucount(menuList.size());
			System.out.println("菜单列表：" + menuList);
			category.setMeunList(menuList);
		}
		System.out.println("查看一下：" + categoryList);
		/*if(categoryList!=null&&categoryList.size()>0){
			String jsonString = JSON.toJSONString(categoryList);
			setToRedisList(jedisClient, INDEX_CONTENT_REDIS_KEY, categoryListNoCare, jsonString);
		}*/
		return categoryList;
	}
	// 按分类号查询出菜单

	public List<Menu> getMenuListByCid(Integer cid) {
		// menuMapper
		MenuExample example = new MenuExample();
		com.huat.bs.bean.MenuExample.Criteria criteria = example.createCriteria();
		criteria.andMcIdEqualTo(cid);
		return menuMapper.selectByExample(example);
	}

	// 按主键查询
	public Category getCategory(Integer cid) {
		/*Category beanfromRedis = getBeanfromRedis(jedisClient, INDEX_CONTENT_REDIS_KEY, cid+"");
		if(beanfromRedis!=null){
			return beanfromRedis;
		}*/
		Category category = categoryMapper.selectByPrimaryKey(cid);
		/*if(category!=null){
			String jsonString = JSONObject.toJSONString(category);
			setToRedisList(jedisClient, INDEX_CONTENT_REDIS_KEY, cid+"", jsonString);
		}*/
		return category;
	}

	// 按名称查询
	public Category getCategoryListByCname(String cname) {
		CategoryExample example = new CategoryExample();
		Criteria criteria = example.createCriteria();
		criteria.andCnameEqualTo(cname);
		List<Category> cateGoryList = categoryMapper.selectByExample(example);
		if (cateGoryList.size() > 0) {
			return cateGoryList.get(0);
		}
		return null;
	}

	// 修改分类
	public void updateCategory(Category category) {
		//删除缓存
/*		jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, categoryListActive);
		jedisClient.hdel(INDEX_CONTENT_REDIS_KEY,categoryListActiveWithParam);
		jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, categoryListNoCare);*/
 		categoryMapper.updateByPrimaryKeySelective(category);
	}

	// 插入数据
	public void insertCategory(Category category) {
	/*	jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, categoryListActive);
		jedisClient.hdel(INDEX_CONTENT_REDIS_KEY,categoryListActiveWithParam);
		jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, categoryListNoCare);*/
		// TODO Auto-generated method stub
		category.setCreatetime(new Date());
		categoryMapper.insertSelective(category);
	}

}
