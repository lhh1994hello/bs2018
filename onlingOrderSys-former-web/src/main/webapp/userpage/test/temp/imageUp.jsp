<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
	
<title>点击头像上传头像</title>
<style type="text/css">
		.fileInputContainer {
			height: 256px;
			background: url('${APP_PATH}/images/default/wm_logo.jpg');
			position: relative;
			width: 256px;
		}
		
		.fileInput {
			height: 256px;
			overflow: hidden;
			font-size: 300px;
			position: absolute;
			right: 0;
			top: 0;
			opacity: 0;
			filter: alpha(opacity = 0);
			cursor: pointer;
		}
</style>
</head>
<body>
	<div class="fileInputContainer">
		<input class="fileInput" id="" type="file" name="">
	</div>
</body>
</html>