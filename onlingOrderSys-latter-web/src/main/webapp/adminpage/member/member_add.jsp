<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Bookmark" href="${APP_PATH}/static/hui/favicon.ico" >
<link rel="Shortcut Icon" href="${APP_PATH}/static/hui/favicon.ico" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/static/h-ui.admin/css/style.css" />
<title>添加用户</title>
<style type="text/css">
	img{
		width: 90px;
		height: 90px;
		
	}
</style>

</head>
<body>
	<article class="page-container">
	<form action="" method="post" class="form form-horizontal" id="form-member-add">
		<!--  -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>账号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="username" name="username">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="默认:0000" id="pwd" name="uPassword" value="0000">
			</div>
		</div>
		
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal" id="choonseSex">
				<div class="radio-box" >
					<input name="sex" type="radio" id="sex-1" value="男" checked>
					<label for="sex-1">男</label>
				</div>
				<div class="radio-box">
					<input type="radio" id="sex-2" name="sex" value="女">
					<label for="sex-2">女</label>
				</div>
			</div>
		</div>
		<!-- <div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="mobile" name="mobile">
			</div>
		</div> -->
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="@" name="email" id="email">
			</div>
		</div>
		<div class="row cl">
			<img alt="头像" title="用户头像" src="http://localhost/headImage/201804280016315852_t7.jpg" id="image_id"  style="margin-left: -150px;">
			<label class="form-label col-xs-4 col-sm-3" style="margin-top: 33px;">头像：</label>
			<div class="formControls col-xs-4 col-sm-5" style="margin-top: 30px;" id="div_file"> 
					<span class="btn-upload">
						<!-- <input class="input-text upload-url" type="text" name="uploadfile"   id="uploadfile" readonly nullmsg="请添加附件！" style="width:180px"> -->
						<a href="javascript:void();" class="btn btn-primary radius upload-btn">
							<i class="Hui-iconfont">&#xe642;</i> 浏览图片
						</a>
						<input  type="file"  id="file_URL" multiple name="file" class="input-file">
					</span> 
			</div>
		</div>
		
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea id="beizhu" name="beizhu" cols="" rows="1" class="textarea"  placeholder="说点什么...最少输入10个字符" ></textarea>
				<p class="textarea-numberbar"><em id="em" class="textarea-length">0</em>/100</p>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit"  id="submit_btn" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>



<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/hui/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${APP_PATH}/static/hui/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<script type="text/javascript" src="${APP_PATH}/static/js/ajaxfileupload.js"></script> 
<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
$(function(){
	var loginFlag="-100";
	var emailFlag="-100";
	var textAreaFlag="100";
	$("#beizhu").keyup(function(){
		 var introduce= $("#beizhu").val();
		 var intro_len=introduce.length;
		 if(intro_len>100){
			 textAreaFlag="-100";
			 $.Huimodalalert("介绍太长了!!!",800);
		 }
		 $("#em").text("").text(intro_len);
	 });
	
	$("#email").change(function(){
		check_email();
	});
	$("#username").change(function(){
		check_uLoginId();
	});
	
	//检查账号是否被使用
	function check_uLoginId(){
		var uLoginid=$("#username").val();
		$.ajax({
			url:"${APP_PATH}/findUserByuLoginId?uLoginid="+uLoginid,
			type:"GET",
			success:function(result){
				//alert("成功了");
				var code=result.code;
				if(code=="100"){//邮件可用
					loginFlag="100";
				}else if(code=="200"){
					$.Huimodalalert(result.extend.msg,1200);
					loginFlag="-100";
				}else if(code=="300"){
					loginFlag="-100";
				}
			},
		});
	}
	//检查邮箱
	function check_email(){
		var uEmail=$("#email").val();
		$.ajax({
			url:"${APP_PATH}/findUserByEmail?uEmail="+uEmail,
			type:"GET",
			success:function(result){
				var code=result.code;
				if(code=="100"){//邮件可用
					emailFlag="100";
				}else if(code=="200"){
					emailFlag="-100";
					$.Huimodalalert(result.extend.msg,1200);
				}else if(code=="300"){
					emailFlag="-100";
				}
			},
		});
	}
	//点击事件,折腾了半天，用$("").change(function{});,只能响应一次
	$(document).on('change','#file_URL',function(){
		ajaxFileUpload();
	});
	function ajaxFileUpload(){
		$.ajaxFileUpload({
			url:"${APP_PATH}/addUserImage",
			secureuri: false, //是否需要安全协议，一般设置为false
			 fileElementId: 'file_URL', //文件上传域的ID
			 type:"POST",
			 dataType: 'json', //返回值类型 一般设置为json
			 success: function (data, status) {
				 var code=data.code;
				 if(code=="100"){
					 var imagePath= data.extend.user.image;
					 $("#image_id").attr("src",imagePath);
				 }else if(code=="200"){
					 alert(data.extend.msg);
				 }	 
			 },
			 error: function (data, status, e)//服务器响应失败处理函数
             {
                 alert(e);
             }
		});
	}
	//**************************************************
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	

	$("#form-member-add").validate({
		rules:{
			username:{
				required:true,
				minlength:2,
				maxlength:16
			},
			sex:{
				required:true,
			},
			mobile:{
				required:true,
				isMobile:true,
			},
			email:{
				required:true,
				email:true,
			},
			uploadfile:{
				required:true,
			},
			
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		
		submitHandler:function(form){
			//alert("标志:"+loginFlag+",邮箱，"+emailFlag);
			if(loginFlag=="100"&&emailFlag=="100"&&textAreaFlag=="100"){
				//获得表单数据发送AJAX请求
				var uLoginid=$("#username").val();
				var uPassword=$("#pwd").val();
				var uSex=$("#choonseSex input[name='sex']:checked").val();
				var uEmail=$("#email").val();
				var image=$("#image_id").attr("src");
				var introduce=$("#beizhu").val();
				$.ajax({
					url:"${APP_PATH}/addUser",
					data:{"uLoginid":uLoginid,"uPassword":uPassword,"uSex":uSex,"uEmail":uEmail,"image":image,"introduce":introduce},
					type:"POST",
					success:function(result){
						var code=result.code;
						if(code=="100"){
							//alert(uPassword);
							var index = parent.layer.getFrameIndex(window.name);
							parent.layer.close(index);
						}
					}
				});		
			}else{
				if(loginFlag=="-100"){
					$.Huimodalalert("账号已存在或异常!",1000);
				}else if(emailFlag=="-100"){
					$.Huimodalalert("邮箱已存在或异常!",1000);
				}else if(textAreaFlag=="-100"){
					$.Huimodalalert("介绍太长了!",1000);
				}
			}
			//$(form).ajaxSubmit();
			//parent.$('.btn-refresh').click();
			
		}
	});
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>