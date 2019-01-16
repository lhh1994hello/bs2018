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
<title>Insert title here</title>
</head>
<body>
	<article class="page-container">
	<form action="#" method="post" class="form form-horizontal" id="form-change-password">
		<!-- <input type="hidden" name="uId" /> -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>账户：</label>
			<div class="formControls col-xs-8 col-sm-9" ><span id="uLoginid"> 张三</span> </div>
		</div>
		<!--  -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>原密码：</label>
			<div class="formControls col-xs-8 col-sm-9" ><span id="pwd">123456</span> </div>
		</div>
		<!--  -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>新密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" autocomplete="off" placeholder="不修改请留空" name="newpassword" id="newpassword">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>确认密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" autocomplete="off" placeholder="不修改请留空" name="newpassword2" id="new-password2">
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="button" id="submit1" value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/layer/2.4/layer.js"></script>  
<script type="text/javascript" src="${APP_PATH}/static/hui/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${APP_PATH}/static/hui/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/jquery.validation/1.14.0/messages_zh.js"></script> 

<script type="text/javascript">
$(function(){
	var msg="";
	//修改密码:uId是用户id
	var uNickname2="";
	var uLoginid2="";
	var uId="-100";
	var url= window.location.href;
	 if (url.indexOf("?") != -1) {   
		 var index=url.indexOf("=");
		 uId=url.substring(index+1);
		//alert(uId);
	 }
	 $("#submit1").click(function(){
		 msg="";
		 var uPassword=$("#newpassword").val();
		 var uRePassword=$("#new-password2").val();
		 $.ajax({
			 type: 'POST',
			 url: '${APP_PATH}/changePassword',
			 dataType: 'json',
			 data:{"uId":uId,"uPassword":uPassword,"uRePassword":uRePassword},
			 success:function(result){
				 var code=result.code;
				if(code==100){
				 modalalertdemo();
				 setTimeout(function() {
					 $("#submit1").submit();
				 }, 1000);
				}else if(code==200){
					msg=result.extend.msg;
					//alert("提示:"+msg);
					$.Huimodalalert(msg,1500);
				}
				
			 }
		 });
	 });
	 filData();
	 //数据回显
	 function filData(){
		
		 if(uId=="-100"){
			 alert("ID非法！！！");
			 return false;
		 }
		 $.ajax({
			 type: 'POST',
			 url: '${APP_PATH}/findUserByUid',
			 dataType: 'json',
			 data:{"uId":uId},
			 success:function(result){
				 var user=result.extend.user;
				// alert("昵称;"+user.uNickname);
				uNickname2=user.uNickname;//昵称
				uLoginid2=user.uLoginid;
				$("#pwd").text("").text(user.uPassword);
				 $("#uLoginid").text("").text(user.uLoginid);
			 }
		});
	 }
	 
	 	function modalalertdemo(){
	 		
	 		var info="";
	 		var info1= uNickname2;
	 		var info2=uLoginid2;
	 		if(info1==""){
	 			//昵称为空，显示账号
	 			info="账号:"+info2+"密码修改成功";
	 		}else{
	 			info="昵称:"+info1+"密码修改成功";
	 		}
	 		if(msg!=""){
	 			info=msg;
	 		}
	 		var uPassword=$("#newpassword").val();
	 		var uRePassword=$("#new-password2").val();
	 		if(uPassword==""||uRePassword==""){
	 			return false;
	 		}
	 		if(uRePassword!=uPassword){
	 			return false;
	 		}
			$.Huimodalalert(info,1500);
		}
	//****************************************
	$("#form-change-password").validate({
		rules:{
			newpassword:{
				required:true,
				minlength:6,
				maxlength:16
			},
			newpassword2:{
				required:true,
				minlength:6,
				maxlength:16,
				equalTo: "#newpassword"
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit();
			var index = parent.layer.getFrameIndex(window.name);
			parent.$('.btn-refresh').click();
			parent.layer.close(index);
		}
	});
});
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>