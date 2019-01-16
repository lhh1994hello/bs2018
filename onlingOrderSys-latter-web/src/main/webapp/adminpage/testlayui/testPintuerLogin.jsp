<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 拼图 -->
<script src="${APP_PATH}/static/pintuer/jquery.js"></script>
<script src="${APP_PATH}/static/pintuer/pintuer.js"></script>
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/pintuer/pintuer.css" />
<title>拼图登录</title>
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
	
<div align="center">
	<form action="#index.html" method="post">
		<div class="panel padding" style="width: 450px;text-align: left;">
			<div class="text-center">
				<br>
				<h2><strong>欢迎使用&nbsp;拼图</strong></h2></div>
			<div class="" style="padding:30px;">
				<div class="form-group">
					<div class="field field-icon-right">
						<input type="text" class="input" name="admin" placeholder="登录账号" data-validate="required:请填写账号,length#>=5:账号长度不符合要求" />
						<span class="icon icon-user"></span>
					</div>
				</div>
				<div class="form-group">
					<div class="field field-icon-right">
						<input type="password" class="input" name="password" placeholder="登录密码" data-validate="required:请填写密码,length#>=8:密码长度不符合要求" />
						<span class="icon icon-key"></span>
					</div>
				</div>
				<div class="form-group">
					<div class="field">
						<input type="text" class="input" name="passcode" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />
						<img src="http://www.pintuer.com/demo/pintuer2/images/passcode.jpg" width="80" height="32" class="passcode" />
					</div>
				</div>
				<div class="form-group">
					<div class="field">
						<button class="button button-block bg-main text-big">立即登录</button>
					</div>
				</div>
				<div class="form-group">
					<div class="field text-center">
						<p class="text-muted text-center"> <a class="" href="#login.html"><small>忘记密码了？</small></a> | <a class="" href="#register.html">注册新账号</a>
						</p>
					</div>
				</div>
				<div class="text-right text-small text-gray padding-top"><a class="text-gray" target="_blank" href="http://www.pintuer.com">拼图</a> 版权所有</div>
			</div>
		</div>
	</form>
</div>
</body>
</html>