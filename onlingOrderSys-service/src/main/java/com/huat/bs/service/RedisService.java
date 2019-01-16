//创建时间:2018年5月18日下午6:51:09
//用户:lihonghui
package com.huat.bs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.huat.bs.bean.Msg;
import com.huat.bs.redis.JedisClient;
/*
 * 实现缓存同步，即当其Service修改数据库时删除redis缓存中的数据
 */
@Service
public class RedisService {
	@Autowired
	private JedisClient jedisClient;
	@Value("${INDEX_CONTENT_REDIS_KEY}")
	private String INDEX_CONTENT_REDIS_KEY;
	
	public Msg asyncContent(long contentCid){
		try{
			jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, contentCid+"");
		}catch(Exception e){
			System.out.println("删除缓存失败..................");
			return Msg.fail();
		}
		return  Msg.Success();
	}
}
