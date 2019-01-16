<%@page pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<style>
.panel-group {
	max-height: 770px;
	overflow: auto;
}

.leftMenu {
	margin: 10px;
	margin-top: 5px;
}

.leftMenu .panel-heading {
	font-size: 14px;
	padding-left: 20px;
	height: 36px;
	line-height: 36px;
	color: white;
	position: relative;
	cursor: pointer;
}
/*转成手形图标*/
.leftMenu .panel-heading span {
	position: absolute;
	right: 10px;
	top: 12px;
}

.leftMenu .menu-item-left {
	padding: 2px;
	background: transparent;
	border: 1px solid transparent;
	border-radius: 6px;
}

.leftMenu .menu-item-left:hover {
	background: #C4E3F3;
	border: 1px solid #1E90FF;
}
</style>



<div class="panel-group table-responsive" role="tablist">
	<div class="panel panel-primary leftMenu">
		<!-- 利用data-target指定要折叠的分组列表 -->
		<div class="panel-heading" id="collapseListGroupHeading1"
			data-toggle="collapse" data-target="#collapseListGroup1" role="tab">
			<h4 class="panel-title">
				个人中心 <span class="glyphicon glyphicon-chevron-up right" id="group1"></span>
			</h4>
		</div>
		<!-- .panel-collapse和.collapse标明折叠元素 .in表示要显示出来 -->
		<div id="collapseListGroup1" class="panel-collapse collapse in"
			role="tabpanel" aria-labelledby="collapseListGroupHeading1">
			<ul class="list-group">
				<li class="list-group-item">
					<!-- 利用data-target指定URL -->
					<button class="menu-item-left" data-target="test2.html">
						<span class="glyphicon glyphicon-triangle-right"></span>分组项1-1
					</button>
				</li>
				<li class="list-group-item">
					<button class="menu-item-left">
						<span class="glyphicon glyphicon-triangle-right"></span>分组项1-2
					</button>
				</li>
				<li class="list-group-item">
					<button class="menu-item-left">
						<span class="glyphicon glyphicon-triangle-right"></span>分组项1-3
					</button>
				</li>

			</ul>
		</div>
	</div>
	<!--panel end第二个开始-->
	<div class="panel panel-primary leftMenu">
		<div class="panel-heading" id="collapseListGroupHeading2"
			data-toggle="collapse" data-target="#collapseListGroup2" role="tab">
			<h4 class="panel-title">
				菜单管理 <span class="glyphicon glyphicon-chevron-down right"
					id="group2"></span>
			</h4>
		</div>
		<div id="collapseListGroup2" class="panel-collapse collapse in"
			role="tabpanel" aria-labelledby="collapseListGroupHeading2">
			<ul class="list-group">
				<li class="list-group-item">
					<button class="menu-item-left">
						<span class="glyphicon glyphicon-triangle-right"></span>
						 <a href="${APP_PATH}/adminToAddMenu">添加菜谱</a>
							
					</button>
				</li>
				<li class="list-group-item">
					<button class="menu-item-left">
						<span class="glyphicon glyphicon-triangle-right"></span>
						 <a href="${APP_PATH}/adminLookMenu">查看菜谱</a>
					</button>
				</li>
				<li class="list-group-item">
					<button class="menu-item-left">
						<span class="glyphicon glyphicon-triangle-right"></span>
						<a href="${APP_PATH}/getCategoryList">管理菜系</a>
					</button>
				</li>

			</ul>
		</div>
	</div>
	<!-- 第二个折叠结束 -->
	<!-- *************************************************************************** -->
	<div class="panel panel-primary leftMenu">
		<div class="panel-heading" id="collapseListGroupHeading3"
			data-toggle="collapse" data-target="#collapseListGroup3" role="tab">
			<h4 class="panel-title">
				订单管理 <span class="glyphicon glyphicon-chevron-down right"
					id="group3"></span>
			</h4>
		</div>
		<div id="collapseListGroup3" class="panel-collapse collapse in"
			role="tabpanel" aria-labelledby="collapseListGroupHeading3">
			<ul class="list-group">
				<li class="list-group-item">
					<button class="menu-item-left">
						<span class="glyphicon glyphicon-triangle-right"></span>
						<a href="#">所有订单</a>
					</button>
				</li>
				<li class="list-group-item">
					<button class="menu-item-left">
						<span class="glyphicon glyphicon-triangle-right"></span>
						<a href="#">未付款订单</a>
					</button>
				</li>
				<li class="list-group-item">
					<button class="menu-item-left">
						<span class="glyphicon glyphicon-triangle-right"></span>
						<a href="#">已付款订单</a>
					</button>
				</li>

			</ul>
		</div>
	</div>
	<!--  ************************************************************************************-->
</div>
<!-- <div class="col-md-10">内容</div> -->

<script>
	$(function() {
		$(".panel-heading").click(function(e) {
			/*切换折叠指示图标*/
			$(this).find("span").toggleClass("glyphicon-chevron-down");
			$(this).find("span").toggleClass("glyphicon-chevron-up");
		});
		//设置成只显示一个展开
		$("#group1").click(function() {

		});

	});
</script>
