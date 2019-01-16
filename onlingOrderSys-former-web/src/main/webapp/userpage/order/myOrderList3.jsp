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
<%@ include file="../public/myjs.jsp"%>
<%@ include file="../public/confirmOrderCssJs.jsp"%>
<%@ include file="../public/myOrderListCssJs.jsp"%>

<style type="text/css">
	img{
	/* 228,140 */
		height: 90px;
		width: 150px;
	}
	.images{
		height: 100px;
		width: 170px;
	}
	.subtotal,.price,.count,.name{
		text-align: center;
		
	}
	.order_bar{
		text-align: left;
		font-size: 15px;
	}
	
</style>
<title>我的订单</title>
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
					<div class="order-menu-header">
						<span>我的订单</span>
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
						<div class="menu-item" id="my_shouchang">
							<div id="menu-favorite">
								<span class="menu-icon favorite-icon"></span> 
								<a 
									href="javascript:void(0);" class="menu-title favorite"><span>收藏夹</span></a>
							</div>
						</div>
					
						<div class="menu-item">
							<div id="menu-account">
								<span class="menu-icon account-icon"></span> 
								<a href="${APP_PATH}/userpage/user/homepage.jsp" class="menu-title account">
									<span>账户设置</span>
								</a>
							</div>
						</div>
					</div>
				</div>
				</section>

				<section class="usercenter-detail" id="user-order">
				<div class="summary">
					<!-- <h3 class="summary-header">全部订单</h3> -->
					<h3 class="summary-header"></h3>
					<div class="summary-info">
						<a class="ft-blk ft-medium header-selected" href="javascript:void(0);" data-type="list"
 							data-node="summary-anchor" id="all_order"> 全部订单(12)</a> 
 							<span>|</span> 
 							<a class="ft-blk ft-medium" href="javascript:void(0);" data-type="uncommented"
 							 data-node="summary-anchor">待评价(0)</a>
					</div>
				</div>
				
		<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
				<div id="context-area"> 
					<h1>AAA</h1>
					
				</div>
				<div class="pagination" id="page_number">
					
				</div>
			</section>

				<div class="clearfix" style="_height: 0px; _overflow: hidden;"></div>
			</div>
			
			
			
		</div>

		<!-- ***************************************************************** -->
 	<%-- 	<%@ include file="/userpage/public/myOrderList_fonter.jsp"%> --%>
		<!-- ****************************************************************** -->
	</div>
	<script type="text/javascript">
		$(function(){
			//获得域总的数据
			var currentPage="1";
			var pageSize=3;
			findMyOrderList();
			
			//点击收藏夹跳转到main.jsp，显示我的收藏
			$("#shouChangJia").click(function(){
				window.location.href = "${APP_PATH}/userpage/main.jsp?shouchang=Star";
			});
			$("#my_shouchang").click(function(){
				window.location.href = "${APP_PATH}/userpage/main.jsp?shouchang=Star";
			});
			//获得我的订单，用户Id从域中获得
			function findMyOrderList(){
				$.ajax({
					url:"${APP_PATH}/getMyOrdersWithAjax",
					data:{"pn":currentPage},
					type:"POST",
					success:function(result){
						var code=result.code;
						if(code==100){
							//alert("成功了...");
 							fillContextArea(result);
							
						}else if(code==200){
							var msg=result.extend.msg;
							//alert("提示:"+msg);
						}
						
					}
				});
			}
			//用户名字鼠标放上去显示下拉
			$(document).on('mouseenter', '#usernameInfo', function() {
	  			$("#popUserInfoId").css("visibility","visible");
			});
			$(document).on('mouseleave', '#usernameInfo', function() {
	 			$("#popUserInfoId").css("visibility","hidden");
			});
			//填充数据
			function fillContextArea(result){
				var orderList=result.extend.pageInfo.list;
				if(orderList.length==0){
					//alert("订单为空111");
					showDataWhenisNull();
					
 				}else if(orderList.length>0){
 					showDataWhenIsNotNull(orderList);
 					fillPage_bar(result);
 				}
			}
			//解析导航条数字 page_number
			function fillPage_bar(result){
  				//总记录数 all_order pageInfo.total 全部订单(12)
				var pageInfo=result.extend.pageInfo;
				$("#all_order").text("").append("全部订单\\(").append(pageInfo.total).append("\\)");
				$("#page_number").empty();
				var div_moda_page=$("<div></div>").addClass("mod-page");
				//上一页
				var prePage_A=$("<a>&nbsp;</a>").addClass("mod-page-item mod-page-item-prev").attr("href","javascript:void(0);");
				if(pageInfo.hasPreviousPage){
					prePage_A.click(function(){
						currentPage=currentPage-1;
						findMyOrderList();
					});
				}
				div_moda_page.append(prePage_A);
				$.each(pageInfo.navigatepageNums,function(index,item){
					var a_ele=$("<a></a>").attr("href","javascript:void(0);").attr("data-page",item).addClass("mod-page-item").append(item);
					if(item==pageInfo.pageNum){
						a_ele.addClass("mod-page-item-active");
					}
					a_ele.click(function(){
						currentPage=item;
						findMyOrderList();
					});
 					div_moda_page.append(a_ele);
				});
				//下一页 
				var nextPage_A=$("<a>&nbsp;</a>").addClass("mod-page-item mod-page-item-next").attr("href","javascript:void(0);");
				if(pageInfo.hasNextPage){
					nextPage_A.click(function(){
						currentPage=currentPage+1;
						findMyOrderList();
					});
				}
				div_moda_page.append(nextPage_A);
				$("#page_number").append(div_moda_page);
			}
			
			//解析订单
			function showDataWhenIsNotNull(orderList){
				//外层循环得到订单，内层循环得到订单项
				var table_ele=$("<table></table>").addClass("table table-striped table-hover success  table-bordered");
				$.each(orderList,function(index,orders){
					var tr_ele=$("<tr></tr>").addClass("hover-style1 order_bar").css("background","#f2f2f2");
					var td_ele=$("<td></td>").attr("colspan","5");
					var orderId_span=$("<span></span>").append("订单编号：").append(orders.oid);
					var orderDate_span=$("<span></span>").append(" |成交时间： ").append(orders.createtime);
					
					var money_span=$("<span></span>").append(" |总金额：￥");
					var money_span_font=$("<font></font>").css("color","red");
					var money_span_font_b=$("<b></b>").append(orders.totals);
					money_span_font.append(money_span_font_b);
					money_span.append(money_span_font);
					//链接
					var paystate=orders.paystate;
					var paystate_a=$("<a></a>").attr("href","#").append("测试").css("padding-left","20px");
					if(paystate=="-1"){
						paystate_a.attr("href","javascript:void(0);").text("").append("  订单超时");
					}
					if(paystate=="0"){
						paystate_a.attr("href","${APP_PATH}/findOrdersByOid?oid="+orders.oid).text("").append("去付款");
					}
					if(paystate=="1"){
						paystate_a.attr("href","javascript:void(0);").text("").append("等待发货").css("color","#0099cc");
					}
					if(paystate=="2"){
 						//paystate_a.attr("href","${APP_PATH}/confirmRec?oid="+orders.oid).text("").append("确认收货");
						paystate_a.attr("href","javascript:void(0);").text("").append("确认收货");
						paystate_a.click(function(){
							confirm_order(paystate_a,orders.oid);
						});
						
					}
					if(paystate=="3"){
						paystate_a.attr("href","javascript:void(0);").text("").append("交易成功").css("color","#cc0066");
					}
					paystate_a.css("text-decoration","none");
					td_ele.append(orderId_span).append(orderDate_span).append(money_span).append(paystate_a);
					tr_ele.append(td_ele);
					table_ele.append(tr_ele);
					//循环遍历订单项
					var orderItemList=orders.orderItemList;
					$.each(orderItemList,function(index,orderItem){
						//alert("AAA");
						var tr_ele_Item=$("<tr></tr>").addClass("hover-style1");
						var th_image=$("<th></th>").css("height","100x").css("width","170px");
						//console.log("图片路径:"+orderItem.menu.image);
						var img_ele=$("<img  />").attr("alt","图片").attr("title","图片").attr("src",orderItem.menu.image).css("height","90px").css("width","150px");
						th_image.append(img_ele);
						var th_name=$("<td></td>").append("").append(orderItem.menu.mname).css("text-align","center").css("vertical-align","middle").css("font-size","15px");
						var th_price=$("<td></td>").append("单价：").append(orderItem.menu.price).css("text-align","center").css("vertical-align","middle").css("font-size","15px");
						var th_count=$("<td></td>").append("数量：").append(orderItem.count).css("text-align","center").css("vertical-align","middle").css("font-size","15px");
						var th_subtotal=$("<td></td>").append("小计：").append(orderItem.subtotal).css("text-align","center").css("vertical-align","middle").css("font-size","15px");
						tr_ele_Item.append(th_image).append(th_name).append(th_price).append(th_count).append(th_subtotal);
						table_ele.append(tr_ele_Item);
					});
 				});
				$("#context-area").html("");
				$("#context-area").append(table_ele);
				
			}
			//确认收货
			function confirm_order(ele,oid){
				$.ajax({
					url:"${APP_PATH}/confirmRecWithAjax",
					data:{"oid":oid,"paystate":"3"},
					type:"POST",
					success:function(result){
						var code=result.code;
						var msg=result.extend.msg;
						if(code=="100"){
							//alert(msg);
							setTimeout(function() {
							findMyOrderList();
 							}, 1000);
							
						}else if(code=="200"){
							alert(msg);
						}
					}
				});
				
			}
			//没有订单时显示
			function showDataWhenisNull(){
				var main_div=$("<div></div>").addClass("container");
				var row1_div=$("<div></div>").addClass("row");
				var row1_div_innerDiv=$("<div></div>").addClass("col-md-6 col-md-offset-1").css("margin-top","80px").css("height","150px");
				row1_div.append(row1_div_innerDiv);
				var row2_div=$("<div></div>").addClass("row");
				var row2_div_innerDiv=$("<div></div>").addClass("col-md-6 col-md-offset-3").css("font-size","20px");
				var row2_div_innerDiv_span=$("<span></span>").append("暂无订单");
				//var dot=$("<span><span>").append(",");
				var row2_div_innerDiv_font=$("<font></font>").css("color","red");
				var font_a=$("<a></a>").attr("href","${APP_PATH}/userpage/main.jsp").append("马上来一份");
				row2_div_innerDiv_font.append(font_a);
				row2_div_innerDiv.append(row2_div_innerDiv_span).append(row2_div_innerDiv_font);
				row2_div.append(row2_div_innerDiv);
				main_div.append(row1_div).append(row2_div);
				$("#context-area").html("");
				$("#context-area").append(main_div);
			}
			
		});
	
	</script>
	
</body>
</html>