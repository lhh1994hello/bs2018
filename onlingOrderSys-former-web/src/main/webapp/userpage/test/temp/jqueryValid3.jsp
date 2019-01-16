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
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery.metadata.js"></script>
<script type="text/javascript"
	src="${APP_PATH}/static/js/messages_zh.js"></script>

<title>jquery validate使用3</title>
</head>
<body>
	<script>
		$().ready(function() {
			$("#signupForm").validate();
		});
	</script>
	<form id="signupForm" method="get" action="">
		<p>
			<label for="firstname">Firstname</label> 
			<!-- <input id="firstname" name="firstname" class="required" /> -->
			<input id="firstname" name="firstname" class="{required:true, minlength:5, messages:{required:'请输入内容'}}" />
				
		</p>
		<p>
			<label for="email">E-Mail</label> 
			<input id="email" name="email" class="required email" />
				
		</p>
		<p>
			<label for="password">Password</label> 
			<input id="password" name="password" type="password" class="{required:true,minlength:5}" />
 		</p>
		<p>
			<label for="confirm_password">确认密码</label> 
			<input id="confirm_password" name="confirm_password" type="password"
 				class="{required:true,minlength:5,equalTo:'#password'}" />
		</p>
		<p>
			<input class="submit" type="submit" value="Submit" />
		</p>
	</form>


</body>
</html>