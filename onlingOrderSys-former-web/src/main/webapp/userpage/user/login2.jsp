<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录-拼图</title>
<%@ include file="../public/waimaiCssJs.jsp"%>
<%@ include file="../public/myjs.jsp"%>
<script src="${APP_PATH}/static/pintuer/jquery.js"></script>
<script src="${APP_PATH}/static/pintuer/pintuer.js"></script>
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/pintuer/pintuer.css" />
	

<style type="text/css">
/*特别说明，验证码样式不包含在拼图pintuer.css文件内，需要自己添加到自己的style.css文件中，若要使用登录模块，需复制.passcode样式。*/
.passcode {
	position: absolute;
	right: 0;
	top: 0;
	height: 32px;
	margin: 1px;
	border-left: solid 1px #ddd;
	text-align: center;
	line-height: 32px;
	border-radius: 0 4px 4px 0;
}
</style>
</head>
<body>
	<div class="row" id="head_row">
		<%@ include file="../public/baiduwaimaihead.jsp"%>
	</div>

	<div class="container-fluid">
	<div class="row" style="height: 50px;">
	
	</div>
		<div align="center">
			<form action="${APP_PATH}/login" method="post">
				<div class="panel padding" style="width: 450px; text-align: left;">
					<div class="text-center">
						<br>
						<h2>
							<strong>欢迎使用&nbsp;订餐系统</strong>
						</h2>
					</div>
					<h5 style="padding-left: 32px;margin-bottom: -20px;color: red">${msg}</h5>
					<div class="" style="padding: 30px;">
						<div class="form-group">
							<div class="field field-icon-right">
								<input type="text" class="input" name="uLoginid" placeholder="登录账号"
									data-validate="required:请填写账号,length#>=0:账号长度不符合要求" autocomplete="off" /> 
									<span class="icon icon-user" ></span>
									
							</div>
						</div>
						<div class="form-group">
							<div class="field field-icon-right">
								<input type="password" class="input" name="uPassword"
									placeholder="登录密码"
									data-validate="required:请填写密码,length#>=0:密码长度不符合要求" /> <span
									class="icon icon-key"></span>
							</div>
						</div>
						<div class="form-group">
							<div class="field">
								<input type="text" class="input" name="verifCode" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" /> 
 								<!-- <img src="http://www.pintuer.com/demo/pintuer2/images/passcode.jpg" width="80" height="32" class="passcode" /> -->
 								<img title="换一张" alt="验证码" id="image" src="${APP_PATH}/verifCode" width="80" height="32" class="passcode" />
									
									
							</div>
						</div>
						<div class="form-group">
							<div class="field">
								<button class="button button-block bg-main text-big">立即登录</button>
							</div>
						</div>
						<div class="form-group">
							<div class="field text-center">
								<p class="text-muted text-center">
									<a class="" href="${APP_PATH}/userpage/user/forgetPassword.jsp"><small>忘记密码了？</small></a> | 
									<a class="" href="javascript:void(0);" id="to_regist">注册新账号</a>
										
								</p>
							</div>
						</div>
						<div class="text-right text-small text-gray padding-top">
							<!-- <a class="text-gray" target="_blank" href="http://www.pintuer.com"> 拼图</a> -->
							<a class="text-gray" target="_blank" href="javascript:void(0);"> 订餐系统</a>
								 版权所有
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
		$("#to_regist").click(function() {
			//alert("去注册");
			$("input").attr("data-validate","");
			window.location.href = "${APP_PATH}/userpage/user/regist.jsp"
				
		});
		$("#image").click(function(){
			$("#image").attr("src","${APP_PATH}/verifCode?time="+new Date().getTime());
		});
	</script>
</body>
</html>