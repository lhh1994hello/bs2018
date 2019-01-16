//创建时间:2018年4月27日 下午10:01:15 
package com.huat.bs.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.huat.bs.bean.Category;
import com.huat.bs.bean.Menu;
import com.huat.bs.bean.Msg;
import com.huat.bs.bean.User;
import com.huat.bs.service.CategoryService;
import com.huat.bs.service.MenuService;
import com.huat.bs.util.FtpUtil;
import com.huat.bs.util.NumberUtils;

import cn.itcast.commons.CommonUtils;

@Controller
@SuppressWarnings("all")
public class MenuController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private MenuService menuService;
	
	@RequestMapping(value = "/addMenuWithAjax", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg addMenuWithAjax(Menu form){
		System.out.println("添加菜品,异步");
		if(form==null){
			Msg.fail().add("msg", "对象为空");
		}
		System.out.println("表单数据:"+form);
		menuService.adminAddMenu(form);
		return Msg.Success().add("msg", "");
	}
	
	// 校验菜名是否已经被使用
	@RequestMapping(value = "/findMenuByName", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg findMenuListByName(String mname) {
		if (StringUtils.isBlank(mname)) {
			return Msg.fail().add("msg", "参数为空");
		}
		List<Menu> menuList = menuService.findMenuByName(mname);
		if(menuList.size()>0){
			return Msg.fail().add("msg", "菜名已被使用");
		}
		return Msg.Success().add("msg", "");
	}

	// 添加菜品，预先加载图片
	@RequestMapping(value = "/addMenuImage", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg addMenuImage(MultipartFile file, HttpServletRequest request, Menu form) throws IOException {
		System.out.println("上传图片实现预览");
		if (file == null) {
			System.out.println("file为空了...");
			return Msg.fail();
		}
		String filename = file.getOriginalFilename();
		boolean suffixFlag = NumberUtils.judgeImageSuffix(filename);
		if (!suffixFlag) {
			return Msg.fail().add("msg", "上传的不是图片");
		}
		filename = NumberUtils.getImageName() + "_" + filename;
		FtpUtil.uploadFile("localhost", 21, "ftp", "123", "/", "/menuImage/", filename, file.getInputStream());
		form.setImage("http://localhost/menuImage/" + filename);
		System.out.println("数据库图片路径:" + form.getImage());
		return Msg.Success().add("menu", form);
	}

	// 查询出所有的有效的分类
	@ResponseBody
	@RequestMapping(value = "/findCategoryListWithAjax", method = { RequestMethod.POST, RequestMethod.GET })
	public Msg findCategoryListWithAjax(@RequestParam(value = "cid", defaultValue = "1") Integer cstate) {
		System.out.println("AJAX查询出所有有效的分类...." + cstate);
		List<Category> categoryList = categoryService.getAllCategoryWithState(cstate);
		return Msg.Success().add("categoryList", categoryList);
	}

	// 根据id查询菜单
	@ResponseBody
	@RequestMapping(value = "/getMenu/{mid}", method = RequestMethod.GET)
	public Msg getMenu(@PathVariable("mid") String mid) {
		Menu menu = menuService.getMenuById(mid);
		System.out.println("测试数据；" + menu);
		return Msg.Success().add("menu", menu);
	}

	// 修改菜单
	@RequestMapping(value = "/updateMenu/{mid}", method = RequestMethod.POST)
	@ResponseBody
	public Msg updateMenu(MultipartFile file, HttpServletRequest request, Menu form) throws IOException {
		System.out.println("更新菜单：" + form);
		System.out.println("测试file：" + file);
		String filename = file.getOriginalFilename();
		System.out.println("文件名：" + filename);
		if (filename != null && !filename.equals("")) {
			// 上传了文件
			System.out.println("修改....................................");
			savaFile(file, request, filename);
			form.setImage(request.getContextPath() + "/" + "images" + "/" + "menu" + "/" + filename);
		}
		menuService.updateMenu(form);
		return Msg.Success();
	}

	// 查看菜单，查看所有
	@RequestMapping("/adminLookMenu")
	public String adminLookMenu(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			HttpServletRequest request) {
		System.out.println("页号：" + pn);
		// 为空就查询所有
		PageHelper.startPage(pn, 8);// 分页，8代表每页显示的条目数量
		List<Menu> menuList = menuService.adminLookMenu();
		System.out.println("SSSS查询结果：" + menuList);
		// 对分页信息包装,5代表导航条只显示5个
		PageInfo pageInfo = new PageInfo(menuList, 5);
		request.setAttribute("pageInfo", pageInfo);// 分页信息
		return "adminpage/menu/HuiListMenu";
	}

	//
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

	// 到添加页面
	@RequestMapping("/adminToAddMenu")
	public String adminToAddMenu(HttpServletRequest request) {
		System.out.println("添加菜品....");
		// 先把菜单分类查询出来，放到下拉列表中
		List<Category> allCategory = categoryService.getAllCategoryWithState();
		request.setAttribute("allCategory", allCategory);
		System.out.println("所有分类：" + allCategory);
		// return "adminpage/menu/addmenu";
		// return "adminpage/menu/layUIaddMenu";
		return "adminpage/menu/HuiaddMenu";
	}

	// AJAX方式获得分类信息，
	@RequestMapping("/getAllCategory")
	@ResponseBody
	public Msg getAllCategoryByState() {
		List<Category> allCategory = categoryService.getAllCategoryWithState();
		return Msg.Success().add("categoryList", allCategory);
	}

	// 添加菜单
	@RequestMapping("/adminAddMenu")
	public String adminAddMenu(MultipartFile file, HttpServletRequest request, Menu form, ModelAndView modelAndView)
			throws IOException {
		String filename = file.getOriginalFilename();
		if (filename == null || filename.equals("")) {
			System.out.println("没有选择图片....");
			request.setAttribute("msg", "请选择图片");
			List<Category> allCategory = categoryService.getAllCategoryWithState();
			request.setAttribute("allCategory", allCategory);
			return "adminpage/menu/addmenu";
		}
		System.out.println("文件名：" + filename);
		// 增加前缀，防止重复
		filename = CommonUtils.uuid().substring(0, 8) + "_" + filename;
		// 把数据放大数据库中
		savaFile(file, request, filename);
		form.setImage(request.getContextPath() + "/" + "images" + "/" + "menu" + "/" + filename);
		menuService.adminAddMenu(form);
		return "redirect:/adminLookMenu";
	}

	// 保存文件到项目和Tomcat下，其实保存到项目下就行，但是不能保存到Tomcat下，Tomcat一重启就丢了
	public void savaFile(MultipartFile file, HttpServletRequest request, String filename) throws IOException {
		String realPath = request.getSession().getServletContext().getRealPath("/images/menu");
		String path = request.getServletContext().getRealPath("/images/menu");

		InputStream is = file.getInputStream();
		byte[] bs = new byte[1024];
		int len = 0;
		System.out.println("测试realPath:" + realPath);
		// String absolutepath =
		// "D:/Java/Data-Mar2/onlingOrderSys/src/main/webapp/images/menu";
		String absolutepath = "D:\\Java\\Data-Mar3\\onlingOrderSys\\src\\main\\webapp\\images\\menu";
		System.out.println("path:       " + path);
		System.out.println("absolutepath:" + absolutepath);
		OutputStream os = new FileOutputStream(absolutepath + "\\" + filename);// 往项目下上传图片
		OutputStream os_Tomcat = new FileOutputStream(new File(realPath + "\\" + filename));// 往tomcat下上传图片

		while ((len = is.read(bs)) != -1) {
			os.write(bs, 0, len);
			os_Tomcat.write(bs, 0, len);
		}
		os.flush();
		os_Tomcat.flush();
		os_Tomcat.close();
		os.close();
		is.close();
	}

}
