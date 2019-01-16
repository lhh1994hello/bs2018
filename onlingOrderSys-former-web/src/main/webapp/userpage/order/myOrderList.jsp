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
						<span>个人中心</span>
					</div>
					<div class="splitter"></div>
					<div class="order-menu-body">
						<div class="menu-item">
							<div id="menu-order" class="selected">
								<span class="menu-icon order-icon"></span> <a
									href="/waimai/trade/orderlist" class="menu-title order"><span>我的订单</span></a>
							</div>
						</div>
						<div class="menu-item">
							<div id="menu-address">
								<span class="menu-icon address-icon"></span> <a
									href="/waimai/user/address/select" class="menu-title address"><span>送餐地址</span></a>
							</div>
						</div>
						<div class="menu-item">
							<div id="menu-favorite">
								<span class="menu-icon favorite-icon"></span> <a
									href="/waimai?qt=myfavorite" class="menu-title favorite"><span>收藏夹</span></a>
							</div>
						</div>
						<div class="menu-item">
							<div id="menu-coupon">
								<span class="menu-icon coupon-icon"></span> <a
									href="/waimai?qt=couponinfo" class="menu-title coupon"><span>代金券</span></a>
							</div>
						</div>
						<div class="menu-item">
							<div id="menu-left">
								<span class="menu-icon left-icon"></span> <a
									href="/pay?qt=getuserleft" class="menu-title left"><span>我的余额</span></a>
							</div>
						</div>
						<div class="menu-item">
							<div id="menu-refund">
								<span class="menu-icon refund-icon"></span> <a
									href="/trade/refundlist" class="menu-title refund"><span>我的退款</span></a>
							</div>
						</div>
						<div class="menu-item">
							<div id="menu-account">
								<span class="menu-icon account-icon"></span> <a
									href="/waimai/user/account" class="menu-title account"><span>账户设置</span></a>
							</div>
						</div>
					</div>
				</div>
				</section>

				<section class="usercenter-detail" id="user-order">
				<div class="summary">
					<h3 class="summary-header">全部订单</h3>
					<div class="summary-info">
						<a class="ft-blk ft-medium header-selected"
							href="javascript:void(0);" data-type="list"
							data-node="summary-anchor">全部订单(12)</a> <span>|</span> <a
							class="ft-blk ft-medium" href="javascript:void(0);"
							data-type="uncommented" data-node="summary-anchor">待评价(0)</a>
					</div>
				</div>
				
		<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
			<c:choose>
					<%-- <c:when test="${empty ordersList or fn:length(ordersList) eq 0}">	 --%>
					<c:when test="${empty pageInfo.list or fn:length(pageInfo.list) eq 0}">					
						<div class="container">
							<div class="row">
								<div class="col-md-6 col-md-offset-1" style="margin-top: 80px;height: 150px;">
									<img src="https://static.waimai.baidu.com/static/waimai/images/noresult_ca75540.png"  style="display:block;margin:auto;">
								</div>
								
							</div>
							<div class="row">
								<div class="col-md-6 col-md-offset-3" style="font-size: 20px;">
									<span>暂无订单，</span>
									<font style="color: red" >
										<a href="${APP_PATH}/userpage/main.jsp">马上来一份</a>
									</font>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
							<table class="table table-striped table-hover success  table-bordered " id="order_table">
								<c:forEach items="${pageInfo.list}" var="order">
											<tr class="hover-style1 order_bar" style="background:  #ffcccc">
												<td colspan="5">
													订单编号:${order.oid}
													成交时间：<fmt:formatDate  pattern="yyyy-MM-dd  HH:mm:ss" value="${order.createtime}"/>　
													金额：<font color="red"><b>${order.totals}</b></font>
													&nbsp;&nbsp;&nbsp;
													<c:choose>
														<c:when test="${order.paystate eq -1 }">
															<a href="#">订单超时</a>
														</c:when>
														<c:when test="${order.paystate eq 0 }">
															<a href="${APP_PATH}/findOrdersByOid?oid=${order.oid}">去付款</a>
														</c:when>
														<c:when test="${order.paystate eq 1 }">
															<a href="#">等待发货</a>
														</c:when>
														<c:when test="${order.paystate eq 2 }">
															<a href="${APP_PATH}/confirmRec?oid=${order.oid}">确认收货</a>
														</c:when>
														<c:when test="${order.paystate eq 3 }">交易成功</c:when>
													</c:choose>
												
												</td>
											</tr>
											<c:forEach items="${order.orderItemList}" var="orderItem">
												<tr class="hover-style1" >
													<th class="images">
														<img alt="图片"  title="图片" src="${orderItem.menu.image}"/>
													</th>
													<th class="name" >${orderItem.menu.mname}</th>
													<th class="price">单价:${orderItem.menu.price}</th>
													<th class="count">数量:${orderItem.count}</th>
													<th class="subtotal">小计:${orderItem.subtotal}</th>
													
												</tr>
											
											</c:forEach>								
								</c:forEach>
						</table>
								
					
						<div class="pagination">
							<div class="mod-page">
								<a href="javascript:void(0);" data-page="0" class="mod-page-item mod-page-item-active">1</a>
								<a href="javascript:void(0);" data-page="1" class="mod-page-item ">2</a>
								<a href="javascript:void(0);" data-page="2" class="mod-page-item ">3</a>
								<a href="javascript:void(0);"  class="mod-page-item mod-page-item-next">&nbsp;</a>
							</div>
						</div>
					
					</c:otherwise>
			
			</c:choose>
				
				</section>

				<div class="clearfix" style="_height: 0px; _overflow: hidden;"></div>
			</div>
			
			
			
		</div>

		<!-- ***************************************************************** -->
	</div>
	<script type="text/javascript">
		$(function(){
			//获得域总的数据
			
		});
	
	</script>
	
</body>
</html>