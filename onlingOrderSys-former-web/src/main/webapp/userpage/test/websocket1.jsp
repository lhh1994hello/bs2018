<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>

<title>测试websocket</title>
</head>
<body>
	<h1>AAA</h1>

	<script type="text/javascript">
		var websocket=null;
		if('webSocket' in window){
			websocket=new webSocket("ws//");
		}else{
			alert("浏览器不支持");
		}
		
		websocket.onopen=function(event){
			console.log("建立连接....");
		}
		websocket.onclose=function(event){
			console.log("关闭连接....");
		}
		websocket.onmessage=function(event){
			console.log("收到消息...."+event.data);
		}
		websocket.onerror=function(event){
			console.log("通信错误.....");
		}
		websocket.onbeforeunload=function(event){
			websocket.close();
		}
	</script>

</body>
</html>