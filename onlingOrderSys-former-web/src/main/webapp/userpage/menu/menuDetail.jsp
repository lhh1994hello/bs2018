<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ include file="/userpage/public/waimaiCssJs.jsp"%>
<%@ include file="/userpage/public/myjs.jsp"%><!-- 顺序在hui的上面， -->
<%@ include file="/userpage/public/huiJSAndCss.jsp"%>
<%-- <%@ include file="/userpage/public/baiduwaimaiCartCssAndJS.jsp"%> --%>
<%-- <script src="${APP_PATH}/static/pintuer/jquery.js"></script>
<script src="${APP_PATH}/static/pintuer/pintuer.js"></script> --%>
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/pintuer/pintuer.css" />
<title>菜品详情</title>
<style type="text/css">
	ul li{
		letter-spacing: 1px;
	}
 	ul li img {
	width: 228px;
	height: 140px;
 	}
 	.layui-textarea{
		border: 1px solid red;
	}
/*  */
		*{  
		  margin:0;  
		   padding:0;  
		}  
 		.box{  
		    margin: 20px auto;  
		    height: 50px;  
		    width: 300px;  
		}  
		.box .comment{  
		    font-size: 30px;  
		    color: orange;  
		}  
 		.comment li{  
		    float: left;  
		    cursor: pointer;  
		}  
 		ul{  
		    list-style: none;  
		}  
		#div_time_line img{
			width:30px;
			height:30px;
		}
		#nav_bar_info{
			
		}
		#find,#order,#contact{
			margin-top: 5px;
		}
/*  */
 	
