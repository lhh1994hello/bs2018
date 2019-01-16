<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<!-- 引入bootstrap样式-->
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/layui/layui.js"></script>
<link href="${APP_PATH}/static/layui/css/layui.css" rel="stylesheet">
<title>添加菜单</title>
<style>
/* .container {
	border: 2px solid pink;
} */

/* .row {
	border: 2px solid red;
} */
</style>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-body">
			<!-- 内容主体区域 -->
			<!-- <div style="padding: 15px;"> -->
				<div class="container">
					<div class="col-md-10" id="d2">

						<h2>${msg}</h2>
						<form class="form-horizontal" action="${APP_PATH}/adminAddMenu"
							method="post" enctype="multipart/form-data"
							onsubmit="return check_onsubmit()">
							<!--菜名 -->
							<div class="form-group    has-feedback">
								<label for="inputEmail3" class="col-sm-2 control-label">菜
									名</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="input_mname"
										name="mname" /> <span class="help-block "></span> <span
										class="glyphicon  form-control-feedback"></span>
								</div>
							</div>
							<!-- 价格 -->
							<div class="form-group    has-feedback">
								<label for="inputEmail3" class="col-sm-2 control-label">价
									格</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="input_price"
										name="price" /> <span class="help-block "></span> <span
										class="glyphicon  form-control-feedback"></span>

								</div>
							</div>
							<!--分类 *************************************************-->
							<div class="form-group   has-feedback">
								<label for="inputPassword3" class="col-sm-2 control-label ">分
									类</label>
								<div class="col-sm-6 ">
									<!-- <input type="password" class="form-control " id="input_mcId"  name="mcId"> -->
									<select name="mcId" class="form-control">
										<c:forEach items="${allCategory}" var="category">
											<option value="${category.cid}">${category.cname}</option>
										</c:forEach>
									</select> <span class="help-block"></span> <span
										class="glyphicon  form-control-feedback"></span>
								</div>
							</div>
							<!--***************************************************************  -->
							<!-- 图片 -->
							<div class="form-group   has-feedback">
								<label for="inputPassword3" class="col-sm-2 control-label ">图片</label>
								<div class="col-sm-6 ">
									<!-- <input type="file" class="form-control" id="input_image"  name="image"> -->
									<input type="file" id="input_image" name="file"
										value="chooseImage"> <span class="help-block"></span>
									<span class="glyphicon  form-control-feedback"></span>
								</div>
							</div>
							<!--  介绍-->
							<div class="form-group has-feedback">
								<label for="inputEmail3" class="col-sm-2 control-label">介
									绍</label>
								<div class="col-sm-6">
									<!-- <input type="text" class="form-control" id="input_introduce" name="introduce" /> -->
									<textarea rows="7" cols="60" name="introduce"
										id="text_introduce"></textarea>
									<span class="help-block"></span> <span
										class="glyphicon  form-control-feedback"></span>
								</div>
							</div>


							<!--  -->
							<div class="form-group">
								<div class="col-md-4 col-md-offset-2">
									<button type="submit" class="btn btn-primary">添&nbsp;&nbsp;加</button>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="reset" class="btn btn-default" id="reset_button">重置</button>
								</div>

							</div>

							<!--  -->
						</form>
					</div>
				</div>
			<!-- </div> -->
		</div>

	</div>
		<!--  JS脚本-->
	<script type="text/javascript">
	
	
	$("#input_mname").change(function(){
		check_mname("#input_mname")
	});
	
	//校验价格，不能是负数，小数点后最多两位
	$("#input_price").change(function(){
		 check_price("#input_price")

	});
	//设置介绍长度不能太长
		$("#text_introduce").change(function(){
			check_introduce("#text_introduce");
		});
	//最后提交
	function check_onsubmit(){
		
	    var mname_flag=check_mname("#input_mname");
	    if(mname_flag==false){
	    	return false;
	    }
	    var price_flag=check_price("#input_price");
	    if(price_flag==false){
	    	//alert("价格不符合");
	    	return false;
	    }
	    var introduce_flag=check_introduce("#input_introduce");
	    if(introduce_flag==false){
	    	//alert("介绍不符合");
	    	return false;
	    }
		return true;
	}
	//
		//点击重置按钮，去除样式
	$("#reset_button").click(function(){
		reset_css("#input_mname");
		reset_css("#input_price");
		reset_css("#input_mcId");	
		reset_css("#input_introduce");
	});
	
	//**********************************************************
		//校验菜品名称
		function check_mname(id){
			reset_css(id);
			var regName=/^[\u2E80-\u9FFF]{2,10}/;
			var mname=$(id).val();
			 if(!regName.test(mname)){
				 show_validate_msg(id,"fail","菜名必须是中文，且在2到10个汉字");
				 return false;
			 }
			 return true;
		}
		//检验价格
		function check_price(id){
			reset_css(id);
			var price=	$(id).val();
			if(price==null||price==""){
				show_validate_msg(id,"warning","金额不能为空");
				return false;
			}
			if(isNaN(price)){
				show_validate_msg(id,"fail","只能是数字");
				return false;
			}
			if(price<0){
				show_validate_msg(id,"fail","金额不能小于0");
				return false;
			}
			var reg = new RegExp("^\\d+(\\.\\d{0,2})?$");
			if(!reg.test(price)){
				show_validate_msg(id,"fail","只能保留两位小数");
				return false;
			}
			return true;
		}
		//检查介绍的长度
		function check_introduce(id){
			var introduce=$(id).val();
		 	 var len= introduce.length;
		 	 if(len>100){
		 		show_validate_msg(id,"fail","介绍太长，数据库装不下");
		 		return false;
		 	 }
		 	 return true;
		}
		//**********************************************
		
		//去除样式
		function reset_css(ele){
			$(ele).parent().parent().removeClass("has-success has-error has-warning");
			$(ele).next("span").next("span").removeClass("glyphicon-ok glyphicon-remove glyphicon-warning-sign");
			$(ele).next("span").removeClass("glyphicon glyphicon-ok glyphicon glyphicon-remove glyphicon glyphicon-info-sign")
			//清空提示内容
			$(ele).next("span").text("");
		}
		//
		//显示验证信息,id,状态，信息
		function show_validate_msg(ele,status,msg){
				 reset_css(ele);
				if(status=="success"){
					/* 成功信息 */
					$(ele).parent().parent().addClass("has-success");
					$(ele).next("span").next("span").addClass("glyphicon-ok");
					$(ele).next("span").addClass("glyphicon glyphicon-ok");
					$(ele).next("span").text(msg);
				}else if(status=="fail"){
					$(ele).parent().parent().addClass("has-error");
					$(ele).next("span").next("span").addClass("glyphicon-remove");//按规定设置格式的属性
					$(ele).next("span").addClass("glyphicon glyphicon-remove");//提示信息的图标
					$(ele).next("span").text(msg);
					
				}else if(status=="warning"){
					$(ele).parent().parent().addClass("has-warning");
					$(ele).next("span").next("span").addClass("glyphicon-warning-sign");					
					$(ele).next("span").addClass("glyphicon glyphicon-info-sign");
					$(ele).next("span").text(msg);
				}
				
		}
	</script>
	<script>
		//JavaScript代码区域
		layui.use('element', function() {
			var element = layui.element;

		});
	</script>

</body>
</html>