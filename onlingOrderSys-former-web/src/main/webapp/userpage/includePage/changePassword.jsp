<%@page pageEncoding="UTF-8"%>
<%-- <%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH}/static/layui/layui.js"></script>
<link href="${APP_PATH}/static/layui/css/layui.css" rel="stylesheet"> --%>
<script type="text/javascript">
	

	  layui.use('form', function(){
	  	var form = layui.form;
	  
	  //监听提交
	  form.on('submit(formDemo)', function(data){
	    /* layer.msg(JSON.stringify(data.field)); */
	    return false;
	  });
	
	  $("#sumbmit_btn").click(function(){
		  var oldPassword=$("#oldPassword").val();
		  var newPassword=$("#newPassword").val();
		  var rePassword=$("#rePassword").val();
		  if(oldPassword==""){
			  var font_ele=$("<font style='color:red;'>请输入旧密码!</font>");
			  $("#oldPassword").parent("div").next("div").text("").append(font_ele);
 			  return false;
		  }
		  if(newPassword==""){
			  var font_ele=$("<font style='color:red;'>请输入新密码!</font>");
			  $("#newPassword").parent("div").next("div").text("").append(font_ele);
 			  return false;
		  }
		  if(rePassword==""){
			  var font_ele=$("<font style='color:red;'>请再次确认密码!</font>");
			  $("#rePassword").parent("div").next("div").text("").append(font_ele);
 			  return false;
		  }
		  if(newPassword!=rePassword){
			  var font_ele=$("<font style='color:red;'>密码不一致!</font>");
			  $("#newPassword").parent("div").next("div").text("").append(font_ele);
			  $("#rePassword").parent("div").next("div").text("");
 			  return false;
		  } 
		  var regex = /^(?!([a-zA-Z]+|\d+)$)[a-zA-Z\d]{3,20}$/;
 		  if(!regex.test(newPassword)){
 			 var font_ele=$("<font style='color:red;'>密码要包含数字和字符,长度大于3!</font>");
 			 $("#newPassword").parent("div").next("div").text("").append(font_ele);
 			 return false;
		  }
		  //alert("提交;");
		  submitForm(oldPassword,newPassword,rePassword);
	  });
	  function submitForm(oldPassword,newPassword,rePassword){
		  $.ajax({
			  url:"${APP_PATH}/changePassword",
			  type:"POST",
			  data:{"oldPassword":oldPassword,"newPassword":newPassword,"rePassword":rePassword},
			  success:function(result){
				  var code=result.code;
				  var msg=result.extend.msg;
				 if(code=="100"){
					console.log("执行成功...");
					$.Huimodalalert(msg, 1000);
					//changePassword
					setTimeout(function() {
						$("#change_My_Password").css("display","none");
					}, 1000);
				 }else if(code=="200"){
					 
					 alert("提示:"+msg);
				 }else if(code=="300"){
					 var font_ele=$("<font style='color:red;'>原密码不正确!</font>");
					 $("#oldPassword").parent("div").next("div").text("").append(font_ele);
				 }
			  }
			  
		  });
	  }
	  //点击重置，删除提示
	  $("#reset_btn").click(function(){
		  $("form .layui-word-aux").html("");
	  });
	});
</script>
<div id="change_My_Password" style="display: none;">
<form class="layui-form" action="" style="margin-top: 20px; " >
  
  <div class="layui-form-item">
	    <label class="layui-form-label">旧密码</label>
	    <div class="layui-input-inline">
	      <input id="oldPassword" type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" >
	    </div>
	    <div class="layui-form-mid layui-word-aux"></div>
  </div>
  
  
   <div class="layui-form-item">
	    <label class="layui-form-label">新密码</label>
	    <div class="layui-input-inline">
	      <input id="newPassword" type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
	    </div>
	    <div class="layui-form-mid layui-word-aux"></div>
  </div>
  
   <div class="layui-form-item">
	    <label class="layui-form-label">再确认</label>
	    <div class="layui-input-inline">
	      <input id="rePassword" type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
	    </div>
	    <div class="layui-form-mid layui-word-aux"></div>
  </div>
  
  
	  <div class="layui-form-item" style="margin-left: 18px;">
	    <div class="layui-input-block">
	      <button id="sumbmit_btn" class="layui-btn" lay-submit lay-filter="formDemo">立即修改</button>
	      <button id="reset_btn" type="reset" class="layui-btn layui-btn-primary">重置</button>
	    </div>
	  </div>
</form>

</div>