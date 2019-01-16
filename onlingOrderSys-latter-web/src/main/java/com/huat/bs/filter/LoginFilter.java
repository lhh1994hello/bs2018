package com.huat.bs.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.huat.bs.bean.AdminUser;
import com.huat.bs.bean.User;

/*
 * 后台登录过滤器
 */
@SuppressWarnings("all")
public class LoginFilter implements Filter {
	private List<String> list = new ArrayList<String>();  
	public LoginFilter() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		chain.doFilter(request, response);
		
//		HttpServletRequest httprequest = (HttpServletRequest) request;
//		HttpServletResponse httpresponse = (HttpServletResponse) response;
//		String urlAll = httprequest.getScheme() + "://" + httprequest.getServerName() + httprequest.getRequestURI()
//				+ "?" + httprequest.getQueryString();
//
//		String path = httprequest.getScheme() + "://" + httprequest.getServerName() + ":" + httprequest.getServerPort()
//				+ httprequest.getContextPath() + "/";
//  
//		AdminUser adminUser = (AdminUser) httprequest.getSession().getAttribute("session_adminUser");
//
//		 String pathURI = httprequest.getRequestURI();
//		
//		if (adminUser != null) {
// 			chain.doFilter(request, response);
//		} else {
// 			System.out.println("管理员登录状态:" + adminUser);
//			if (urlAll.contains("regist") || urlAll.contains("adminLogin") || urlAll.contains("login.jsp")
//					|| urlAll.contains("verifCode")||urlAll.contains("toRegistPage")||urlAll.contains("css")||urlAll.contains("js")) {
//				if(urlAll.contains("css")||urlAll.contains("js")){
//					System.out.println("样式判断:"+urlAll);
//				}
//				chain.doFilter(request, response);
//				return;
//			}
//			httprequest.setAttribute("msg", "请先登录");
//			System.out.println("path路径:" + path);
// 			httprequest.getRequestDispatcher("/adminpage/user/login.jsp").forward(httprequest, httpresponse);
//		}
 	}

	public void init(FilterConfig fConfig) throws ServletException {
	
	}

}
