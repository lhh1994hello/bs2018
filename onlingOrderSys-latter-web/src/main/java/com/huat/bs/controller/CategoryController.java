//创建时间:2018年4月27日 下午10:03:29 
package com.huat.bs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.huat.bs.bean.Msg;
import com.huat.bs.service.CategoryService;
import com.huat.bs.service.MenuService;

@Controller
@SuppressWarnings("all")
public class CategoryController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private MenuService menuService;
	//获得
	@ResponseBody
	@RequestMapping(value = "/findAllCateToMap", method = {RequestMethod.POST,RequestMethod.GET})
	public Msg findAllCateToMap() {
		List<Category> categoryList = categoryService.getAllCategoryList();
		Map<String,Object> map=new HashMap<String,Object>();
		for(Category category:categoryList){
			map.put(category.getCname(),category.getMenucount());
		}
		
		return Msg.Success().add("map", map);
	}

	// 添加新的分类
	@ResponseBody
	@RequestMapping(value = "/addCategory", method = RequestMethod.POST)
	public Msg addCategory(Category category) {
		categoryService.insertCategory(category);
		return Msg.Success();
	}

	// 查询出所有,
	@SuppressWarnings("all")
	@RequestMapping("/getCategoryList")
	public String getAllCategory(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			HttpServletRequest request) {
		PageHelper.startPage(pn, 5);
		List<Category> categoryList = categoryService.getAllCategoryList();
		PageInfo pageInfo = new PageInfo(categoryList, 5);
		request.setAttribute("pageInfo", pageInfo);
		return "adminpage/menu/Huicategory";
	}
	// 需要实现，给出一个分类ID,返回这个分类下得菜数量
	// 按cid查询

	@RequestMapping(value = "/getCategory/{cid}", method = RequestMethod.GET)
	@ResponseBody
	public Msg getCategory(@PathVariable("cid") Integer cid) {
		Category category = categoryService.getCategory(cid);
		return Msg.Success().add("category", category);
	}

	// 按cname名称查询
	@ResponseBody
	@RequestMapping(value = "checkcname", method = RequestMethod.POST)
	public Msg checkCname(@RequestParam("cname") String cname) {
		Category category = categoryService.getCategoryListByCname(cname);
		System.out.println("category查询出来的：" + category);
		if (category != null) {
			return Msg.fail().add("va_msg", "后台校验_用户名已存在");
		} else {
			return Msg.Success();
		}

	}

	// 更新数据
	@ResponseBody
	@RequestMapping(value = "/updateCategory", method = RequestMethod.POST)
	public Msg updateCategory(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Category category) {
		System.out.println("修改 测试一下数据：" + category);
		categoryService.updateCategory(category);
		return Msg.Success();
	}
}
