<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>websocket5</title>
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>

</head>
<body>
<h1></h1>


<script type="text/javascript">
	var websocket=null
	if('webSocket' in window){
		websocket=new WebSocket('ws://');
	}else {
		alert("该浏览器不支持！");
	}
	
	websocket.onopen=function(event){
		console.log("建立连接.....");
	};
	websocket.onclose = function(event) {
		console.log("Socket已关闭....");
		//alert("Socket已关闭");
	};
	websocket.onerror = function(event) {
		console.log("发生了错误..");
		//alert("发生了错误");
	}
	websocket.onmessage = function(event) {
		console.log("收到消息:"+event.data);
		alert("收到消息:"+event.data);
	}
	window.onbeforeunload=function(){
		websocket.close();
	}
</script>
</body>
</html>