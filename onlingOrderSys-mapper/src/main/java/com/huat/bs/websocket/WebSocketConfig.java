/*//创建时间:2018年5月22日下午4:49:18
//用户:lihonghui
package com.huat.bs.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Component
@EnableWebSocket
@Configuration
 public class WebSocketConfig extends WebMvcConfigurerAdapter implements WebSocketConfigurer{

	public void registerWebSocketHandlers(WebSocketHandlerRegistry arg0) {
		// TODO Auto-generated method stub
		
	}
   
}
*/