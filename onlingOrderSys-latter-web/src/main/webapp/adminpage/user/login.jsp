<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="${APP_PATH}/static/hui/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />	
<link href="${APP_PATH}/static/hui/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="${APP_PATH}/static/hui/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="${APP_PATH}/static/hui/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
<!-- 相当于那个Tomcat图标-->
<link rel="shortcut icon" href="${APP_PATH}/images/logo/favicon.ico"> 
<title>订餐系统后台登录</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
<style type="text/css">
	#logo_font{
		font-size: 30px;
		color: white;
		display:block;
		margin-top: 5px;
		letter-spacing: 10px;
		margin-left: 30px;
	}
	
	/* #msg_info{
		position: fixed;
		left: 535px;
		top: 155px;
		background-color: pink;
	} */
</style>
</head>
<body>
	<input type="hidden" id="TenantId" name="TenantId" value="" />
	<div class="header">
		<font id="logo_font">订餐管理系统后台</font>
	</div>
	<div class="loginWraper">
		<div id="loginform" class="loginBox">
			<form class="form form-horizontal" action="${APP_PATH}/adminLogin" method="post">
				
					<label id="msg_info" style="color: red;margin-left: 160px;">${msg}</label>
				
				<div class="row cl">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
					<div class="formControls col-xs-8">
						<input id="username" name="loginid" type="text" placeholder="账户" value="${admin.loginid}"  class="input-text size-L">
 					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
					<div class="formControls col-xs-8">
						<input id="password" name="password" type="password" placeholder="密码" value="${admin.password}"  class="input-text size-L">
							
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<input class="input-text size-L" type="text" placeholder="验证码" name="verifCode"
							onblur="if(this.value==''){this.value='验证码:'}"
							onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:"
							style="width: 150px;"> 
							<img  title="验证码"  id="image_verifCode" src="${APP_PATH}/verifCode" style="width:108px;height:40px;"> 
							<a id="kanbuq" href="javascript:;">看不清，换一张</a>		
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<label for="online"> 
						<!-- <input type="checkbox" name="online" id="online" value="">
						使我保持登录状态 -->
						<a href="${APP_PATH}/toRegistPage" style="font-size: 16px; margin-bottom: -200px"  >注册</a>
						</label>
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;"> 
 						<input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
  					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="footer">Copyright 订餐管理系统</div>
	<script type="text/javascript" src="${APP_PATH}/static/hui/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="${APP_PATH}/static/hui/static/h-ui/js/H-ui.min.js"></script>
	<!--此乃百度统计代码，请自行删除-->
	<script>
		$(function(){
			//看不清，换一张
			$("#kanbuq").click(function(){
				$("#image_verifCode").attr("src","${APP_PATH}/verifCode?time="+new Date().getTime());
			});
		});
	</script>

</body>
</html>