<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sock4</title>
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

				$("#btnConnection").click(function() {
					//实现化WebSocket对象，指定要连接的服务器地址与端口
					socket = new WebSocket("ws://127.0.0.1:8088/onlingOrderSys-former-web/ws/张三");
					//打开事件
					socket.onopen = function() {
						alert("Socket 已打开");
						//socket.send("这是来自客户端的消息" + location.href + new Date());
					};
					//获得消息事件
					socket.onmessage = function(msg) {
						alert("获得的消息:"+msg.data);
					};
					//关闭事件
					socket.onclose = function() {
						alert("Socket已关闭");
					};
					//发生了错误事件
					socket.onerror = function() {
						alert("发生了错误");
					}
					window.onbeforeunload=function(){
						socket.close();
					}
				});

				$("#btnSend").click(function() {
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