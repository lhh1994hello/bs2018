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
img {
	/* 228,140 */
	height: 90px;
	width: 150px;
}

.images {
	height: 100px;
	width: 170px;
}

.subtotal, .price, .count, .name {
	text-align: center;
}

.order_bar {
	text-align: left;
	font-size: 15px;
}
</style>
<title>我的订单2</title>
</head>
<body>
	<div class="row" id="head_row">
		<%@ include file="../public/baiduwaimaihead.jsp"%>
	</div>
	<div class="container-fluid">
		<!--**********************************************************************  -->
		<div id="content" class="clearfix" style="min-height: 52px;">
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
							data-node="summary-anchor">全部订单(20)</a> <span>|</span> <a
							class="ft-blk ft-medium" href="javascript:void(0);"
							data-type="uncommented" data-node="summary-anchor">待评价(0)</a>
					</div>
				</div>
				<div>
					<a class="cms-charlink" data-node="summary-txtLinkExpand"
						href="javascript:void(0);"></a>
				</div>
				<div class="order-cards" data-node="order-cards">
					<div class="order-card order-process">
						<div class="order-content">
							<div class="order-dishes">
								<table>
									<thead>
										<tr>
											<th colspan="3"><a href="/waimai/shop/1730716448"
												class="shop-name">麦兜猪蹄饭（财大店）</a>
												<p class="pag">
													<span class="ico sphone"></span>商家电话：13585652251
												</p>
												<p class="pag">
													<span class="ico kphone"></span>客服电话：10105777
												</p></th>
										</tr>
									</thead>
									<tbody>
										<tr data-node="dishes">
											<td data-node="dish" data-origin="奥良鸡腿饭">奥良鸡腿饭</td>
											<td>6</td>
											<td class="text-right">￥168</td>
										</tr>
										<tr data-node="dishes">
											<td data-node="dish" data-origin="朱家角红烧扎肉">朱家角红烧扎肉</td>
											<td>4</td>
											<td class="text-right">￥24</td>
										</tr>
										<tr data-node="dishes">
											<td data-node="dish" data-origin="猪蹄牛肉饼双拼">猪蹄牛肉饼双拼</td>
											<td>2</td>
											<td class="text-right">￥60</td>
										</tr>
										<tr data-node="dishes">
											<td data-node="dish" data-origin="超值份去骨蹄膀饭">超值份去骨蹄膀饭</td>
											<td>1</td>
											<td class="text-right">￥30</td>
										</tr>
										<!-- <tr>
											<td>餐盒费</td>
											<td></td>
											<td class="text-right">￥13</td>
										</tr>
										<tr>
											<td>配送费</td>
											<td></td>
											<td class="text-right">￥4</td>
										</tr> -->
									</tbody>
								</table>
								<div class="order-price">
									总价：<span class="ft-red">￥299</span>
								</div>
								<div class="order-delivery">
									<div class="tp">
										<span>本单由 由百度快送提供 配送并提供售后服务</span>
									</div>
									<div class="receive-info">
										<span>送餐地址：新梅淞南苑 28弄901</span> <span>联系人：李红辉女士</span> <span>电话：158*****284</span>
										<span>送达时间：2018/04/15 立即配送</span> <span>备注信息：请提供餐具,辣一点,米饭多点,米饭多点,没零钱</span>
									</div>
								</div>
							</div>
							<div class="order-info" data-node="order-info">
								<div class="delivery-info">
									<div class="delivery-snippet ">
										<div class="snippet-header nick-selected">
											<div class="round"></div>
											<div class="line-through "></div>
										</div>
										<div class="snippet-body ">
											<div class="status-msg">订单提交成功</div>
											<div class="prompt">订单号：15237852039777</div>
											<div class="time">17:40</div>
										</div>
									</div>
									<div class="delivery-snippet ">
										<div class="snippet-header nick-selected">
											<div class="round"></div>
											<div class="line-through "></div>
										</div>
										<div class="snippet-body ">
											<div class="status-msg">待支付</div>
											<div class="prompt">请在提交订单后15分钟内完成支付</div>
											<div class="time">17:40</div>
										</div>
									</div>
									<div class="delivery-snippet ">
										<div class="snippet-header nick-selected">
											<div class="round"></div>
										</div>
										<div class="snippet-body ">
											<div class="status-msg">订单已取消</div>
											<div class="prompt">您的订单已成功取消</div>
											<div class="time">17:43</div>
										</div>
									</div>
									<div class="order-operator" data-node="order-operator">
										<div class="operator-btns">
											<a class="see-others" href="/">去别家看看</a>
										</div>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>
					</div>
					<!-- ********************************************************************************** -->
					<div class="order-card order-process">
						<div class="order-content">
							<div class="order-dishes">
								<table>
									<thead>
										<tr>
											<th colspan="3"><a href="/waimai/shop/2099282343"
												class="shop-name">上海麦当劳淞南上坤红街餐厅</a>
												<p class="pag">
													<span class="ico sphone"></span>商家电话：400-051-7117
												</p>
												<p class="pag">
													<span class="ico kphone"></span>客服电话：10105777
												</p></th>
										</tr>
									</thead>
									<tbody>
										<tr data-node="dishes">
											<td data-node="dish" data-origin="麦乐鸡5块中薯套餐">麦乐鸡5块中薯套餐</td>
											<td>4</td>
											<td class="text-right">￥104</td>
										</tr>
										
									</tbody>
								</table>
								<div class="order-price">
									总价：<span class="ft-red">￥113</span>
								</div>
								<div class="order-delivery">
									
									<div class="receive-info">
										<span>送餐地址：新梅淞南苑 28弄901</span> <span>联系人：李红辉女士</span> <span>电话：158*****284</span>
										<span>备注信息：请提供餐具</span>
									</div>
								</div>
							</div>
							<div class="order-info" data-node="order-info">
								<div class="pay-outTime"></div>
								<div class="delivery-info">
									<div class="delivery-snippet ">
										<div class="snippet-header nick-selected">
											<div class="round"></div>
											<div class="line-through "></div>
										</div>
										<div class="snippet-body ">
											<div class="status-msg">订单提交成功</div>
											<div class="prompt">订单号：15237108660390</div>
											<div class="time">21:01</div>
										</div>
									</div>
									<div class="delivery-snippet ">
										<div class="snippet-header nick-selected">
											<div class="round"></div>
											<div class="line-through "></div>
										</div>
										<div class="snippet-body ">
											<div class="status-msg">待支付</div>
											<div class="prompt">请在提交订单后15分钟内完成支付</div>
											<div class="time">21:01</div>
										</div>
									</div>
									<div class="delivery-snippet ">
										<div class="snippet-header nick-selected">
											<div class="round"></div>
										</div>
										<div class="snippet-body ">
											<div class="status-msg">订单已取消</div>
											<div class="prompt">取消原因：您未在15min内完成支付</div>
											<div class="time">21:16</div>
										</div>
									</div>
									<div class="order-operator" data-node="order-operator">
										<div class="operator-btns">
											<a class="see-others" href="/">去别家看看</a>
										</div>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>
					</div>


					<!-- ********************************************************************** -->

				</div>
				<div class="pagination">
					<div class="mod-page">
						<a href="javascript:void(0);" data-page="0"
							class="mod-page-item mod-page-item-active">1</a><a
							href="javascript:void(0);" data-page="1" class="mod-page-item ">2</a><a
							href="javascript:void(0);" data-page="2" class="mod-page-item ">3</a><a
							href="javascript:void(0);" data-page="3" class="mod-page-item ">4</a><a
							href="javascript:void(0);" data-page="+"
							class="mod-page-item mod-page-item-next">&nbsp;</a>
					</div>
				</div>
				<div class="callCenter" data-node="callCenter"></div>
				</section>

			</div>



			<!-- ***************************************************************** -->
		</div>
</body>
</html>