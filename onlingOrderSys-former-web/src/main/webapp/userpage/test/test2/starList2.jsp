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
<style type="text/css">
	.star_bg {
    width: 120px; height: 20px;
    background: url(${APP_PATH}/images/star/star.png) repeat-x;
    position: relative;
    overflow: hidden;
}
.star {
    height: 100%; width: 24px;
    line-height: 6em;
    position: absolute;
    z-index: 3;
}
.star:hover {    
    background: url(${APP_PATH}/images/star/star.png) repeat-x 0 -20px!important;
    left: 0; z-index: 2;
}
.star_1 { left: 0; }
.star_2 { left: 24px; }
.star_3 { left: 48px; }
.star_4 { left: 72px; }
.star_5 { left: 96px; }
.star_1:hover { width: 24px; }
.star_2:hover { width: 48px; }
.star_3:hover { width: 72px; }
.star_4:hover { width: 96px; }
.star_5:hover { width: 120px; }

label { 
    display: block; _display:inline;
    height: 100%; width: 100%;
    cursor: pointer;
}

/* 幕后的英雄，单选按钮 */
.score { position: absolute; clip: rect(0 0 0 0); }
.score:checked + .star {    
    background: url(${APP_PATH}/images/star/star.png) repeat-x 0 -20px;
    left: 0; z-index: 1;
}
.score_1:checked ~ .star_1 { width: 24px; }
.score_2:checked ~ .star_2 { width: 48px; }
.score_3:checked ~ .star_3 { width: 72px; }
.score_4:checked ~ .star_4 { width: 96px; }
.score_5:checked ~ .star_5 { width: 120px; }

.star_bg:hover .star {  background-image: none; }

</style>
</head>
<body>
	<div id="starBg" class="star_bg">                    	
    <input type="radio" id="starScore1" class="score score_1" value="1" name="score">
    <a href="#starScore1" class="star star_1" title="差"><label for="starScore1">差</label></a>
    <input type="radio" id="starScore2" class="score score_2" value="2" name="score">
    <a href="#starScore2" class="star star_2" title="较差"><label for="starScore2">较差</label></a>
    <input type="radio" id="starScore3" class="score score_3" value="3" name="score">
    <a href="#starScore3" class="star star_3" title="普通"><label for="starScore3">普通</label></a>
    <input type="radio" id="starScore4" class="score score_4" value="4" name="score">
    <a href="#starScore4" class="star star_4" title="较好"><label for="starScore4">较好</label></a>
    <input type="radio" id="starScore5" class="score score_5" value="5" name="score">
    <a href="#5" class="star star_5" title="好"><label for="starScore5">好</label></a>
</div>
</body>
</html>