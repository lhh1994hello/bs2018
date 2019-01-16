//创建时间:2018年7月31日下午3:38:41
//用户:lihonghui
package com.huat.bs.controller;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

	@RequestMapping("testFun1")
	public String test(Map<String, Object> map, String username) {
		System.out.println("执行了..........");
		System.out.println("接受的参数:" + map.values());
		System.out.println("参数:" + username);
		return "false";
	}
}
