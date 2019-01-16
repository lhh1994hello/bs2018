<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../public/menuCssJs.jsp"%>
<%-- <link rel="Bookmark" href="${APP_PATH}/static/hui/favicon.ico" > --%>

<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/static/hui/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/static/hui/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/static/hui/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/static/hui/static/h-ui.admin/skin/default/skin.css"
	id="skin" />
<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/static/hui/static/h-ui.admin/css/style.css" />
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript"
		src="${APP_PATH}/static/hui/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${APP_PATH}/static/hui/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript"
		src="${APP_PATH}/static/hui/static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript"
		src="${APP_PATH}/static/hui/static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="${APP_PATH}/static/hui/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="${APP_PATH}/static/hui/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="${APP_PATH}/static/hui/lib/laypage/1.2/laypage.js"></script>
<title>会员列表</title>
<style type="text/css">
	#member_tbody_area td{
		 vertical-align: middle;
    	text-align: center;  
 	}
</style>
</head>
<body>
	<nav class="breadcrumb">
	<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
	用户中心 <span class="c-gray en">&gt;</span> 用户管理 <a
		class="btn btn-success radius r"
		style="line-height: 1.6em; margin-top: 3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<div class="text-c">
			日期范围： <input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })"
				id="datemin" class="input-text Wdate" style="width: 120px;">
			- <input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })"
				id="datemax" class="input-text Wdate" style="width: 120px;">
			<input type="text" class="input-text" style="width: 250px" placeholder="输入会员名称、电话、邮箱" id="stext" name="">
				
			<button type="submit" class="btn btn-success radius" id="search_member" name="">
				<i class="Hui-iconfont">&#xe665;</i> 搜用户
			</button>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"> 
				<a href="javascript:;" id="del_batch" class="btn btn-danger radius">
					<i class="Hui-iconfont">&#xe6e2;</i>
					批量删除
				</a> 
				<a href="javascript:;" onclick="member_add('添加用户','member_add.jsp','','550')" class="btn btn-primary radius"> 
					<i class="Hui-iconfont">&#xe600;</i>添加用户
				</a>
			</span> 
			<span class="r">共有数据：<strong id="total_num">88</strong> 条</span>
		</div>
		<div class="mt-20">
			<!-- *********************************************************************** -->
			<div id="DataTables_Table_0_wrapper"
				class="dataTables_wrapper no-footer">
				<div class="dataTables_length" >
					<label>显示
					 <select name="pageSize" class="select" id="select_pageSise" style="width: 70px; height:25px; padding: 0 0 0 15px;">
						 <option value="5">&nbsp;5</option>
						 <option value="10">10</option>
						 <option value="15">15</option>
						 <option value="20">20</option>
						 <option value="30">30</option>
					 </select> 条
					</label>
				</div>
			</div>
			<!-- ************************************************************************* -->
			<table class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="25">
							<input type="checkbox"  id="checkAll" />
						</th>
						<th width="80">ID</th>
						<th width="100">用户名</th>
						<th width="40">性别</th>
						<th width="90">手机</th>
						<th width="150">邮箱</th>
						<th width="">地址</th>
						<th width="130">加入时间</th>
						<th width="70">状态</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<tbody id="member_tbody_area">
				<!-- ******************************************************************************** -->
					<!-- <tr class="text-c">
						<td><input type="checkbox" value="1" name=""></td>
						<td>1</td>
						<td>
							<u style="cursor: pointer" class="text-primary"
							onclick="member_show('张三','member-show.jsp','10001','360','400')">张三</u>
						</td>
						<td>男</td>
						<td>13000000000</td>
						<td>admin@mail.com</td>
						<td class="text-l">北京市 海淀区</td>
						<td>2014-6-11 11:11:42</td>
						<td class="td-status">
							<span class="label label-success radius">已启用</span>
						</td>
						<td class="td-manage"> 
								<a style="text-decoration: none" onClick="member_stop(this,'10001')" href="javascript:;"
									title="停用"><i class="Hui-iconfont">&#xe631;</i>
								</a> 
								<a title="编辑" href="javascript:;"
									onclick="member_edit('编辑','member-add.jsp','4','800','510')"
									class="ml-5" style="text-decoration: none">
									<i class="Hui-iconfont">&#xe6df;</i>
								</a> 
								<a style="text-decoration: none" class="ml-5"
									onClick="change_password('修改密码','change-password.jsp','10001','600','270')"
									href="javascript:;" title="修改密码">
									<i class="Hui-iconfont">&#xe63f;</i>
								</a>
								<a title="删除" href="javascript:;" onclick="member_del(this,'1')"
									class="ml-5" style="text-decoration: none">
									<i class="Hui-iconfont">&#xe6e2;</i>									
								</a>
						</td>
					</tr> -->
					<!--**************************************************************************************  -->
				</tbody>
			</table>
			<!-- ****************************************** -->
			<div class="col-md-3" id="page_info_area" style="font-size: 18px; "></div>
			<!-- <div class="col-md-2" style="background-color: orange;">到第10页</div> -->
			<div class="col-md-5 col-md-offset-2" id="page_nav_area">
				<!-- 导航条 -->
			</div>
			<!-- ******************************************** -->
		</div>
	</div>


	<script type="text/javascript">
	 <%@ include file="../public/confirmshow.jsp" %>
		$(function() {
			//用户状态码 ，默认查询所有
			var uState="-100";
			//记录当前页
			var currentPage="1";
			var totalRecord="1";
			var beginTime="";
			var endTime="";
			var stext="";
			var pageSize=5;
			findUserList();
			//单个删除选项
			function member_del(obj,id){
				layer.confirm('确认要删除吗？',function(index){
					layer.close(index);
					var uId=id;
					delete_user(uId);
				});
			}
			//批量删除 checkAll_item checkAll
			$("#del_batch").click(function(){
				var Nickname=""; 
				var del_idstr="";
				//遍历
				$.each($(".checkAll_item:checked"),function(){
					Nickname+=$(this).parents("tr").find("td:eq(2)").text()+",";
				     del_idstr+=$(this).parents("tr").find("td:eq(1)").text()+"-";
				});
				Nickname=Nickname.substring(0,Nickname.length-1);
				del_idstr=del_idstr.substring(0,del_idstr.length-1);
				var info="";
				var num=$(".checkAll_item:checked").length;
				if(num<1){
					 info="没有选择用户！！！";
				 }else{
					info="确认删除:"+Nickname+" 吗?"
				 }
				 confirm(function(){
				     //在这里写删除逻辑，点击确认执行这里的代码 	
				     delete_user(del_idstr);
					 
				    },"",info);
			});
			
			//执行假删除的方法
			function delete_user(uId){
				if(uId==""){
					return false;
				}
				$.ajax({
					url:"${APP_PATH}/updateUserState",
					type:"POST",
					data:{"uId":uId,"uState":"2"},
					success:function(result){
						findUserList();
						$("#checkAll").prop("checked",false);
						//弹框提示...
						$.Huimodalalert("删除成功!!!",2000);
					}
				});
			}
			//当点击表格头的复选框的时候
			$("#checkAll").click(function(){
			   var flag=$(this).prop("checked");
				$(".checkAll_item").prop("checked",flag);
			});
			
			//判断复选框被选中了几个
			$(document).on("click",".checkAll_item",function(){
			    var num=$(".checkAll_item:checked").length;
			   	if(num==$(".checkAll_item").length){
			   		$("#checkAll").prop("checked",true);
			   	}else{
			   		$("#checkAll").prop("checked",false);
			   	}
			});
			//条件查询
			$("#search_member").click(function(){
				beginTime=$("#datemin").val();
				endTime=$("#datemax").val();
				stext=$("#stext").val();
				//alert("beginTime:"+beginTime+",endTime:"+endTime+",stext:"+stext);
				findUserList();
			});
			//下拉列表改变显示的数量
			$("#select_pageSise").change(function(){
				pageSize=$("#select_pageSise").val();
				//alert("数量:"+pageSize);
				findUserList();
			});
			//member_tbody_area
			function findUserList(){
				//findUserList
				$.ajax({
					url:"${APP_PATH}/findUserList",
					data:{"uState":uState,"pn":currentPage,"beginTime":beginTime,"endTime":endTime,"stext":stext,"pageSize":pageSize},
					type : "POST",
					success:function(result){
						//填充页面
						formElement(result);
						page_nav_area(result);
						page_info_area(result)
					}
				});
			}
			
			//解析导航信息:
			function page_info_area(result){
				var pageInfo=result.extend.pageInfo;
				$("#page_info_area").empty();
				var pageNumFont=$("<font></font>").css("color","red").append(pageInfo.pageNum);;
				$("#page_info_area").append("第");
				$("#page_info_area").append(pageNumFont);
				$("#page_info_area").append("页,");
				$("#page_info_area").append("共");
				var pagesFont=$("<font></font>").css("color","red").append(pageInfo.pages);
				$("#page_info_area").append(pagesFont);
				$("#page_info_area").append("页");
				var totalsFont=$("<font></font>").css("color","red").append(pageInfo.total);
				$("#page_info_area").append("共");
				$("#page_info_area").append(totalsFont);
				$("#page_info_area").append("条记录");
				$("#total_num").text("").text(pageInfo.total);
				currentPage=pageInfo.pageNum;
			}
			//解析分页条目
			function page_nav_area(result){
				var pageInfo=result.extend.pageInfo;
				$("#page_nav_area").empty();
				var nav=$("<nav></nav>").attr("aria-label","Page navigation");
				var ul=$("<ul></ul>").addClass("pagination").css("display","block").css("margin-top","-20px");
				var firstPageLi=$("<li></li>").append($("<a></a>").append("首 页").attr("href","#"));
				var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
				//如果没有前一页，设置首页和前一页不可点击
				if(!pageInfo.hasPreviousPage){
					firstPageLi.addClass("disabled");
	            	prePageLi.addClass("disabled");
				}else {
					firstPageLi.click(function(){
						currentPage="1";
						findUserList();
					});
					 prePageLi.click(function(){
						 currentPage=currentPage-1;
						 findUserList();
			         });
				}
				ul.append(firstPageLi).append(prePageLi).append();
				//遍历
				$.each(pageInfo.navigatepageNums,function(index,item){
					var numLi=$("<li></li>").append($("<a></a>").append(item).attr("href","#"));
					if(pageInfo.pageNum==item){
						numLi.addClass("active");
					}
					numLi.click(function(){
						currentPage=item;
						findUserList();
					});
					ul.append(numLi);
				});
				//页尾和下一页
				var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
				var lastPageLi=$("<li></li>").append($("<a></a>").append("尾 页").attr("href","#"));
				if(!pageInfo.hasNextPage){
					nextPageLi.addClass("disabled");
					lastPageLi.addClass("disabled");
				}else{
					//下一页点击事件鼠标点击事件,当有下一页的时候才绑定
					nextPageLi.click(function(){
						currentPage=currentPage+1;
						findUserList();
					});
					lastPageLi.click(function(){
						currentPage=pageInfo.pages;
						findUserList();
					});
				}
				ul.append(nextPageLi).append(lastPageLi);
				var navEle= nav.append(ul);
				navEle.appendTo("#page_nav_area");
			}
			//填充数据内容
			function formElement(result){
				$("#member_tbody_area").html("");
				var userList=result.extend.pageInfo.list;
				$.each(userList,function(index,user){
					
					console.log(user);
					var tr=$("<tr></tr>").addClass("text-c");
					var checkInput=$("<input />").attr("type","checkbox").addClass("checkAll_item");
					var checkTd=$("<td></td>").append(checkInput);
					var uidTd=$("<td></td>").append(user.uId);
					var nameU=$("<u></u>").addClass("text-primary").css("cursor","pointer").append(user.uNickname);
					nameU.click(function(){
						member_show(user.uNickname,'member-show.jsp?uId='+user.uId,user.uId,'360','450');
					});
					var nameTd=$("<td></td>").append(nameU);
					var sexTd=$("<td></td>").append(user.uSex);
					var phoneTd=$("<td></td>").append(user.uPhone);
					var emailTd=$("<td></td>").append(user.uEmail);
					var addressTd=$("<td></td>").append(user.uAddress).css("width","90px");
					var registTimeTd=$("<td></td>").append(user.uRegisttime);
					var uState=user.uState;
					var uStateInfo=user.uState;
					var flagTd_span=$("<span></span>");
					var titleInfo="";
					if(uState==1){
						uStateInfo="已启用";
						titleInfo="停用";
						flagTd_span.addClass("label label-success radius").append(uStateInfo);
					}else if(uState==0){
						uStateInfo="已停用"
							titleInfo="启用";
						flagTd_span.addClass("label label-danger radius").append(uStateInfo);
					}else {
						flagTd_span.addClass("label label-danger radius").append("异常");
					}
					//.addClass("label label-success radius")
					//var flagTd_span=$("<span></span>").append(uStateInfo);
					var flagTd=$("<td></td>").addClass("td-status").append(flagTd_span);
					//操作按钮
					var operateTd=$("<td></td>").addClass("td-manage");
					
					var stop_a_i=$("<i></i>").addClass("Hui-iconfont").append("&#xe631;");
					
					
					var stop_a=$("<a></a>").css("text-decoration","none").attr("href","#").attr("title",titleInfo).append(stop_a_i).attr("stateFlag","-100");
					
					stop_a.click(function(){
						var stateFlag =parseInt($(this).attr("stateFlag"));
						//alert(stateFlag)
						if(stateFlag==-100){
							if(uState==1) member_stop(this,user.uId);
							if(uState==0) member_start(this,user.uId);	
						}else{
							if(stateFlag==0) member_start(this,user.uId);
							if(stateFlag==1) member_stop(this,user.uId);
						}
					});
					var edit_a_i=$("<i></i>").addClass("Hui-iconfont").append("&#xe6df;");
					var edit_a=$("<a></a>").addClass("ml-5").css("text-decoration","none").attr("href","#").attr("title","编 辑").append(edit_a_i);
					edit_a.click(function(){
						member_edit('编辑','member_edit2.jsp?uId='+user.uId,user.uId,'800','530');
					});
					
					var change_a_i=$("<i></i>").addClass("Hui-iconfont").append("&#xe63f;");
					var change_a=$("<a></a>").addClass("ml-5").css("text-decoration","none").attr("href","#").attr("title","修改密码").append(change_a_i);
					change_a.click(function(){
						change_password('修改密码','change-password.jsp?uId='+user.uId,user.uId,'500','320');
					});
					
					var delete_a_i=$("<i></i>").addClass("Hui-iconfont").append("&#xe6e2;");
					var delete_a=$("<a></a>").addClass("ml-5").css("text-decoration","none").attr("href","#").attr("title","删 除").append(delete_a_i);
					delete_a.click(function(){
						member_del(this,user.uId);
					});
					operateTd.append(stop_a).append(edit_a).append(change_a).append(delete_a);
					
					//console.log(operateTd.html());
					tr.append(checkTd).append(uidTd).append(nameTd).
						append(sexTd).append(phoneTd).append(emailTd).append(addressTd).append(registTimeTd).append(flagTd).append(operateTd);
					$("#member_tbody_area").append(tr);
					
				});
				
			}
			//
			//**************************************************
			/*  $('.table-sort').dataTable({
			 "aaSorting": [[ 1, "desc" ]],//默认第几个排序
			 "bStateSave": true,//状态保存
			 "aoColumnDefs": [
			 //{"bVisible": false, "aTargets": [ 3 ]}, //控制列的隐藏显示
			 {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
			 ]
			 }); */
			

		});
		/*用户-添加*/
		function member_add(title, url, w, h) {
			layer_show(title, url, w, h);
		}
		/*用户-查看*/
		function member_show(title,url,id,w,h){
			layer_show(title,url,w,h);
		}
		/*用户-停用*/
		function member_stop(obj,id){
			var uState="0";
			layer.confirm('确认要停用吗？',function(index){
				layer.close(index);
				//alert(id);
				$.ajax({
					type: 'POST',
					url: '${APP_PATH}/updateUserState',
					dataType: 'json',
					data:{"uId":id,"uState":uState},
					success: function(data){
						$(obj).parent("td").prev("td").children("span").removeClass("label label-success radius").addClass("label label-danger radius").text("").append("已停用");
						$(obj).attr("stateFlag","0");
						$(obj).attr("title","启用");
					},
					error:function(data) {
						console.log(data.msg);
					},
				});		
			});
		}

		/*用户-启用*/
		function member_start(obj,id){
			var uState="1";
			layer.confirm('确认要启用吗？',function(index){
				layer.close(index);
				$.ajax({
					type: 'POST',
					url: '${APP_PATH}/updateUserState',
					dataType: 'json',
					data:{"uId":id,"uState":uState},
					success: function(data){
						$(obj).attr("stateFlag","1");
						$(obj).parent("td").prev("td").children("span").removeClass("label label-danger radius").addClass("label label-success radius").text("").append("已启用");
						$(obj).attr("title","停用");
					},
					error:function(data) {
						console.log(data.msg);
					},
				});
			});
		}
		/*用户-编辑*/
		function member_edit(title,url,id,w,h){
			//$("#beizhu").text("ASDFGHJKL:");
			layer_show(title,url,w,h);
		}
		/*密码-修改*/
		function change_password(title,url,id,w,h){
			//alert("修改密码")
			layer_show(title,url,w,h);	
		}
		/*用户-删除*/
		/* function member_del(obj,id){
			layer.confirm('确认要删除吗？',function(index){
				layer.close(index);
				var uId=id;
			});
		} */
	</script>
</body>
</html>