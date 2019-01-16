package com.huat.bs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.huat.bs.bean.Evaluation;
import com.huat.bs.bean.Msg;
import com.huat.bs.bean.User;
import com.huat.bs.service.EvaluationService;

@Controller
@SuppressWarnings("all")
public class EvaluationController {
	@Autowired
	private EvaluationService evaluationService;

	@ResponseBody
	@RequestMapping(value = "/addEvaluation", method = { RequestMethod.GET, RequestMethod.POST })
	public Msg addEvaluation(@RequestParam(value = "mid", defaultValue = "") String mid, HttpServletRequest request,
			@RequestParam(value = "contexts", defaultValue = "") String contexts,
			@RequestParam(value = "startnum", defaultValue = "5") Integer startnum) {
		System.out.println("mid:" + mid + ",contexts:" + contexts + ",startnum:" + startnum);
		System.out.println("用户对菜品添加评论...");
		User user = (User) request.getSession().getAttribute("session_user");
		if (user == null) {
			return Msg.fail().add("msg", "尚未登录");
		}
		String uid = user.getuId();
		evaluationService.addEvaluation(uid, contexts, startnum, mid);
		return Msg.Success().add("msg", "成功");
	}

	@ResponseBody
	@RequestMapping(value = "/showEvalList", method = { RequestMethod.GET, RequestMethod.POST })
	public Msg showEvalList(@RequestParam(value="mid",defaultValue="")String mid,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		System.out.println("显示这道菜的所有评论...:pn:"+pn+",mid:"+mid);
		if(StringUtils.isBlank(mid)){
			return Msg.Warning().add("msg", "参数为空");
 		}
		System.out.println("pn值:****************:"+pn);
		PageHelper.startPage(pn, 6);// 分页，8代表每页显示的条目数量
		List<Evaluation> evaluationList=evaluationService.evaluationList(mid);
		PageInfo pageInfo = new PageInfo(evaluationList, 5);
		return Msg.Success().add("pageInfo", pageInfo);
	}

}
