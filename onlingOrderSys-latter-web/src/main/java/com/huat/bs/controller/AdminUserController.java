//创建时间:2018年5月20日上午10:45:26
//用户:lihonghui
package com.huat.bs.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.huat.bs.bean.AdminUser;
import com.huat.bs.bean.UserException;
import com.huat.bs.service.AdminUserService;
@Controller
public class AdminUserController {
	@Autowired
	private AdminUserService adminUserService;
	// 后台管理员登录
	@RequestMapping(value = "/adminLogin", method = { RequestMethod.POST, RequestMethod.GET })
	public String adminLogin(AdminUser form, HttpServletRequest request) {
		System.out.println("后台管理员登录.........................");
		if (form == null) {
			request.setAttribute("msg", "错误");
			return "adminpage/user/login";
		}
		System.out.println("表单数据:" + form);
		String loginid = form.getLoginid();
		String password = form.getPassword();
		if (StringUtils.isBlank(loginid) || StringUtils.isBlank(password)) {
			request.setAttribute("msg", "信息不全");
			return "adminpage/user/login";
		}
		String session_vercode = (String) request.getSession().getAttribute("verifCode");
		System.out.println("域中的验证码:" + session_vercode);
		System.out.println("输入的验证码:" + form.getVerifCode());
		if (!session_vercode.equalsIgnoreCase(form.getVerifCode())) {
			request.setAttribute("msg", "验证码错误");
			request.setAttribute("admin", form);
			return "adminpage/user/login";
		}
		try {
			AdminUser admin = adminUserService.login(form);
			request.getSession().setAttribute("session_adminUser", admin);
			AdminUser admin11=	(AdminUser) request.getSession().getAttribute("session_adminUser");
			System.out.println("取得管理员:"+admin11);
			
		} catch (UserException e) {
			// e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			request.setAttribute("admin", form);
			return "adminpage/user/login";
		}

		System.out.println("后台管理员登录");
		return "adminpage/HuiMain";
	}
	
	@RequestMapping("/quit")
	public String quit(HttpServletRequest request) {
		System.out.println("管理员退出登录");
		request.getSession().invalidate();
		return "adminpage/user/login";
	}
	
}
