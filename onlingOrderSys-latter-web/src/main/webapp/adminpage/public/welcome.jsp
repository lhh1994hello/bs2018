<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="menuCssJs.jsp"%>
<!-- <link href="http://www.17sucai.com/static/css/demo.css" rel="stylesheet" media="all" />
<script type="text/javascript" src="http://www.17sucai.com/static/js/jquery.min.js"></script>
<script type="text/javascript" src="http://www.17sucai.com/static/js/jquery.qrcode.min.js"></script> -->
<title>系统首页</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<table class="layui-table" id="user_info_table">
					<colgroup>
						<col width="150">
						<col width="200">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th colspan="2">会员信息</th>
							<!-- <th>加入时间</th> -->
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>会员总数</td>
							<td id="member_total_num">108</td>
						</tr>
						<tr>
							<td>今日注册</td>
							<td id="todayRegistNum">18</td>
						</tr>
					</tbody>
				</table>

			</div>
			<div class="col-md-5">
				<table class="layui-table">
					<colgroup>
						<col width="150">
						<col width="200">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th colspan="2">订单信息</th>
 						</tr>
					</thead>
					<tbody>
						<tr>
							<th>订单总量</th>
							<th id="total_order_num"></th>
 						</tr>
						<tr>
							<td>今日订单</td>
							<td id="today_order_num">108</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-5">
				<table class="layui-table">
					<colgroup>
						<col width="150">
						<col width="200">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th colspan="2">菜单信息</th>
 						</tr>
					</thead>
					<tbody>
						<tr>
							<th>销售总量</th>
							<th id="total_menu_salary_num">0</th>
 						</tr>
						<tr>
							<td>今日销量</td>
							<td id="today_menu_salary_num">0</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-5">
			
				<table class="layui-table">
					<colgroup>
						<col width="150">
						<col width="200">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th colspan="2">销售信息</th>
 						</tr>
					</thead>
					<tbody>
						<tr>
							<th>总的收入</th>
							<th id="total_salary">0</th>
 						</tr>
						<tr>
							<td>今日收入</td>
							<td id="today_salary">0</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

	</div>



	<script type="text/javascript">
		$(function() {
			//会员
			getUserNum();
			getTodayRegistNum();
			//订单
			getOrderNum();
			getTodayOrderNum();
			//菜品
			getTotalMenuSalaryNum();
			 getTodayMenuNum();
			 
			 //销售信息
			 getTodaySalary();
			 getTotalSalary();
			 
			 function getTotalSalary(){
					$.ajax({
						url : "${APP_PATH}/getTotalSalary",
						type : "POST",
						success : function(result) {
							var code = result.code;
							if (code == "100") {
								var msg = result.extend.totalSalary;
								//alert(msg); msg
								//msg.toFixed(2);
								//alert(msg.toFixed(2));
								 msg=msg.toFixed(2);
	 							$("#total_salary").text("").append("￥"+msg);
							}
						}
					});
				}
			 //今日销售额
			 function getTodaySalary(){
					$.ajax({
						url : "${APP_PATH}/getTodaySalary",
						type : "POST",
						success : function(result) {
							var code = result.code;
							if (code == "100") {
								var msg = result.extend.todaySalay;
								//alert(msg);
	 							$("#today_salary").text("").append("￥"+msg);
							}
						}
					});
				}
			//获得今日菜单卖出去的数量
			function getTodayMenuNum(){
				$.ajax({
					url : "${APP_PATH}/getTodayMenuSalaryNum",
					type : "POST",
					success : function(result) {
						var code = result.code;
						if (code == "100") {
							var msg = result.extend.todayMenuNum;
 							$("#today_menu_salary_num").text("").append(msg);
						}
					}
				});
			}
			//获得总的卖出去的数量
			function getTotalMenuSalaryNum(){
				$.ajax({
					url : "${APP_PATH}/getTotalMenuSalaryNum",
					type : "POST",
					success : function(result) {
						var code = result.code;
						if (code == "100") {
							var msg = result.extend.totalSalaryNum;
							$("#total_menu_salary_num").text("").append(msg);
						}
					}
				});
			}
			
				//获得今日订单数量
				function getTodayOrderNum(){
					$.ajax({
						url : "${APP_PATH}/getTodayOrderNum",
						type : "POST",
						success : function(result) {
							var code = result.code;
							if (code == "100") {
								var msg = result.extend.todayOrderNum;
								$("#today_order_num").text("").append(msg);
							}
						}
					});
				}
			//订单统计
			function getOrderNum(){
				$.ajax({
					url : "${APP_PATH}/geOrderNum",
					type : "POST",
					success : function(result) {
						var code = result.code;
						if (code == "100") {
							var msg = result.extend.totalNum;
							$("#total_order_num").text("").append(msg);
							;
						}
					}
				});
			}
			//会员统计，
			function getUserNum() {
				$.ajax({
					url : "${APP_PATH}/getUserNum",
					type : "POST",
					success : function(result) {
						var code = result.code;
						if (code == "100") {
							var msg = result.extend.totalNum;
							$("#member_total_num").text("").append(msg);
							;
						}
					}
				});
			}
			//获得今日注册人数
			function getTodayRegistNum() {
				$.ajax({
					url : "${APP_PATH}/getTodayRegistNum",
					type : "POST",
					success : function(result) {
						var code = result.code;
						if (code == "100") {
							var msg = result.extend.todayRegistNum;
							$("#todayRegistNum").text("").append(msg);
							;
						}
					}
				});
			}

		});
	</script>
</body>
</html>