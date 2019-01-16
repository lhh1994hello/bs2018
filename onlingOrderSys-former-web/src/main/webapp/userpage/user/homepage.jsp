<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../public/waimaiCssJs.jsp"%>
<%@ include file="../public/subpublic/myjs.jsp"%>
<%@ include file="../public/huiJSAndCss.jsp"%>
<%-- <%@ include file="../public/confirmOrderCssJs.jsp"%> --%>
<%@ include file="../public/myOrderListCssJs.jsp"%>
<script type="text/javascript" src="${APP_PATH}/static/js/ajaxfileupload.js"></script> 
<%-- <script src="${APP_PATH}/static/pintuer/pintuer.js"></script> --%>
<%-- <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/pintuer/pintuer.css" /> --%>
<style type="text/css">
	img{
		height: 100px;
		width: 100px;
	}
	.fileInputContainer {
		width: 100px;
		height: 100px;
		position:relative;
		/*  border: 1px solid pink; */
	}
		
	.fileInput {
		height:100px;
		width: 100px;
		position:absolute;
      	 	right:0;
       	top:0;
       	opacity: 0;
       	filter:alpha(opacity=0);
       	cursor:pointer;
	}
	a{
		text-decoration: none;
	}
	#find,#order,#contact{
		margin-top: 10px;
	}
