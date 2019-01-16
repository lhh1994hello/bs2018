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
<title>添加菜品</title>
<style type="text/css">
	img{
		width: 90px;
		height: 90px;	
	}
</style>
</head>
<body>
	<article class="page-container">
	<form class="form form-horizontal" id="form-menu-add" action="#">
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>菜名：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="" placeholder="菜名" id="menuName" name="menuName" style="width: 300px">
			<label id="menuName_info_label" style="color: red"></label>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>价格：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" autocomplete="off" value="" placeholder="价格" id="price" name="price" style="width: 300px">
			<label id="price_info_label" style="color: red;"></label>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>类别：</label>
		<div class="formControls col-xs-8 col-sm-9">
				<select id="menu_select" style="height: 28px;width: 100px;">
					<option value="1" >AAA</option>
					<option value="2" >AAA</option>
				</select>
				<label id="cate_info_label" style="color: red;"></label>
		</div>
	</div>
	<div class="row cl">
			<img alt="头像" title="用户头像" src="http://localhost/headImage/201804280016315852_t7.jpg" id="image_id"  style="margin-left: -260px;">
			<label class="form-label col-xs-4 col-sm-3" style="margin-top: 33px;">图像：</label>
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
			<textarea name="" id="introduce" cols="20" rows="20" class="textarea" style="width: 300px;"  placeholder="说点什么...100个字符以内" dragonfly="true"></textarea>
			<!-- <p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p> -->
		</div>
	</div>
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" id="submit_btn" type="button" value="&nbsp;&nbsp;添加&nbsp;&nbsp;">
		</div>
	</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去--> 
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
	
	
	//异步提交表单 form-menu-add
	$("#submit_btn").click(function(){
		var name_flag= check_mname("#menuName");
 		var price_flag=check_price("#price");
 		var cate_flag=getSelectText();
 		if(name_flag==true&&price_flag==true&&cate_flag==true){
 			//alert("校验通过");
 			 submit_form();
 		}
 	});
	
	
	//提交表单
	function submit_form(){
		var mname=$("#menuName").val();
			var price=$("#price").val();
			var image=$("#image_id").attr("src");
			var mcId=$("#menu_select option:selected").val();
			var introduce=$("#introduce").val();
			$.ajax({
				url:"${APP_PATH}/addMenuWithAjax",
				data:{"mname":mname,"price":price,"image":image,"mcId":mcId,"introduce":introduce},
				type:"POST",
				success:function(result){
					//alert("成功了...");
					//$("#form-menu-add").submit();
					setTimeout(function() {
						parent.location.href="${APP_PATH}/adminpage/HuiMain.jsp?page_flag=addMenu";
					}, 400);
					
				},
				error:function(){
					alert("失败了...");
				}
			});
		
	}
	//校验价格:
		$("#price").change(function(){
			check_price("#price");
		});
	 //校验 名称menuName_info_label
		$("#menuName").change(function(){
			check_mname("#menuName");
		});
	//填充下拉列表
	fillSelectData();
	function fillSelectData(){
		//menu_select
		$("#menu_select").empty();
		$.ajax({
			url:"${APP_PATH}/findCategoryListWithAjax",
			data:{"cstate":"1"},
			type:"POST",
			success:function(result){
				var categoryList=result.extend.categoryList;
				var firstOption=$("<option></option>").append("------").attr("value","-100");
				$("#menu_select").append(firstOption);
				$.each(categoryList,function(index,category){
					var optionEle=$("<option ></option>").append(category.cname).attr("value",category.cid);
					$("#menu_select").append(optionEle);
				});
				
			}
		});
		
	}
	//监听文件选中状态
	$(document).on('change','#file_URL',function(){
		//alert("AA");
		ajaxFileUpload();
	});
	
	function ajaxFileUpload(){
		$.ajaxFileUpload({
			url:"${APP_PATH}/addMenuImage",
			secureuri: false, //是否需要安全协议，一般设置为false
			 fileElementId: 'file_URL', //文件上传域的ID
			 type:"POST",
			 dataType: 'json', //返回值类型 一般设置为json
			 success: function (data, status) {
				 var code=data.code;
				 if(code=="100"){
					 var imagePath= data.extend.menu.image;
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
	
	//校验是否选择了分类，默认是不选的
	function getSelectText(){
		$("#cate_info_label").text("");
		var mids=$("#menu_select option:selected").val();
		if(mids=="-100"){
			$("#cate_info_label").text("请选择分类");
			return false;
		}
		return true;
	}
	
	//校验菜品名称
	function check_mname(id){
 		 $("#menuName_info_label").text("");
		var regName=/^[\u2E80-\u9FFF]{2,10}$/;
		var mname=$(id).val();
		 var len=mname.length;
		 if(!regName.test(mname)){
			 $("#menuName_info_label").text("菜名必须是中文，且在2到10个汉字");
			 return false;
		 }
		 if(mname==""){
			 alert("参数为空");
			 return false;
		 }
		 //校验是否存在
		 var flag_n=true;
		 $.ajax({
			 url:"${APP_PATH}/findMenuByName",
			 data:{"mname":mname},
			 type:"POST",
			 async:false,
			 success:function(result){
				 var code=result.code;
				 var msg=result.extend.msg;
				 if(code=="100"){
					 $("#menuName_info_label").text(msg);
				 }else if(code=="200"){
					// alert("严重");
					 $("#menuName_info_label").text(msg);
					 flag_n =false;
				 }
			 },
			 error:function(){
				 alert("报错了");
			 }	 
		 });
		 return flag_n;
	}
	//检验价格
	function check_price(id){
		$("#price_info_label").text("");
		var price=	$(id).val();
		if(price==null||price==""){
			$("#price_info_label").text("金额不能为空!!!");
			return false;
		}
		if(isNaN(price)){
			$("#price_info_label").text("只能是数字");
			return false;
		}
		if(price<0){
			$("#price_info_label").text("金额不能小于0");
			return false;
		}
		var reg = new RegExp("^\\d+(\\.\\d{0,2})?$");
		if(!reg.test(price)){
			$("#price_info_label").text("只能保留两位小数");
			return false;
		}
		return true;
	}
	/* $('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-admin-add").validate({
		rules:{
			adminName:{
				required:true,
				minlength:4,
				maxlength:16
			},
			password:{
				required:true,
			},
			password2:{
				required:true,
				equalTo: "#password"
			},
			sex:{
				required:true,
			},
			phone:{
				required:true,
				isPhone:true,
			},
			email:{
				required:true,
				email:true,
			},
			adminRole:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type: 'post',
				url: "xxxxxxx" ,
				success: function(data){
					layer.msg('添加成功!',{icon:1,time:1000});
				},
                error: function(XmlHttpRequest, textStatus, errorThrown){
					layer.msg('error!',{icon:1,time:1000});
				}
			});
			var index = parent.layer.getFrameIndex(window.name);
			parent.$('.btn-refresh').click();
			parent.layer.close(index);
		}
	}); */
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>