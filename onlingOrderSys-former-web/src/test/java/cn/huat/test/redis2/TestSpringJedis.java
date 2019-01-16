//创建时间:2018年5月17日上午10:27:40
//用户:lihonghui
package cn.huat.test.redis2;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;



public class TestSpringJedis {
	@Test
	public void fun1() {
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		JedisPool pool = (JedisPool) context.getBean("redisClient");
		Jedis jedis = pool.getResource();
		String value = jedis.get("key1");
		System.out.println("查询:"+value);
		
	}
	
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		JedisPool pool = (JedisPool) context.getBean("redisClient");
		Jedis jedis = pool.getResource();
		String value = jedis.get("key1");
		System.out.println("查询:"+value);
	
	}

}
