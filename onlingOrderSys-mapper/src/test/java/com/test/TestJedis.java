//创建时间:2018年5月20日下午10:51:03
//用户:lihonghui
package com.test;

import org.junit.Test;

import redis.clients.jedis.Jedis;
@SuppressWarnings("all")
public class TestJedis {
	@Test
	public void fun1(){
		Jedis jedis=new Jedis("127.0.0.1",6379);
		
		System.out.println(jedis.ping());
		jedis.set("test1", "helloTest1");
		String string = jedis.get("test1");
		System.out.println(string);
		Long ttl = jedis.ttl("test1");
		System.out.println(ttl);
		//jedis.zs
	}
}
