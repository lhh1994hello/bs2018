<!DOCTYPE html>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
<title>页面布局</title>
<link rel="stylesheet" type="text/css"
	href="D:\SoftWare\Subline\static\bootstrap-3.3.7-dist\css\bootstrap.min.css">
<script src="D:\SoftWare\Subline\static\js\jquery-1.12.4.min.js"></script>
<script
	src="D:\SoftWare\Subline\static\bootstrap-3.3.7-dist\js\bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">首&nbsp;&nbsp;页</a>
				</div>
				<div>
					<ul class="nav navbar-nav">
						<li class="active"><a href="#">购物车</a></li>
						<li><a href="#">我的订单</a></li>
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
		</nav>
	</div>


</body>
</html>