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
<title>确认订单</title>
<style type="text/css">
#commit_cart {
	margin-left: 180px;
}
#orderSubmit{
	display: block;
	height:40px;
}
#addr_title{
	height: 33px;
	
}
#userPhone{
	width:145px;
	height:30px;
	float:right;
	margin-right: 0px;
	margin-top:-4px;
	/* border: 2px solid red; */
}
#userAddress{
	width:145px;
	height:30px;
	float:right;
	margin-top:-22px;
	/* border: 2px solid red; */
	
}
</style>

</head>
<body>
	<div class="row" id="head_row">
		<%@ include file="../public/baiduwaimaihead.jsp"%>
		<%-- <%@ include file="../public/baiduwaimaiClassfy.jsp"%> --%>
	</div>
	<div class="container-fluid">
		<section id="commit_cart" class="cart-section fl">
		<div class="cart" data-node="cart">
			<div class="title">
				<div
					onclick="javascript:window.location='${APP_PATH}/userpage/main.jsp';">
					<i></i> <span>返回购物车修改</span>
				</div>
			</div>
			<div class="cart-panel">
				<table>
					<thead class="cart-head">
						<tr>
							<td class="item-name">菜品</td>
							<td class="item-price">单价</td>
							<td class="item-count">份数</td>
							<td class="item-price-all">金额</td>
							<td class="item-takeplace"></td>
						</tr>
					</thead>
					<tbody class="item-list">
						<!-- <tr class="item " data-stockid="" id="cartItem_2207324475">
							<td class="item-name">星厨优惠单人餐</td>
							<td class="item-price">¥59.50</td>
							<td class="item-count"><input type="hidden"
								value="2207324475"><span class="item-count">2</span></td>
							<td class="item-price-all">¥119.00</td>
							<td class="item-takeplace"></td>
						</tr> -->
						
						<c:forEach items="${cart.cartItems}" var="cartItem">
							<tr class="item" >
								<td class="item-name">${cartItem.menu.mname}</td>
								<td class="item-price">¥${cartItem.menu.price}</td>
								<td class="item-count">
									<input type="hidden" value="2207324475"> 
									<span class="item-count">${cartItem.count}</span>
								</td>
								<td class="item-price-all">¥${cartItem.subtotal}</td>
								<td class="item-takeplace"></td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
				<!-- 这是那个二维码 -->
				<!-- <div class="order-tip">
					<div class="order-tip-image"></div>
				</div> -->
				<div class="bottom-div">
					<div class="warning-tips">
						<a class="delivery-tip" href="${APP_PATH}/userpage/main.jsp">
							客官再来点？</a>
					</div>
					<div class="order-msg">
						总价：<span class="order-total">¥<span id="total_money">${cart.total}</span></span>
						<p data-node="discountMsg" style="display: none;"></p>
					</div>

				</div>
			</div>

		</div>
		</section>
		<!-- 右边内容*********************************************************** -->
		<section class="delivery fl" id="delivery"> 
		<input type="hidden" value="0" data-node="left-check-count-down"> 
		<input type="hidden" value="" data-node="left-check-vercode">
			
		<ul class="delivery-ul">
			<li class="addr-list-li">
				<div data-node="loading" style="text-align: center; height: 90px; padding: 70px 0px; display: none;">
					<img src="https://stc0.waimai.baidu.com/static/waimai/images/loading_50c5e3e.gif">
				</div>
				<div class="list-title" data-node="listTitle" >
					<span>收货人信息：</span> <!-- <span class="add-new" data-node="addNew">新增送餐地址</span> -->
				</div>
				<ul class="curAddrPanel" data-node="addrPanel" style="height: auto;">
					<li class="addr-item select" data-id="197941174">
						<div class="addr-title" id="addr_title" >
							<%-- <span class="name" >${session_user.uLoginid}</span> <span class="sex">先生</span> --%>
							<label>下单人:
								<input type="text" name="purchaser"  value="${session_user.uNickname}" id="purchaser" class="layui-input"  style="width: 145px;height:31px;margin-left:63px;margin-top:-34px;"/>
							</label>
								
							<!-- <div class="addr-action">
								<a class="addr-edit">编辑</a> 
								<a class="addr-remove">删除</a>
							</div> -->
						</div>
						<div class="addr-con"  id="address_id">
							<p class="phone">
								<!-- 手机号:<input type="text" name="userPhone"/><hr/> -->
								<label style="">手机号:</label>
								<input type="text" name="title" value="${sessionScope.session_user.uPhone}"  class="layui-input" id="userPhone" />
							</p>
							<p class="addr-desc"><!-- 新梅淞南苑 28弄901 uAddress -->
								<label style="margin-top: 0px">地&nbsp;&nbsp;&nbsp;址:</label>
								<input type="text" name="title"  value="${sessionScope.session_user.uAddress}"  class="layui-input" id="userAddress" />
							</p>
						</div> <span class="select-ico"></span>
					</li>
					<h3><font style="color:red;font-size: 20px;" id="error_info"></font></h3>
				</ul>
				
			</li>
					<!-- <li class="payMethod" data-node="payMethod"><label>支付方式：</label>
						<div class="payMethod-body">
							<div class="payList-online clearfix">
								<label>在线支付</label>
								<table class="pay-list">
									<tbody>
										<tr data-value="10" class="pay-box useLeft " data-node="useLeft">
											<td><span class="checkbox "></span></td>
											<td class="text">
												<span class="pay-name">账户余额（可用余额<b>￥</b>
													<span data-node="need-left-pay-amount">0</span>）
												</span> <span class="pay-desc"><span
														class="need-other-pay-amount hide">还需在线支付<b>￥575.1</b></span></span>
											</td>
										</tr>
										<tr data-value="1" class="pay-box select" data-node="payBox">
											<td class="radio-con">
												<div class="s-radio">
													<i></i>
												</div>
											</td>
											<td class="text">
												<span class="pay-name">
													<i class="pay-icon"></i>百度钱包
												</span> 
												<span class="pay-desc">推荐百度钱包用户使用</span>
											</td>
										</tr>
										
									</tbody>
								</table>
							</div>
							<div class="payMethodCover hide" data-node="payMethodCover"></div>
						</div>
					</li>
			<li> -->
			
			
			</li>
			<li>
				<div class="delivery-lable">
					<span class="lable">备注信息：</span>
				</div>
				<div class="delivery-input">
					<input class="input mark" maxlength="200" name="mark" id="mark" data-node="markInput" >
					<textarea data-node="markInput_list" style="display: none"  ></textarea>                   
				</div>
			</li>
			<li>
				
				<div class="delivery-input  delivery-btn"
					style="display: block;">
					<span id="orderSubmit"><h2>确认下单</h2></span> 
					<a id="continue-to-book" data-node="continueToBook" data-href="https://waimai/shop/1512533374" style="display: none;">继续点餐</a>
				</div>
			</li>
		</ul>
		<p id="commit_warning" class="commit-warning hide"
			style="display: none;">(提示：您需要先保存送餐地址，再提交订单)</p>
		</section>
		<!--  ****************************************************************-->
	</div>
	<script type="text/javascript">
			$(function(){
				//确认下单按钮
				$("#orderSubmit").click(function(){
					/* alert("点击确认下单了"); */
					//window.location.href="${APP_PATH}/userpage/main.jsp";
					//这里判断手机号码和地址是否填写
					var Phone_flag=getPhone();
					if(Phone_flag==false){
						return false;
					}
				 	var address_flag=getAddress();
					if(address_flag==false){
						return false;
					}
					 var purchaser_flag=getPurchaser();
					if(purchaser_flag==false){
						return false;
					} 
					var userphone=$("#userPhone").val();
					var address=$("#userAddress").val();
					var notes=$("#mark").val();
					var purchaser=$("#purchaser").val();
					
					console.log(userphone);
					console.log(address);
					console.log(notes);
					
					//window.location.href="${APP_PATH}/userpage/public/msg.jsp";
					//window.location.href="${APP_PATH}/confirmOrder?userphone="+userphone+"&address="+address+"&notes="+notes;
					window.location.href="${APP_PATH}/confirmOrder?userphone="+userphone+"&address="+address+"&notes="+notes+"&purchaser="+purchaser;
				});
				//校验下单人姓名
				function getPurchaser(){
					var purchaser=$("#purchaser").val();
					var purchaser_length=purchaser.length;
					if(purchaser_length==0){
						$("#error_info").text("").append("请填写下单人名称！");
						return false;
					}
					if(purchaser_length<2){
						$("#error_info").text("").append("名称太短！");
						return false;
					}
					if(purchaser_length>8){
						$("#error_info").text("").append("名称太长了!");
						return false;
					}
					$("#error_info").text("");
					return true;
					
				}
				
				function getPhone(){
					//获得手机号
					var userPhone=$("#userPhone").val();
					//手机号校验
					if(userPhone==""){
						$("#error_info").text("").append("请输入手机号");
						return false;
					}
					if(isNaN(userPhone)){
						$("#error_info").text("").append("手机号只能是数字");
						return false;
					}
					var regName=/(^[0-9]{6,16}$)/;
					if(!regName.test(userPhone)){
						
						$("#error_info").text("").append("不符合校验规则");
						 return false;
					}
					$("#error_info").text("");
				/* 	$("#mark").val("AAAAAAAAAAA"); */
					return true;
				}
				
				function getAddress(){
					var userAddress=$("#userAddress").val();
					
					var userAddress_length= userAddress.length;
					if(userAddress_length==0){
						$("#error_info").text("").append("送餐地址不能为空");
						return false;
					}
					if(userAddress_length<3){
						$("#error_info").text("").append("送餐地址不详细");
						return false;

					}
					//alert(userAddress_length);
					//console.log(userAddress_length);
					$("#error_info").text("");
					return true;
				}
				
			});
		
	</script>
	
	
</body>
</html>