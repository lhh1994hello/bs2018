<%@page pageEncoding="UTF-8"%>
<style>
	#cart_container{
	position: fixed;/*位置固定  */
	bottom: 5px;
	left: 0px;
	width: 178px;
	 /* height: 360px;  */
	height: auto; 
	margin-right:0px;
	/*  background:pink; */
	 	 
}
#cart_head{
	background: #f9f9f9;
	height: 30px;
	width: 178px;
}
/*  购物车子*/
#cart_head_cart{
	height: 30px;
	width: 62px;
	float:left;
	padding-left:10px;
	padding-top:6px;
	 /* background: #ccffff;  */
}
/*  删除按钮*/
#cart_head_delete{
	height: 30px;
	width: 60px;
	float:left;
	margin-left:53px;
 	padding-top:3px;
	text-align:right;
	/* padding-left:8px; */
 	/* background: #ff9966;  */
}
/* 内容区域 */
#cart_content{
	/*  background: #cc99ff; */ 
	 width: 178px;
	/*  height: 300px;  */
	 height: auto; 
	overflow: auto;
	font-size: 8px;
}
/* 底部 */
#cart_footer{
	background: #cc6600;
	color: #ffffff;
	position: absolute;
	left: 0px;
	bottom: 0px;
	height: 30px;
	width: 178px;
}
#cart_footer_cart{
	height: 30px;
	width:128px;
	float:left;
	background: #000000;
}
#cart_footer_buy{
	height: 30px;
	width: 50px;
	float:left;
	text-align:center;
	/* vertical-align:middle; */
	padding-top:8px;
	background: red;
	/* text-decoration:none; */
}
#cart_table{

	table-layout:fixed;
	word-break:break-all;
	/* white-space: nowrap; *//* 不换行 */
	text-overflow: ellipsis;
	overflow: hidden; 
}
</style>


<div id="cart_container">
	<audio id="audio"   src="${APP_PATH}/images/sound/login.mp3"></audio>

			<div id="cart_head">
				<div id="cart_head_cart">购物车</div>
				<div id="cart_head_delete">
					<i class="layui-icon" style="font-size: 20px; color: #1E9FFF;">&#xe640;</i> 
					<span ><a href="#">删除</a></span> 
				</div>
			</div>
			<div    id="cart_content" >
			
					<table class="table table-striped table-hover success  table-bordered" id="cart_table">
							
							<thead id="table_head"> 
								<tr class="hover-style1">
									<th class="menu_name">菜品</th>
									<th class="menu_count">份数</th>
									<th class="menu_price">小计</th>
								</tr>
							</thead>
							<tbody id="cart_tbody">
								<c:forEach items="${cart.cartItems}" var="cartItem">
									<tr class="hover-style1">
										<th class="menu_name">${cartItem.menu.mname}</th>
										<th class="menu_count">${cartItem.count}</th>
										<th class="menu_price">${cartItem.menu.price}</th>
									</tr>
								</c:forEach>
						
							</tbody>
					</table>
				<!-- 内容区域 -->
				
			</div>
			<!-- 底部区域 -->
			<div id="cart_footer">
				<div id="cart_footer_cart">
					<i class="layui-icon" style="font-size: 20px; color: #1E9FFF;">&#xe657;</i> 
					<span id="show_cart_info">
						<!-- 购物车为空1 -->
						<c:choose>
							<c:when test="${!empty cart.cartItems}">共${cart.total}</c:when>
							<c:otherwise>购物车为空</c:otherwise>
						</c:choose>
						
					</span>
					
				</div>
				<!-- javascript:void(0); -->
				<%-- <div id="cart_footer_buy"><a href="${APP_PATH}/toConfirmPage" style="color:white;">购 买</a></div> --%>
				<div id="cart_footer_buy"><a href="javascript:void(0);" style="color:white;text-decoration:none;">购 买</a></div>
			</div>
		</div>