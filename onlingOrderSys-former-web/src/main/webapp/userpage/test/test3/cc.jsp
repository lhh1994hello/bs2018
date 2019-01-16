<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="https://static.waimai.baidu.com/static/wcommon/main_a79c03f.css" />
<link rel="stylesheet" type="text/css"
	href="https://stc1.waimai.baidu.com/static/waimai/widget/common/ui/cartAlert/cartAlert_69d76b3.css" />
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
	href="https://stc1.waimai.baidu.com/static/waimai/widget/menu/basicinfo/basicinfo_c3e4798.css" />
<link rel="stylesheet" type="text/css"
	href="https://static.waimai.baidu.com/static/waimai/menucommon_bebb0ee.css" />
<link rel="stylesheet" type="text/css"
	href="https://static.waimai.baidu.com/static/waimai/widget/menu/tab/tab_b3d88c8.css" />
<link rel="stylesheet" type="text/css"
	href="https://stc1.waimai.baidu.com/static/waimai/widget/common/ui/popCarousel/popCarousel_89218b2.css" />
<link rel="stylesheet" type="text/css"
	href="https://stc0.waimai.baidu.com/static/waimai/widget/menu/filter/filter_4847ffc.css" />
<link rel="stylesheet" type="text/css"
	href="https://static.waimai.baidu.com/static/waimai/widget/common/ui/setmeal/setmeal_864a85e.css" />
<link rel="stylesheet" type="text/css"
	href="https://stc1.waimai.baidu.com/static/waimai/widget/menu/list/list_3b46847.css" />
<link rel="stylesheet" type="text/css"
	href="https://stc1.waimai.baidu.com/static/waimai/widget/menu/collect/collect_35cd19e.css" />
<link rel="stylesheet" type="text/css"
	href="https://stc1.waimai.baidu.com/static/waimai/widget/common/backtop/backtop_e064524.css" />
<link rel="stylesheet" type="text/css"
	href="https://stc0.waimai.baidu.com/static/waimai/widget/common/footer/footer_bf9a09d.css" />
<link rel="stylesheet" type="text/css"
	href="https://stc0.waimai.baidu.com/static/waimai/menu_f039732.css" />
	
	
<script type="text/javascript" src="https://passport.baidu.com/phoenix/account/jsapi"></script>
<script type="text/javascript" src="https://stc1.waimai.baidu.com/static/waimai/libs/mod_4296a9b.js"></script>
<script type="text/javascript">require.resourceMap({"res":{"waimai:widget/common/userinfo/comp/registerDialog.js":{"url":"https://static.waimai.baidu.com/static/waimai/widget/common/userinfo/comp/registerDialog_ff8e4cd.js","deps":["wcommon:static/util/Cookie.js"]},"waimai:widget/common/userinfo/UserMgr.js":{"url":"https://static.waimai.baidu.com/static/waimai/widget/common/userinfo/UserMgr_e200a1f.js","deps":["waimai:widget/common/userinfo/comp/registerDialog.js","wcommon:static/util/Cookie.js"]}}});</script><script type="text/javascript" src="https://static.waimai.baidu.com/static/wcommon/main_27540a3.js"></script>
<script type="text/javascript" src="https://stc0.waimai.baidu.com/static/waimai/widget/common/ui/cartAlert/cartAlert_33a616a.js"></script>
<script type="text/javascript" src="https://stc1.waimai.baidu.com/static/waimai/lib_a8bf1bf.js"></script>
<script type="text/javascript" src="https://stc1.waimai.baidu.com/static/waimai/widget/common/ui/citybar/citybar_ce545ec.js"></script>
<script type="text/javascript" src="https://stc1.waimai.baidu.com/static/waimai/widget/common/ui/muticities/muti_7cec3bf.js"></script>
<script type="text/javascript" src="https://static.waimai.baidu.com/static/waimai/landing_af2d654.js"></script>
<script type="text/javascript" src="https://stc1.waimai.baidu.com/static/waimai/widget/common/ui/search/search_9fd8502.js"></script>
<script type="text/javascript" src="https://stc0.waimai.baidu.com/static/waimai/widget/common/ui/addressEditDialog/addressEditDialog_83dba56.js"></script>
<script type="text/javascript" src="https://stc0.waimai.baidu.com/static/waimai/widget/common/ui/navSearch/search_ac8d22c.js"></script>
<script type="text/javascript" src="https://stc1.waimai.baidu.com/static/waimai/widget/common/nav/nav_26a027a.js"></script>
<script type="text/javascript" src="https://stc0.waimai.baidu.com/static/waimai/widget/menu/basicinfo/basicinfo_7b3c77c.js"></script>
<script type="text/javascript" src="https://stc1.waimai.baidu.com/static/waimai/widget/menu/tab/tab_b9d5368.js"></script>
<script type="text/javascript" src="https://static.waimai.baidu.com/static/waimai/widget/common/mustbuy/mustbuy_a90a62b.js"></script>
<script type="text/javascript" src="https://stc0.waimai.baidu.com/static/waimai/widget/common/ui/noresult/noresult_8b58ce9.js"></script>
<script type="text/javascript" src="https://stc0.waimai.baidu.com/static/waimai/widget/common/ui/popCarousel/popCarousel_b7eac1d.js"></script>
<script type="text/javascript" src="https://static.waimai.baidu.com/static/waimai/menucommon_de74ba3.js"></script>
<script type="text/javascript" src="https://static.waimai.baidu.com/static/waimai/widget/menu/filter/filter_9c6f1bf.js"></script>
<script type="text/javascript" src="https://stc1.waimai.baidu.com/static/waimai/widget/common/ui/setmeal/setmeal_f42603d.js"></script>
<script type="text/javascript" src="https://static.waimai.baidu.com/static/waimai/widget/menu/list/list_1ab1f8b.js"></script>
<script type="text/javascript" src="https://stc0.waimai.baidu.com/static/waimai/widget/common/ui/feedback/feedback_5e6c6b4.js"></script>
<script type="text/javascript" src="https://stc1.waimai.baidu.com/static/waimai/widget/common/backtop/backtop_3bb0645.js"></script>
<script type="text/javascript" src="https://stc1.waimai.baidu.com/static/waimai/widget/common/footer/footer_3efb8d8.js"></script>
<script type="text/javascript" src="https://stc0.waimai.baidu.com/static/waimai/menu_20df260.js"></script>

