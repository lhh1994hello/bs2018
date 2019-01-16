//创建时间:2018年5月22日下午10:45:01
//用户:lihonghui
package com.huat.bs.websocket;

 
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.messaging.simp.annotation.SendToUser;
@SuppressWarnings("all")
//ws://127.0.0.1:8087/Demo1/ws/张三
@ServerEndpoint("/ws/{user}")
public class WSServer {
	private String currentUser;
	
	List<Session> listSession=new ArrayList<Session>();
	//连接打开时执行
	@OnOpen
	public void onOpen(@PathParam("user") String user, Session session) {
		listSession.add(session);
		System.out.println("sessio列表:"+listSession.size());
		currentUser = user;
		System.out.println("Connected ... " + session.getId());
	}


	//收到消息时执行
	@OnMessage
	public String onMessage(String message, Session session) {
		System.out.println(currentUser + "：" + message);
		System.out.println("接收消息........................");
		
		return currentUser + "：" + message;
	}

	//连接关闭时执行
	@OnClose
	public void onClose(Session session, CloseReason closeReason)  {
		try {
			session.close();
			System.out.println("移除session后:"+listSession.size());
			listSession.remove(session);
			System.out.println("关闭连接");
			System.out.println(String.format("Session %s closed because of %s", session.getId(), closeReason));
		} catch (IOException e) {
			System.out.println("关闭连接捕获异常...................");
			e.printStackTrace();
		}
		
	}

	//连接错误时执行
	@OnError
	public void onError(Throwable t) {
		
		//t.printStackTrace();
		try{
			System.out.println("发生了错误...............");
		}catch(Exception e){
			
		}
	}
}

