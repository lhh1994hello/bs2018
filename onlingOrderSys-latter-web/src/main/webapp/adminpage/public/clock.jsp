<%@page pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	function realSysTime(){
		var now =new Date();
		var year =now.getFullYear();
		var month=now.getMonth();
		var date= now.getDate();
		var hour=now.getHours();
		var minu=now.getMinutes();
		var sec=now.getSeconds();
		var month=month+1;
		var day=now.getDay();
		var arr_week=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
		var week=arra_week[day];
		var time=year+"年"+month+"月"+date+"日"+week+" "+hour+":"+minu+":"+sec;
		$("#time_clock_id").text("").append(time);
	}

</script>