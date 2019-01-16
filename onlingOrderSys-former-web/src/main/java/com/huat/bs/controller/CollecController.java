package com.huat.bs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
/*
 * 收藏操作
 */
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huat.bs.bean.Msg;
import com.huat.bs.bean.User;
import com.huat.bs.service.CollectService;

@Controller
public class CollecController {
	@Autowired
	private CollectService collectService;

	@ResponseBody
	@RequestMapping(value = "/StarshouChang", method = { RequestMethod.GET, RequestMethod.POST })
	public Msg shouChangStar(@RequestParam(value = "cid", defaultValue = "-100") String cid,
			@RequestParam(value = "flagStar", defaultValue = "0") String flagStar,HttpServletRequest request,
			@RequestParam(value = "mid", defaultValue = "-100") String mid) {
		System.out.println("cid:" + cid + ",flagStar:" + flagStar+",mid:"+mid);
		User user =(User) request.getSession().getAttribute("session_user");
		if(user==null){
			return Msg.fail().add("msg", "请先登录");
		}
		
		collectService.shouChangStar(cid,mid,flagStar,user.getuId());
		
		return Msg.Success().add("msg", "执行成功");
	}
	@ResponseBody
	@RequestMapping(value = "/aaa", method = { RequestMethod.GET, RequestMethod.POST })
	public Msg aaa(){
		return Msg.Success();
	}
}
