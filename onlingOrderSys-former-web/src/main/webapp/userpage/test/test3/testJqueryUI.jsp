<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${APP_PATH}/static/jqueryUI/jquery-ui.css" />
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
 <script src="${APP_PATH}/static/jqueryUI/jquery-ui.min.js"></script>
 <!-- "src/main/webapp/static/jqueryUI/jquery-ui.theme.min.css" -->
 
<title>jqueryUI</title>
</head>
<body>
	<input type="text" name="date" id="date" />
	<script type="text/javascript">
		$("#date").datepicker();
	</script>
</body>
</html>