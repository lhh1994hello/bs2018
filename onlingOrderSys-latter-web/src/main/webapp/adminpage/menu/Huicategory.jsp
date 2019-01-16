<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	Date thisDay = new Date();
	long time = thisDay.getTime();
	pageContext.setAttribute("TIME", time);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<!-- 引入bootstrap样式-->
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/layui/layui.js"></script>
<link href="${APP_PATH}/static/layui/css/layui.css" rel="stylesheet">
<title>菜单分类操作</title>
<style type="text/css">
tr th {
	text-align: center;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.cate_id {
	width: 70px;
}

.cate_state {
	width: 70px;
}

.cate_cname {
	width: 110px;
}

.cate_time {
	width: 160px;
}

.cate_info {
	width: 140px;
}

#page_info_area {
	font-size: 20px;
	/* border: 2px solid pink; */
	margin-top: 20px;
}

table {
	table-layout: fixed;
}
/* div{
	border:2px solid yellow;
} */
</style>
</head>
<body class="layui-layout-body">
	<!-- 模态框 -->
	<!--模态框，菜品添加信息 -->
	<div class="modal fade" id="categoryAddModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel2">添加分类</h4>
				</div>
				<div class="modal-body">

					<form class="form-horizontal" method="post" id="form_add_data"
						enctype="multipart/form-data"
						action="${APP_PATH}/getCategoryList?time=${TIME}"
						onsubmit="return check_add_onsubmit()">
						<input type="hidden" name="cid" id="cid_add_input" id="add_pn" />
						<input type="hidden" name="pn" value="${pageInfo.pages+1}" />
						<div class="form-group">
							<label for="empName_add_input" class="col-sm-2 control-label">分类名</label>
							<div class="col-sm-10">
								<!-- <p class="form-control-static" id="empName_update_static"></p> -->
								<input type="text" name="cname" class="form-control"
									id="cname_add_input"> <span id="menu_add_span"
									class="help-block"></span>

							</div>
						</div>

						<!--有效性  -->
						<div class="form-group">
							<label class="col-sm-2 control-label">有 效&nbsp;&nbsp;</label>
							<div class="col-sm-4">
								<label class="radio-inline"> <input type="radio"
									name="cstate" id="gender1_add_input" value="1"
									checked="checked"> 是
								</label> <label class="radio-inline"> <input type="radio"
									name="cstate" id="gender2_add_input" value="0"> 否
								</label>
							</div>
						</div>

						<!-- 分类描述 -->
						<div class="form-group">
							<label for="email_add_input" class="col-sm-2 control-label">描述</label>

							<div class="col-sm-10" id="div_pingjia_update_input">
								<!--  <input type="text" name="email" class="form-control" id="intro_update_input" /> -->
								<textarea rows="4" cols="60" name="cinfo" id="text_add_cinfo"></textarea>
								<span id="intro_add_span" class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关&nbsp;闭</button>
					<button type="button" class="btn btn-primary " id="cate_add_btn">添&nbsp;加</button>

				</div>
			</div>
		</div>
	</div>
	<!-- 模态框结束-->
	<!--模态框，菜品修改信息 ##########################################################-->
	<div class="modal fade" id="categoryUpdateModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改分类信息</h4>
				</div>
				<div class="modal-body">

					<form class="form-horizontal" method="post" id="form_data"
						enctype="multipart/form-data"
						action="${APP_PATH}/getCategoryList?time=${TIME}"
						onsubmit="return check_update_onsubmit()">
						<input type="hidden" name="cid" id="cid_update_input" /> <input
							type="hidden" name="pn" value="${pageInfo.pageNum}" />
						<div class="form-group">
							<label for="empName_add_input" class="col-sm-2 control-label">分类名</label>
							<div class="col-sm-10">
								<!-- <p class="form-control-static" id="empName_update_static"></p> -->
								<input type="text" name="cname" class="form-control"
									id="cname_update_input"> <span id="menu_add_span"
									class="help-block"></span>
							</div>
						</div>

						<!-- 菜系选项 -->
						<div class="form-group">
							<label class="col-sm-2 control-label">有 效&nbsp;&nbsp;</label>
							<div class="col-sm-4">
								<label class="radio-inline"> <input type="radio"
									name="cstate" id="gender1_update_input" value="1"
									checked="checked"> 是
								</label> <label class="radio-inline"> <input type="radio"
									name="cstate" id="gender2_update_input" value="0"> 否
								</label>
							</div>
						</div>

						<!-- 分类描述 -->
						<div class="form-group">
							<label for="email_add_input" class="col-sm-2 control-label">描
								述</label>
							<div class="col-sm-10" id="div_pingjia_update_input">
								<!--  <input type="text" name="email" class="form-control" id="intro_update_input" /> -->
								<textarea rows="4" cols="60" name="cinfo" id="text_cinfo"></textarea>
								<span id="intro_add_span" class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关&nbsp;闭</button>
					<button type="button" class="btn btn-primary " id="cate_update_btn">修&nbsp;改</button>

				</div>
			</div>
		</div>
	</div>
	<!-- 模态框结束-->
	<div class="layui-layout layui-layout-admin">
		<%-- <%@ include file="../public/layuihead.jsp"%> --%>
		<!-- <div class="layui-body"> -->
			<!-- 内容主体区域 -->
			<!-- <div style="padding: 15px;"> -->
				<!-- 内容主体区域 -->
				<div class="container">
					<div class="row">

						<div class="row" style="margin-top: 8px; margin-bottom: 20px;">
							<div class="col-md-2 col-md-offset-10">
								<button class="btn btn-primary  btn-sm  add_btn">
									<span class="glyphicon glyphicon-pencil " aria-hidden="true"></span>
									新 增
								</button>
							</div>
						</div>
						<div class="row" id="head1"></div>
						<div class="row" id="body1">
							<div class="col-md-12">
								<table
									class="table table-striped table-hover success  table-bordered">
									<thead>
										<tr class="hover-style1">
											<!-- <th><input type="checkbox" id="checkAll" /></th> -->
											<th class="cate_id">ID</th>
											<th class="cate_cname">类 名</th>
											<th class="cate_state">状 态</th>
											<th class="cate_info">描 述</th>
											<th class="cate_time">时 间</th>
											<th class="cate_state">菜 数</th>
											<th class="cate_info">操 作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${pageInfo.list}" var="cateGory">
											<tr>
												<th class="cate_id">${cateGory.cid}</th>
												<th class="cate_cname">${cateGory.cname}</th>
												<th class="cate_state">${cateGory.cstate}</th>
												<th class="cate_info">${cateGory.cinfo}</th>
												<%-- <th>${cateGory.createtime}</th> --%>
												<th class="cate_time"><fmt:formatDate
														pattern="yyyy-MM-dd  HH:mm:ss"
														value="${cateGory.createtime}" /></th>
												<th class="cate_state">${cateGory.menucount}</th>
												<th class="cate_info">
													<button class="btn btn-primary  btn-sm edit_btn"
														update_id="${cateGory.cid}" id="cate_edit_btn">
														<span class="glyphicon glyphicon-pencil"
															aria-hidden="true"></span> 编辑
													</button>
													<button class="btn btn-danger btn-sm delete_btn"
														delete_id="${cateGory.cid}"
														delete_count="${cateGory.menucount}" id="cate_delete_btn">
														<span class="glyphicon glyphicon glyphicon-trash"
															aria-hidden="true"></span> 删除
													</button>
												</th>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!--  分页信息-->
						<div class="row">
							<div class="col-md-6" id="page_info_area">
								当前第${pageInfo.pageNum}页
								,共${pageInfo.pages}页,共${pageInfo.total}条记录</div>
							<div class="col-md-6">
								<nav aria-label="Page navigation">
								<ul class="pagination">
									<c:choose>
										<c:when test="${pageInfo.hasPreviousPage}">
											<li><a href="${APP_PATH}/getCategoryList?pn=1">首页</a></li>
											<li><a
												href="${APP_PATH}/getCategoryList?pn=${pageInfo.pageNum-1}"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="disabled"><a
												href="${APP_PATH}/getCategoryList?pn=1">首页</a></li>
											<li class="disabled"><a
												href="${APP_PATH}/getCategoryList?pn=${pageInfo.pageNum-1}"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
										</c:otherwise>
									</c:choose>

									<c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
										<c:if test="${pageInfo.pageNum==page_Num}">
											<li class="active"><a href="#">${page_Num}</a></li>
										</c:if>
										<c:if test="${pageInfo.pageNum!=page_Num}">
											<li><a href="${APP_PATH}/getCategoryList?pn=${page_Num}">${page_Num}</a></li>
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when test="${pageInfo.hasNextPage}">
											<li><a
												href="${APP_PATH}/getCategoryList?pn=${pageInfo.pageNum+1}"
												aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											</a></li>
											<li><a
												href="${APP_PATH}/getCategoryList?pn=${pageInfo.pages}">尾页</a></li>
										</c:when>
										<c:otherwise>
											<li class="disabled"><a
												href="${APP_PATH}/getCategoryList?pn=${pageInfo.pageNum+1}"
												aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											</a></li>
											<li class="disabled"><a
												href="${APP_PATH}/getCategoryList?pn=${pageInfo.pages}">尾页</a></li>
										</c:otherwise>
									</c:choose>

								</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			<!-- </div> -->
		<!-- </div> -->

	</div>
