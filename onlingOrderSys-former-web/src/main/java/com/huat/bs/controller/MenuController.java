package com.huat.bs.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.huat.bs.bean.Category;
import com.huat.bs.bean.Menu;
import com.huat.bs.bean.Msg;
import com.huat.bs.bean.User;
import com.huat.bs.service.CategoryService;
import com.huat.bs.service.MenuService;

@Controller
@SuppressWarnings("all")
public class MenuController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private MenuService menuService;

	@RequestMapping(value = "/menuTest", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String test() {
		System.out.println("测试一下。。。。");
		return "测试一下：";
	}

	//前台首页综合搜索功能
	@ResponseBody
	@RequestMapping(value = "/searchMenuWithAjax", method = {RequestMethod.GET,RequestMethod.POST})
	public Msg searchMenuWithAjax(@RequestParam(value="context",defaultValue="")String context,HttpServletRequest request,
			@RequestParam(value="pn",defaultValue="1")Integer pn){
		//如果是get请求，就先转码(中文乱码)
		String method = request.getMethod();
		//System.out.println("请求方式:"+method);
 		if(method.equalsIgnoreCase("GET")){
			try {
				context=new String(context.getBytes("ISO-8859-1"), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				//e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
		//System.out.println("搜索:"+context+",pn:"+pn);
		if(StringUtils.isBlank(context)){
			return Msg.fail().add("msg", "查询条件为空!");
		}
		
		//先不分页了
		PageHelper.startPage(pn, 5);
		List<Menu> menuList=menuService.searchMenuList(context);
		PageInfo pageInfo=new PageInfo<>(menuList, 5);
		if(menuList!=null){
			int num=menuList.size();
			//System.out.println("集合长度:"+num);
		}
		//System.out.println("查询结果:"+menuList);
		return Msg.Success().add("pageInfo", pageInfo);
	}
	
	// 根据分类号查询菜单，如果分类号为空，就查询所有
	@ResponseBody
	@RequestMapping(value = "/findMenuByCategory", method = {RequestMethod.GET,RequestMethod.POST})
	public Msg findMenuByCategory(@RequestParam(value = "orderbySome", defaultValue = "createtime") String orderbySome,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "cid", defaultValue = "-100") Integer cid, HttpServletResponse response,
			@RequestParam(value = "mid", defaultValue = "-100") String mid,
			HttpServletRequest request) {
		System.out.println("分类号：" + cid + ",分页号:" + pn+",菜品ID:"+mid);
		User user= (User) request.getSession().getAttribute("session_user");
		String uid="";
		if(user!=null) uid=user.getuId();
		//System.out.println("排序依据:" + orderbySome);
		PageHelper.startPage(pn, 8);// 分页，8代表每页显示的条目数量
		List<Menu> menuList=null;
		if(mid.equals("-100")){
 			menuList = menuService.adminLookMenu(cid, orderbySome,uid);
		}else{
			System.out.println("按ID查询");
 			menuList=menuService.findMenuByMid(mid);
		}
		
		
		// menuList = menuService.adminLookMenu(cid, orderbySome);
		System.out.println("查询结果:"+menuList);
		PageInfo pageInfo = new PageInfo(menuList, 5);
		return Msg.Success().add("pageInfo", pageInfo);
	}

	// 根据id查询菜单
	@ResponseBody
	@RequestMapping(value = "/getMenu/{mid}", method = RequestMethod.GET)
	public Msg getMenu(@PathVariable("mid") String mid) {
		Menu menu = menuService.getMenuById(mid);
		System.out.println("测试数据；" + menu);
		return Msg.Success().add("menu", menu);
	}

	// 查看菜单，按分类号查询
	@RequestMapping("/adminLookMenuByCid")
	public String adminLookMenuByCid(
			@RequestParam(value = "orderbySome", defaultValue = "createtime") String orderbySome,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn, Integer mcId, HttpServletRequest request) {
		System.out.println("页号：" + pn + ":分类号：" + mcId);
		PageHelper.startPage(pn, 8);
		String uid="";
		List<Menu> menuList = menuService.adminLookMenu(mcId, orderbySome,uid);
		System.out.println("查询结果：" + menuList);
		PageInfo pageInfo = new PageInfo(menuList, 5);
		request.setAttribute("pageInfo", pageInfo);
		return "adminpage/menu/listmenu";
	}

	// AJAX方式获得分类信息，
	@RequestMapping("/getAllCategory")
	@ResponseBody
	public Msg getAllCategoryByState() {
		List<Category> allCategory = categoryService.getAllCategoryWithState();
		return Msg.Success().add("categoryList", allCategory);
	}
}
