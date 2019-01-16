//创建时间:2018年5月20日上午9:29:16
//用户:lihonghui
package com.huat.bs.service;

import java.util.Date;
import java.util.List;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huat.bs.bean.Orderitem;
import com.huat.bs.bean.OrderitemExample;
import com.huat.bs.bean.OrderitemExample.Criteria;
import com.huat.bs.dao.OrderitemMapper;

@Service
@SuppressWarnings("all")
public class OrderItemService {
	@Autowired
	private OrderitemMapper orderitemMapper;

	public long getTodayMenuSalaryNum() {
		double todaySalary = 0.00;
		long todayMenuNum=0;
		DateTime nowTime = new DateTime();
		DateTime startOfDay = nowTime.withTimeAtStartOfDay();
		DateTime endOfDay = nowTime.millisOfDay().withMaximumValue();
		Date start = startOfDay.toDate();
		Date end = endOfDay.toDate();

		OrderitemExample example = new OrderitemExample();
		Criteria criteria = example.createCriteria();
		criteria.andCreatetimeBetween(start, end);
		// 获得所有菜单销售总和，通过查询所有订单项
		List<Orderitem> orderItemList = orderitemMapper.selectByExample(example);
		for (Orderitem item : orderItemList) {
			todaySalary = item.getSubtotal();
			todayMenuNum=todayMenuNum+item.getCount();
		}
		//System.out.println("今日菜单数量:"+todayMenuNum);
		return todayMenuNum;
	}
	//获得总的销售数量
	public long getTotalMenuSalaryNum() {
		long totalSalaryNum=0;
		List<Orderitem> orderItemList = orderitemMapper.selectByExample(null);
		for (Orderitem item : orderItemList) {
			totalSalaryNum=totalSalaryNum+item.getCount();
		}
		return totalSalaryNum;
	}
}
