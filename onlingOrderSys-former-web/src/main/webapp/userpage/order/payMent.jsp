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
<title>进行付款</title>
<style type="text/css">
/* #container_id {
	background: pink;
} */
#show_info {
	background: #cc9900;
	font-size: 20px;
}

#show_bar {
	font-size: 20px;
}

#header_row {
	margin-top: 30px;
}

#thead_orderShow {
	font-size: 18px;
}

.hover-style1 th {
	text-align: center;
	vertical-align: middle;
} 

#pay img {
	width: 150px;
	height: 37px;
}

#pay {
	font-size: 18px;
}
/* #oncePayMent{
	background: #ff3e6f;
	font-size: 30px;
	color: white;
} */
#span_pay{
	font-size: 30px;
	color: white;
	background: #ff3e6f;
	display:block;
	text-align: center;
}
</style>
</head>
<body>
	<div class="row" id="head_row">
		<%@ include file="../public/baiduwaimaihead.jsp"%>
	</div>
	<div class="container" id="container_id">
		<div class="row" id="header_row">
			<div class="col-md-10 col-md-offset-1">
				<div class="col-md-2" id="show_info">进行付款</div>
				<div class="col-md-10" id="show_bar">
					<div class="col-md-3" style="background: #cacaca;">1.提交订单</div>
					<div class="col-md-3" style="background: orange;">2.选择支付方式</div>
					<div class="col-md-3" style="background: #cacaca;">3.购买成功</div>
					<div class="col-md-3" style="background: #ffff99;font-size:15px;height: 29px;padding-top: 4px;padding-right: 0px;" id="showtime_div">
						<span class="glyphicon glyphicon-time" style="color: blue"></span>
						<font id="clock" style="font-size:15px;color: red"></font>
						<span>后订单关闭</span>
					</div>
				</div>
			</div>
		</div>
		<!-- 显示订单的区域 -->
		<div class="row" id="order_area">
			<div class="col-md-10 col-md-offset-1">
				<table
					class="table table-striped table-hover success  table-bordered"
					id="cart_table">
					<thead>
						<tr class="hover-style1" id="thead_orderShow">
							<th colspan="3">
								<div class="row">
									<div class="col-md-4" style="text-align: left;">订单编号:<span id="getoid">${order.oid}</span></div>
									<div class="col-md-4" style="text-align: left;">
										创建时间:
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
											value="${order.createtime}" />
									</div>
									<div class="col-md-3 col-md-offset-1" style="text-align: left;">
										总金额:<font color="red"><b id="gettotals">${order.totals}</b><b>元</b></font>
									</div>

								</div>
							</th>
						</tr>
						<tr class="hover-style1">
							<th class="menu_name">菜品</th>
							<th class="menu_count">份数</th>
							<th class="menu_price">单价</th>
						</tr>
					</thead>
					<tbody id="order_tbody">
						<c:forEach items="${order.orderItemList}" var="orderItem">
							<tr class="hover-style1">
								<th class="menu_name">${orderItem.menu.mname}</th>
								<th class="menu_count">${orderItem.count}</th>
								<th class="menu_price">￥${orderItem.subtotal}</th>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
		<!-- 选择银行 -->
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<font style="font-size: 20px;">选择支付方式</font>
				<hr
					style="height: 2px; border: none; border-top: 2px dotted #185598;" />
			</div>

			<div class="col-md-12 " style="margin-left: 100px;" id="pay">
				<div class="row">
				   <div class="col-md-3">
						<input type="radio" name="pd_FrpId" value="CCB-NET-B2C"  checked="checked"/>建设银行
						<img alt="建设银行" src="${APP_PATH}/images/bank/ccb.bmp">
					</div>
					<div class="col-md-3">
						<input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" />工商银行
						<img alt="工商银行" src="${APP_PATH}/images/bank/icbc.bmp">
					</div>
					
					<div class="col-md-3">
						<input type="radio" name="pd_FrpId" value="ABC-NET-B2C" />农业银行
						<img alt="农业银行" src="${APP_PATH}/images/bank/abc.bmp">
					</div>
				</div>
				<!--  -->
				<div class="row"  style="margin-top: 20px;">
					<div class="col-md-3">
						<input type="radio" name="pd_FrpId" value="BOC-NET-B2C" />中国银行
						<img alt="工商银行" src="${APP_PATH}/images/bank/bc.bmp">
					</div>
					<div class="col-md-3">
						<input type="radio" name="pd_FrpId" value="BOCO-NET-B2C" />交通银行
						<img alt="建设银行" src="${APP_PATH}/images/bank/bcc.bmp">
					</div>
					<div class="col-md-3">
						<input type="radio" name="pd_FrpId" value="POST-NET-B2C" />中国邮政
						<img alt="农业银行" src="${APP_PATH}/images/bank/post.bmp">
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<hr style="height: 2px; border: none; border-top: 2px dotted #185598;" />
			</div>
			<div class="col-md-2 col-md-offset-9" id="oncePayMent">
				<span  id="span_pay">
					<a href="#" style="color: white;text-decoration:none;"  >立即付款</a>
				</span>
 			</div>
		</div>
		<%-- <h3>
			<a href="${APP_PATH}/payMoney">立即支付</a>
		</h3> --%>

	</div>
		<script type="text/javascript">
			
			$(function(){
				//获得剩余时间
				var totalTime=getTotalTime();
				//alert(totalTime);
				//countDown();
				//var timer = setInterval('countDown()',1000); /* 循环执行这个方法 */
				if(totalTime>=0){
					countDown2();
					var timer = setInterval(countDown2,1000);
				}else{
 					$("#showtime_div").html("订单超时了!");
 					updateSpan();
					//把按钮设置
					//$("#span_pay").children("a").text("").append("订单超时");
					//$("#span_pay").css("background","#b1b1b1");//background: #ff3e6f;	
				}
				
				//立即付款
				$("#span_pay").click(function(){
					if(totalTime<=0){
						//alert("超时，不能付款了");
						return false;
					}
					var pd_FrpId=$("#pay input[name='pd_FrpId']:checked").val();
					var oid=$("#getoid").text();
					var totals=$("#gettotals").text();
					window.location.href="${APP_PATH}/payMoney?pd_FrpId="+pd_FrpId+"&oid="+oid+"&totals="+totals;
				});	
				
				function countDown2(){
					//alert("AAA");
					console.log(totalTime);
					if(totalTime<=0){
						//alert("sfsdf");
						updateSpan();
						
 						clearInterval(timer);
						$("#showtime_div").html("订单超时了!");
						
						
					}
					var leftMinutes = parseInt(totalTime / 60);
					var leftSeconds = parseInt(totalTime % 60); 
					var date1=new Date(totalTime*1000);
					var minu=date1.getMinutes();
					var sec=date1.getSeconds();
					$("#clock").text("");
					$("#clock").text(minu+"分"+sec+"秒");
					totalTime--;
					
				}
				//替换按钮
				function updateSpan(){
					$("#oncePayMent").html("");
					var span_ele=$("<span></span>").css("font-size","30px;").css("color","white").css("background","#b1b1b1").css("display","block")
						.css("text-align","center").css("height","42px").css("width","165px").css("font-size","25px").css("padding","3px");
						var a_ele=$("<a></a>").attr("href","javascript:return false;").css("color","white").css("text-decoration","none").append("订单超时");
					span_ele.append(a_ele);
					$("#oncePayMent").append(span_ele);
				}
				//获得剩余时间
				function getTotalTime(){
					var totalTime;
					$.ajax({
						url : "${APP_PATH}/countDown?time="+new Date().getTime(),
						type : "POST",
						async: false,
						success:function(result){
							 totalTime=parseInt(result);
						}
					});
					return totalTime;
				}
				
				$(document).on('mouseenter', '#usernameInfo', function() {
					$("#popUserInfoId").css("visibility", "visible");
				});
				$(document).on('mouseleave', '#usernameInfo', function() {
					$("#popUserInfoId").css("visibility", "hidden");
				});
				//倒计时
				function countDown(){
					$.ajax({
						url : "${APP_PATH}/countDown",
						type : "POST",
						success:function(result){
							var leftTime=result;
							leftTime=parseInt(leftTime);
							if(leftTime<=0){
								alert("倒计时结束");
								clearInterval(timer);
								$("#showtime_div").html("").append("订单超时了");
								return false;
							} 
							var leftMinutes = parseInt(leftTime / 60);
							var leftSeconds = parseInt(leftTime % 60); 
							var date1=new Date(result*1000);
							var minu=date1.getMinutes();
							var sec=date1.getSeconds();
							$("#clock").text("");
							$("#clock").text(minu+"分"+sec+"秒");
							console.log(result);
						}
					});
				}
				
			});
		
			
			
			
			
		</script>
</body>
</html>