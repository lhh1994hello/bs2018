<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="waimaiCssJs.jsp"%>
<%@ include file="myjs.jsp"%>
<title>信息显示</title>
</head>
<body>
	<div class="row" id="head_row">
		<!--  首页导航和 分类菜单-->
		<%@ include file="baiduwaimaihead.jsp"%>
	</div>
	<div class="container-fluid">
		<div class="row" style="height:50px;"></div>
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<h3>提示:</h3>
				<h3>${msg}</h3>
			</div>
			
		</div>

	</div>

	<script type="text/javascript">
		$(document).on('mouseenter', '#usernameInfo', function() {
			$("#popUserInfoId").css("visibility", "visible");
		});
		$(document).on('mouseleave', '#usernameInfo', function() {
			$("#popUserInfoId").css("visibility", "hidden");
		});
	</script>

</body>
</html>