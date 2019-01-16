package com.huat.bs.task;

import java.util.Date;
import java.util.List;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.huat.bs.bean.Orders;
import com.huat.bs.bean.UserException;
import com.huat.bs.service.OrderService;

//@Component
@SuppressWarnings("all")
public class ListenTimeOutJob extends QuartzJobBean {
	static int count=0;
	private static final long COUNTDOWN_TIME = 30;
	static ApplicationContext context = null;
	static OrderService orderService = null;
	static {
		context = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		orderService = (OrderService) context.getBean("orderService1");
	}

	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		//updateStateWhereTimeOut();

	}

	public void updateStateWhereTimeOut() {
		count++;
		System.out.println("执行次数:"+count);
		List<Orders> ordersList = orderService.selectAllOrdersNoPayment();
		System.out.println("集合的长度:"+ordersList.size());
		if (ordersList.size() < 1) {
			//System.out.println("没有订单需要被监控..............");
			return;
		}
		for (Orders order : ordersList) {
			long timeDiff = timeDiff(order);
			// 如果超时了
			System.out.println("时间:"+timeDiff);
			if (timeDiff > COUNTDOWN_TIME) {
				System.out.println("超时了.......");
				try {
					orderService.updateOrderPayState(order.getOid(), -1);
				} catch (UserException e) {
					System.out.println(e.getMessage());
					throw new RuntimeException(e);
				}// 状态为-1，代表超时
			}
		}
	}

	// 获得时间差，单位是秒
	public long timeDiff(Orders order) {
		long createTime = order.getCreatetime().getTime();
		long currentTime = new Date().getTime();
		long timeDiff = (currentTime - createTime) / 1000;
		return timeDiff;
	}

}
