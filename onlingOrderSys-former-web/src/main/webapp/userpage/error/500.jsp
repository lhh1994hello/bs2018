<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${APP_PATH}/static/pintuer/jquery.js"></script>
<script src="${APP_PATH}/static/pintuer/pintuer.js"></script>
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/pintuer/pintuer.css" />
<title>服务器错误</title>
<link rel="icon" href="//static.waimai.baidu.com/static/forpc/favicon.ico" 	
	mce_href="//static.waimai.baidu.com/static/forpc/favicon.ico" type="image/x-icon">
</head>
<body>
	<!-- <h1>服务器内部错误</h1> -->
	<div style="height: 30px;"></div>
	<div class="container">
	<div class="panel margin-big-top">
	<div class="text-center">
			<br>
			<br>
			<img src="http://www.pintuer.com/images/mm-1.jpg" class="radius" width="500" />
			<h2  class="padding-top">
				<stong>500错误！咦！服务器内部出错了？</stong>
			</h2>
			<div class="padding-big">
				<!-- <a href="http://www.pintuer.com/" class="button bg-yellow">返回首页</a>
				<a href="http://blog.pintuer.com/?post=3" class="button">反馈</a> -->
				<a href="${APP_PATH}/userpage/main.jsp" class="button bg-yellow">返回首页</a>
			</div>
	</div>
	</div>
</div>
</body>
</html>