</style>
<title>个人中心</title>
</head>
<body>
	<div class="row" id="head_row">
		<%@ include file="../public/baiduwaimaihead.jsp"%>
	</div>
	<div class="container-fluid">
		<!--**********************************************************************  -->
		<div id="content" class="clearfix" style="min-height: 28px;">
			<div class="main">
			 <section class="order-menu">
				<div class="order-menu-pos">
					<div class="order-menu-header" style="height: 120px;">
						<!-- <span>个人中心</span> -->
						<%-- <img alt="" src="${APP_PATH}/images/default/baiduImage.png"> --%>
						<%-- <img class="round" alt="" src="${APP_PATH}/images/default/t6.jpg" style="margin-left: 15px;margin-top: 5px;"> --%>
						<div class="fileInputContainer">
							<input class="fileInput" id="file_URL" type="file" name="file" title="修改头像">
							<%-- <img id="image_id" class="round" alt="图片" src="${APP_PATH}/images/default/t6.jpg"> --%>
							<img id="image_id" class="round" alt="图片" src="${APP_PATH}/images/default/avatar-default-S.gif">
						</div>
						
						
					</div>
					<div class="splitter"></div>
					<div class="order-menu-body">
						<div class="menu-item">
							<div id="menu-order" class="selected">
								<span class="menu-icon order-icon"></span> 
								<!-- <a href="/waimai/trade/orderlist" class="menu-title order"> -->
								<a href="${APP_PATH}/userpage/order/myOrderList3.jsp" class="menu-title order">
									<span>我的订单</span>
								</a>
									
							</div>
						</div>
						<!-- <div class="menu-item">
							<div id="menu-address">
								<span class="menu-icon address-icon"></span> <a
									href="/waimai/user/address/select" class="menu-title address"><span>送餐地址</span></a>
							</div>
						</div> -->
						
						<div class="menu-item" id="show_changepassword_div">
							<div id="menu-coupon">
								<span class="menu-icon coupon-icon"></span> 
								<a href="javascript:void(0);" class="menu-title coupon">
									<span>修改密码</span>
								</a>
							</div>
						</div>
						<div class="menu-item" id="showMyDetailMsgID">
							<div id="menu-left">
								<span class="menu-icon left-icon"></span> 
								<a href="javascript:void(0);" class="menu-title left">
									<span>详细信息</span>
								</a>
							</div>
						</div>
					</div>
				</div>
				</section> 

				<section class="usercenter-detail" id="user-order" >
				
				
		<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
				<div id="context-area" style=""> 
					<!-- <h1>AAA</h1> -->
					<!-- 在这里填充数据 -->
					<%@ include file="../includePage/changePassword.jsp"%>
					<%@ include file="../includePage/myDetailMsg.jsp"%>
					
				</div>
			</section>

				<div class="clearfix" style="_height: 0px; _overflow: hidden;"></div>
			</div>
			
			
			
		</div>

		<!-- ***************************************************************** -->
		<!--  尾部导航-->
 		<%-- <%@ include file="/userpage/public/myOrderList_fonter.jsp"%> --%>
		<!-- ****************************************************************** -->
	</div>
	<script type="text/javascript">
		$(function(){
			<%@ include file="../public/confirmshow.jsp" %>
			//获得域总的数据
			var currentPage="1";
			var pageSize=3;
			$(document).on('change','#file_URL',function(){
				ajaxFileUpload();
				console.log("改变了...");
			});
			findUserInfo();
			
			
			
			
			//点击详细信息就把我的详情显示出来，只显示不隐藏，隐藏让其他点击事件来负责
		/* 	$("#showMyDetailMsgID").click(function(){
				fillMyDetailMsgInfo();
				$("#myDetailMsgID").css("display","block");
				$("#change_My_Password").css("display","none");//隐藏其他
			}); */
			//点击修改密码显示对应的div
			var changepassword_flag=0;//0代表未显示
			$("#show_changepassword_div").click(function(){
				 //alert("修改密码");
				if(changepassword_flag==0){
					//alert("修改密码a");newPassword
					$("#oldPassword").val("");
					$("#newPassword").val("");
					$("#rePassword").val("");
					$(".layui-form-item .layui-word-aux").text("");
					//changepassword_flag=1;
					$("#myDetailMsgID").css("display","none");
					$("#change_My_Password").css("display","block");
					return false;
 				}
				if(changepassword_flag==1){
					//alert("修改密码b");
					changepassword_flag=0;
					$("#myDetailMsgID").css("display","block");
					$("#change_My_Password").css("display","none");
					return false;
 				} 
 				//location.href ="${APP_PATH}/userpage/includePage/changePassword.jsp?passFlag=1";
				
			});
			//当页面加载完成后，
			function findUserInfo(){
				$.ajax({
					url:"${APP_PATH}/findUserInfo",
					type:"POST",
					success:function(result){
						var code=result.code;
						if(code=="100"){
							fillUserData(result);
						}else if(code=="200"){
							//var msg=result.extend.msg;
							var msg = "还没登录，是否登录？"
	 							confirm(function() 
										{window.location.href = "${APP_PATH}/userpage/user/login2.jsp";
								}, "", msg);
						}
					}
				});
			}
			
			function fillUserData(result){
				var user=result.extend.user;
				$("#image_id").attr("src",user.image).attr("title","修改头像");
				
			}
			//头像上传
			function ajaxFileUpload(){
				$.ajaxFileUpload({
					url:"${APP_PATH}/changeUserImage",
					secureuri: false, //是否需要安全协议，一般设置为false
					 fileElementId: 'file_URL', //文件上传域的ID
					 type:"POST",
					 dataType: 'json', //返回值类型 一般设置为json
					 success: function (data, status) {
						 var code=data.code;
						 if(code=="100"){
							 var imagePath= data.extend.user.image;
							 $("#image_id").attr("src",imagePath);
							 console.log("修改头像后新路径:"+imagePath);
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
			
			//点击收藏夹跳转到main.jsp，显示我的收藏
			$("#shouChangJia").click(function(){
				window.location.href = "${APP_PATH}/userpage/main.jsp?shouchang=Star";
			});
			
			//用户名字鼠标放上去显示下拉
			$(document).on('mouseenter', '#usernameInfo', function() {
				console.log("进入:a");
	  			$("#popUserInfoId").css("visibility","visible");
			});
			$(document).on('mouseleave', '#usernameInfo', function() {
				console.log("离开:b");
	 			$("#popUserInfoId").css("visibility","hidden");
			});
		});
	
	</script>
	
</body>
</html>