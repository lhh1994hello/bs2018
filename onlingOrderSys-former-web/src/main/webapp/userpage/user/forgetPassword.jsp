<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>忘记密码</title>
<link rel="icon" href="//static.waimai.baidu.com/static/forpc/favicon.ico" 	
	mce_href="//static.waimai.baidu.com/static/forpc/favicon.ico"
	type="image/x-icon">
<%@ include file="../public/myjs.jsp"%>
<%@ include file="../public/huiJSAndCss.jsp"%>
<style type="text/css">
	#header_id{
		background: url(${APP_PATH}/images/default/huat-logo.png);
		background-repeat: no-repeat;
	}
</style>
</head>
<body>
	<!-- <button class="layui-btn layui-btn-radius">默认按钮</button> -->
	<div class="container">
		<div class="row" style="height:80px;background-color: #6f6f6f" id="header_id">
		
		</div>
		<!--  -->
		<div class="row" style="height: 50px;margin-top: 10px;">
			<div class="col-md-6">
				<button class="layui-btn layui-btn-primary">账号:</button>
				<input type="text" placeholder="账号/邮箱" style="height:36px;width: 230px;" id="input_context_id"/>
				<label style="width: 90px;" ></label>
				<button style="" class="layui-btn" id="confirm_btn">确定</button>
			</div>
			<div class="col-md-1 col-md-offset-5">
				<button class="layui-btn  layui-btn-normal" id="return_back_btn">返回</button>
			</div>
		
		</div>
		<div class="row" style="margin-bottom: 10px; display: none;" id="chooseStyle">
			<div class="col-md-4">
				<button class="layui-btn layui-btn-primary "><font style="color: #ff8080">选择找回方式</font></button>
			</div>
		</div>
		<div class="row" id="main_div_id" >
			<div class="col-md-4" style="display: none;" id="mibaoStyle">
				<button class="layui-btn layui-btn-normal" id="mibao_back_btn">密保找回</button>
				<div class="row" style="height: 10px;"></div>
				
				<div class="row" style="padding-bottom: 5px;display: none;">
 					<div class="col-md-12" >
						<label>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:</label>
						<input type="text" style="height: 30px;width: 200px;margin: 3px;" readonly="true" class="account"><br/>
						<label>密保问题:</label>
						<input id="request" type="text" style="height: 30px;width: 200px;margin: 3px;" ><br/>
						<label>密保答案:</label>
						<input id="answer" type="text" style="height: 30px;width: 200px;margin: 3px;">
							<label></label>
						<br/>
						<button id="mibao_submit_btn" class="layui-btn layui-btn-sm">修&nbsp;&nbsp;改</button>
					</div>
				</div>
				
			</div>
			<div class="col-md-4" style="display: none;" id="emailStyle" >
				<button class="layui-btn" id="email_back_btn">邮箱找回</button>
				<div class="row" style="height: 10px;"></div>
				<div class="row" style="padding-bottom: 5px; display: none;">
 					<div class="col-md-12" >
						<label>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:</label>
						<input type="text" style="height: 30px;width: 200px;margin: 3px;" class="account" readonly="true"><br/>
						<label>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</label>
						<input type="text" style="height: 30px;width: 200px;margin: 3px;" id="email_input_id"><label></label><br/>
 						<button class="layui-btn layui-btn-sm" id="sendEmail">发送邮件</button>
					</div>
				</div>
				
 			</div>
 			<div class="col-md-4" style="display: none;" id="phoneStyle">
				<button class="layui-btn layui-btn-warm" id="phone_back_btn">手机找回</button>
				<div class="row" style="height: 10px;"></div>
				
				<div class="row" style="padding-bottom: 5px;display: none;">
 					<div class="col-md-12" >
						<label>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:</label>
						<input type="text" style="height: 30px;width: 200px;margin: 3px;" class="account" readonly="true"><br/>
						<label>手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机:</label>
						<input type="text" style="height: 30px;width: 200px;margin: 3px;" id="userPhone"  />
						<label id="phone_label_info"></label><br/>
						<input type="hidden" id="Phone_user_id" />
						
						<input type="text" style="height: 30px;width: 100px;margin: 3px;margin-left:65px;display: none;" id="vercode_id" class="vercode" />
						<label class="vercode" style="display:none;">验证码</label><br/>
 						<button style="margin-left: 65px;" class="layui-btn layui-btn-sm" id="sendVercode_id">发验证码</button>
 						<span id="phoneChangepassword_id">
 							<!-- <button class="layui-btn layui-btn-normal layui-btn-sm">修改密码</button> -->
 						</span>
					</div>
				</div>
			</div>
		
		</div>
		<div class="row" id="reChangepassword_id" style="display: none;">
			<div class="col-md-6">
				<span id="info_span_id_a"></span><br/>
				<label>账号:</label> <label id="fillUidDate" style="margin-left: 30px;"></label><br/>
				<label>新密码:</label><input id="newPassword_id" type="text" style="height: 30px;width:200px;margin: 3px;" /><label></label><br/>
				<label>再确认:</label><input id="renewPassword_id" type="text"  style="height: 30px;width:200px;margin: 3px;" /><label></label><br/>
				<button  id="changeNewPassword_btn" class="layui-btn layui-btn-sm" style="margin-left: 50px;">修改</button>
			</div>
		</div>
		
	</div>
	<!-- ************************************************************************************************ -->
	<script type="text/javascript">
		$(function(){
			var uSafequest="";
			var uId="";
			var loginID="";
			//checkPhoneRandom
			var url= window.location.href;
			if (url.indexOf("?") != -1) {   
				var index=url.indexOf("=");
				var flagIndex=url.indexOf("&");
				var  param=url.substring(index+1);
				var  fromEmail=url.substring(flagIndex+1);
				var fromEmail_idex=fromEmail.indexOf("=");
				var flagEmail=fromEmail.substring(fromEmail_idex+1);
 				//alert("主键："+param);
 				//截取主键
 				var beginIndex=url.indexOf("uId=");
 				var endIndex=url.indexOf("&");
 				var mainID= url.substring(beginIndex+4,endIndex);
 				//alert("主键main;"+mainID);
				console.log("标志:"+flagEmail);
				
				if(flagEmail=="fromEmail"){
					//alert("adsfdds");
					emailcallback(mainID);
				}
			 }
			
			//邮箱回调
			function  emailcallback(param){
				//alert("进来没1");
				$("#main_div_id").css("display","none");
				$("#chooseStyle").css("display","none|");
				
				$.ajax({
					url:"${APP_PATH}/emailcallback",
					type:"POST",
					data:{"uId":param},
					success:function(result){
						var code=result.code;
 						//console.log("标志code:"+code);
						if(code=="100"){
 							$("#reChangepassword_id").css("display","block");
							var user=result.extend.user;
							$("#fillUidDate").text("").append(user.uLoginid);
							
						}else if(code=="200"){
							var msg=result.extend.msg;
							//console.log("msg:"+msg);
							$("#info_span_id_a").text("").append(msg);
						}
					}
				});
				
			}
			
			//邮箱校验
			$("#sendEmail").click(function(){
				$("#email_input_id").next("label").text("");
				var uEmail=$("#email_input_id").val();
				//alert("邮箱:"+uEmail);
				var regEmail=/^([a-zA-Z0-9_\.-]+)@([\da-zA-Z\.-]+)\.([a-zA-Z\.]{2,12})$/;
				if(!regEmail.test(uEmail)){
					var font_ele=$("<font style='color:#ff8080'>非法邮箱</font>");
					$("#email_input_id").next("label").text("").append(font_ele);
					return false;
				}
				//校验通过后设置10秒后才能再次点击，防止重复提交
				$("#sendEmail").addClass("layui-btn-disabled");
				setTimeout(function(){
					$("#sendEmail").removeClass("layui-btn-disabled");
				},10000);
				$.ajax({
					url:"${APP_PATH}/backPasswordByEmail",
					data:{"uId":uId,"uEmail":uEmail},
					type:"POST",
					success:function(result){
						var code=result.code;
						if(code=="100"){
							//alert("成功了");
							//当邮件发送成功后，设置按钮10秒内不可点击layui-btn-disabled
							//<button class="layui-btn layui-btn-sm" id="sendEmail">发送邮件</button>
							
						}else if(code=="200"){
							var msg=result.extend.msg;
							var font_ele=$("<font style='color:#ff8080'></font>").append(msg);
							$("#email_input_id").next("label").text("").append(font_ele);
							
						}
						
					}
				});
			});
			
			
			$(document).on('click', '.phone_change_btn', function() {
				var phoneCode=$("#vercode_id").val();
				if(phoneCode==""){
					$("#phone_label_info").text("").append("请输入验证码");
				}
				$.ajax({
					url:"${APP_PATH}/checkPhoneRandom",
					type:"POST",
					data:{"phoneCode":phoneCode},
					success:function(result){
						var code=result.code;
						if(code=="100"){
							$("#fillUidDate").text("").append(loginID);
							$.Huimodalalert('校验通过', 1000);
							setTimeout(function(){
  								$("#main_div_id").css("display","none");
								$("#chooseStyle").css("display","none");
							    $("#reChangepassword_id").css("display","block");
 							},1000);
						}else if(code=="200"){
							var msg=result.extend.msg;
							$("#phone_label_info").text("").append(msg);
						}
					}
				});
	  			//alert("修改密码");
			});
			
			//点击手机找回那发送验证码
			$("#sendVercode_id").click(function(){
				var uLoginid=$("#phoneStyle .account").val();
				var uPhone=$("#userPhone").val();
				//alert(uPhone);
				var myregPhone=/^[1][3,4,5,7,8][0-9]{9}$/;
				//如果手机格式是正确的，就显示手机找回密码选项
				//alert(uPhone);
				if(!myregPhone.test(uPhone)) {
					var font_ele=$("<font style='color:#ff8080'>手机格式错误</font>");
					$("#phone_label_info").text("").append(font_ele);						
					return false;
				}
 				$.ajax({
 					url:"${APP_PATH}/transmitVerificationCode",
 					data:{"uId":uId,"uPhone":uPhone},
 					type:"POST",
 					success:function(result){
 						var code=result.code;
 						if(code=="100"){
 							$("#phone_label_info").text("");
 							$(".vercode").css("display","inline");
 							$.Huimodalalert('验证码发送 成功', 1000);
 							$("#sendVercode_id").addClass("layui-btn-disabled");
 							//拼接修改密码按钮<button class="layui-btn layui-btn-normal layui-btn-sm">修改密码</button>
 							var btn_ele=$("<button class='layui-btn layui-btn-normal layui-btn-sm phone_change_btn'>修改密码</button>");
 							$("#phoneChangepassword_id").text("").append(btn_ele);
 							setTimeout(function(){
 								$("#sendVercode_id").removeClass("layui-btn-disabled");
 							},10000);
 						}else if(code=="200"){
 							var msg=result.extend.msg;
 							//phone_label_info
 							var font_ele=$("<font style='color:#ff8080'></font>").text("").append(msg);
							$("#phone_label_info").text("").append(font_ele);
 							//alert("提示:"+msg);
 						}
 					}
 				});
			});
			
			//点击密保那个修改按钮后
			$("#mibao_submit_btn").click(function(){
				var inputContext=$("#mibaoStyle .account").val();
				var uSafequest=$("#request").val();
				var uSafeanswer=$("#answer").val();
				if(uSafeanswer==""){
					var font_ele=$("<font style='color:#ff8080'>请输入答案</font>");
					$("#answer").next("label").text("").append(font_ele);
					return false;
				}
				$.ajax({
					url:"${APP_PATH}/backPasswordByMibao",
					data:{"inputContext":inputContext,"uSafequest":uSafequest,"uSafeanswer":uSafeanswer},
					type:"POST",
					success:function(result){
						var code=result.code;
						if(code=="100"){
							var user=result.extend.user;
							var uLoginid=user.uLoginid;
 							$("#fillUidDate").text("").append(uLoginid);
							$.Huimodalalert('校验通过', 1000);
							setTimeout(function(){
  								$("#main_div_id").css("display","none");
								$("#chooseStyle").css("display","none");
							    $("#reChangepassword_id").css("display","block");
 							},1000);
						}else if(code=="200"){
							$.Huimodalalert('校验失败', 1000);
						}
					}
				});
			});
			
			//提交修改密码按钮
			$("#changeNewPassword_btn").click(function(){
				var password=$("#newPassword_id").val();
				var repassword=$("#renewPassword_id").val();
				var uLoginId=$("#fillUidDate").text();
				if(password==""){
					var font_ele=$("<font style='color:#ff8080'>请输入密码！</font>");
					$("#newPassword_id").next("label").text("").append(font_ele);
					return false;
				}
				if(repassword==""){
					var font_ele=$("<font style='color:#ff8080'>请确认密码！</font>");
					$("#renewPassword_id").next("label").text("").append(font_ele);
					return false;
				}
				if(password!=repassword){
					var font_ele=$("<font style='color:#ff8080'>两次密码不同！</font>");
					$("#newPassword_id").next("label").text("").append(font_ele);
 					$("#renewPassword_id").next("label").text("");
					return false;
				}
				$.ajax({
					url:"${APP_PATH}/setNewPassword",
					type:"POST",
					data:{"uLoginid":uLoginId,"uPassword":password,"uRePassword":repassword},
					success:function(result){
						var code=result.code;
						if(code=="100"){
							$.Huimodalalert('密码设置成功', 1000);
							setTimeout(function(){
								window.location.href="${APP_PATH}/userpage/user/login2.jsp"
 							},1200);
						}else if(code=="200"){
							$.Huimodalalert('操作失败', 1000);
						}
						
					}
				});
				
			});
			//密保展开
			$("#mibao_back_btn").click(function(){
				//alert("dainji ");
				//把其他两项设为隐藏，把查询条件拿到放到输入框中
				$("#mibao_back_btn").next("div").next("div").css("display","block");
				$("#email_back_btn").next("div").next("div").css("display","none");
				$("#phone_back_btn").next("div").next("div").css("display","none");
				
				var input_context=$("#input_context_id").val();
				$("#mibaoStyle  .account").val(input_context);
				//alert(uSafequest);
				$("#request").val(uSafequest);
				
			});
			//邮箱展开
			$("#email_back_btn").click(function(){
				//alert("dainji ");
				//把其他两项设为隐藏，把查询条件拿到放到输入框中
				$("#mibao_back_btn").next("div").next("div").css("display","none");
				$("#email_back_btn").next("div").next("div").css("display","block");
				$("#phone_back_btn").next("div").next("div").css("display","none");
				var input_context=$("#input_context_id").val();
				$("#emailStyle  .account").val(input_context);
				//alert(uSafequest);
  			});
			
			//手机展开
			$("#phone_back_btn").click(function(){
				$("#Phone_user_id").val(uId);
				//把其他两项设为隐藏，把查询条件拿到放到输入框中
				$("#mibao_back_btn").next("div").next("div").css("display","none");
				$("#email_back_btn").next("div").next("div").css("display","none");
				$("#phone_back_btn").next("div").next("div").css("display","block");
				var input_context=$("#input_context_id").val();
				$("#phoneStyle  .account").val(input_context);
				//alert(uSafequest);
  			});
			//根据用户输入的条件查询用户信息
			$("#confirm_btn").click(function(){
				//alert("SDS")
				/* $("#mibaoStyle").css("display","block");
				$("#emailStyle").css("display","block");
				$("#phoneStyle").css("display","block"); */
				$("#mibao_back_btn").next("div").next("div").css("display","none");
				$("#main_div_id").css("display","block");
				$("#reChangepassword_id").css("display","none");
				$("#input_context_id").next("label").text("");
			
				findUserInfoByInputContext();
			});
			
			//根据用户输入的内容查询用户信息
			function findUserInfoByInputContext(){
				var uLoginid=$("#input_context_id").val();
				var len=uLoginid.length;
				if(len<1){
					var font_ele=$("<font style='color:#ff8080'>条件为空！</font>");
					$("#input_context_id").next("label").text("").append(font_ele);
 					return false;
				}
				$.ajax({
					url:"${APP_PATH}/findUserInfoByInputContext",
					data:{"inputContext":uLoginid},
					type:"POST",
					success:function(result){
						var code=result.code;
						if(code=="100"){
							
							chooseShow(result);
							//根据查询出来的内容决定要显示哪几个密保选项；
						}else if(code=="200"){
							var font_ele=$("<font style='color:#ff8080'>账号不存在！</font>");
							$("#input_context_id").next("label").text("").append(font_ele);
							$("#main_div_id").css("display","none");
						}
					}
					
				});
			}
			//根据查询结果选择性显示选项
			function chooseShow(result){
				//成功之后emailStyle
				$("#chooseStyle").css("display","block");
				$("#emailStyle").css("display","block");
				var user=result.extend.user;
				if(user==null||user=="") return false;
				uId=user.uId;
				loginID=user.uLoginid;
				var uPhone=user.uPhone;//手机
				uSafequest=user.uSafequest;//密保问题
				var uSafeanswer=user.uSafeanswer;
				var uEmail=user.uEmail;
				var myregPhone=/^[1][3,4,5,7,8][0-9]{9}$/;
				//如果手机格式是正确的，就显示手机找回密码选项
				//alert(uPhone);
				if(myregPhone.test(uPhone)){
					$("#phoneStyle").css("display","block");
				}else {
					$("#phoneStyle").css("display","none");
				}
				//是否显示密保选项
				if(uSafequest!=""&& uSafeanswer!=""){
					$("#mibaoStyle").css("display","block");
				}else{
					$("#mibaoStyle").css("display","none");
				}
			}
			//返回按钮事件
			$("#return_back_btn").click(function(){
 				window.location.href="${APP_PATH}/userpage/user/login2.jsp"
			});
		});
	</script>
</body>
</html>