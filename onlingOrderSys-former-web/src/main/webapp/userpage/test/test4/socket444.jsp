<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sock444</title>
</head>
<body>	
	<div>
			<input type="button" id="btnConnection" value="连接" />
			<input type="button" id="btnClose" value="关闭" />
			<input type="button" id="btnSend" value="发送" />
		</div>
		<script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript">
			$(function() {
				var socket;
				if(typeof(WebSocket) == "undefined") {
					alert("您的浏览器不支持WebSocket");
					return;
				}
				connection();
				function connection(){
					//实现化WebSocket对象，指定要连接的服务器地址与端口
					socket = new WebSocket("ws://127.0.0.1:8088/onlingOrderSys-former-web/ws/张三");
					//打开事件
					socket.onopen = function() {
						console.log("已经打开...........");
						//socket.send("这是来自客户端的消息" + location.href + new Date());
					};
					//获得消息事件
					socket.onmessage = function(msg) {
						alert("获得的消息:"+msg.data);
					};
					
					
					//关闭事件
					socket.onclose = function() {
						//alert("Socket已关闭");
						socket.close();
						console.log("Socket已关闭...........");
					};
					//发生了错误事件
					socket.onerror = function() {
						alert("发生了错误");
					}
					window.onbeforeunload=function(){
						socket.close();
					}
					
				}
				
				$("#btnConnection").click(function() {
				 
					connection();
				});

				$("#btnSend").click(function() {
					console.log("连接状态:"+socket.OPEN+"当前状态:"+socket.readyState);
					if(socket.readyState!=socket.OPEN){
						alert("已经断了..");
						return ;
					}
					
					socket.send("这是来自客户端的消息" + location.href + new Date());
				});

				$("#btnClose").click(function() {
					socket.close();
				});
			});
		</script>
	</body>
	<!--  -->
</body>
</html>