//创建时间：2018年4月13日,下午1:50:50
package com.huat.bs.task;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

//监听订单超时请求
public class OrderTimeOutListenr  implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("服务器启动拉........................................");
		
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("服务器关闭拉........................................");
		
	}

}
