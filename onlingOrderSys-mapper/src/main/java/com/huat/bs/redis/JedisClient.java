//创建时间:2018年5月17日上午11:02:50
//用户:lihonghui
package com.huat.bs.redis;

public interface JedisClient {
	String get(String key);
	String set(String key,String value);
	String hget(String hkey,String key);
	long hset(String hkey,String key,String value);
	long incr(String key);
	long expire(String key,int seconds);
	long ttl(String key);
	long del(String key);//清除key
	long hdel(String hkey, String key);//清除key
}
