<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<style>
/* header {
	border: 2px solid blue;
} */
#nav_bar_info li {
	/* background:blue; */
	line-height: 30px;
}

#user_info {
	margin-top: -10px;
	/* background-color: blue; */
}
/* #nav_bar_info li{
	background: #dadada;
}  */

/* #nav_bar_info a:link {
	color: yellow;
}

#nav_bar_info a:visited {
	color: yellow;
}

#nav_bar_info a:hover {
	color: yellow;
}

#nav_bar_info a:active {
	color: yellow;
} */
#nav_bar_info li:hover {
	background: yellow;
}
#logout_user_info{
	margin-top: 10px;
	
}

</style>
<script>
<%-- <%@ include file="confirmshow.jsp" %> --%>
	$(function(){
		$("#myCountSet").click(function(){
			window.location.href = "${APP_PATH}/userpage/user/homepage.jsp";
		});
		$("#order").click(function(){
			$.ajax({
				url:"${APP_PATH}/userIsLogin",
				type:"POST",
				success:function(result){
					var code=result.code;
 					if(code=="200"){
  						//window.location.href = "${APP_PATH}/userpage/user/login2.jsp";
						window.location.href = "${APP_PATH}/toLoginPage";
 						
					}
				}
			});
		});
		
	});

</script>


<header class="header">
	<div class="ui-width header-wrap">
		<figure>
			<!-- 百度外卖的logo -->
			<!-- <a href="/waimai" class="wm-logo">百度外卖AAA</a> -->
			<!-- <span style="display:in-line; margin-left: -200px;">2018年05月22日，星期二 11:01:08</span> -->
			<font style="font-size: 20px;color: white">订 餐 系 统</font>
		</figure>
		<!-- <div id="nav-search-section" class="nav-search-section">
			<div class="s-first">
				<i class="addr-icon"></i> 
				<input type="text" placeholder="请输入送餐地址" class="s-con" />
 			</div>
			<div class="s-second s-shoplist">
				<div class="s-citybar"></div>
				<div class="s-input">
					<input type="text" placeholder="请输入送餐地址" id="s-con" class="s-con" />
					<img src="https://stc0.waimai.baidu.com/static/waimai/images/loading_min_b0eaadb.gif" class="s-loading mod-search-hide" />
 				</div>
				<div class="s-search-container1"></div>
			</div>
			<div id="muti-aois"></div>
		</div> -->
		<div class="filter-search" style="width: 400px;margin-left: -150px;">
			<input type="text" id="f-input" class="f-input placeholder-con" placeholder="搜索商品" value="" style="width: 250px;"> 
			
 			<a href="/waimai/shoplist/3805b06ad14420e4" id="f-close-btn" title="重新搜索" class="f-close-btn hide">×</a>
  			<button id="f-search" class="f-search"></button>
			<div class="f-search-list" style="display: none;">
				<!-- 这里的数据是动态插入的 -->
					<h5>商户</h5>
					<ul class="nav-sug-list nav-sug-shop-list">
						<li>
							<a href="/waimai/shop/1434567453" title="肯德基宅急送（淞南），本月销售29份" data-type="nav-sug-shop">
							 	<span class="n-s-left">
									<img src="http://img.waimai.baidu.com/pb/a1636f792ede000c8d186079cd35fb7586"  onerror="util.errorImg(this);">
	 								 肯德基宅急送（淞南）
 								</span> 
 								<span class="n-s-right ">29份</span>
 							</a>
						</li>
 					</ul>
					
			</div>
		</div>
		<nav>
			<ul class="nav" id="nav_bar_info">

				<li class="nav-item nav-item-active" id="find">
					<a href="${APP_PATH}/userpage/main.jsp" class="nav-item-link">外卖</a>
				</li>
				<li class="nav-item " id="order">
					<%-- <a href="${APP_PATH}/getMyOrders" class="nav-item-link">我的订单</a> --%>
					<a href="${APP_PATH}/userpage/order/myOrderList3.jsp" class="nav-item-link">我的订单</a>
				</li>
				<li class="nav-item " id="contact">
					<a href="javascript:void(0);" class="nav-item-link">联系我们</a>
				</li>
				<li style="display: none;" class="nav-item " id="medicine">
					<a href="/waimai?qt=medicine" class="nav-item-link">药品信息</a>
				</li>
			</ul>

		</nav>
		<div id="user_info" class="user-info-widget" style="">
			<div id="login_user_info" style="display: none;"></div>
			<div id="logout_user_info">
				<c:choose>
					<c:when test="${empty sessionScope.session_user }">
						<ul class="logout_info">
							<%-- <li id="login_id1"><a id="login" href="${APP_PATH}/userpage/user/login.jsp">&nbsp;登录</a></li> --%>
							<li id="login_id1"><a id="login" href="${APP_PATH}/userpage/user/login2.jsp">&nbsp;登录</a></li>
							<li><a id="logout_user_register" href="${APP_PATH}/userpage/user/regist.jsp">注册</a></li>		
						</ul>
					</c:when>
					<%-- <c:when test="${!empty sessionScope.session_user && !empty sessionScope.session_user.uNickname}">
						<ul class="logout_info">
							<li id="login_id1"><a id="login" href="#">你好，${ sessionScope.session_user.uNickname}</a></li>
							<li><a id="logout_user_register" href="${APP_PATH}/quit">退出</a></li>		
						</ul>
					</c:when> --%>
					<c:when test="${!empty sessionScope.session_user && !empty sessionScope.session_user.uNickname}">
						<ul class="logout_info">
							<%-- <li id="login_id1"><a id="login" href="#">你好，${ sessionScope.session_user.uNickname}</a></li> --%>
 							<!--  ***********************************-->
 							<li id="usernameInfo" class="uname mn-lk-w" style="opcity:1">
								<a id="username" class="mn-lk" href="${APP_PATH}/userpage/order/myOrderList3.jsp">你好，${ sessionScope.session_user.uNickname}</a>
 									<div id="popUserInfoId" class="mn-tip" style="visibility: hidden;">
										<div class="top-arrow"></div>
										<ul class="mn">
											<li>
												<a class="my-info" href="${APP_PATH}/userpage/order/myOrderList3.jsp">
								 					<span class="icon order-icon"></span>
													我的订单
												</a>
											</li>
											<li id="myCountSet">
												<a class="my-info" href="javascript:void(0);">
												<span class="icon address-icon"></span>
  													账户设置
												</a>
											</li>
											<li id="shouChangJia">
												 <a class="my-info" href="javascript:void(0);"> 
												<span  class="icon favorite-icon"></span>
													收藏夹
												 </a> 
											</li>
											 
											<li>
												<a class="my-info" href="/trade/refundlist">
												<span class="icon refund-icon"></span>
												我的退款</a>
											</li>
											<li>
												<a id="logout" class="logout" href="${APP_PATH}/quit">
												<span class="icon account-icon"></span>
												退出</a>
											</li>
										</ul>
								</div>
		
							</li>
							
							<!-- ************************************ -->
							<%-- <li><a id="logout_user_register" href="${APP_PATH}/quit">退出</a></li> --%>		
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="logout_info">
							<li id="login_id1"><a id="login" href="#">你好，${sessionScope.session_user.uLoginid}</a></li>
							<li><a id="logout_user_register" href="${APP_PATH}/quit">退出</a></li>		
						</ul>
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
		<script type="text/javascript"
			src="https://passport.baidu.com/phoenix/account/jsapi"></script>
	</div>
</header>
<!--****************************************************************************  -->

