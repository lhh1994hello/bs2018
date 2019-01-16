/*//创建时间:2018年5月19日下午7:43:46
//用户:lihonghui
package com.huat.bs.util;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.huat.bs.redis.JedisClient;

public class RedisUtil3 {
	// 从缓存中获取数据转成对应的对象
		public List<T> getListfromRedis(JedisClient jedisClient, String hkey, String key,Class clazz) {
			List<T> cacheList = null;
			try {
				String result = jedisClient.hget(hkey, key);
				if (!StringUtils.isBlank(result)) {
					cacheList = JSON.parseArray(result, clazz);
					System.out.println("缓存哈希hkey:"+hkey+",键值:"+key+"从缓存取到的数据集合是:" + cacheList);
				}
			} catch (Exception e) {
				System.out.println("从缓存中读取数据失败.................");
			}
			return cacheList;
		}
		// 从缓存中获取数据转成对应的对象
		public T getBeanfromRedis(JedisClient jedisClient, String hkey, String key) {
			T beanObject=null;
			try {
				String result = jedisClient.hget(hkey, key);
				if (!StringUtils.isBlank(result)) {
					beanObject=	(T) JSONObject.parseObject(result,clazz);
					System.out.println("缓存哈希hkey:"+hkey+",键值:"+key+"从缓存取到的对象:" + beanObject);
					
				}
			} catch (Exception e) {
				System.out.println("从缓存中读取数据失败.................");
			}
			return beanObject;
		}
		//把集合转成JSON保存到Redis中
		public long setToRedisList(JedisClient jedisClient, String hkey, String key,String jsonData){
			long hset=0;
			try {
				 hset = jedisClient.hset(hkey, key, jsonData);
				System.out.println("向缓存中存数据:"+"哈希hkey:"+hkey+",键值:"+key);
			} catch (Exception e) {
				System.out.println("redis保存评价列表错误...");
				//e.printStackTrace();
			}
			return hset;
		}

}
*/