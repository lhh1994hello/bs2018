<%@page pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link rel="icon"
	href="//static.waimai.baidu.com/static/forpc/favicon.ico"
	mce_href="//static.waimai.baidu.com/static/forpc/favicon.ico"
	type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="https://static.waimai.baidu.com/static/wcommon/main_a79c03f.css" />
<link rel="stylesheet" type="text/css"
	href="https://stc1.waimai.baidu.com/static/waimai/widget/common/ui/cartAlert/cartAlert_6e5c365.css" />
<link rel="stylesheet" type="text/css"
	href="https://static.waimai.baidu.com/static/waimai/common_4840c98.css" />
<link rel="stylesheet" type="text/css"
	href="https://stc1.waimai.baidu.com/static/waimai/widget/common/ui/citybar/citybar_2daccc1.css" />
<link rel="stylesheet" type="text/css"
	href="https://stc0.waimai.baidu.com/static/waimai/landing_26d4e9b.css" />
<link rel="stylesheet" type="text/css"
	href="https://static.waimai.baidu.com/static/waimai/widget/common/ui/muticities/muti_60d05dd.css" />
<link rel="stylesheet" type="text/css"
	href="https://stc0.waimai.baidu.com/static/waimai/widget/common/userinfo/comp/registerDialog_77e55d3.css" />
<link rel="stylesheet" type="text/css"
	href="https://static.waimai.baidu.com/static/waimai/widget/common/userinfo/userInfo_11c5a6b.css" />
<link rel="stylesheet" type="text/css"
	href="https://static.waimai.baidu.com/static/waimai/widget/common/ui/search/search_cae56fa.css" />
<link rel="stylesheet" type="text/css"
	href="https://static.waimai.baidu.com/static/waimai/widget/common/ui/addressEditDialog/addressEditDialog_be19f67.css" />
<link rel="stylesheet" type="text/css"
	href="https://stc0.waimai.baidu.com/static/waimai/widget/common/ui/navSearch/search_b1f3d15.css" />
<link rel="stylesheet" type="text/css"
	href="https://stc1.waimai.baidu.com/static/waimai/widget/common/nav/nav_92fb35c.css" />
<link rel="stylesheet" type="text/css"
	href="https://stc0.waimai.baidu.com/static/waimai/shoplist_b2c246e.css" />
<link rel="stylesheet" type="text/css"
	href="https://static.waimai.baidu.com/static/waimai/widget/common/ui/shopcard/shopcard_93f9a30.css" />
<link rel="stylesheet" type="text/css"
	href="https://stc0.waimai.baidu.com/static/waimai/widget/common/ui/dishcard/dishcard_d331747.css" />
<link rel="stylesheet" type="text/css"
	href="https://stc1.waimai.baidu.com/static/waimai/widget/common/backtop/backtop_e064524.css" />
<link rel="stylesheet" type="text/css"
	href="https://stc0.waimai.baidu.com/static/waimai/widget/common/footer/footer_bf9a09d.css" />


<!-- JS部分 -->
<script type="text/javascript"
	src="https://passport.baidu.com/passApi/js/uni_armorwidget_wrapper.js"></script>

<script type="text/javascript"
	src="https://passport.baidu.com/phoenix/account/jsapi"></script>

<script type="text/javascript"
	src="https://stc1.waimai.baidu.com/static/waimai/libs/mod_4296a9b.js"></script>


<script type="text/javascript"
	src="https://static.waimai.baidu.com/static/wcommon/main_27540a3.js"></script>
<script type="text/javascript"
	src="https://stc0.waimai.baidu.com/static/waimai/widget/common/ui/cartAlert/cartAlert_4a0a9e1.js"></script>
<script type="text/javascript"
	src="https://stc1.waimai.baidu.com/static/waimai/lib_a8bf1bf.js"></script>
<script type="text/javascript"
	src="https://stc1.waimai.baidu.com/static/waimai/widget/common/ui/citybar/citybar_ce545ec.js"></script>
<script type="text/javascript"
	src="https://stc1.waimai.baidu.com/static/waimai/widget/common/ui/muticities/muti_7cec3bf.js"></script>
<script type="text/javascript"
	src="https://static.waimai.baidu.com/static/waimai/landing_af2d654.js"></script>
<script type="text/javascript"
	src="https://stc1.waimai.baidu.com/static/waimai/widget/common/ui/search/search_9fd8502.js"></script>
<script type="text/javascript"
	src="https://stc0.waimai.baidu.com/static/waimai/widget/common/ui/addressEditDialog/addressEditDialog_83dba56.js"></script>
<script type="text/javascript"
	src="https://stc0.waimai.baidu.com/static/waimai/widget/common/ui/navSearch/search_ac8d22c.js"></script>
<script type="text/javascript"
	src="https://stc1.waimai.baidu.com/static/waimai/widget/common/nav/nav_9c3306e.js"></script>
<script type="text/javascript"
	src="https://stc0.waimai.baidu.com/static/waimai/widget/common/ui/shopcard/shopcard_3cc6c43.js"></script>
<script type="text/javascript"
	src="https://static.waimai.baidu.com/static/waimai/widget/common/ui/dishcard/dishcard_7d5a487.js"></script>
<script type="text/javascript"
	src="https://static.waimai.baidu.com/static/waimai/widget/common/userinfo/comp/registerDialog_ff8e4cd.js"></script>
<script type="text/javascript"
	src="https://static.waimai.baidu.com/static/waimai/shoplist_21b56fd.js"></script>
<script type="text/javascript"
	src="https://stc0.waimai.baidu.com/static/waimai/widget/common/ui/feedback/feedback_5e6c6b4.js"></script>
<script type="text/javascript"
	src="https://stc1.waimai.baidu.com/static/waimai/widget/common/backtop/backtop_3bb0645.js"></script>
<script type="text/javascript"
	src="https://stc1.waimai.baidu.com/static/waimai/widget/common/footer/footer_3efb8d8.js"></script>
	
<!--  layui-->
<%-- <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/layui/layui.js"></script>
<link href="${APP_PATH}/static/layui/css/layui.css" rel="stylesheet"> --%>

