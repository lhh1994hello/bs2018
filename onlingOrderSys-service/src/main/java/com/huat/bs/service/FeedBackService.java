package com.huat.bs.service;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
/**
 * 
 * @author lihonghui
 *反馈
 */

import com.huat.bs.bean.Feedback;
import com.huat.bs.bean.FeedbackExample;
import com.huat.bs.bean.FeedbackExample.Criteria;
import com.huat.bs.bean.User;
import com.huat.bs.dao.FeedbackMapper;
import com.huat.bs.dao.UserMapper;
import com.huat.bs.redis.JedisClient;
import com.huat.bs.util.RedisUtilsIO;

import cn.itcast.commons.CommonUtils;

@Service
@SuppressWarnings("all")
public class FeedBackService extends RedisUtilsIO<Feedback>{
	@Autowired
	private FeedbackMapper feedbackMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private JedisClient jedisClient;
	@Value("${INDEX_CONTENT_REDIS_KEY}")
	private String INDEX_CONTENT_REDIS_KEY;

	// 添加反馈
	public int addFeedback(Feedback form) {
		form.setFid(CommonUtils.uuid().substring(0, 8));
		form.setCreatetime(new Date());
		System.out.println("将要插入的反馈记录:" + form);
		int num = feedbackMapper.insertSelective(form);
 		return num;
	}

	// 获得反馈列表
	public List<Feedback> findFeedbackList(String beginTime, String endTime, String stext) {
		FeedbackExample example = new FeedbackExample();
		DateTimeFormatter format = DateTimeFormat.forPattern("yyyy-MM-dd");
		example.setOrderByClause("createtime desc");
		Criteria criteria1 = example.createCriteria();
		Criteria criteria2 = example.createCriteria();
		Criteria criteria3 = example.createCriteria();
		Criteria criteria4 = example.createCriteria();
		Criteria criteria5 = example.createCriteria();
		
		DateTime dateTime = null;
		if (!StringUtils.isBlank(beginTime)) {
			dateTime = DateTime.parse(beginTime, format);
			Date beginDate = dateTime.toDate();
			System.out.println("开始时间:" + beginDate);
			criteria1.andCreatetimeGreaterThanOrEqualTo(beginDate);
			criteria2.andCreatetimeGreaterThanOrEqualTo(beginDate);
			criteria3.andCreatetimeGreaterThanOrEqualTo(beginDate);
			criteria4.andCreatetimeGreaterThanOrEqualTo(beginDate);
			criteria5.andCreatetimeGreaterThanOrEqualTo(beginDate);
		}
		if(!StringUtils.isBlank(endTime)){
			 dateTime = DateTime.parse(endTime, format);
			 dateTime=dateTime.plusDays(1);//结束时间加一天
			 Date endDate=dateTime.toDate();
			 criteria1.andCreatetimeLessThanOrEqualTo(endDate);
			 criteria2.andCreatetimeLessThanOrEqualTo(endDate);
			 criteria3.andCreatetimeLessThanOrEqualTo(endDate);
			 criteria4.andCreatetimeLessThanOrEqualTo(endDate);
			 criteria5.andCreatetimeLessThanOrEqualTo(endDate);
		}
		if(!StringUtils.isBlank(stext)){
			criteria1.andFidEqualTo(stext);//反馈主键
			criteria2.andUserphoneEqualTo(stext);
 			//criteria3.and
			example.or(criteria2);
		}
		// Criteria criteria = example.createCriteria();
		List<Feedback> feedbackList = feedbackMapper.selectByExampleWithBLOBs(example);
		feedbackList = fillUser(feedbackList);
		return feedbackList;
	}

	// 删除反馈
	public void deleteFeedback(String fid) {
		feedbackMapper.deleteByPrimaryKey(fid);
	}
	//批量删除 反馈
	public void deleteFeedbackWithList(List<String> fidList) {
		FeedbackExample example=new FeedbackExample();
		Criteria criteria=example.createCriteria();
		criteria.andFidIn(fidList);
		feedbackMapper.deleteByExample(example);
 	}
	// 填充用户
	public List<Feedback> fillUser(List<Feedback> feedbackList) {

		for (Feedback feedback : feedbackList) {
			String userid = feedback.getUserid();
			User user = userMapper.selectByPrimaryKey(userid);
			feedback.setUser(user);
		}
		return feedbackList;
	}


}
