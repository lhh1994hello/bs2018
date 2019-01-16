<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../public/menuCssJs.jsp"%>
<%-- <link rel="Bookmark" href="${APP_PATH}/static/hui/favicon.ico" > --%>

<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/static/hui/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/static/hui/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/static/hui/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/static/hui/static/h-ui.admin/skin/default/skin.css"
	id="skin" />
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/static/hui/static/h-ui.admin/css/style.css" />
<title>编辑会员</title>
</head>
<body>
	<article class="page-container">
	<form action="https://www.baidu.com/" method="post" class="form form-horizontal" id="form-member-add">
		<input type="hidden" name="uId" id="uId" />
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>账号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" disabled="disabled" id="loginID" name="username">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="username" name="username">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
			<div id="radio_id" class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="radio-box">
					<input name="sex" type="radio" id="sex-1" value="男">
					<label for="sex-1">男</label>
				</div>
				<div class="radio-box">
					<input type="radio" id="sex-2" name="sex" value="女">
					<label for="sex-2">女</label>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="手机号" id="mobile" name="mobile">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="@" name="email" id="email">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="地址" name="address" id="address">
			</div>
		</div>
		<!-- <div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">附件：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="btn-upload form-group">
				<input class="input-text upload-url" type="text" name="uploadfile" id="uploadfile" readonly nullmsg="请添加附件！" style="width:200px">
				<a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
				<input type="file" multiple name="file-2" class="input-file">
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">所在城市：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" size="1" name="city">
					<option value="" selected>请选择城市</option>
					<option value="1">北京</option>
					<option value="2">上海</option>
					<option value="3">广州</option>
				</select>
				</span> </div>
		</div> -->
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="beizhu" id="beizhu" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" ></textarea>
				<p class="textarea-numberbar" >
					<em class="textarea-length" id="em" >0</em>/100
				</p>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input id="submit1" class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/hui/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${APP_PATH}/static/hui/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/jquery.validation/1.14.0/messages_zh.js"></script>

<script type="text/javascript">

function  check_submit(){
	var introduce= $("#beizhu").val();
	var intro_len=introduce.length;
	//  alert(intro_len);
	  return false;
	  
}

$(function(){
	//提交按钮
	$("#submit1").click(function(){
		var uId=$("#uId").val();
		var uLoginid=$("#loginID").val();
		var uNickname=$("#username").val();
		var uSex=$("#radio_id input[name='sex']:checked").val();
		var uPhone=$("#mobile").val();
		var uEmail=$("#email").val();
		var uAddress=$("#address").val();
		var introduce=$("#beizhu").val();
		//alert(uId+","+uLoginid+","+uNickname+","+uSex+","+uPhone+","+uEmail+","+uAddress);
		 $.ajax({
			
			url:"${APP_PATH}/updateUserInfo",
			type:"POST",
			data:{"uId":uId,"uLoginid":uLoginid,"uNickname":uNickname,"uSex":uSex,"uPhone":uPhone,"uEmail":uEmail,"uAddress":uAddress,"introduce":introduce},
			success:function(result){
				//alert("状态码:"+result.code);
				if(result.code==100){
					$("#form-member-add").submit();
					//parent.parent.location.href="${APP_PATH}/adminpage/HuiMain.jsp?page_flag=edit";
				}
			},
			error:function(){
				$("#form-member-add").submit();
				alert("出错了");
			}
		}); 
	});

	var param="-100";
	var url= window.location.href;
	 if (url.indexOf("?") != -1) {   
		 var index=url.indexOf("=");
		 param=url.substring(index+1);
		// alert(param);
	 }
	 fillData();
	 //数据回显
	 function  fillData(){
		 if(param=="-100"){
			 alert("ID非法！！！");
			 return false;
		 }
		 $.ajax({
			 type: 'POST',
			 url: '${APP_PATH}/findUserByUid',
			 dataType: 'json',
			 data:{"uId":param},
			 success:function(result){
				if(result.code="100"){
					 var user=result.extend.user;
					 console.log(user);
					 $("#uId").val(user.uId);
					 $("#loginID").val(user.uLoginid);
					 $("#username").val(user.uNickname);
					 var sex=user.uSex;
					 var usex1=$("#sex-1").val();
					 var usex2=$("#sex-2").val();
					 console.log(sex+","+usex1+","+usex2);
					 if(sex==usex1){
						 $("#sex-1").prop("checked",true);
						 $("#sex-1").parent().addClass("checked");
					 }
					 if(sex==usex2){
						 $("#sex-2").prop("checked",true);
						 $("#sex-2").parent().addClass("checked");
					 }
					 $("#mobile").val(user.uPhone);
					 $("#email").val(user.uEmail);
					 $("#address").val(user.uAddress);
					 $("#beizhu").val(user.introduce);
					 //0/100
					 var introduce_len=user.introduce.length;
					 $("#em").text("").text(introduce_len);
					 
				}
				else{
					alert("查询错误！！！");
				}
			 }
		 });
		 
	 }
	 
	 //onKeyUp="$.Huitextarealength(this,100)"
	  $("#beizhu").keyup(function(){
		 var introduce= $("#beizhu").val();
		 var intro_len=introduce.length;
		 $("#em").text("").text(intro_len);
	 });
	 
	
	//************************************************
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
			//$(form).ajaxSubmit();
			var index = parent.layer.getFrameIndex(window.name);
			//parent.$('.btn-refresh').click();
			parent.layer.close(index);
		}
	});
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>