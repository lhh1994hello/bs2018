//创建时间:2018年5月21日上午8:53:17
//用户:lihonghui
package com.test.redis;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.junit.Test;

import redis.clients.jedis.Jedis;
@SuppressWarnings("all")
public class TestRedisList1 {
	@Test
	public void fun1(){
		Jedis jedis=new Jedis("127.0.0.1",6379);
		jedis.lpush("list_key", "1","2");
		String lpop = jedis.lpop("list_key");
		System.out.println(lpop);
		Map scoreMembers=new HashMap<String, Object>();
		scoreMembers.put("k1", "k1_value");
		scoreMembers.put("k2", "k2_value");
		scoreMembers.put("k3", "k3_value");
		jedis.zadd("map1", scoreMembers);
		Set<String> zrange = jedis.zrange("map", 0, 2);
		System.out.println("值;"+zrange);
	}
	public static void main(String[] args) {
		Jedis jedis=new Jedis("127.0.0.1",6379);
		jedis.lpush("list_key", "1","2");
		String lpop = jedis.lpop("list_key");
		System.out.println(lpop);
		Map scoreMembers=new HashMap<String, Object>();
		scoreMembers.put("k1", "k1_value");
		scoreMembers.put("k2", "k2_value");
		scoreMembers.put("k3", "k3_value");
		jedis.zadd("map1", scoreMembers);
		Set<String> zrange = jedis.zrange("map", 0, 2);
		System.out.println("值;"+zrange);
	}
}
