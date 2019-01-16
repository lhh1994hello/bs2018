<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../public/menuCssJs.jsp"%>
<title>显示菜单</title>
<style type="text/css">
img {
	width: 160px;
	height: 160px;
	/* border: 2px solid pink; */
}

#my_image {
	width: 140px;
	height: 140px;
	/* border: 2px solid pink; */
}

.myclass {
	margin-bottom: 20px;
}
#page_info_area {
	font-size: 20px;
	/* border: 2px solid pink; */
	margin-top: 20px;
}
</style>
</head>
<body class="layui-layout-body">
	<!-- 模态框 -->
	<!--模态框，菜品修改信息 -->
	<div class="modal fade" id="menuUpdateModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改菜单</h4>
				</div>
				<div class="modal-body">

					<form class="form-horizontal" method="post"
						enctype="multipart/form-data" id="form_data"
						action="${APP_PATH}/adminLookMenu"
						onsubmit="return check_onsubmit()">
						<input type="hidden" name="pn" value="${pageInfo.pageNum}" />
						<div class="form-group">
							<label for="empName_add_input" class="col-sm-2 control-label">菜名</label>
							<div class="col-sm-10">
								<!-- <p class="form-control-static" id="empName_update_static"></p> -->
								<input type="text" name="mname" class="form-control"
									id="mname_update_input" readonly="readonly"> <span
									id="menu_add_span" class="help-block"></span>
							</div>
						</div>

						<div class="form-group ">
							<label for="email_add_input" class="col-sm-2 control-label">价&nbsp;&nbsp;格</label>
							<div class="col-sm-10" id="div_price_update_input">
								<input type="text" name="price" class="form-control"
									id="price_update_input"> <span id="price_add_span"
									class="help-block"></span>
							</div>
						</div>


						<!-- 菜系选项 -->
						<div class="form-group">
							<label class="col-sm-2 control-label">菜系</label>
							<div class="col-sm-4">
								<select class="form-control" name="mcId"
									id="category_update_select">
									<!-- 提交部门ID即可，外键 -->
								</select>
							</div>
							<!--  -->
							<label class="col-sm-2 control-label">是否有效&nbsp;&nbsp;</label>
							<div class="col-sm-4">
								<label class="radio-inline"> <input type="radio"
									name="mstate" id="gender1_update_input" value="1"
									checked="checked"> 是
								</label> <label class="radio-inline"> <input type="radio"
									name="mstate" id="gender2_update_input" value="0"> 否
								</label>
							</div>
							<!--  -->
						</div>
						<!--  显示图片-->
						<div class="form-group">
							<label for="email_add_input" class="col-sm-2 control-label">原&nbsp;&nbsp;图</label>
							<div class="col-sm-10" id="div_price_update_input_image">
								<img alt="原图" src="http://localhost/headImage/201804280918463721_tom.gif"
									class="img-rounded  img-circle" id="my_image"> <span
									id="image_add_span" class="help-block"></span>
							</div>
						</div>
						<!--  选择新的图片-->
						<div class="form-group">
							<label for="email_add_input" class="col-sm-2 control-label">换&nbsp;&nbsp;图</label>
							<div class="col-sm-10" id="div_update_input_update">
								<input type="file" name="file" id="image_update_input" /> <span
									id="image_add_span" class="help-block"></span>
							</div>
						</div>
						<!-- 评价选项 -->
						<div class="form-group">
							<label for="email_add_input" class="col-sm-2 control-label">评&nbsp;&nbsp;价</label>
							<div class="col-sm-10" id="div_pingjia_update_input">
								<!--  <input type="text" name="email" class="form-control" id="intro_update_input" /> -->
								<textarea rows="2" cols="60" name="introduce"
									id="text_introduce"></textarea>
								<span id="intro_add_span" class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关&nbsp;闭</button>
					<button type="button" class="btn btn-primary" id="menu_update_btn">修
						&nbsp;改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 模态框结束-->
	<div class="layui-layout layui-layout-admin">
		<%-- <%@ include file="../public/layuihead.jsp"%> --%>
		<!-- <div class="layui-body"> -->
			<!-- 内容主体区域 -->
			<div style="padding: 15px;">
				<div class="container">
					<div class="row">
						<div class="col-md-12" id="d1">
							<!-- <h3>显示菜单</h3> -->
							<div class="row" id="imagebox">
								<c:forEach items="${pageInfo.list}" var="menu">

									<div class="col-md-3 text-center myclass" id="myid">
										<a href="#">
										<%-- <a href="<c:url value='/BookServlet?method=load&bid=${book.bid }'/>"> --%>
											<%-- <img src="${menu.image}" class="img-rounded  img-circle" /> --%>
											<img src="${menu.image}"  />
										</a> <br />
										 <%-- <a href="<c:url value='/BookServlet?method=load&bid=${book.bid }'/>">${menu.mname}</a> --%>
										 <a href="#">${menu.mname}</a>
										<span> ￥
										<i class="layui-icon" style="font-size: 15px; color: #1E9FFF;">&#xe65e;</i> 
										<font style="color: red">${menu.price}</font>元
										</span> <br />
										<button type="button"
											class="btn btn-info btn btn-default btn-sm edit_btn"
											update_id="${menu.mid}" id="menu_update_modal_btn">修&nbsp;&nbsp;改</button>


									</div>
								</c:forEach>
							</div>
							<!-- 第二行 -->
							<div class="row">

								<div class="col-md-6" id="page_info_area">
									
									第<font style="color: red">${pageInfo.pageNum}</font>页
									,共<font style="color: red">${pageInfo.pages}</font>页,
									共<font style="color: red">${pageInfo.total}</font>条记录
								</div>

								<div class="col-md-6" id="page_info_nav">
									<nav aria-label="Page navigation">
									<ul class="pagination">
										<c:choose>
											<c:when test="${pageInfo.hasPreviousPage}">
												<li><a href="${APP_PATH}/adminLookMenu?pn=1">首页</a></li>
												<li><a
													href="${APP_PATH}/adminLookMenu?pn=${pageInfo.pageNum-1}"
													aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
												</a></li>
											</c:when>
											<c:otherwise>
												<li class="disabled"><a
													href="${APP_PATH}/adminLookMenu?pn=1">首页</a></li>
												<li class="disabled"><a
													href="${APP_PATH}/adminLookMenu?pn=${pageInfo.pageNum-1}"
													aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
												</a></li>
											</c:otherwise>
										</c:choose>

										<c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
											<c:if test="${pageInfo.pageNum==page_Num}">
												<li class="active"><a href="#">${page_Num}</a></li>
											</c:if>
											<c:if test="${pageInfo.pageNum!=page_Num}">
												<li><a href="${APP_PATH}/adminLookMenu?pn=${page_Num}">${page_Num}</a></li>
											</c:if>
										</c:forEach>
										<c:choose>
											<c:when test="${pageInfo.hasNextPage}">
												<li><a
													href="${APP_PATH}/adminLookMenu?pn=${pageInfo.pageNum+1}"
													aria-label="Next"> <span aria-hidden="true">&raquo;</span>
												</a></li>
												<li><a
													href="${APP_PATH}/adminLookMenu?pn=${pageInfo.pages}">尾页</a></li>
											</c:when>
											<c:otherwise>
												<li class="disabled"><a
													href="${APP_PATH}/adminLookMenu?pn=${pageInfo.pageNum+1}"
													aria-label="Next"> <span aria-hidden="true">&raquo;</span>
												</a></li>
												<li class="disabled"><a
													href="${APP_PATH}/adminLookMenu?pn=${pageInfo.pages}">尾页</a></li>
											</c:otherwise>
										</c:choose>

									</ul>
									</nav>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		<!-- </div> -->

	</div>
	<!-- <script src="../src/layui.js"></script> -->

	<!-- js部分 -->
	<script type="text/javascript">
		var pageNum = ${pageInfo.pageNum};
		// alert("当前页："+pageNum);

		//给更新按钮绑定事件
		$("#menu_update_btn").click(function() {
			var mid = $(this).attr("menu_id");
			//获得form表单数据，包括文件类型的
			var formData = new FormData($("#form_data")[0]);
			//发送AJAX请求
			$.ajax({
				url : "${APP_PATH}/updateMenu/" + mid,
				type : "POST",
				//data:$("#menuUpdateModal form").serialize(),
				data : formData,
				dataType : 'json',
				contentType : false, //必须
				processData : false, //必须
				success : function(result) {
					$("#menuUpdateModal").modal('hide');
				},
			});
			setTimeout(function() {
				$("#form_data").submit();
			}, 500);
		});

		//进行模态框表单校验
		//校验评价的长度
		$("#text_introduce").change(function() {
			check_introduce("#text_introduce")
		});
		//校验价格
		$("#price_update_input").change(function() {
			check_price("#price_update_input")
		});

		function check_onsubmit() {
			var price_flag = check_price("#price_update_input");
			if (price_flag == false) {
				return false;
			}
			var introduce_flag = check_introduce("#text_introduce");
			if (introduce_flag == false) {
				return false;
			}
			return true;
		}

		//检查介绍的长度
		function check_introduce(id) {
			var introduce = $(id).val();
			var len = introduce.length;
			if (len > 10) {
				show_validate_msg(id, "fail", "介绍太长，数据库装不下");
				return false;
			}
			return true;
		}
		//价格校验
		function check_price(id) {
			//reset_css(id);
			var price = $(id).val();
			//alert("价格："+price);
			if (price == null || price == "") {
				show_validate_msg(id, "warning", "金额不能为空");
				return false;
			}
			if (isNaN(price)) {
				show_validate_msg(id, "fail", "只能是数字");
				return false;
			}
			if (price < 0) {
				show_validate_msg(id, "fail", "金额不能小于0");
				return false;
			}
			var reg = new RegExp("^\\d+(\\.\\d{0,2})?$");
			if (!reg.test(price)) {
				show_validate_msg(id, "fail", "只能保留两位小数");
				return false;
			}
			//如果都成功，就清除样式
			reset_form("#menuUpdateModal form");
			return true;
		}
		//
		//每次点击修改都把样式设为默认，防止上次残留
		function reset_form(ele) {
			//[0]使用dom对象的方法
			//$(ele)[0].reset();
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		//显示校验结果的提示信息
		function show_validate_msg(ele, status, msg) {
			//每次清除之前都先清除父元素的样式
			$(ele).parent().removeClass("has-success has-error");
			//提示内容默认是空
			$(ele).next("span").text("");
			if ("success" == status) {
				$(ele).parent().parent().addClass("has-success");
				$(ele).next("span").text(msg);
			} else if ("fail" == status) {
				console.log($(ele));
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
	
		$(document).on("click", ".edit_btn", function() {
			//清除之前的样式
			reset_form("#menuUpdateModal form");
			var mid = $(this).attr("update_id");//得到要修改菜品的主键
			//* alert("对应的ID:"+mid);  category_update_select
			//获得分类信息
			getCategory("#category_update_select");
			//获得菜单信息
			getMenu(mid);
			//给更新按钮设置一个属性
			$("#menu_update_btn").attr("menu_id", mid);
			//打开模态框
			$("#menuUpdateModal").modal({
				backdrop : "static"

			});
		});

		//根据id查询菜品信息，发送AJAX请求
		function getMenu(mid) {
			$.ajax({
				url : "${APP_PATH}/getMenu/" + mid,
				type : "GET",
				success : function(result) {
					console.log(result);
					var menuData = result.extend.menu;
					//给input框赋值，直接用val()
					$("#mname_update_input").val(menuData.mname);
					$("#price_update_input").val(menuData.price);
					$("#menuUpdateModal input[name=mstate]").val(
							[ menuData.mstate ]);
					$("#menuUpdateModal select").val([ menuData.mcId ]);
					$("#my_image").attr("src", menuData.image);
					$("#text_introduce").val(menuData.introduce);
				}
			});
		}
		//查出分类信息
		function getCategory(ele) {
			//清空下拉列表的记忆选择
			$(ele).empty();
			$.ajax({
				url : "${APP_PATH}/getAllCategory",
				type : "GET",
				success : function(result) {
					console.log(result);
					//遍历
					$.each(result.extend.categoryList, function(index, item) {

						var optionEle = $("<option ></option>").append(
								item.cname).attr("value", item.cid);

						//把这个变量添加到这个id指向的标签
						optionEle.appendTo(ele);
					});
				}
			});
		}
		//给图片div注册鼠标经过事件，高亮显示
		$("#imagebox div ").mouseenter(function() {
			$(this).css("opacity", "1").siblings().css("opacity", "0.8");
		});
		//注册鼠标离开事件
		$("#imagebox ").mouseleave(function() {
			$(this).find("div").css("opacity", "1");
		});
	</script>
	<script>
		//JavaScript代码区域
		layui.use('element', function() {
			var element = layui.element;

		});
	</script>

</body>
</html>