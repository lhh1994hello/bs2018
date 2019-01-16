<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<link href="${APP_PATH}/static/city/css/jquery.city.css" rel="stylesheet">
<link href="${APP_PATH}/static/city/css/animate.min.css" rel="stylesheet">

</head>
<body>
	 <input type="text" id="txt_city" class="form-control" />
	 <script type="text/javascript" src="${APP_PATH}/static/city/js/jquery.city.js"></script>
<%-- 	<script type="text/javascript" src="${APP_PATH}/static/city/js/jquery-1.10.2.js"></script> --%>
	<script>
      $(function () {
          $('#txt_city').jcity({
              urlOrData: '${APP_PATH}/static/city/js/citydata.json',
              animate: { showClass: 'animated flipInX', hideClass: 'animated flipOutX' },  // 需要第一步引用的animate.min.css文件，也可以自己定义动画 
              onChoice: function (data) {
                  console.log(data);
             }
          });
     });
 </script>
</body>
</html>