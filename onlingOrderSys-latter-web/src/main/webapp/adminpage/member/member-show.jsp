<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/static/h-ui.admin/css/style.css" />

<title>个人详情</title>
</head>
<body>
	<div class="cl pd-20" style=" background-color:#5bacb6">
	<!-- <img alt="" src="/onlingOrderSys/images/head/201804261540127753_t6.jpg"> -->
	<img class="avatar size-XL l" src="${APP_PATH}/static/hui/static/h-ui/images/ucnter/avatar-default.jpg" id="image_id">
	<dl style="margin-left:80px; color:#fff">
		<dt>
			<span class="f-18" id="uNickname">张三</span>
			<span class="pl-10 f-12">余额：40</span>
		</dt>
		<dd class="pt-10 f-12" style="margin-left:0" id="introduce" >这家伙很懒，什么也没有留下</dd>
	</dl>
</div>
<div class="pd-20">
	<table class="table">
		<tbody>
			<tr>
				<th class="text-r" width="80">性别：</th>
				<td id="uSex">男</td>
			</tr>
			<tr>
				<th class="text-r" >手机：</th>
				<td id="uPhone">13000000000</td>
			</tr>
			<tr>
				<th class="text-r" >邮箱：</th>
				<td id="uEmail">admin@mail.com</td>
			</tr>
			<tr>
				<th class="text-r" >地址：</th>
				<td id="uAddress">北京市 海淀区</td>
			</tr>
			<tr>
				<th class="text-r" >注册时间：</th>
				<td id="uRegisttime">2014.12.20</td>
			</tr>
			<tr>
				<th class="text-r">积分：</th>
				<td>330</td>
			</tr>
		</tbody>
	</table>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/hui/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/hui/static/h-ui.admin/js/H-ui.admin.js"></script> 
<!--/_footer 作为公共模版分离出去-->
<script type="text/javascript">
	$(function(){
		var uId="-100";
		var url= window.location.href;
		 if (url.indexOf("?") != -1) {   
			 var index=url.indexOf("=");
			 uId=url.substring(index+1);
		 }
		 fillData();
		 function fillData(){
			 $.ajax({
				 url:"${APP_PATH}/findUserByUid?uId="+uId,
				 type:"POST",
				 success:function(result){
					 var user =result.extend.user;
					// alert(user.uEmail);
					 var image=user.image;
					 var introduce=user.introduce;
					 var uSex=user.uSex;
					 var uEmail=user.uEmail;
					 var uPhone=user.uPhone;
					 var uRegisttime=user.uRegisttime;
					 var uAddress=user.uAddress;
					 if(image!="0000"){
						 $("#image_id").attr("src",image);//图片
					 }
					 if(introduce!=""){
						$("#introduce").text("").text(user.introduce);//介绍
					 }
					 $("#uNickname").text("").text(user.uNickname);//昵称
					 $("#uSex").text("").text(user.uSex);//性别
					 $("#uPhone").text("").text(user.uPhone);//手机
					 $("#uRegisttime").text("").text(user.uRegisttime);//注册时间
					 $("#uAddress").text("").text(user.uAddress);//地址
					 $("#uEmail").text("").text(user.uEmail);//地址
				 }
				
			 });
		 }
	});
	
	 

</script>


<!--请在下方写此页面业务相关的脚本-->
</body>
</html>