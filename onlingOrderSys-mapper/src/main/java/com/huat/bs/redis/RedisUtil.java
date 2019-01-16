//创建时间:2018年5月18日下午7:02:19
//用户:lihonghui
package com.huat.bs.redis;

import com.alibaba.fastjson.JSON;
import com.huat.bs.bean.Msg;

/*
 * 
 */
@SuppressWarnings("all")
public class RedisUtil {
	// 从缓存中取得数据
	public static String getRedisJsonData(JedisClient jedisClient, String hkey, String key) {
		String result = null;
		try {
			result = jedisClient.hget(hkey, key);
			System.out.println("从缓存中取数据...................");
		} catch (Exception e) {
			System.out.println("从缓存中获取数据捕获异常..........................");
		}

		return result;
	}

	// 向缓存中添加数据
	public static long setRedisJsonData(JedisClient jedisClient, String hkey, String key, String jsonData) {
		long hset = 0;
		try {
			hset = jedisClient.hset(hkey, key, jsonData);
			System.out.println("向缓存中存数据................");
		} catch (Exception e) {
			System.out.println("向缓存中存数据捕获异常.......................");
			// e.printStackTrace();
		}
		return hset;
	}

	// 删除缓存中的数据
	public static long asyncContent(JedisClient jedisClient, String hkey, long contentCid) {
		long hdel = 0;
		try {
			hdel = jedisClient.hdel(hkey, contentCid + "");
		} catch (Exception e) {
			System.out.println("删除缓存失败..................");
		}
		return hdel;
	}
}
