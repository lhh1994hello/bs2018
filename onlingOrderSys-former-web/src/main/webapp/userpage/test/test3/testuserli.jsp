<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<li id="usernameInfo" class="uname mn-lk-w">
	<a id="username" class="mn-lk" href="/waimai/trade/orderlist">你好，雨墨青澜</a>
 	<div id="popUserInfoId" class="mn-tip" style="visibility: hidden;">
			<div class="top-arrow"></div>
			<ul class="mn">
				<li>
					<a class="my-info" href="/waimai?qt=orderlist&amp;type=wait">
	 					<span class="icon order-icon"></span>
						我的订单
					</a>
				</li>
				<li>
					<a class="my-info" href="/waimai?qt=addressmanage&amp;type=select">
					<span class="icon address-icon"></span>
						送餐地址
					</a>
				</li>
				<li>
					<a class="my-info" href="/waimai?qt=myfavorite">
					<span class="icon favorite-icon"></span>
						收藏夹
					</a>
				</li>
				 
				<li><a class="my-info" href="/trade/refundlist"><span
						class="icon refund-icon"></span>我的退款</a></li>
				<li><a id="logout" class="logout" href="javascript:void(0)"><span
						class="icon account-icon"></span>退出</a></li>
			</ul>
		</div>
		
		</li>
</body>
</html>