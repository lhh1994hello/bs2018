<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>

<style type="text/css">
	img{
		width: 100px;
		height: 100px;
	}
	.fileInputContainer{
		width: 100px;
		height: 100px;
		position:relative;
		 border: 1px solid pink;
	}
	.fileInput{
		height:100px;
		width: 100px;
		position:absolute;
        right:0;
        top:0;
        opacity: 0;
        filter:alpha(opacity=0);
        cursor:pointer;
        
	}
</style>
	
</head>
<body>
	<div class="fileInputContainer">
		<input class="fileInput" id="" type="file" name="">
		<img alt="图片" src="${APP_PATH}/images/default/t6.jpg">
	</div>
</body>
</html>