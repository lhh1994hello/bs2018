//创建时间：2018年3月20日,上午11:31:31
package com.huat.bs.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.huat.bs.bean.User;
@SuppressWarnings("all")
public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		String urlAll = request.getScheme() + "://" + request.getServerName() + request.getRequestURI() + "?"
				+ request.getQueryString();
		//System.out.println("完整路径:"+urlAll);
		String requestURI = request.getRequestURI();
		//System.out.println("requestURI测试：" + requestURI);
		String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
				+ request.getContextPath() + "/";
 
		List<String> urlList = urlList();
		for (String url : urlList) {
 			if (!urlAll.contains(url)) {
 				continue;
			} else{
 				return true;
			}
		}
		//在这里再判断用户是否登录了
			HttpSession session = request.getSession();
			User user= (User) session.getAttribute("session_user");
			//System.out.println("用户状态:"+user);
			if(user!=null){
				//System.out.println("拦截器判断用户是否登录...");
				return true;
			}
			response.sendRedirect(path + "toLoginPage");
			//response.sendRedirect("https://www.baidu.com/");
		
		return false;
	}

	// 设置不用登陆就可访问的链接
	public List<String> urlList() {
		List<String> url = new ArrayList<String>();
		url.add("verifCode");// 验证码
		url.add("login");// 登录 
		url.add("userIsLogin");// 检查用户是否登录getAllCategory
		url.add("getCategoryWithAjax");
		url.add("findMenuByCategory");
		url.add("judgeUserIsCollect");
		url.add("toLoginPage");
		url.add("getAllCategory");
		url.add("StarshouChang");
		url.add("judgeUserIsCollect");
		url.add("addEvaluation");
		url.add("public");
		url.add("showEvalList");//显示这道菜的评价列表
		url.add("searchMenuWithAjax");
		//找回密码
		url.add("findUserInfoByInputContext");
		url.add("setNewPassword");
		url.add("backPasswordByMibao");
		url.add("transmitVerificationCode");
		url.add("checkPhoneRandom");
		url.add("backPasswordByEmail");
		url.add("emailcallback");
		
		//静态样式
		url.add(".json");
		url.add("css");
		url.add("js");
		url.add("gif");
		url.add("waimai");
		url.add("static");
		url.add("images");
		url.add("https://static.waimai.baidu.com");
		url.add("layui");
		//url.add("main.jsp");
		//url.add("login2.jsp");
		// http://192.168.71.1:8088/onlingOrderSys-former-web/static/layui/font/iconfont.ttf?v=220
		return url;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