</style>
</head>
<body>
	<div class="row" id="head_row">
		<!--  首页导航和 分类菜单-->
		<%@ include file="/userpage/public/baiduwaimaihead.jsp"%>
	</div>
	<!-- <div class="container-fluid"> -->
	<div class="container">
		<!-- <h1>AAA</h1>
		<h2 id="mid_show"></h2> -->
		<div class="row">
			<div class="col-md-3">
					
				<div class="row">
					<div class="col-md-12">
 							<section class="shop-list" id="shop-list">
								<div class="list-wrap">
									<div class="list clearfix">
										<ul class="shopcards-list" id="show_img">
											<!-- 在这里面显示商品信息，通过Jquery插入 -->
						 					<li class="list-item shopcard">
												<div class="shopimg">
													<img id="img_show" src="http://localhost/menuImage/201805081200067730_c11.jpg" class="mouse_event" title="罄竹鲜花蛋糕" >
						 						</div>
												<div class="title">
													<span id="menu_name">罄竹鲜花蛋糕</span>
													<span class="cert-icon">
														<img src="https://static.waimai.baidu.com/static/forpc/certificated_s.png">
						 							</span>
												</div>
												<div class="info s-info clearfix">
													<div class="f-col f-star star-control">
														<span class="rate">
															<span style="width: 72px" class="rate-inner"></span>
														</span>
													</div>
													<div class="f-col f-sale" id="sale_count">已售:0 份</div>
												</div>
												<div class="info f-info clearfix">
													<div class="f-col f-price" style="padding-top: 4px; width: 120px;">
														<span class="item-label"></span>
														<span class="item-value" >售价:￥</span>
														<span class="salary_font_size" id="sale_price">188</span>
														<!-- <i class="Hui-iconfont">&#xe68e;</i> -->
						   							</div>
						   							
													<div class="f-col f-time" id="f_col_time">
														<i title="未收藏" cid="-100" id="icon_image" flag_star="0" class="Hui-iconfont" style="font-size: 28px;">&#xe69e;</i>
														
						 							</div>
												</div>
												<div class="feature"></div>
											</li>
											<!-- ********************************** -->
												
											<!-- ********************************** -->
										</ul>
										<!-- <div style="letter-spacing:1px;">AAAAAAAAAAAAa</div> -->
									</div>
								</div>
								</section>
					</div>
				</div>
				<!-- 第二行 -->
				<div class="row">
					<div class="row" style="margin-left: 18px;" id="menu_introduce"></div>
					<div class="row" style="margin-left: 18px;" id="categoryName"></div>
					<div class="row" style="margin-left: 18px;" id="category_intro"></div>
				</div>
			</div>
			<!-- 一行，分左右两列 -->
			<div class="col-md-8" style="margin-left: -50px;">
				<div class="row" style="height: 50px;margin-top: 30px;">
					<div class="col-md-8 col-md-offset-1">
						<span id="pingjia_span" style="font-size: 30px;color: red;" ><!-- 评价列表 --></span>
					</div>
					<div class="col-md-3">
						<!-- <button class="btn btn-success radius">评论一下</button> -->
 					</div>
				</div>
				<div class="row" id="div_time_line">
					<div class="col-md-8">
						<span id="info_span2" style="font-size: 30px;color: red;margin-left: 30px;"></span>
						<ul class="layui-timeline" id="ul_id">
						<%--   <li class="layui-timeline-item">
						    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
						    <div class="layui-timeline-content layui-text">
						      <h3 class="layui-timeline-title">
						      	<img alt="图片" src="${APP_PATH}/images/default/avatar-default-S.gif">
						      	<span>昵称  </span> 
						     	<span>8月18日</span> 
						      </h3>
						      	<h5 >
						      		<span>评价:</span>
						      		<i  style="font-size:20px;color: orange;margin: -7px;" class="Hui-iconfont">&#xe630;</i> 
						      		<i  style="font-size:20px;color: orange" class="Hui-iconfont">&#xe69e;</i> 
						      	</h5>
						      <p>
						        layui 2.0 的一切准备工作似乎都已到位。发布之弦，一触即发。
						        <br>不枉近百个日日夜夜与之为伴。因小而大，因弱而强。
						        <br>无论它能走多远，抑或如何支撑？至少我曾倾注全心，无怨无悔
						         <i class="layui-icon"></i>
						      </p>
						    </div>
						  </li> --%>
						
						</ul>
						<div class="row" style="margin-left: 30px;"> 
							<div class="col-md-4" id="page_nav_info_area" style="font-size: 20px;">
								
							</div>
							<div class="col-md-8" id="page_nav_num_area">
	 							<!-- 这里是分页条码填充区域 -->
							</div>
						</div>
					</div>
					<div class="col-md-4" >
						<div class="row">
							<button id="comment_id" class="btn btn-success radius" style="display: none;">评论一下</button>
 						</div>
 						<div id="div_textarea_id" class="row" style="visibility:hidden;">
 							<div class="layui-form-item layui-form-text">
	    						<!-- <label class="layui-form-label">文本域</label> -->
	    						<div style="margin-top: 10px;">
	    							  <textarea id="textarea_context" name="desc" placeholder="请输入内容" class="layui-textarea" ></textarea>
	    							  <span id="info_span" style="color: red"></span>
	     						</div>
 							</div>
 						</div>
						<div id="div_star" class="row" style="visibility:hidden;">
							<div class="box" style="margin-top: -20px;">  
								<span style="float: left;display: block;margin-top: 15px;">评价:</span>
		        				<ul class="comment" >  
				       		    	<li id="star1" class="star" star="1">☆</li>  
						            <li id="star2" class="star" star="2">☆</li>  
						            <li id="star3" class="star" star="3">☆</li>  
						            <li id="star4" class="star" star="4">☆</li>  
						            <li id="star5" class="star" star="5">☆</li>  
		       					</ul>  
    						</div> 
 						</div>
 						<div id="div_submit" class="row"  style="margin-top: -20px;visibility:hidden;">
 							<div class="col-md-2" style="margin-left: -10px;">
 								<button id="btn_submit" class="btn btn-success radius">提交评论</button>
  							</div>
 						</div>
 					</div>
				</div>
			</div>
		</div>
		
	</div>


	<script type="text/javascript">
		<%@ include file="/userpage/public/confirmshow.jsp" %>
		$(function() {
			var pn="1";
			var commentFlag=0;//0代表隐藏
			//五星评分
			var starNum="0";
			var star="0";
			var mid = "-100";
			var isLogin="-100";
			var url = window.location.href;
			if (url.indexOf("?") != -1) {
				var index = url.indexOf("=");
				mid = url.substring(index + 1);
  			}
			findmenuById();
			judgeUserIsCollect();
			checkUserIsLogin();
			showEvalList();
			//comment_id
			function checkUserIsLogin(){
				$.ajax({
					url:"${APP_PATH}/userIsLogin",
					type:"POST",
					async:false,
					success:function(result){
						var code=result.code;
						if(code=="100"){
							$("#comment_id").css("display","block");
						}else if(code=="200"){
							$("#comment_id").css("display","none");
						}
					}
				});
			}
			
			//头部导航按钮的收藏夹
			$("#shouChangJia").click(function(){
				window.location.href = "${APP_PATH}/userpage/main.jsp?shouchang=Star";
			});
			
			
			//显示这道菜的评论列表
			function showEvalList(){
				//alert("调用");
				$.ajax({
					url:"${APP_PATH}/showEvalList",
					data:{"mid":mid,"pn":pn},
					type:"POST",
					success:function(result){
						var code=result.code;
						//alert("边走:"+code);
						if(code=="100"){
							//alert("成功了...");
							var evaluationList=result.extend.pageInfo.list;
							fillContextList(result);
							if(evaluationList.length>0){
								page_nav_num(result);
								page_nav_info(result);
							}
							
						}
					}
				});
			}
			
			//页码信息区
			function page_nav_info(result){
				var pageInfo=result.extend.pageInfo;
				$("#page_nav_info_area").empty();
				//span_info_info
				var pages=pageInfo.pages;//总页数
				var total=pageInfo.total;//总记录数
				//alert("记录:"+total);
				var font_A=$("<font></font>").css("color","red").append(pages);
				var font_B=$("<font></font>").css("color","red").append(total);
				var span_A=$("<span></span>").append("共").append(font_A).append("页");
				var span_B=$("<span>&nbsp;,&nbsp;</span>");
				var span_C=$("<span></span>").append("共").append(font_B).append("条");
				$("#page_nav_info_area").append(span_A).append(span_B).append(span_C)
				
				
			}
			//数字按钮区域
			function page_nav_num(result){
				var pageInfo=result.extend.pageInfo;
				$("#page_nav_num_area").empty();
				var ul=$("<ul class='pagination pagination-group border-sub'></ul>");
				var prePageLi=$("<li></li>");
				var prePageLi_A=$("<a href='javascript:void(0);'>«</a>");
				prePageLi.append(prePageLi_A);
				if(!pageInfo.hasPreviousPage){
					prePageLi.addClass("disabled");
				}else{
					prePageLi.click(function(){
						pn=pn-1;
						showEvalList();
			         });
 				}
				ul.append(prePageLi);
				$.each(pageInfo.navigatepageNums,function(index,item){
					var numLi=$("<li></li>");
					var numLi_A=$("<a href='javascript:void(0);'></a>").append(item);
					numLi.append(numLi_A);
					if(pageInfo.pageNum==item){
						numLi.addClass("active");
					}
					numLi.click(function(){
						pn=item;
						//alert("pn:"+pn);
						showEvalList();
					});
 					ul.append(numLi);
 				});
				var nextPageLi=$("<li></li>");
				var nextPageLi_A=$("<a href='javascript:void(0);'>»</a>");
				nextPageLi.append(nextPageLi_A);
				if(!pageInfo.hasNextPage){
					nextPageLi.addClass("disabled");
 				}else{
 					nextPageLi.click(function(){
						pn=pn+1;
						showEvalList();
					});
 				}
				ul.append(nextPageLi);
				$("#page_nav_num_area").append(ul);
			}
			//内容区域 填充评价列表
			function fillContextList(result){
				
				$("#ul_id").empty();
				var evaluationList=result.extend.pageInfo.list;
				//pingjia_span
				var len=evaluationList.length;
				if(len<=0){
					$("#pingjia_span").text("");
					$("#info_span2").append("暂无评价");
					$("#page_nav_num_area").html("");
					$("#page_nav_info_area").html("");
					
				}else{
					$("#info_span2").text("");
					$("#pingjia_span").text("").append("评价列表");
				
				$.each(evaluationList,function(index,evaluation){
					var contexts=evaluation.contexts;
					var createtime=evaluation.createtime;
					var startnum=evaluation.startnum;
					var uNickname=evaluation.user.uNickname;
					var image=evaluation.user.image;
					if(image==""||image=="0000"){
						image="${APP_PATH}/images/default/avatar-default-S.gif";
					}
					var li=$("<li class='layui-timeline-item'></li>");
					var i_circle=$("<i class='layui-icon layui-timeline-axis'>&#xe63f;</i>");
					
					var div_ele=$("<div class='layui-timeline-content layui-text'></div>");
					var h3_ele=$("<h3 class='layui-timeline-title'></h3>");
					var img_ele=$("<img />").attr("title",uNickname).attr("src",image);
					var span_uNickname=$("<span></span>").append(uNickname);
					var span_createtime=$("<span>&nbsp;&nbsp;</span>").append(createtime);
					h3_ele.append(img_ele).append(span_uNickname).append(span_createtime);
					
					var h5=$("<h5></h5>");
					var span_eveluation=$("<span>评价:</span>");
					console.log("星星："+startnum);
 					var i_star_S_A=$("<i class='Hui-iconfont'>&#xe630;</i>").css("font-size","20px").css("color","orange");//.css("margin","-7px");
					var i_star_S_B=$("<i class='Hui-iconfont'>&#xe630;</i>").css("font-size","20px").css("color","orange");//.css("margin","-7px");
					var i_star_S_C=$("<i class='Hui-iconfont'>&#xe630;</i>").css("font-size","20px").css("color","orange");//.css("margin","-7px");
					var i_star_S_D=$("<i class='Hui-iconfont'>&#xe630;</i>").css("font-size","20px").css("color","orange");//.css("margin","-7px");
					var i_star_S_E=$("<i class='Hui-iconfont'>&#xe630;</i>").css("font-size","20px").css("color","orange");//.css("margin","-7px");
					
					
 					var i_star_K_A=$("<i class='Hui-iconfont'>&#xe69e;</i>").css("font-size","20px").css("color","orange");//.css("margin","-7px");
 					var i_star_K_B=$("<i class='Hui-iconfont'>&#xe69e;</i>").css("font-size","20px").css("color","orange");//.css("margin","-7px");
 					var i_star_K_C=$("<i class='Hui-iconfont'>&#xe69e;</i>").css("font-size","20px").css("color","orange");//.css("margin","-7px");
 					var i_star_K_D=$("<i class='Hui-iconfont'>&#xe69e;</i>").css("font-size","20px").css("color","orange");//.css("margin","-7px");
 					var i_star_K_E=$("<i class='Hui-iconfont'>&#xe69e;</i>").css("font-size","20px").css("color","orange");//.css("margin","-7px");
					if(startnum=="0"){
						h5.append(span_eveluation).append(i_star_K_A).append(i_star_K_B).append(i_star_K_C).append(i_star_K_D).append(i_star_K_E);
 					}
					if(startnum=="1"){
						h5.append(span_eveluation).append(i_star_S_A).append(i_star_K_B).append(i_star_K_C).append(i_star_K_D).append(i_star_K_E);
 					}
					if(startnum=="2"){
						h5.append(span_eveluation).append(i_star_S_A).append(i_star_S_B).append(i_star_K_C).append(i_star_K_D).append(i_star_K_E);
 					}
					if(startnum=="3"){
						h5.append(span_eveluation).append(i_star_S_A).append(i_star_S_B).append(i_star_S_C).append(i_star_K_D).append(i_star_K_E);
 					}
					if(startnum=="4"){
						h5.append(span_eveluation).append(i_star_S_A).append(i_star_S_B).append(i_star_S_C).append(i_star_S_D).append(i_star_K_E);
 					}
					if(startnum=="5"){
						h5.append(span_eveluation).append(i_star_S_A).append(i_star_S_B).append(i_star_S_C).append(i_star_S_D).append(i_star_S_E);
 					}
					var i_icon=$("<i class='layui-icon'></i>");
					var p_ele=$("<p></p>").append(contexts).append(i_icon);
					div_ele.append(h3_ele).append(h5).append(p_ele);
 					li.append(i_circle).append(div_ele);
 					$("#ul_id").append(li);
					console.log("contexts:"+contexts);
				});
				
				}
			}
			//点击提交评论
			$("#btn_submit").click(function(){
				var contexts=$("#textarea_context").val();
				//在后台判断用户是否登录
				if(contexts==""){
					//$.Huimodalalert('已收到您的反馈', 1000);
					$("#info_span").text("").append("请输入评论");
					return false;
				}
				//alert("star:"+star);
				//return false;
				$.ajax({
					url:"${APP_PATH}/addEvaluation",
					data:{"mid":mid,"startnum":star,"contexts":contexts},
					type:"POST",
					success:function(result){
						var code=result.code;
						if(code=="200"){
							var msg = "还没登录，是否登录？"
		 					confirm(function() 
										{window.location.href = "${APP_PATH}/userpage/user/login2.jsp";
							}, "", msg);
						}else if(code=="100"){
							//alert("提交评论后:"+code);0
							star="0";
							commentFlag=0;
							$("#div_textarea_id").css("visibility","hidden");
							$("#div_star").css("visibility","hidden");
							$("#div_submit").css("visibility","hidden");
							$("#comment_id").text("").append("评论一下");
							pn=1;
							showEvalList();
							//关闭评论框
							
						}
					}
					
				});
				
				
				
			});
			
			$(".star").click(function(){
				star=$(this).attr("star");
 				var wjx_none = '☆'; // 空心五角星  
		   		var wjx_sel = '★'; // 实心五角星  
		   		$(this).text("").append(wjx_sel);
		   		$(this).prevAll().text("").text(wjx_sel);
		   		$(this).nextAll().text("").append(wjx_none);
 			});
			
			$("#comment_id").click(function(){
				
				var wjx_none = '☆'; // 空心五角星  
				$("#star1").text("").append(wjx_none);
				$("#star2").text("").append(wjx_none);
				$("#star3").text("").append(wjx_none);
				$("#star4").text("").append(wjx_none);
				$("#star5").text("").append(wjx_none); 
				$("#info_span").text("");
				$("#textarea_context").val("");
				if(commentFlag==0){
					commentFlag=1;
					$("#div_textarea_id").css("visibility","visible");
					$("#div_star").css("visibility","visible");
					$("#div_submit").css("visibility","visible");
					$("#comment_id").text("").append("取消评论");
				}else if(commentFlag==1){
					commentFlag=0;
					$("#div_textarea_id").css("visibility","hidden");
					$("#div_star").css("visibility","hidden");
					$("#div_submit").css("visibility","hidden");
					$("#comment_id").text("").append("评论一下");
				}
			});
			//未收藏时，添加点击事件
			/* $("#icon_image").click(function(){
				var cid_id=$(this).attr("cid");
				var flag_star=$(this).attr("flag_star");
				change_star_state(cid_id,flag_star);
			}); */
			
			//收藏相关，传入参数:mid,去查询用户的收藏列表，看是否有这道菜，判断用户是否收藏了这道菜
			function judgeUserIsCollect(){
				$.ajax({
					url:"${APP_PATH}/judgeUserIsCollect",
					data:{"mid":mid},
					type:"POST",
					success:function(result){
						var code=result.code;
						var msg=result.extend.msg;
						//alert("结果:"+msg);
						if(code=="100"){
							//把收藏图标设为实心的 f_col_time, icon_image
							$("#f_col_time").empty();
							var ico_star=$("<i class='Hui-iconfont'>&#xe630;</i>").css("font-size","28px").css("color","#FF6666").attr("cid",msg).attr("flag_star","1").attr("title","已收藏");
							ico_star.click(function(){
								//alert("点击了");
								var cid_id=$(this).attr("cid");
								var flag_star=$(this).attr("flag_star");
								change_star_state(cid_id,flag_star);
								//,获得id,获得状态，判断是否登录
							});
							$("#f_col_time").append("已收藏");
							$("#f_col_time").append(ico_star);
						}else if(code=="200"){
							$("#f_col_time").empty();
							var ico_star=$("<i class='Hui-iconfont'>&#xe69e;</i>").css("font-size","28px").attr("cid",msg).attr("flag_star","0").attr("title","未收藏");
							ico_star.click(function(){
								//alert("点击了");
								var cid_id=$(this).attr("cid");
								var flag_star=$(this).attr("flag_star");
								change_star_state(cid_id,flag_star);
								//,获得id,获得状态，判断是否登录
							});
							$("#f_col_time").append("未收藏");
							$("#f_col_time").append(ico_star);
						}
						
					}
				});
			}
			
			
			//进行收藏或取消收藏 收藏的ID判断是修改状态还是新建一个记录，flg_star判断是收藏还是取消收藏
			function change_star_state(cid_id,flag_star){
			
				$.ajax({
					url:"${APP_PATH}/StarshouChang",
					data:{"cid":cid_id,"flagStar":flag_star,"mid":mid},
					type:"GET",
					//async:false,
					success:function(result){
						var code=result.code;
						//alert("标志:"+code);
						if(code=="100"){
							judgeUserIsCollect();
						}else if(code=="200"){
 							var msg = "还没登录，是否登录？"
		 						confirm(function() 
										{window.location.href = "${APP_PATH}/userpage/user/login2.jsp";
								}, "", msg);
						}
						
					}
					
				});
				//alert("id:"+cid_id+",flag_star:"+flag_star);
			}
			
			//判断用户是否登录isLogin
			function userIsLogin(){
				$.ajax({
					url:"${APP_PATH}/userIsLogin",
					type:"POST",
					async:false,
					success:function(result){
						var code=result.code;
						if(code=="100"){
							isLogin="100";
						}
						if(code=="200"){
							isLogin="-100";
							var msg = "还没登录，是否登录？"
	 						confirm(function() 
									{window.location.href = "${APP_PATH}/userpage/user/login2.jsp";
							}, "", msg); 
						}
					},
					error:function(){
						alert("出错了...");
					}
				});
			}
			//点击详情的时候自动执行这个方法
			function findmenuById(){
				if(mid=="-100"){
					return false;
				}
				$.ajax({
					url:"${APP_PATH}/findMenuByCategory",
					data:{"mid":mid},
					type:"POST",
					success:function(result){
						var code=result.code;
						if(code=="100"){
							//alert("成功了");
							var menList = result.extend.pageInfo.list;
							var menList_len = menList.length;
							if(menList_len>0){
 								$.each(menList,function(index, menu) {
 									mid=menu.mid; 
 									//alert("mid:"+mid);
									var mname=menu.mname;
									var price=menu.price;
									var salecount=menu.salecount;
									var image=menu.image;
									var introduce=menu.introduce;
									var createtime=menu.createtime;
									
									var categoryId=menu.category.cid;
									var categoryName=menu.category.cname;
									var categoryInfo=menu.category.cinfo;
									//填充
									$("#img_show").attr("src",image);
									$("#menu_name").text("").append(mname);
									$("#sale_count").text("").append("已售：").append(salecount).append("份");
									$("#sale_price").text("").append(price);
									
									$("#menu_introduce").text("").append("菜品介绍：").append(introduce);
									$("#categoryName").text("").append("所属分类：").append(categoryName);
									$("#category_intro").text("").text("").append("分类介绍：").append(categoryInfo);
								});
 							}
						}else if(code=="200"){
							alert("没成功..");
						}
					},
					error:function(){
						alert("出错了");
					}
					
				});
			}
			/*  */
			
				$(document).on('mouseenter', '#usernameInfo', function() {
  					$("#popUserInfoId").css("visibility","visible");
				});
				$(document).on('mouseleave', '#usernameInfo', function() {
 					$("#popUserInfoId").css("visibility","hidden");
				});
			/*  */
		});
		/* 五星评价的JS */
			 var wjx_none = '☆'; // 空心五角星  
		     var wjx_sel = '★'; // 实心五角星  
		        
		  
		        //鼠标移进变实星  
		      /*   $(".comment li").on("mouseover",function(){  
		            $(this).text(wjx_sel).prevAll("li").  
		            text(wjx_sel).end().nextAll().text(wjx_none);  
		        });   */
		  
		        //鼠标移出变空星  
		        /* $(".comment li").on("mouseout",function(){  
		           if($("li.current").length === 0){  
		                $(".comment li").text(wjx_none);  
		           }else{  
		               $("li .current").text(wjx_sel).prevAll().text(wjx_sel).end().nextAll().text(wjx_none);  
		           }  
		        });  */ 
		  
		        //鼠标点击保持当前状态  
		        $(".comment li").on("click",function(){  
		            $(this).attr("class","current").siblings().removeClass("current");  
		            starNum= $(this).attr("star");
		            //alert("分数:"+starNum);
		        });  
		/* 五星评价的JS */
		
	</script>
</body>
</html>