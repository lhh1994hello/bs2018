package com.huat.bs.interceptor;

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

import com.huat.bs.bean.User;


public class LoginFilter implements Filter {
 
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	 
	public void destroy() {
 	}

	 
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		/*
		 * 得到Session ,如果
		 */
	
		HttpServletRequest req=(HttpServletRequest) request;
		User user= (User) req.getSession().getAttribute("session_user");
		String urlAll = req.getScheme() + "://" + req.getServerName() + req.getRequestURI() + "?"+ req.getQueryString();
		//要拦截的页面:订单，个人中心，
		System.out.println("过滤器。。。。。。。。。。。。。。。。。。。。。");
		if(urlAll.contains(".jsp")){
			System.out.println("过滤器:urlAll:"+urlAll);
			if(urlAll.contains("payMent")||urlAll.contains("myOrderList3")||urlAll.contains("homepage")){
				if(user!=null){
					chain.doFilter(request, response);
				}else{
					req.setAttribute("msg", "还没登录");
					req.getRequestDispatcher("/userpage/user/login2.jsp").forward(request, response);
					return ;
				}
				
			}
			
		}else {
			System.out.println("过滤器放行:urlAll:"+urlAll);
			//System.out.println("放行.....");
		}
		
		
		chain.doFilter(request, response);
	}

	 public List<String> urlList(){
		 List<String> urlList=new ArrayList<String>();
		 urlList.add("payMent");
		 urlList.add("myOrderList3");
		 urlList.add("homepage");
		 
		 
		 return urlList;
	 }
	public void init(FilterConfig fConfig) throws ServletException {
		
 	}

}