<script type="text/javascript">
	//确认框
	<%@ include file="../public/confirmshow.jsp"%>
	var  pageNum= ${pageInfo.pageNum};
	var  pages= ${pageInfo.pages};
	var Exist_flag="0";
	var add_exist_flag="0";
	//更新，提交
	function check_add_onsubmit(){
		//在模态框那里校验过了，不再校验了
		return true;
	}
	
	//删除功能
	$(".delete_btn").click(function(){
		var delete_id=	$(this).attr("delete_id");
		var delete_count=	$(this).attr("delete_count");
		//alert(delete_id+":"+delete_count);
		var info="是否确认删除?";
		if(delete_count>0){
			info ="还有"+delete_count+"道该类菜，"+info;
		}
		confirm(function(id){
			
		},delete_id,info); 
		
		
		
	});
	//删除该分类，
	function delete_category(cid){
		
	}
	//修改,提交
	function check_update_onsubmit(){
		 var cname_flag=  check_cname("#cname_update_input");
		 var cinfo_flag=check_cinfo("#text_cinfo");
			if(cname_flag==false){
				return false;
			}
			if(cinfo_flag==false){
				return false;
			}	
			return true;
	}
	//新增时，点击添加按钮执行添加操作
	$("#cate_add_btn").click(function(){
		//alert("添加");
		    var cname=$("#cname_add_input").val();
		 	var cname_flag=  check_cname("#cname_add_input");
			var cinfo_flag=check_cinfo("#text_add_cinfo");
			if(cname_flag==false){
				return false;
			}
			if(cinfo_flag==false){
				return false;
			}
			//通过标记来确定名称是否重复
			check_NameExist(cname);
			var  add_name_flag= $("#cate_add_btn").attr("add_name_flag");
			if(add_name_flag=="fail"){
				return false;
			}
			//添加信息
			$.ajax({
				url:"${APP_PATH}/addCategory",
				type:"POST",
				data:$("#categoryAddModal form").serialize(),
				success:function(result){
					//关闭模态框
					$("#categoryAddModal").modal('hide');		
				}
			});
			//让表单再执行请求
			setTimeout(function() {
				$("#form_add_data").submit();					
			},100);	
			
		
	});
	
	//点击新增按钮弹出模态框
	$(document).on("click", ".add_btn", function() {
		reset_form("#categoryAddModal form");
		$("#categoryAddModal form")[0].reset();
		$("#categoryAddModal").modal({
			backdrop : "static"
		});
	});
	
	
	//给编辑按钮绑定事件
	$(document).on("click", ".edit_btn", function() {
		reset_form("#categoryUpdateModal form");
		var cid = $(this).attr("update_id");
		$(this).attr("cate_id",cid);
		//根据主键，得到实体类
		getCategory(cid);
		$("#categoryUpdateModal").modal({
			backdrop : "static"

		});
	});
	//给修改按钮注册点击事件
	$("#cate_update_btn").click(function() {
		 var cname_flag=  check_cname("#cname_update_input");
		 var cinfo_flag=check_cinfo("#text_cinfo");
		if(cname_flag==false){
			return false;
		}
		if(cinfo_flag==false){
			return false;
		}	
		if(Exist_flag=="1"){
			return false;
		}
		//发送请求，执行修改操作
		$.ajax({
			url:"${APP_PATH}/updateCategory",
			type:"POST",
			data:$("#categoryUpdateModal form").serialize(),
			success:function(result){
				//关闭模态框
				$("#categoryUpdateModal").modal('hide');		
			}
		});
		//让表单再执行请求
		setTimeout(function() {
			$("#form_data").submit();					
		},100);	
	});
	
	//这个方法用来检查名称是否已经存在
	function check_NameExist(cname){
		var code_num="0";
		$.ajax({
			url:"${APP_PATH}/checkcname",
			type:"POST",
			 async :false,//改成同步
			data:"cname="+cname,
			success:function(result){
				/* alert(result.code); */
				if(result.code==100){
					add_name_flag="success";
					
				}else{
					show_validate_msg("#cname_add_input","fail",result.extend.va_msg);
					add_name_flag="fail";
				}
			}
		});
		$("#cate_add_btn").attr("add_name_flag",add_name_flag);
	}
	//当用户状态改变后
	$("#cname_update_input").change(function(){
		check_cname("#cname_update_input");
		//使用AJAX检查名称是否已经被使用了
		var cname=$("#cname_update_input").val();
		$.ajax({
			url:"${APP_PATH}/checkcname",
			type:"POST",
			data:"cname="+cname,
			success:function(result){
				if(result.code==100){
					// show_validate_msg("#cname_update_input","success","用户可用");
					Exist_flag="0";
				}else{
					show_validate_msg("#cname_update_input","fail",result.extend.va_msg);
					Exist_flag="1";
				}
			}
		});
	});
	

	$("#text_cinfo").change(function(){
		check_cinfo("#text_cinfo");
	});
	
	//检查分类名
	function check_cname(id){
		var cname= $(id).val();
		//alert("cname:"+cname);
		if(cname==null||cname==""){
			show_validate_msg(id, "fail", "分类名不能为空")
			return false;
		}
		var regName=/^[\u4E00-\u9FA5]{2,10}$/;
		 if(!regName.test(cname)){
			 show_validate_msg(id,"fail","分类名必须是中文，且在2到10个汉字");
			 return false;
		 }
		 //检查是否重复
		 
		 
			reset_form("#categoryUpdateModal form")
			return true;
	}
	function check_cinfo(id){
		var cinfo= $(id).val();
		var cinfo_length=cinfo.length;
		if(cinfo_length>20){
			 show_validate_msg(id,"fail","描述信息太长了");
			 return false;
		}
		reset_form("#categoryUpdateModal form");
		return true;
	}
	//得到分类信息
	function getCategory(cid) {
		$.ajax({
			url : "${APP_PATH}/getCategory/" + cid,
			type : "GET",
			success : function(result) {
				console.log(result);
				var menuData = result.extend.category;
				//给input框赋值，直接用val()
				$("#cid_update_input").val(menuData.cid);
				$("#cname_update_input").val(menuData.cname);
				$("#text_cinfo").val(menuData.cinfo);
				$("#categoryUpdateModal input[name=cstate]").val([ menuData.cstate]);
				$("#categoryUpdateModal select").val([ menuData.mcId ]);

			}
		});
	}
	//

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
	function reset_form(ele) {
		//[0]使用dom对象的方法
		//$(ele)[0].reset();
		$(ele).find("*").removeClass("has-error has-success");
		$(ele).find(".help-block").text("");
	}
 </script>
	<script>
		//JavaScript代码区域
		layui.use('element', function() {
			var element = layui.element;

		});
	</script>

</body>
</html>