package com.huat.bs.task;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@SuppressWarnings("all")
public class TestSpring {
	public static void main(String[] args) {
		// 开启Spring容器
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"classpath:applicationContext-quartz.xml");

	}
}
