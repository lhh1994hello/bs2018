//创建时间:2018年5月17日上午9:37:05
//用户:lihonghui
package cn.huat.test;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.junit.Test;

public class HttpClientTest {
	@Test
	public void doGet() throws Exception{
		CloseableHttpClient httpClient=HttpClients.createDefault();
		HttpGet get=new HttpGet("http://www.baidu.com");
		CloseableHttpResponse response = httpClient.execute(get);
		HttpEntity entity = response.getEntity();
		int statusCode = response.getStatusLine().getStatusCode();
		System.out.println("相应状态码:"+statusCode);
		String entityString = EntityUtils.toString(entity);
		System.out.println("相应实体 ;"+entityString);
		
	}
}
