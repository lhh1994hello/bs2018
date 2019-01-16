package com.huat.bs.service;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.huat.bs.bean.Evaluation;
import com.huat.bs.bean.EvaluationExample;
import com.huat.bs.bean.EvaluationExample.Criteria;
import com.huat.bs.bean.User;
import com.huat.bs.dao.EvaluationMapper;
import com.huat.bs.dao.UserMapper;
import com.huat.bs.redis.JedisClient;
import com.huat.bs.util.RedisUtilsIO;

import cn.itcast.commons.CommonUtils;

@Service
@SuppressWarnings("all")
public class EvaluationService extends RedisUtilsIO<Evaluation> {
	// 这里老是报错

	@Autowired
	private EvaluationMapper evaluationMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private JedisClient jedisClient;// =new JedisClientSingle();
	@Value("${INDEX_CONTENT_REDIS_KEY}")
	private String INDEX_CONTENT_REDIS_KEY;
	// RedisUtil<Evaluation> redisUtil=new RedisUtil<Evaluation>();

	// 添加对菜品的评价
	public void addEvaluation(String uid, String contexts, Integer startnum, String mid) {
		try {
			jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, mid);
		} catch (Exception e) {
			System.out.println("添加评论，清空缓存时出错了...........");
		}
		Evaluation evaluation = new Evaluation();
		evaluation.setEid(CommonUtils.uuid().substring(0, 8));
		evaluation.setCreatetime(new Date());
		evaluation.setContexts(contexts);
		evaluation.setStartnum(startnum);
		evaluation.setMid(mid);
		evaluation.setUid(uid);
		evaluation.setEstate(1);

		evaluationMapper.insertSelective(evaluation);

	}

	// 获得这个菜的所有评论列表
	public List<Evaluation> evaluationList(String mid) {
		// 从缓存中读取数据
		List<Evaluation> listfromRedis = null;
		try {
			listfromRedis = getListfromRedis(jedisClient, INDEX_CONTENT_REDIS_KEY, mid);
		} catch (Exception e) {
			System.out.println("获得评价列表，从缓存中获取失败...");
		}
		if (listfromRedis != null) {
			System.out.println("evaluation从缓存中取数据..............");
			return listfromRedis;
		}

		/*
		 * try{ String result=jedisClient.hget(INDEX_CONTENT_REDIS_KEY, mid);
		 * if(!StringUtils.isBlank(result)){ List<Evaluation> cacheList =
		 * JSON.parseArray(result, Evaluation.class);
		 * System.out.println("从缓存取到的数据是:"+cacheList); } }catch(Exception e){
		 * System.out.println("从缓存中读取数据失败................."); }
		 */

		EvaluationExample example = new EvaluationExample();
		example.setOrderByClause("createtime desc");
		Criteria criteria = example.createCriteria();
		criteria.andMidEqualTo(mid);
		criteria.andEstateEqualTo(1);
		List<Evaluation> evaluationList = evaluationMapper.selectByExample(example);
		evaluationList = fillEvaluationUser(evaluationList);

		// 向缓存中存数据
		try {
			String cacheString = JSON.toJSONString(evaluationList);
			jedisClient.hset(INDEX_CONTENT_REDIS_KEY, mid, cacheString);
			System.out.println("向缓存中存数据................");
		} catch (Exception e) {
			System.out.println("redis保存评价列表错误...");
			// e.printStackTrace();
		}
		return evaluationList;
	}

	// 填充评论中的用户属性
	public List<Evaluation> fillEvaluationUser(List<Evaluation> evaluationList) {
		for (Evaluation e : evaluationList) {
			if (e == null)
				break;
			String uId = e.getUid();
			User user = userMapper.selectByPrimaryKey(uId);
			e.setUser(user);
		}
		return evaluationList;
	}
}
