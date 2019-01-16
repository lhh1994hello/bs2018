//创建时间:2018年5月20日上午9:28:47
//用户:lihonghui
package com.huat.bs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huat.bs.bean.Msg;
import com.huat.bs.service.OrderItemService;

@Controller
@SuppressWarnings("all")
public class OrderItemController {
	@Autowired
	private OrderItemService orderItemService;
	
 	@RequestMapping(value = "/getTodayMenuSalaryNum", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg getTodayMenuSalaryNum(){
 		long todayMenuNum=orderItemService.getTodayMenuSalaryNum();
		return Msg.Success().add("todayMenuNum", todayMenuNum);
	}
 	@RequestMapping(value = "/getTotalMenuSalaryNum", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public Msg getTotalMenuSalaryNum(){
 		long totalSalaryNum=orderItemService.getTotalMenuSalaryNum();
		return Msg.Success().add("totalSalaryNum", totalSalaryNum);
	}
	
}
