//创建时间:2018年5月17日上午9:53:46
//用户:lihonghui
package cn.huat.test.redis2;

import java.io.IOException;
import java.util.HashSet;

import org.junit.Test;

import redis.clients.jedis.HostAndPort;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisCluster;
import redis.clients.jedis.JedisPool;

public class TestJedis {
/*	@Test
	public void testJedis(){
		Jedis jedis=new Jedis("127.0.0.1",6379);
		jedis.set("key1", "jedis test");
		String value = jedis.get("key1");
		System.out.println(value);
		jedis.close();
	}
	//测试连接池
	@Test
	public void jedisPool(){
		JedisPool pool=new JedisPool("127.0.0.1",6379);
		Jedis jedis=pool.getResource();
		String value = jedis.get("key1");
		System.out.println("使用连接池:"+value);
		jedis.close();
	}*/
	//测试集群版
	@Test
	public void jedisCluster() throws IOException{
		HashSet<HostAndPort> nodes=new HashSet<HostAndPort>();
		System.out.println("************************");
		nodes.add(new HostAndPort("127.0.0.1", 7001));
		nodes.add(new HostAndPort("127.0.0.1", 7002));
		nodes.add(new HostAndPort("127.0.0.1", 7003));
		nodes.add(new HostAndPort("127.0.0.1", 7004));
		nodes.add(new HostAndPort("127.0.0.1", 7005));
		nodes.add(new HostAndPort("127.0.0.1", 7006));
		JedisCluster cluster=new JedisCluster(nodes);
		cluster.set("key2", "1000");
		String value = cluster.get("key2");
		System.out.println("测试集群:"+value);
		cluster.close();
		System.out.println("---------------------");
	}
}
