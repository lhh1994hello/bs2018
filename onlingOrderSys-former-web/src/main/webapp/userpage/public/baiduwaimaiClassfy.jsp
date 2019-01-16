<%@page pageEncoding="UTF-8"%>
<div id="content" class="clearfix">
	<div class="main">
		<section id="f_panel" class="filter-section clearfix">
			<div class="filter-up clearfix" >
				<!-- 通过AJAX查询出所有分类，添加到这里面就行了 -->
				<ul class="filter-cates clearfix" id="category_id">
					<li class="cate-item " data_id="-100" >
				
							<div class="item-img">
								<div class="img-show cate-start"
									style="background-image: url(https://img.waimai.baidu.com/pb/dbed14c4cb831bff5f0e5ab92a78a4517c@s_0,w_18,h_46);">
								</div>
								<div class="img-show cate-hover cate-hover-all"
									style="background-image: url(https://img.waimai.baidu.com/pb/dbed14c4cb831bff5f0e5ab92a78a4517c@s_0,w_18,h_46);">
								</div>
							</div>
							<div class="item-text">全部</div>
					</li>
				</ul>
			</div>
			<!--******************************  -->
			
			<div class="filter-bottom clearfix" id="filter-bottom">
					<div class="outline-left">
						<ul class="option-left">
							<!-- <li><span class="sort-item selected" data-node=""
								style="padding-right: 10px">默认</span><span class="item-interval">|</span>
							</li> -->
							<li title="默认" class="sort-item" >
								<span class="sort-item" data-node="createtime">默认</span>
								<!-- <i class="down"></i> -->
								<span class="item-interval">|</span>
							</li>
							
							<li title="销量" class="item-left">
								<span class="sort-item" data-node="salecount">销量</span>
								<i class="down"></i>
								<span class="item-interval">|</span>
							</li>
							
							<li title="价格">
								<span class="sort-item" data-node="price" >价格</span>
								<i class="down"> </i>
								<span class="item-interval">|</span>
							</li>
							<li title="评价">
								<span class="sort-item" data-node="rateStar">收藏量</span>
								<i class="down"></i>
								<span class="item-interval last"></span>
							</li>
							<!--我的收藏  -->
						
								<li title="收藏" id="star_li">
									<span id="sort_item_Star" class="sort-item" data-node="Star">收藏</span>
	 								<!-- <i class="Hui-iconfont">&#xe630;</i> -->
	 								<i class="down"> </i>
									<span class="item-interval"></span>
								</li>
							
							
							
						</ul>
					</div>
			</div>
			<!-- ***************************** -->
		</section>
	</div>
</div>