<%@page pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<style type="text/css">
#navbar {
	border: 2px solid pink;
	height: 45px;
	font-size: 15px;
	text-align: center;
	background-color: #EEEEE0;
}

a:link {
	font: 12px;
	color: yellow;
	text-decoration: none;
}

a:visited {
	color: #003366;
	text-decoration: none;
}

a:hover {
	color: #FF0000;
	text-decoration: underline;
}

a:active {
	color: #FF0000;
	text-decoration: underline;
}
</style>
<div class="row" id="navbar">
	<div class="col-md-9" >
		<ul class="nav nav-pills">
			<li><a href="#">首页</a></li>
			<li><a href="#">外卖</a></li>
			<li><a href="#">我的订单</a></li>
			<li><a href="#">联系我们</a></li>


		</ul>
	</div>
	<div class="col-md-3">
		<ul class="nav nav-pills">
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
				</ul></li>
		</ul>
	</div>
</div>


