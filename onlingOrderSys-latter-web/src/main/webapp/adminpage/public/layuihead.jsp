<%@page pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH2", request.getContextPath());
%>
<div class="layui-header">
			<div class="layui-logo">订餐系统后台</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="">控制台</a></li>
				<li class="layui-nav-item"><a href="">商品管理</a></li>
				<li class="layui-nav-item"><a href="">用户</a></li>
				<li class="layui-nav-item"><a href="javascript:;">其它系统</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">邮件管理</a>
						</dd>
						<dd>
							<a href="">消息管理</a>
						</dd>
						<dd>
							<a href="">授权管理</a>
						</dd>
					</dl></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img"> 贤心
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">基本资料</a>
						</dd>
						<dd>
							<a href="">安全设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="">退了</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item layui-nav-itemed" id="all_menu">
					<a class="" href="javascript:;">所有商品</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="${APP_PATH2}/adminToAddMenu">
								<i class="layui-icon" style="font-size: 15px; color: #1E9FFF;">&#xe608;</i>  
								添加菜谱</a>
							</dd>
							<dd>
								<a href="${APP_PATH2}/adminLookMenu">
								<span class="glyphicon glyphicon-eye-open"></span>
								查看菜谱</a>
							</dd>
							<dd>
								<a href="${APP_PATH2}/getCategoryList">
								<i class="layui-icon" style="font-size: 15px; color: #1E9FFF;">&#xe614;</i>
								管理菜系</a>
							</dd>
							<dd>
								<a href="">超链接</a>
							</dd>
						</dl>
					</li>
					<!-- layui-nav-itemed：设置是否折叠 -->
					<li class="layui-nav-item layui-nav-itemed">
						<a href="javascript:;">订单管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="${APP_PATH2}/getOrderByPayState?paystate=-100">所有订单</a>
							</dd>
							<dd>
								<a href="${APP_PATH2}/getOrderByPayState?paystate=0">未付款</a>
							</dd>
							<dd>
								<a href="${APP_PATH2}/getOrderByPayState?paystate=1">未发货</a>
							</dd>
							<dd>
								<a href="${APP_PATH2}/getOrderByPayState?paystate=2">未收货</a>
							</dd>
							<dd>
								<a href="${APP_PATH2}/getOrderByPayState?paystate=3">已完成</a>
							</dd>
							<dd>
								<a href="${APP_PATH2}/getOrderByPayState?paystate=-1">已超时</a>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item"><a href="">云市场</a></li>
					<li class="layui-nav-item"><a href="">发布商品</a></li>
				</ul>
			</div>
		</div>
		
		
		<div class="layui-footer">
			<!-- 底部固定区域 -->
			© layui.com - 底部固定区域
		</div>
