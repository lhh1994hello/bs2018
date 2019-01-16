<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<!-- 引入的配置文件 -->
<%@ include file="../public/waimaiCssJs.jsp"%>
<%@ include file="../public/myjs.jsp"%>
<style type="text/css">

#registform{
	margin-top: 50px;
}
#msg_id{
	margin-bottom: 15px;
}
#vercode{
	width:120px;
	margin-left:-13px;
	/* height:30px;
	border-bottom:2px solid black; */
}
</style>
</head>
<body>
	<div class="row" id="head_row">
		<%@ include file="../public/baiduwaimaihead.jsp"%>
	</div>
	<div class="container-fluid">
		<%-- <%@ include file="../public/head2.jsp"%> --%>
 		<div class="col-md-6 col-md-offset-2" id="registform">
			<div class="row" id="msg_id">
				<div class="col-md-4 col-md-offset-2">
					<p style="color: red; font-weight: 900">${msg }</p>
				</div>
			</div>
			
			<form id="form_side" class="form-horizontal"
				action="${APP_PATH}/login" method="post"
				onsubmit=" return  check_onsubmit()">

				<div class="form-group    has-feedback">
					<label for="inputEmail3" class="col-sm-2 control-label">账&nbsp;号</label>
					<div class="col-sm-10">

						<input type="text" class="form-control"  id="input_username"
							name="uLoginid" value="${form.uLoginid}" placeholder="账号或邮箱" style="width:420px;"> <span
							class="help-block "></span> 
							<span 	class="glyphicon  form-control-feedback"></span>
						

					</div>
				</div>
				<!-- 密码 -->
				<div class="form-group   has-feedback">
					<label for="inputPassword3" class="col-sm-2 control-label ">密&nbsp;码</label>
					<div class="col-sm-10 ">
						<input type="password" class="form-control " id="input_password"
							placeholder="Password" name="uPassword" value="${form.uPassword}" style="width:420px;"> 
							<span class="help-block"></span>
							<span class="glyphicon  form-control-feedback"></span>
							
					</div>
				</div>

				<!--忘记密码-->
				<div class="form-group   has-feedback">
					<label for="inputPassword3" class="col-sm-2 control-label ">验证码:</label>
					<div class="col-md-10">
						<div class="col-md-3"><input class="form-control " id="vercode" type="text" name="verifCode"  /></div>
						<div class="col-md-2"><img  id="image" alt="验证码" src="${APP_PATH}/verifCode"></div>
						<div class="col-md-2" style="padding-top:13px; margin-left:20px;"><a href="#" id="changeImage">换一张</a></div>
						<div class="col-md-3 col-md-offset-2" style="padding-top:10px; margin-left:20px;"><a href="#">忘记密码?</a></div>
						
					</div>
					<!-- <label for="inputPassword3" class="col-sm-2 control-label ">密&nbsp;码</label> -->
					<!-- <div class="col-md-2 col-md-offset-10 "> -->
					<!-- <div class="col-md-2 ">
						<a href="#">忘记密码?</a>
					</div> -->
				</div>
				<!-- 提交 -->
				<div class="form-group">
					<div class="col-md-4 col-md-offset-2">
						<button type="submit" class="btn btn-primary">登&nbsp;&nbsp;录</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-default" id="to_regist">去注册</button>
					</div>

				</div>
			</form>
		</div>
	</div>
	<!--  JS代码-->
	<script type="text/javascript">
	
		$("#changeImage").click(function(){
			$("#image").attr("src","${APP_PATH}/verifCode?time="+new Date().getTime());
		});
		$("#to_regist").click(function() {
			//alert("去注册");
			location.href = "${APP_PATH}/userpage/user/regist.jsp"
		});
		function check_onsubmit() {
			var loginID = $("#input_username").val();
			if (loginID == null || loginID == "") {
				alert("用户名不能为空");
				return false;
			}
			var password = $("#input_password").val();
			if (password == null || password == "") {
				alert("密码不能为空");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>