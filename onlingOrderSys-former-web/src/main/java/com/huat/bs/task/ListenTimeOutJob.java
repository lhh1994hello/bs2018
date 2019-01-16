package com.huat.bs.task;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.stereotype.Component;

import com.huat.bs.bean.Orders;
import com.huat.bs.bean.UserException;
import com.huat.bs.service.OrderService;

@Component
@SuppressWarnings("all")
public class ListenTimeOutJob extends QuartzJobBean {
		
	static int count=0;
	private static final long COUNTDOWN_TIME = 30*60;
	private Integer timeNumber=30;
	static ApplicationContext context = null;
	static OrderService orderService = null;
	static {
		context = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		orderService = (OrderService) context.getBean("orderService1");
	}

	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		try {
			updateStateWhereTimeOut();
 		} catch (IOException e) {
 			e.printStackTrace();
		}
		

	}

	public void updateStateWhereTimeOut() throws IOException {
		//通过读取配置文件的方式设置时间
		Properties props = new Properties();
		props.load(this.getClass().getClassLoader().getResourceAsStream("former.properties"));//加载这个文件
		timeNumber=Integer.valueOf(props.getProperty("countDownTime"));
 		
		
		count++;
		//System.out.println("执行次数:"+count);
		List<Orders> ordersList = orderService.selectAllOrdersNoPayment();
		//System.out.println("未付款订单数量:"+ordersList.size());
		if (ordersList==null||ordersList.size() < 1) {
			//System.out.println("没有订单需要被监控..............");
			return;
		}
		System.out.println("未付款订单数量:"+ordersList.size());
		for (Orders order : ordersList) {
			long timeDiff = timeDiff(order);
			// 如果超时了
			//System.out.println("时间1:"+timeDiff+",timeNumber:"+timeNumber);
			if (timeDiff > timeNumber) {
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
