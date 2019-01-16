package com.huat.bs.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.huat.bs.bean.Feedback;
import com.huat.bs.bean.Msg;
import com.huat.bs.service.FeedBackService;

@Controller
@SuppressWarnings("all")
public class FeedbackController {
	@Autowired
	private FeedBackService feedBackService;

	@ResponseBody
	@RequestMapping(value = "/findFeedbackList", method = { RequestMethod.GET, RequestMethod.POST })
	public Msg findFeedbackList(@RequestParam(value = "beginTime", defaultValue = "") String beginTime,
			@RequestParam(value = "endTime", defaultValue = "") String endTime,
			@RequestParam(value = "stext", defaultValue = "") String stext,
			@RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		System.out.println("获得反馈列表...,beginTime:" + beginTime + ",endTime:" + endTime + ",stext:" + stext + ",pageSize:"+ pageSize + ",pn:" + pn);
		
		PageHelper.startPage(pn, pageSize);// pn是页号，
		List<Feedback> feedbackList=feedBackService.findFeedbackList(beginTime, endTime, stext);		
		PageInfo pageInfo = new PageInfo(feedbackList, 5);
		return Msg.Success().add("pageInfo", pageInfo);
	}
	
	//删除反馈记录
	@ResponseBody
	@RequestMapping(value = "/deleteFeedback", method = { RequestMethod.GET, RequestMethod.POST })
	public Msg deleteFeedback(@RequestParam(value="fid",defaultValue="") String fid){
		System.out.println("删除反馈:"+fid);
		if(StringUtils.isBlank(fid)){
			return Msg.fail().add("msg", "参数为空!");
		}
		//
		if(fid.contains("-")){
			System.out.println("批量删除...");
			List<String> fidList = new ArrayList<String>();
			String[] fids = fid.split("-");
			for(String id:fids){
				fidList.add(id);
			}
			feedBackService.deleteFeedbackWithList(fidList);
		}else{
			System.out.println("单个删除...");
			feedBackService.deleteFeedback(fid);
 		}
		
		return Msg.Success().add("msg", "删除成功!");
	}
	
	

}
