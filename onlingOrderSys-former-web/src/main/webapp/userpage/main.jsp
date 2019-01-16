<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订餐系统首页</title>
<%@ include file="public/waimaiCssJs.jsp"%>
<%@ include file="public/myjs.jsp"%><!-- 顺序在hui的上面， -->
<%@ include file="public/huiJSAndCss.jsp"%>
<%@ include file="public/baiduwaimaiCartCssAndJS.jsp"%>


</head>

<style>
img {
	width: 228px;
	height: 140px;
	/* margin-left: */
}

ul li {
	letter-spacing: 0px;
}

.salary_font_size {
	/* letter-spacing: -1px; */
	font-size: 1px;
	/* background-color: pink; */
	width: 60px;
}

#shop-list {
	/* margin-left: 168px; */
	margin-left: 168px;
}

.menu_price {
	text-align: left;
	width: 49px;
}

.menu_count {
	text-align: left;
	padding: 0px;
	width: 41px;
}

.menu_name {
	width: 77px;
	text-align: left;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
}
</style>
<body>
	<!-- 测试购物车div -->
	<%@ include file="includePage/myCart.jsp"%>

	<%-- <%@ include file="includePage/baiduCart.jsp"%> --%>
	<!-- ******************************************************* -->

	<div class="row" id="head_row">
		<!--  首页导航和 分类菜单-->
		<%@ include file="public/baiduwaimaihead.jsp"%>
		<%@ include file="public/baiduwaimaiClassfy.jsp"%>

	</div>
	<div class="container-fluid">
		<%-- <%@ include file="public/head.jsp"%> --%>
		<%-- <%@ include file="public/head2.jsp"%> --%>

		<!-- <div class="row"> -->

		<section class="shop-list" id="shop-list">
		<div class="list-wrap">
			<div class="list clearfix">
				<ul class="shopcards-list" id="show_img">
					<!-- 在这里面显示商品信息，通过Jquery插入 -->

				</ul>
			</div>
		</div>
		</section>
		<!-- 意见反馈*********************************************** -->
			<%@ include file="includePage/feedback.jsp"%>
		<div class="backtop-section" id="backtop-section">
			<div class="appdown">
 				<a id="backTop" class="back-top-action v-hide" href="javascript:scroll(0,0)"></a>
 				<a id="feedback" class="feedback" href="javascript:;" ></a>
					
			</div>
		</div>



	<!-- ***************************************************************** -->
 		<%-- <%@ include file="/userpage/public/myOrderList_fonter.jsp"%> --%>
 		<div class="row" style="margin-left: 150px; display: none;" id="foot_span_id">
 			<div class="col-md-3 col-md-offset-2">
 				<hr style="height: 2px; border: none; border-top: 2px dotted #185598;" />
 			</div>
 			<div class="col-md-1">
 				<span style="display: inline-block;margin-top: -5px;color: #ff6666">到底部了</span>
 				<font  style="display:block;color: #ff9797;padding-top: -20px;"></font></div>
 			<div class="col-md-3 ">
 				<hr style="height: 2px; border: none; border-top: 2px dotted #185598;" />
 			</div>
 		</div>
		<!-- ****************************************************************** -->


	</div>

	<script type="text/javascript">
		//一个漂亮的确认框
	<%@ include file="public/confirmshow.jsp" %>
		//反馈信息标志位
		var login_flag=1;
		//搜索下拉框是否隐藏标志，设置为1的时候不隐藏，当鼠标进入换一批时，改变为1，列表就不隐藏了
		var switch_flag = "-1";
		//搜索下拉列表的当前页
		var currentPage_search = 1;
		var search_mid="-100";
		var digui_flag = 0;
		var currentPage = "1";
		//总页数，默认第一页
		var pageTotal = "1";
		//默认排序按时间
		var orderbySome = "createtime";
		//分类号，默认是-100，查询所有
		var cid = "-100";
		//当页面加载完成的时候
		$(function() {
			//请求分类
			to_getCategory();
			//请求商品
			
			to_menuByClassfy(cid, orderbySome);
		});

		//$("#confirm_cancel").css("color", "red");
		/* $("#cart_footer_buy").click(function(){
			alert("购物");
			
		}); */
		var url= window.location.href;
		if (url.indexOf("?") != -1) {   
			var index=url.indexOf("=");
			var  param=url.substring(index+1);
	 		if(param=="Star"){
	 			//alert("sdfsd");
	 			currentPage = "1";
				$(".shopcards-list").html("");//清空菜品内容，重新插入
				orderbySome = "Star";
				//to_menuByClassfy(cid, "Star");
 	 		}
			
		 }
		
		//收藏夹
		$("#shouChangJia").click(function(){
			currentPage = "1";
			$(".shopcards-list").html("");//清空内容，重新插入
			var orderbySome = "Star";
			to_menuByClassfy(cid, orderbySome);
		});
		$(document).on('mouseenter', '#usernameInfo', function() {
  			$("#popUserInfoId").css("visibility","visible");
		});
		$(document).on('mouseleave', '#usernameInfo', function() {
 			$("#popUserInfoId").css("visibility","hidden");
		});
		//判断用户是否登录，若登录，显示收藏按钮
		StarIsShow();
		function StarIsShow(){
			$.ajax({
				url:"${APP_PATH}/userIsLogin",
				type:"POST",
				success:function(result){
					$("#star_li").empty();
					var code=result.code;
					if(code=="100"){
						console.log("用户登录了...显示收藏按钮");
 						var span_ele=$("<span class='sort-item' data-node='Star'>我的收藏</span>");
						var i_ele=$("<i class='down'></i>");
						var span_ele2=$("<span class='item-interval'></span>");
						$("#star_li").append(span_ele).append(i_ele).append(span_ele2);
					}
				}
			});
		}
		
		//显示弹出框
 		$("#feedback").click(function(){
			//清空上次的内容
			$("#textarea_feedback_id").val("");
			$("#contact_feedback_id").val("");
 			//先判断用户是否登录
 			$.ajax({
				url:"${APP_PATH}/userIsLogin",
				type:"POST",
				async : false,//修改标志变量必须设为同步方式
				success:function(result){
					var code=result.code;
					var msg=result.extend.msg;
					if(code=="100"){
						login_flag=1;
					}else if(code=="200"){
							login_flag=0;
 							var msg = "还没登录，是否登录？"
 							confirm(function() 
									{window.location.href = "${APP_PATH}/userpage/user/login2.jsp";
							}, "", msg);
					}
				}
			});
			//alert("标志:"+login_flag);
			if(login_flag==1){
				$(".modal-backdrop").css("display","block");
				$(".feedback-wrap").css("display","block");
				$("body").css("overflow","hidden");
				$("#textarea_feedback_id").parent("div").next("div").addClass("v-hide");
		 		$("#contact_feedback_id").parent("div").next("div").addClass("v-hide");
			}
 		});
		//点击弹出框的取消按钮
		$(".cancelBtn").click(function(){
			//alert("取消。。。");
			$(".modal-backdrop").css("display","none");//遮罩层,显示弹出层
			$(".feedback-wrap").css("display","none");
			$("body").css("overflow","auto");
		});
		//点击弹出框的确认按钮
		$(".submitBtn").click(function(){
			//alert("确认");
		   var feedbackInfo=$("#textarea_feedback_id").val();
		   var contact=$("#contact_feedback_id").val();
		   var flag=judgefeedbackInfo();
		   //console.log("标志;"+flag);
			if(flag==false){
 				return false;
			}
			//执行插入操作
			$.ajax({
				url:"${APP_PATH}/addFeedbackInfo",
				type:"POST",
				data:{"userphone":contact,"substance":feedbackInfo},
				success:function(result){
					var code=result.code;
					//alert("状态码:"+code);
					if(code=="100"){
						$(".modal-backdrop").css("display","none");//遮罩层,显示弹出层
						$(".feedback-wrap").css("display","none");
						$("body").css("overflow","auto");
						$.Huimodalalert('已收到您的反馈', 1000);
					}else if(code=="200"){
						alert("操作失败!");
					}
				}
			});
			
		});
		//判断反馈信息
		function judgefeedbackInfo(){
			var feedbackInfo=$("#textarea_feedback_id").val();
			var contact=$("#contact_feedback_id").val();
			//alert("建议:"+feedbackInfo+",联系方式:"+contact);
 			var feedbackInfo_error=$("#textarea_feedback_id").parent("div").next("div");
			
			var feedbackInfo_len=feedbackInfo.length;
			if(feedbackInfo_len==0){
				feedbackInfo_error.removeClass("v-hide").text("").append("请填写建议！");
				return false;
			}
			if(feedbackInfo_len<3){
 				feedbackInfo_error.removeClass("v-hide").text("").append("内容太少！");
 				return false;
			}
			//校验手机号
			var contact_error=$("#contact_feedback_id").parent("div").next("div");
			var myregPhone=/^[1][3,4,5,7,8][0-9]{9}$/;
			var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/; 
			//!myregPhone.test(contact)||
			if(myregPhone.test(contact) || regEmail.test(contact)){
				
			 }else{
				 contact_error.removeClass("v-hide").text("").append("请填写正确的联系方式！");
				 return false;
 			 }
			return true;
 		}
 		//反馈框内容部分，
 			$("#contact_feedback_id").focus(function(){
 			var contactInfo_error=$("#contact_feedback_id").parent("div").next("div");//元素
			contactInfo_error.addClass("v-hide").text("");
		});
 		
		$("#textarea_feedback_id").focus(function(){
 			var feedbackInfo_error=$("#textarea_feedback_id").parent("div").next("div");//元素
 			feedbackInfo_error.addClass("v-hide").text("");
		});
		//搜索商品框
		$("#f-input").focus(function() {
			digui_flag = 0;
			//console.log("获得焦点...");
			var context = $("#f-input").val();
			if (context != "") {
				//console.log("得到焦点,内容:" + context);
				serachMenuList();
			}
		});
		$("#f-input").blur(function() {
			//我想实现 点击换一批，但是实现不了，因为点击时已经失去焦点了，因此设置鼠标进入事件，当鼠标进入时 就不隐藏，尽可以点击了
			//console.log("失去焦点...标志:"+switch_flag);
			if (switch_flag == "-1") {
				$(".f-search-list").css("display", "none");
			}

		});
		/* $("#f-input").change(function(){
			console.log("改变内容...");
		});  */
		//input输入框内容一修改立即触发请求
		$(document).on("input", "#f-input", function() {
			serachMenuList();
		});
		//，去数据库模糊查询菜品，显示在搜索栏下面
		function serachMenuList() {
			var context = $("#f-input").val();
			if (context == "")
				return false;
			//console.log("propertychange...." + context);
			$.ajax({
				url : "${APP_PATH}/searchMenuWithAjax",
				data : {"context" : context,"pn" : currentPage_search},
 				type : "POST",
				success : function(result) {
					var code = result.code;
					if (code == "100") {
						//alert("成功了");
						filSearchList(result)
					} else if (code == "200") {
						alert("失败了..");
					}
				},
				error : function(result) {
					alert("出错了..");
				}
			});
		}

		//填充搜索框的下拉列表
		function filSearchList(result) {
			var menuList = result.extend.pageInfo.list;
			var pageInfo = result.extend.pageInfo;
 			var menuList_len = menuList.length;
			$(".f-search-list").html("");
			if (menuList_len <= 0) {
				return false;
			}
			$(".f-search-list").css("display", "block");
			var span_info = $("<span></span>").append("换一批").css("margin-left","205px").css("display", "inline-block").addClass("switch_one");
			var h5_ele = $("<h5></h5>").append("菜单");//.append(span_info); 
			
			
			if (pageInfo.pages > 1) {
				span_info.click(function() {
					//$(".f-search-list").css("display", "block");
 					if (pageInfo.hasNextPage) {
						currentPage_search = currentPage_search + 1;
					} else {
						currentPage_search = 1;
					}
 					serachMenuList();
					//console.log("点击了" + currentPage_search);
				});
				h5_ele.append(span_info);

			}
			//serachMenuList();
			var ul = $("<ul></ul>").addClass("nav-sug-list nav-sug-shop-list");
			ul.append(h5_ele);
			$.each(menuList, function(index, menu) {
 				//console.log("菜单ID:" + menu.mid);
				var li_ele = $("<li></li>");
				var a_ele = $("<a href='javascript:void(0);'></a>").attr("title", menu.mname).attr("data-type", "nav-sug-shop");
 				var span_ele = $("<span></span>").addClass("n-s-left");
				var span_ele_img = $("<img />").attr("src", menu.image);
				var menuName = menu.mname;
				var menuName_len = menuName.length;
				if (menuName_len > 8) {
					menuName = menuName.substring(0, 7) + "、、、";
				}
				span_ele.append(span_ele_img).append(menuName);
				var sale_span = $("<span></span>").addClass("n-s-right").append("已售"+menu.salecount+"份");
 				a_ele.append(span_ele).append(sale_span);
				li_ele.append(a_ele);
  
				li_ele.click(function(){
					//console.log("点击了...");
					//alert("点击了,,,"+menu.mid);
					//search_mid
					search_mid=menu.mid;
					$("#show_img").html("");
					to_menuByClassfy(cid, orderbySome);
					$(".f-search-list").css("display", "none");
				});
				ul.append(li_ele);
			});
			
			ul.css("background-color","pink");
			$(".f-search-list").append(ul);
			//console.log("集合长度:" + menuList_len);
		}
	 
		//nav-sug-shop-list
		$(document).on('mouseenter', '.switch_one', function() {
			//console.log("鼠标进入换一批了...");
			switch_flag = "1";
		});
		$(document).on('mouseleave', '.switch_one', function() {
			//console.log("鼠标离开换一批了...");
			switch_flag = "-1";
		});
		
		 $(document).on('mouseenter', '.nav-sug-shop-list', function() {
 			switch_flag = "1";
		});
		$(document).on('mouseleave', '.nav-sug-shop-list', function() {
 			switch_flag = "-1";
		}); 
		//给购买按钮注册点击事件
		$("#cart_footer_buy").click(function() {
			/* var audioDom=document.querySelector('audio');
			audioDom.play(); */
			//alert("去购买..");
			var len = $("#cart_tbody").children("tr").length;
			if (len <= 0) {
				//alert("购物车为空...");
				$.Huimodalalert('购物车为空！', 800);
				return;
			}
			var audioDom=document.querySelector('audio');
			console.log("声音标志:"+audioDom.paused);
			if(audioDom.paused==true){
 				audioDom.play();
			}else{
 				audioDom.pause();
			} 
			setTimeout(function(){
				window.location.href = "${APP_PATH}/toConfirmPage";
				
			},800);
			//alert("数量.."+len);
		});

		
		//回到顶端 
		$(window).scroll(function() {
			//console.log("返回顶部..........");
			$("#backTop").addClass("v-hide");
			var distance = $(window).scrollTop();
			if (distance > 200) {
				$("#backTop").removeClass("v-hide");
			}
		});
		//当滚动到底部的时候重新发送ajax
		$(window).scroll(function() {
			var scrollTop = $(this).scrollTop();
			var scrollHeight = $(document).height();
			var windowHeight = $(this).height();
			if (scrollTop + windowHeight == scrollHeight) {
				// 此处是滚动条到底部时候触发的事件，在这里写要加载的数据，或者是拉动滚动条的操作
				if (currentPage >= pageTotal) {
					//alert("查完了"+"总页数:"+pageTotal+" 当前页："+currentPage);
					$("#foot_span_id").css("display","block");
					return false;
				}
				currentPage = parseInt(currentPage) + 1;
				to_menuByClassfy(cid, orderbySome);
			}
		});
		//点击购物车中的删除按钮清空购物车
		$("#cart_head_delete").click(
				function() {
 					$.ajax({
						url : "${APP_PATH}/clear",
						type : "POST",
						success : function(result) {
							if (result.code == 100) {
								$("#cart_tbody").html("");
								//window.location.href="${APP_PATH}/userpage/main.jsp";
								//清空数字
								$(".show_num").text("");
								//隐藏减号
								$(".glyphicon-minus-sign").removeClass("glyphicon glyphicon-minus-sign");
 								$("#show_cart_info").html("购物车为空");
							}
						}
					});
				});

		//点击加号执行动作
		$(document).on("click",".glyphicon-plus-sign",function() {
						//这里我再去判断是否登录
						var isLogin_flag123=1;
							$.ajax({
								url:"${APP_PATH}/userIsLogin",
								type:"POST",
								async:false,
								success:function(result){
									var code=result.code;
									if(code=="200"){
										//alert("sdfds");
										isLogin_flag123=0;
										var msg = "还没登录，是否登录？";
											//confirm中的回调函数，如果点确认就执行回调函数
											confirm(function() 
													{window.location.href = "${APP_PATH}/userpage/user/login2.jsp";
										   }, "", msg);
									}
								}
							});
							if(isLogin_flag123==0) return false;
  							//修改数字显示
							var num = $(this).prev("span").text();
							if (num == "") {
								num = 0;
								//把减号显示出来
								$(this).prev("span").prev("span").addClass("glyphicon glyphicon-minus-sign");
 							}
							num = parseInt(num) + 1;
							$(this).prev("span").text("");//置空
							$(this).prev("span").append(num);
							//获得售价
							var mid = $(this).parent("div").prev("div").children("input:eq(0)").val();
 							var image_path = $(this).parent("div").prev("div").children("input:eq(1)").val();
 							var price_str = $(this).parent("div").prev("div").children("span:eq(1)").text();
 							var price = $(this).parent("div").prev("div").children("span:eq(2)").text();
 							var menuName = $(this).parent("div").parent("div").prev("div").prev("div").children("span:eq(0)").text();
 							//alert("主键:"+mid+","+price+","+menuName+","+image_path);
 									$.ajax({
										url : "${APP_PATH}/addCartItem",
										data : {"mid" : mid,"price" : price,"mname" : menuName},
 										type : "POST",
										success : function(result) {
											var flag = result.code;
											if (flag == 200) {
												$(this).prev("span").prev("span").removeClass("glyphicon glyphicon-minus-sign");
 												var msg = "还没登录，是否登录？"
												//confirm中的回调函数，如果点确认就执行回调函数
												confirm(function() 
														{window.location.href = "${APP_PATH}/userpage/user/login2.jsp";
 												}, "", msg);
											} else if (flag == 100) {
												showTable(result);
											}

										}
									});
						});
		//往购物车塞数据
		function showTable(result) {
			var totalPrice = result.extend.cart.total;
			//购物车集合
			var cartItemList = result.extend.cart.cartItems;
			$("#cart_tbody").html("");
			$("#totalPrice").text("");
			$.each(cartItemList, function(index, cartItem) {
 				var tr_ele = $("<tr></tr>").addClass("hover-style1");
				var th_name = $("<th></th>").addClass("menu_name").append(cartItem.menu.mname);
 				var th_count = $("<th></th>").addClass("menu_count").append(cartItem.count);
 				subtotal_price=cartItem.subtotal.toFixed(2);
 				var th_subtotal = $("<th></th>").addClass("menu_price").append(subtotal_price);
						
				tr_ele.append(th_name);
				tr_ele.append(th_count);
				tr_ele.append(th_subtotal);
				tr_ele.appendTo("#cart_tbody");
			});
			$("#show_cart_info").text("");
			var show_info_span1 = $("<span></span>").append("共 ￥");
			//保留两位小数
			totalPrice=totalPrice.toFixed(2);
			var show_info_span2 = $("<span></span>").append(totalPrice);
			var show_info_span3 = $("<span></span>").append("元");
			show_info_span1.appendTo("#show_cart_info");
			show_info_span2.appendTo("#show_cart_info");
			show_info_span3.appendTo("#show_cart_info");
		}
		//减号按钮
		$(document).on("click",".glyphicon-minus-sign",function() {
 					var num = $(this).next("span").text();
					var mid = $(this).parent("div").prev("div").children("input:eq(0)").val();
 					num = parseInt(num);
					if (num <= 1) {
						//alert("小于等于1");
						//数字设为空，隐藏自己
						$(this).next("span").text("");
						$(this).removeClass("glyphicon glyphicon-minus-sign");
						//获得mid
						$.ajax({
							url : "${APP_PATH}/delete",
							data : {"mid" : mid},
 							type : "POST",
							success : function(result) {
								var flag = result.code;
								if (flag == 100) {
									showTable(result);
								}
							}
						});
						return false;
					} else {
						num = num - 1;
						$(this).next("span").text("");
						$(this).next("span").append(num);
						$.ajax({
							url : "${APP_PATH}/delete",
							data : {"mid" : mid},
 							type : "POST",
							success : function(result) {
								var flag = result.code;
								if (flag == 100) {
									showTable(result);
								}
							}
						});
					}

				});

		//按分类查询 点击分类号
		$(document).on("click", "#category_id li", function() {
			search_mid="-100";
			  if(orderbySome=="Star"){
					orderbySome="createtime";
					//alert("收藏");
				} 
			//首先置当前页为1，清空商品信息防止重复
			currentPage = "1";
			$(".shopcards-list").html("");//清空内容，重新插入
			cid = $(this).attr("data_id");
			to_menuByClassfy(cid, orderbySome);
			//alert("分类号："+c_id);
			 
		});

		//排序按钮........................................................
		$("span.sort-item").click(function() {
			//alert("点击....");
			currentPage = "1";
			$(".shopcards-list").html("");//清空内容，重新插入
			var orderbySome = $(this).attr("data-node");
			to_menuByClassfy(cid, orderbySome);
		});
		$(document).on("click","#star_li",function() {
			
			currentPage = "1";
			$(".shopcards-list").html("");//清空内容，重新插入
			orderbySome = "Star";
			to_menuByClassfy(cid, orderbySome);
			//alert("收藏："+orderbySome);
		});
		
		//查询所有分类：
		function to_getCategory() {
 					$.ajax({
						url : "${APP_PATH}/getCategoryWithAjax",
						type : "GET",
						success : function(result) {
							var categoryList = result;
 									$.each(categoryList,function(index, category) {
 												//console.log("分类名："+category.cname);
												var li = $("<li></li>").addClass("cate-item").attr("data_id",category.cid);
 												var div_img = $("<div></div>").addClass("item-img");
 												var div_img_start = $("<div   style='background-image: url(https://img.waimai.baidu.com/pb/dbed14c4cb831bff5f0e5ab92a78a4517c@s_0,w_18,h_46);'  ></div>").addClass("img-show cate-start");
 												var div_img_hover = $("<div   style='background-image: url(https://img.waimai.baidu.com/pb/dbed14c4cb831bff5f0e5ab92a78a4517c@s_0,w_18,h_46);' ></div>").addClass("img-show cate-hover cate-hover-all");
 												div_img.append(div_img_start);
												div_img.append(div_img_hover);
 												var item_text = $("<div></div>").addClass("item-text").append(category.cname);
 												div_img.appendTo(li);
												item_text.appendTo(li);
												li.appendTo("#category_id");
 												if (index <= 8)
													$(".cate-item").css("margin-bottom","13px");
 												if (index > 8 && index <= 16)
													$(".cate-item").css("margin-top","13px");
 												if (index > 16)
													$(".cate-item").css("margin-bottom","13px");
 											});

						}
					});
		}
		//按分类号查询***********************************************************************************
		function to_menuByClassfy(cid, orderbySome) {
 					$.ajax({
						url : "${APP_PATH}/findMenuByCategory",
						/* data : "cid=" + cid, */
						data : {"cid" : cid,"pn" : currentPage,"orderbySome" : orderbySome,"mid":search_mid},
 						type : "POST",
 						//async: false,
						success : function(result) {
							var menList = result.extend.pageInfo.list;
							var menList_len = menList.length;
							//console.log("列表长度:" + menList_len);
							/* currentPage=result.extend.pageInfo.pageNum; */
							pageTotal = result.extend.pageInfo.pages;
							//console.log("结果：" + menList);
							if (menList_len > 0) {
 										$.each(menList,function(index, menu) {
 												getMenuListSub(index,menu);
										});
 								//
							} else {
 								var info_h1 = $("<div></div>").append("该分类下没有菜品").css("letter-spacing", "2px").css("margin-left", "380px").css("margin-top", "200px").css("font-size", "20px");
 								$("#show_img").append(info_h1);
 							}
						}
					});
		}
		
		function getMenuListSub(index,menu){
			//console.log("循环：" + menu.mname + "," + menu.price);
				/* console.log("循环："+menu.mname+","+menu.image);
			var imgs=$("<img />").attr("src",menu.image);
			imgs.appendTo("#container1"); */
			var li = $("<li></li>").addClass("list-item shopcard");
				var shopimg = $("<div ></div>").addClass("shopimg");
				var img = $("<img />").attr("src",menu.image).addClass("mouse_event").attr("title",menu.mname);
				img.click(function() {
				//alert("点击图片...");
					window.location.href="${APP_PATH}/userpage/menu/menuDetail.jsp?mid="+menu.mid;
				});
			
			shopimg.append(img);//图片显示
			var my_span = $("<span></span>").append(menu.mname);
				var title = $("<div></div>").addClass("title").append(my_span);
				title.click(function() {
					//window.location.href="${APP_PATH}/userpage/menu/menuDetail.jsp";
				});

			var cert_icon = $("<span></span>").addClass("cert-icon");
				var cert_icon_img = $("<img />").attr("src","https://static.waimai.baidu.com/static/forpc/certificated_s.png");
				cert_icon.append(cert_icon_img);
				shopimg.appendTo(li);
			title.appendTo(li);//把菜名加入
			cert_icon.appendTo(title);//这是那个(证)字
			//把五角星加入
			var info = $("<div></div>").addClass("info s-info clearfix");
			 				
			var f_star = $("<div></div>").addClass("f-col f-star star-control");
				var rate = $("<span></span>").addClass("rate");
				var rate_inner = $("<span style='width: 72px'></span>").addClass("rate-inner");
				rate.append(rate_inner);
			f_star.append(rate);
			info.append(f_star);
				//显示卖出去的数量
			var f_sale = $("<div></div>").addClass("f-col f-sale").append("已售:"+ menu.salecount+ " 份");
			 				
			info.append(f_sale);
			info.appendTo(li);
			//显示售价
			var info_price = $("<div></div>").addClass("info f-info clearfix");
				var f_price = $("<div></div>").addClass("f-col f-price").css("padding-top","4px").css("width","80px");//.css("background-color","pink");
				var item_label = $("<span></span>").addClass("item-label").append("");
				var item_value = $("<span></span>").addClass("item-value").append("售价:￥");
				var salary_price=menu.price.toFixed(2);
				var item_value_count = $("<span></span>").append(salary_price).addClass("salary_font_size");
				//console.log("售价:"+menu.price);
				//把主键加入，放到隐藏域中
			var input_key = $("<input />").attr("type", "hidden").attr("value",menu.mid);
				//图片路径
			var image_path = $("<input />").attr("type", "hidden").attr("value",menu.image);
				//						
			f_price.append(item_label);
			f_price.append(item_value);
			f_price.append(item_value_count);
					
			f_price.append(input_key);
			f_price.append(image_path);
			info_price.append(f_price);

			//配送 <i class="Hui-iconfont">&#xe640;</i> 收藏 isCollect为1 代表已经收藏
			//<i class="layui-icon" style="font-size: 20px; color: #1E9FFF;">&#xe640;</i>
			//var icon_ele=$("<i>&#xe67b;</i>").addClass("layui-icon").css("font-size","20px").append("");
			var rateStar=menu.ratestar;
			var f_cost = $("<div><p style='height:5px;'></p></div>").addClass("f-col f-cost").css("height","10px").css("padding-bottom","-10px;");
			var item_label_span = $("<span>收藏量:</span>").addClass("item-label").append("");
				var item_value_span = $("<span></span>").addClass("item-value").append(rateStar);
				f_cost.append(item_label_span).append(item_value_span);
				//info_price.append(f_cost);
				//var saleCount_ele=$("<span><p style='height:5px;'></p>收藏:</span>").append(rateStar);
				//info_price.append(rateStar);
				//加减号
			var f_time = $("<div></div>").addClass("f-col f-time");
				var addplus = $("<i style='font-size: 20px; color: #1E9FFF;'>&#xe61f;</i>").addClass("layui-icon");
				var addplus2 = $("<span></span>").addClass("glyphicon glyphicon-plus-sign").css("font-size","20px").css("color","#1E9FFF");
				var reduce = $("<span></span>").addClass("").css("font-size","20px").css("color","#1E9FFF");
				var show_num = $("<span></span>").css("font-size","18px").addClass("show_num");//
				//循环遍历session中的购物车项，判断菜有没有被选中过
			var fromSession_cartItems = getCartSession();
			var mid = menu.mid;
			var cartItems = fromSession_cartItems.cartItems;
			//console.log(cartItems);
			if (cartItems != 0&& cartItems != undefined) {
					//如果用户没登录，session就为空， cartItems为undefined
				for (var i = 0; i < cartItems.length; i++) {
					var session_mid = cartItems[i].menu.mid;
					if (mid == session_mid) {
						//如果相等就证明数量肯定大于0了，让左边那个减号显示出来
						//订单条目中对应的数量
						var count = cartItems[i].count;
						show_num.append(count);
							reduce.addClass("glyphicon glyphicon-minus-sign");
						}

				}
			}

			f_time.append(reduce);
			f_time.append(show_num);
			f_time.append(addplus2);
			info_price.append(f_time);
			info_price.appendTo(li);
			//放在最下面，撑地方rateStar
			var feature = $("<div>收藏量:</div>").addClass("feature").append(rateStar).css("margain-left","10px");
				feature.appendTo(li);
			li.appendTo("#show_img");
		}
		
		//从Session中获得购物车中的值
		function getCartSession() {
			var cartFromSession = "";
			$.ajax({
				url : "${APP_PATH}/getCartSession",
				type : "GET",
				async : false,
				success : function(result) {
					cartFromSession = result;
					///alert("购物车数据:"+cartFromSession);
					//console.log(cartFromSession);
				}
			});
			return cartFromSession;
		}
 		//设置鼠标进入事件 mouse_event
		//监听文件选中状态
		/* $(document).on('mouseenter', '.mouse_event', function() {
 			$(".mouse_event").css("opacity", "0.9");
			$(this).css("opacity", "1");
		});
		$(document).on('mouseleave', '.mouse_event', function() {
 			$(".mouse_event").css("opacity", "1");
 		}); */
	</script>

</body>
</html>


