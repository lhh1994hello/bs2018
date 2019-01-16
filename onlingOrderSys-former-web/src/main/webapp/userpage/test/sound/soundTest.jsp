<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>

<title>测试声音</title>
</head>
<body>
	
	<audio id="audio"  loop  src="${APP_PATH}/images/sound/login.mp3"></audio>
	
	<button id="play">播放</button>
	<script type="text/javascript">
		var audioDom=document.querySelector('audio');
		$("#play").click(function(){
			console.log("标志:"+audioDom.paused);
			if(audioDom.paused==true){
				audioDom.play();
			}else{
				audioDom.pause();
			}
		});
		
	</script>
</body>
</html>