<title>Insert title here</title>

</head>
<body>
	<section class="cart-section cart-fix" id="cart-section">
	<div class="menu-cart menu-cart-box-shadow">
		<div class="cc-warp hide" style="display: block;">
			<div class="title">
				<span class="txt">购物车</span> <span class="clear-cart">清空</span>
			</div>
			<div class="cart-panel" style="max-height: 271.2px;">
				<table>
					<thead class="cart-head">
						<tr>
							<td class="item-name">菜品</td>
							<td class="item-count">份数</td>
							<td class="item-price">单价</td>
							<td class="item-delete"></td>
						</tr>
					</thead>
					<tbody class="item-list" data-node="item-list">
						<tr class="item normal-item hide" data-stockid=""
							id="cartItem_2107901023" style="display: table-row;">
							<td class="item-name">牛肉照烧鸡双拼</td>
							<td class="item-count"><input type="hidden"
								value="2107901023"><span class="item-minus" value=""
								type="button"></span><input class="item-count" type="input"
								value="5"><span class="item-plus" value="" type="button"></span></td>
							<td class="item-price">¥30.8</td>
							<td class="item-delete"><span class="item-delete-icon">×</span></td>
						</tr>
						<tr class="item normal-item hide" data-stockid=""
							id="cartItem_2187666706" style="display: table-row;">
							<td class="item-name">咖喱香酥鸡</td>
							<td class="item-count"><input type="hidden"
								value="2187666706"><span class="item-minus" value=""
								type="button"></span><input class="item-count" type="input"
								value="2"><span class="item-plus" value="" type="button"></span></td>
							<td class="item-price">¥30.8</td>
							<td class="item-delete"><span class="item-delete-icon">×</span></td>
						</tr>
						<tr class="item normal-item hide" data-stockid=""
							id="cartItem_2209364369" style="display: table-row;">
							<td class="item-name">特价招牌卤肉饭</td>
							<td class="item-count"><input type="hidden"
								value="2209364369"><span class="item-minus" value=""
								type="button"></span><input class="item-count" type="input"
								value="1"><span class="item-plus" value="" type="button"></span></td>
							<td class="item-price">¥26.8</td>
							<td class="item-delete"><span class="item-delete-icon">×</span></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="tip-bar">
				<span>优惠活动手机App专享，网页下单不再享受</span>
			</div>
		</div>
		<div class="cart-bar pointer">
			<span class="cart-logo fl"></span> <span class="cart-desc "
				id="cartIsEmpty" style="display: none;">购物车是空的</span> <span
				class="cart-desc fl" id="cartAmout" style="">共&nbsp;¥242.40 元</span>
			<span class="cart-desc cart-cha fr" id="cartCha"
				style="display: none;">还差¥5元起送</span> <span
				class="cart-desc submit fr" id="cartSubmit" style=""> 选好了</span>
		</div>
	</div>
	</section>
</body>
</html>