<%@page pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<style>
	
</style>
<!-- 	<div class="container"> -->
		<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">首&nbsp;&nbsp;页</a>
			</div>
			<div>
				<ul class="nav navbar-nav" >
					<li class="active"><a href="#">购物车</a></li>
					<li><a href="#">我的订单</a></li>
					<li><a href="${APP_PATH}/userpage/user/login.jsp">登录</a></li>
					<li><a href="${APP_PATH}/userpage/user/regist.jsp">注册</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> 个人中心 <b class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a href="#">jmeter</a></li>
							<li><a href="#">EJB</a></li>
							<li><a href="#">Jasper Report</a></li>
							<li class="divider"></li>
							<li><a href="#">分离的链接</a></li>
							<li class="divider"></li>
							<li><a href="#">另一个分离的链接</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		</nav>
	<!-- </div> -->
	

