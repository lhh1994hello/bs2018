//创建时间:2018年5月17日上午11:08:00
//用户:lihonghui
package com.huat.bs.redis;

import org.springframework.stereotype.Component;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@Component
public class JedisClientSingle implements JedisClient {

	private JedisPool jedisPool;

	public JedisClientSingle() {
		System.out.println("构造方式实例化................");
		jedisPool = new JedisPool("127.0.0.1", 6379);
	}

	public String get(String key) {
		Jedis jedis = jedisPool.getResource();
		String value = jedis.get(key);
		jedis.close();
		return value;
	}

	public String set(String key, String value) {
		Jedis jedis = jedisPool.getResource();
		String set = jedis.set(key, value);
		jedis.close();
		return set;
	}

	public String hget(String hkey, String key) {
		System.out.println("获得缓存数据,键值是:"+key);
		Jedis jedis = jedisPool.getResource();
		String value = jedis.hget(hkey, key);
		jedis.close();
		return value;
	}

	public long hset(String hkey, String key, String value) {
		System.out.println("添加缓存,键值是:"+key);
		Jedis jedis = jedisPool.getResource();
		Long hset = jedis.hset(hkey, key, value);
		jedis.close();
		return hset;
	}

	public long incr(String key) {
		Jedis jedis = jedisPool.getResource();
		Long incr = jedis.incr(key);
		jedis.close();
		return incr;
	}

	public long expire(String key, int seconds) {
		Jedis jedis = jedisPool.getResource();
		Long expire = jedis.expire(key, seconds);
		jedis.close();
		return expire;
	}

	public long ttl(String key) {
		Jedis jedis = jedisPool.getResource();
		Long ttl = jedis.ttl(key);
		jedis.close();
		return ttl;
	}
	//当数据更新后删除对应的缓存数据
 	public long del(String key) {
		// TODO Auto-generated method stub
		Jedis jedis = jedisPool.getResource();
		Long num = jedis.del(key);
		jedis.close();
		return num;
	}

	public long hdel(String hkey, String key) {
		System.out.println("删除缓存中数据.................."+key);
		Jedis jedis = jedisPool.getResource();
		Long hdel = jedis.hdel(hkey, key);
		jedis.close();
		return hdel;
	}

}
