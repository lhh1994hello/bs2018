//创建时间:2018年4月27日 下午9:40:56 
package com.huat.bs.controller;

import java.util.List;

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

@Controller
public class CategoryController {
	@Autowired
	private CategoryService categoryService;

	// AJAX请求，查询出所有有效的分类:不进行分页
	@ResponseBody
	@RequestMapping(value = "/getCategoryWithAjax", method = RequestMethod.GET)
	public List<Category> getCategoryWithAjax() {
		List<Category> categoryList = categoryService.getAllCategoryWithState();
		return categoryList;
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
		// return "adminpage/menu/category";
		// return "adminpage/menu/layui1";
		//return "adminpage/menu/layUIcategory";
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
}
