<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.fileInput{
        height:256px;
        overflow: hidden;
        font-size: 300px;
        position:absolute;
        right:0;
        top:0;
       /*  opacity: 0.5; */
        filter:alpha(opacity=0);
        cursor:pointer;
        
    }

</style>
</head>
<body>
	<button class="clp" id="btn">clp</button>
	<input class="fileInput" type="file" id="File" />

	<script type="text/javascript">
		$(function() {

			$("#btn").click(function() {
				//alert("SSS");
				return $("#File").click();
			});

		});
	</script>
</body>
</html>