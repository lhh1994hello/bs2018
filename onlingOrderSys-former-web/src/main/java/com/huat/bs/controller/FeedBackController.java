package com.huat.bs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
/**
 * 
 * @author lihonghui
 *反馈
 */
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huat.bs.bean.Feedback;
import com.huat.bs.bean.Msg;
import com.huat.bs.bean.User;
import com.huat.bs.service.FeedBackService;

@Controller
@SuppressWarnings("all")
public class FeedBackController {
	@Autowired
	private FeedBackService feedBackService;

	// 添加反馈信息
	@ResponseBody
	@RequestMapping(value = "addFeedbackInfo", method = { RequestMethod.GET, RequestMethod.POST })
	public Msg addFeedbackInfo(Feedback form,HttpServletRequest request) {
		System.out.println("添加反馈信息:"+form);
		if(form==null){
			return Msg.fail().add("msg", "参数为空!");
		}
		User user=(User) request.getSession().getAttribute("session_user");
		if(user==null){
			return Msg.fail().add("msg", "用户尚未登录");
		}
		form.setUserid(user.getuId());
		int addFeedback = feedBackService.addFeedback(form);
		return Msg.Success().add("msg", "添加成功.");
	}
}
