<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">    
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
	
	<title>五星评分</title>
</head>
<body>
    <div>
        <a href="javascript:click(1)"><img src="${APP_PATH}/images/star/star.png" id="star1" onMouseOver="over(1)" onMouseOut="out(1)"/></a>
        <a href="javascript:click(2)"><img src="${APP_PATH}/images/star/star.png" id="star2" onMouseOver="over(2)" onMouseOut="out(2)" /></a>
        <a href="javascript:click(3)"><img src="${APP_PATH}/images/star/star.png" id="star3" onMouseOver="over(3)" onMouseOut="out(3)" /></a>
        <a href="javascript:click(4)"><img src="${APP_PATH}/images/star/star.png" id="star4" onMouseOver="over(4)" onMouseOut="out(4)"/></a>
        <a href="javascript:click(5)"><img src="${APP_PATH}/images/star/star.png" id="star5" onMouseOver="over(5)" onMouseOut="out(5)"/></a>
        <span id="message"></span>
    </div>
</body>
<script type="text/javascript">
var check = 0;//该变量是记录当前选择的评分
var time = 0;//该变量是统计用户评价的次数，这个是我的业务要求统计的（改变评分不超过三次），可以忽略
 
/*over()是鼠标移过事件的处理方法*/
function over(param){
    if(param == 1){
        $("#star1").attr("src","${APP_PATH}/images/star/star_red.png");//第一颗星星亮起来，下面以此类推
        $("#message").html("很差");//设置提示语，下面以此类推
    }else if(param == 2){
        $("#star1").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#star2").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#message").html("比较差");
    }else if(param == 3){
        $("#star1").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#star2").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#star3").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#message").html("一般");
    }else if(param == 4){
        $("#star1").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#star2").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#star3").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#star4").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#message").html("比较好");
    }else if(param == 5){
    	$("#star1").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#star2").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#star3").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#star4").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#star4").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#message").html("很好");
    }
}
/*out 方法是鼠标移除事件的处理方法，当鼠标移出时，恢复到我的打分情况*/
function out(){
    if(check == 1){//打分是1，设置第一颗星星亮，其他星星暗，其他情况以此类推
        $("#star1").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#star2").attr("src","${APP_PATH}/images/star/star.png");
        $("#star3").attr("src","${APP_PATH}/images/star/star.png");
        $("#star4").attr("src","${APP_PATH}/images/star/star.png");
        $("#star5").attr("src","${APP_PATH}/images/star/star.png");
        $("#message").html("");
    }else if(check == 2){
        $("#star1").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#star2").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#star3").attr("src","${APP_PATH}/images/star/star.png");
        $("#star4").attr("src","${APP_PATH}/images/star/star.png");
        $("#star5").attr("src","${APP_PATH}/images/star/star.png");
        $("#message").html("");
    }else if(check == 3){
        $("#star1").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#star2").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#star3").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#star4").attr("src","${APP_PATH}/images/star/star.png");
        $("#star5").attr("src","${APP_PATH}/images/star/star.png");
        $("#message").html("");
    }else if(check == 4){
        $("#star1").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#star2").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#star3").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#star4").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#star5").attr("src","${APP_PATH}/images/star/star.png");
        $("#message").html("");
    }else if(check == 5){
    	 $("#star1").attr("src","${APP_PATH}/images/star/star_red.png");
         $("#star2").attr("src","${APP_PATH}/images/star/star_red.png");
         $("#star3").attr("src","${APP_PATH}/images/star/star_red.png");
         $("#star4").attr("src","${APP_PATH}/images/star/star_red.png");
         $("#star5").attr("src","${APP_PATH}/images/star/star_red.png");
        $("#message").html("");
    }else if(check == 0){
        $("#star1").attr("src","${APP_PATH}/images/star/star.png");
        $("#star2").attr("src","${APP_PATH}/images/star/star.png");
        $("#star3").attr("src","${APP_PATH}/images/star/star.png");
        $("#star4").attr("src","${APP_PATH}/images/star/star.png");
        $("#star5").attr("src","${APP_PATH}/images/star/star.png");
        $("#message").html("");
    }
}
/*click()点击事件处理，记录打分*/
function click(param){
    time++;//记录打分次数
    check = param;//记录当前打分
    out();//设置星星数
}
</script>
</html>