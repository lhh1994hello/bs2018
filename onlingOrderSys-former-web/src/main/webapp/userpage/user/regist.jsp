<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<!-- 引入的配置文件 -->
<%@ include file="../public/waimaiCssJs.jsp"%>
<%@ include file="../public/myjs.jsp"%>
<style type="text/css">
/* #registform {
	border: 1px solid blue;
} */

/* #x1 {
	border: 1px solid red;
} */
#registform{
	margin-top: 100px;
}
</style>
</head>
<body>
	<div class="row" id="head_row">
		<%@ include file="../public/baiduwaimaihead.jsp"%>
	</div>
	<div class="container-fluid">
		<%-- <%@ include file="../public/head2.jsp"%>
		<h1>注册页面</h1> --%>
		<div class="col-md-6 col-md-offset-2" id="registform">
			<h3></h3>
			<form class="form-horizontal" action="${APP_PATH}/regist"
				method="post" onsubmit=" return  check_onsubmit()">
				<!-- 昵称 -->
				<div class="form-group    has-feedback">

					<label for="inputEmail3" class="col-sm-2 control-label">昵&nbsp;称</label>
					<div class="col-sm-10">

						<input type="text" class="form-control" id="input_nickname"
							name="uNickname" placeholder="可重复，可不填"> <span
							class="help-block "></span> <span
							class="glyphicon  form-control-feedback"></span>

					</div>
				</div>

				<div class="form-group    has-feedback">

					<label for="inputEmail3" class="col-sm-2 control-label">账&nbsp;号</label>
					<div class="col-sm-10">

						<input type="text" class="form-control" id="input_username"
							name="uLoginid" placeholder="登录账号"> <span
							class="help-block "></span> <span
							class="glyphicon  form-control-feedback"></span>

					</div>
				</div>
				<!-- 密码 -->
				<div class="form-group   has-feedback">
					<label for="inputPassword3" class="col-sm-2 control-label ">密&nbsp;码</label>
					<div class="col-sm-10 ">
						<input type="password" class="form-control " id="input_password"
							placeholder="Password" name="uPassword"> <span
							class="help-block"></span> <span
							class="glyphicon  form-control-feedback"></span>
					</div>
				</div>
				<!--  确认密码-->
				<div class="form-group has-feedback">
					<label for="inputEmail3" class="col-sm-2 control-label">确认密码</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="input_repassword"
							name="uRePassword" placeholder="password"> <span
							class="help-block"></span> <span
							class="glyphicon  form-control-feedback"></span>
					</div>
				</div>
				<!--  邮箱-->
				<div class="form-group has-feedback">
					<label for="inputPassword3" class="col-sm-2 control-label ">邮&nbsp;箱</label>
					<div class="col-sm-10 ">
						<input type="text" class="form-control " id="input_email"
							name="uEmail" placeholder="email"> <span
							class="help-block"></span> <span
							class="glyphicon  form-control-feedback"></span>
					</div>
				</div>
				<!--性别  -->

				<div class="form-group">


					<label for="inputPassword3" class="col-sm-2 control-label ">性
						别 </label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
						<input type="radio" name="uSex" id="optionsRadios1" value="男"
						checked="checked">男 &nbsp;&nbsp;&nbsp;
					</label> <label> <input type="radio" name="uSex"
						id="optionsRadios2" value="女">女
					</label>
				</div>
				<div class="form-group">
					<div class="col-md-4 col-md-offset-2">
						<button type="submit" class="btn btn-primary">注&nbsp;&nbsp;册</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="reset" class="btn btn-default" id="reset_button">重&nbsp;&nbsp;置</button>
					</div>

				</div>

				<!--  -->
			</form>
		</div>
	</div>
	<script type="text/javascript">
		//进行表单校验
		//当输入框change的时候校验用户的长度，格式，以及是否重复，当提交的时候判断输入框是否为空
		$("#input_username")
				.change(
						function() {
							var username = $("#input_username").val();
							var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u4E00-\u9FA5]{2,5})/;
							var pattern = pattern = /^([\u4e00-\u9fa5]{2,5}|[a-zA-Z-_0-9]{6,16})$/g;
							if (!pattern.test(username)) {
								//alert("不符合");
								show_validate_msg("#input_username", "fail",
										"用户名可以是6到16位字符，或者2到5个汉字");
								return false;
							} else {
								//符合了
								show_validate_msg("#input_username", "success",
										"用户名可用");
							}

						});
		//校验密码是否合法
		$("#input_password")
				.change(
						function() {
							var regex = /^(?!([a-zA-Z]+|\d+)$)[a-zA-Z\d]{6,20}$/;
							var password = $("#input_password").val();
							if (!regex.test(password)) {
								show_validate_msg("#input_password", "fail",
										"密码必须包含数字和字母且长度在6到20之间");
							} else {
								//成功
								var password_length = $("#input_password")
										.val().length;
								var msg = "";
								if (password_length > 6 && password_length < 10) {
									msg = "弱"
								} else if (password_length >= 10
										&& password_length < 15) {
									msg = "中"
								} else if (password_length >= 15
										&& password_length <= 20) {
									msg = "强"
								}
								show_validate_msg("#input_password", "success",
										"密码强度：" + msg);
							}
						});
		//校验确认密码框
		$("#input_repassword").change(
				function() {
					var repassword = $("#input_repassword").val();
					var password = $("#input_password").val();
					if (repassword != password) {
						show_validate_msg("#input_repassword", "warning",
								"两次填写的密码不一致");
					} else {
						show_validate_msg("#input_repassword", "success", "");
					}

				});
		//校验邮件
		$("#input_email")
				.change(
						function() {
							var email = $("#input_email").val();
							var regEmail = /^([a-zA-Z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
							if (!regEmail.test(email)) {
								show_validate_msg("#input_email", "fail",
										"邮箱格式不正确");
							} else {
								show_validate_msg("#input_email", "success",
										"邮箱可用");
							}
						});
		//最后进行总的校验
		function check_onsubmit() {
			//用户名
			var username = $("#input_username").val();
			if (username == null || username == "") {
				show_validate_msg("#input_username", "fail", "用户名不能为空!!!");
				return false;
			}
			var pattern = pattern = /^([\u4e00-\u9fa5]{2,5}|[a-zA-Z-_0-9]{6,16})$/g;
			if (!pattern.test(username)) {
				show_validate_msg("#input_username", "fail",
						"用户名可以是6到16位字符，或者2到5个汉字");
				return false;
			}
			//密码
			var password = $("#input_password").val();
			if (password == null || password == "") {
				show_validate_msg("#input_password", "fail", "请输入密码");
				return false;
			}
			var regex = /^(?!([a-zA-Z]+|\d+)$)[a-zA-Z\d]{6,20}$/;
			if (!regex.test(password)) {
				show_validate_msg("#input_password", "fail",
						"密码必须包含数字和字母且长度在6到20之间");
				return false;
			}
			//确认密码
			var repassword = $("#input_repassword").val();
			if (repassword == null || repassword == "") {
				show_validate_msg("#input_repassword", "warning", "请确认密码");
				return false;
			}
			if (repassword != password) {
				show_validate_msg("#input_repassword", "warning", "两次填写的密码不一致");
				return false;
			}
			//邮箱
			var email = $("#input_email").val();
			if (email == null || email == "") {
				show_validate_msg("#input_email", "fail", "请输入邮箱");
				return false;
			}
			var regEmail = /^([a-zA-Z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!regEmail.test(email)) {
				//不符合
				show_validate_msg("#input_email", "fail", "邮箱格式不正确");
				return false;
			}
			return true;
		}
		//点击重置按钮，去除样式
		$("#reset_button").click(function() {

			reset_css("#input_username");
			reset_css("#input_password");
			reset_css("#input_repassword");
			reset_css("#input_email");

		});
		//去除样式
		function reset_css(ele) {
			$(ele).parent().parent().removeClass(
					"has-success has-error has-warning");
			$(ele).next("span").next("span").removeClass(
					"glyphicon-ok glyphicon-remove glyphicon-warning-sign");
			$(ele)
					.next("span")
					.removeClass(
							"glyphicon glyphicon-ok glyphicon glyphicon-remove glyphicon glyphicon-info-sign")
			//清空提示内容
			$(ele).next("span").text("");
		}
		//
		//显示验证信息,id,状态，信息
		function show_validate_msg(ele, status, msg) {
			/* 	$(ele).parent().parent().removeClass("has-success has-error has-warning");
				$(ele).next("span").next("span").removeClass("glyphicon-ok glyphicon-remove glyphicon-warning-sign");
				$(ele).next("span").removeClass("glyphicon glyphicon-ok glyphicon glyphicon-remove glyphicon glyphicon-info-sign")
				//清空提示内容
				$(ele).next("span").text(""); */
			reset_css(ele);
			if (status == "success") {
				/* 成功信息 */
				$(ele).parent().parent().addClass("has-success");
				$(ele).next("span").next("span").addClass("glyphicon-ok");
				$(ele).next("span").addClass("glyphicon glyphicon-ok");
				$(ele).next("span").text(msg);
			} else if (status == "fail") {
				$(ele).parent().parent().addClass("has-error");
				$(ele).next("span").next("span").addClass("glyphicon-remove");//按规定设置格式的属性
				$(ele).next("span").addClass("glyphicon glyphicon-remove");//提示信息的图标
				$(ele).next("span").text(msg);

			} else if (status == "warning") {
				$(ele).parent().parent().addClass("has-warning");
				$(ele).next("span").next("span").addClass(
						"glyphicon-warning-sign");
				$(ele).next("span").addClass("glyphicon glyphicon-info-sign");
				$(ele).next("span").text(msg);
			}

		}
	</script>

</body>
</html>