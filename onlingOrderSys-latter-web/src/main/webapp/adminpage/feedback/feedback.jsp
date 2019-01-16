<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <%@ include file="../public/menuCssJs.jsp"%> --%>
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/static/h-ui.admin/css/style.css" />
<!-- 拼图 -->
<script src="${APP_PATH}/static/pintuer/jquery.js"></script>
<script src="${APP_PATH}/static/pintuer/pintuer.js"></script>
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/pintuer/pintuer.css" />


<title>反馈列表</title>
<style>
	#nav_area{
		/* background-color: pink; */
		height:30px;
	}
	#nav_area_info{
		margin-top:20px;
		height: 28px;
		float: left;
		width: 400px;
		font-size: 20px;
		/* padding-left: 30px; */
	} 

	#member_tbody_area td{
		 vertical-align: middle;
    	text-align: center;  
 	}
</style>
</head>
<body>
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 评论管理 <span class="c-gray en">&gt;</span> 意见反馈 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" style="width:250px" placeholder="输入关键词" id="stext" name="">
		<button type="submit" class="btn btn-success radius" id="search_button" name="">
		<i class="Hui-iconfont">&#xe665;</i> 搜意见</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="javascript:;"  id="del_batch" class="btn btn-danger radius">
				<i class="Hui-iconfont">&#xe6e2;</i> 批量删除
			</a> 
		</span> 
		<span class="r">共有数据：
			<strong id="strong_total">88</strong>条
		</span> 
	</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value="" id="checkAll"></th>
					<th width="100">ID</th>
					<th width="60">用户名</th>
					<th>留言内容</th>
					<th width="100">操作</th>
				</tr>
			</thead>
			<tbody id="member_tbody_area">
				<tr class="text-c">
					<td>
						<input type="checkbox" value="1" name="">
					</td>
					<td>1</td>
					<td>
						<a href="javascript:;" onclick="member_show('张三','member-show.html','10001','360','400')">
							<i class="avatar size-L radius">
								<img alt="" src="${APP_PATH}/images/default/avatar-default-S.gif">
							</i>
						</a>
					</td>
					<td class="text-l"><div class="c-999 f-12">
							<u style="cursor:pointer" class="text-primary" onclick="member_show('张三','member-show.html','10001','360','400')">张三</u> <time title="2014年8月31日 下午3:20" datetime="2014-08-31T03:54:20">2014-8-31 15:20</time> <span class="ml-20">13000000000</span> <span class="ml-20">admin@mail.com</span></div>
							<div class="f-12 c-999"><a href="http://www.h-ui.net/Hui-4.22-comment.shtml" target="_blank">http://www.h-ui.net/Hui-4.22-comment.shtml</a></div>
						<div>留言内容</div>
					</td>
					<td class="td-manage">
						<a title="编辑" href="javascript:;" onclick="member_edit('编辑','member-add.html','4','','510')" style="text-decoration:none">
							<i class="Hui-iconfont">&#xe6df;</i>
						</a> 
						<a title="删除" href="javascript:;" onclick="member_del(this,'1')" class="ml-5" style="text-decoration:none">
							<i class="Hui-iconfont">&#xe6e2;</i>
						</a>
					</td>
				</tr>
			 
			</tbody>
		</table>
		<div style="height: 10px;width: auto;"></div>
		<div id="nav_area">
			
			<div id="nav_area_info">导航区域。。。</div>
			
			<div id="page_nav_area_A" style="float: right;">
 				<ul class="pagination pagination-group border-main">
					<li><a href="#">上一页</a> </li>
	    			<li class="disabled"><a href="#">«</a> </li>
	   	 			<li><a href="#">1</a> </li>
	   				<li class="active"><a href="#">2</a> </li>
	    			<li><a href="#">3</a> </li>
	    			<li><a href="#">4</a> </li>
	   				<li><a href="#">5</a> </li>
	    			<li><a href="#">»</a> </li>
	    			 <li><a href="#">下一页</a> </li>
				</ul>
				
			</div>
			
		</div>
	</div>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/layer/2.4/layer.js"></script>  
<script type="text/javascript" src="${APP_PATH}/static/hui/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${APP_PATH}/static/hui/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$(function(){
	 <%@ include file="../public/confirmshow.jsp" %>
	//填充数据
	var currentPage="1";
	var totalRecord="1";
	var beginTime="";
	var endTime="";
	var stext="";
	var pageSize=5;
	//解析数据
	findFeedbackList();
	function findFeedbackList(){
		$.ajax({
			url:"${APP_PATH}/findFeedbackList",
			data:{"pn":currentPage,"beginTime":beginTime,"endTime":endTime,"stext":stext,"pageSize":pageSize},
			type : "POST",
			success:function(result){
				var code=result.code;
				formElement(result);
				page_nav_area(result);
				page_info_area(result);
			}
		});
	}
	
	$("#search_button").click(function(){
		//alert("搜...");
		beginTime=$("#datemin").val();
		endTime=$("#datemax").val();
		stext=$("#stext").val();
		//alert("beginTime:"+beginTime+",endTime:"+endTime+",stext:"+stext);
		findFeedbackList();
	});
	
	//批量删除
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
			info="确认删除:"+del_idstr+" 吗?"
		 }
 		 confirm(function(){
		     //在这里写删除逻辑，点击确认执行这里的代码 	
		    // delete_user(del_idstr);
			 //delete_feedback(fid);
			 if(num>0){
				 delete_feedback(del_idstr);
 			 }
		  },"",info);
	});
	
	//
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
	
	function page_info_area(result){
		var pageInfo=result.extend.pageInfo;
		$("#nav_area_info").empty();
		var total=pageInfo.total;
		$("#strong_total").text("").append(total);
		currentPage=pageInfo.pageNum;
		var pages= pageInfo.pages;
		
		$("#nav_area_info").append("页码信息:").append(currentPage).append("/").append(pages);
	}
	
	//填充导航数字
	function page_nav_area(result){
		$("#page_nav_area_A").empty();
		var pageInfo=result.extend.pageInfo;
 		var ul=$("<ul></ul>").addClass("pagination pagination-group border-main");
 		var firstPageLi=$("<li></li>").append($("<a></a>").append("首 页").attr("href","javascript:void(0);"));
 		var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;").attr("href","javascript:void(0);"));
 		if(!pageInfo.hasPreviousPage){
			firstPageLi.addClass("disabled");
        	prePageLi.addClass("disabled");
		}else {
			firstPageLi.click(function(){
				currentPage="1";
				findFeedbackList();
			});
			 prePageLi.click(function(){
				 currentPage=currentPage-1;
				 findFeedbackList();
	         });
		}
 		ul.append(firstPageLi).append(prePageLi);
 		//循环开始
 		$.each(pageInfo.navigatepageNums,function(index,item){
 			var numLi=$("<li></li>").append($("<a></a>").append(item).attr("href","javascript:void(0);"));
 			if(pageInfo.pageNum==item){
				numLi.addClass("active");
			}
 			numLi.click(function(){
				currentPage=item;
				findFeedbackList();
			});
			ul.append(numLi);
 			
 		});
 		//页尾和下一页
		var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;").attr("href","javascript:void(0);"));
		var lastPageLi=$("<li></li>").append($("<a></a>").append("尾 页").attr("href","javascript:void(0);"));
		if(!pageInfo.hasNextPage){
			nextPageLi.addClass("disabled");
			lastPageLi.addClass("disabled");
		}else{
			//下一页点击事件鼠标点击事件,当有下一页的时候才绑定
			nextPageLi.click(function(){
				currentPage=currentPage+1;
				findFeedbackList();
			});
			lastPageLi.click(function(){
				currentPage=pageInfo.pages;
				findFeedbackList();
			});
		}
		ul.append(nextPageLi).append(lastPageLi);
 		$("#page_nav_area_A").append(ul);
	}
	//填充主要内容区域
	function formElement(result){
		$("#member_tbody_area").html("");
		var feedbackList=result.extend.pageInfo.list;
		$.each(feedbackList,function(index,feedback){
			var user= feedback.user;
			var username=user.uLoginid;
			var uNickname=user.uNickname;
			if(uNickname!=""){
				username=uNickname;
			}
			console.log(feedback);
			var tr=$("<tr></tr>").addClass("text-c");
			//style="text-align:center;vertical-align:middle"
			var checkInput=$("<input />").attr("type","checkbox").addClass("checkAll_item").css("text-align","center").css("vertical-align","middle");
			//复选框
			var checkTd=$("<td></td>").append(checkInput);
			//ID
			var fidTd=$("<td></td>").append(feedback.fid);
			//头像
			var imgTd=$("<td></td>");
			var imgTd_A=$("<a href='javascript:;'></a>");
			var imgTd_A_I=$("<i class='avatar size-L radius'></i>");
			var imgTd_A_I_img=$("<img />").attr("alt",username).attr("src","${APP_PATH}/images/default/avatar-default-S.gif");
			if(user.image!=""){
				imgTd_A_I_img.attr("src",user.image);
			}
			if(user.image=="0000"){
				imgTd_A_I_img.attr("src","${APP_PATH}/images/default/avatar-default-S.gif");
			}
			//注册点击事件
			imgTd_A.click(function(){
				member_show(user.uNickname,'${APP_PATH}/adminpage/member/member-show.jsp?uId='+user.uId,user.uId,'360','450')
			});
			imgTd_A_I.append(imgTd_A_I_img);
			imgTd_A.append(imgTd_A_I);
			imgTd.append(imgTd_A);
			//下一个td 留言内容
			var infoTd=$("<td class='text-l'></td>");
			var div_A=$("<div class='c-999 f-12'></div>");
			
			var div_A_U=$("<u style='cursor:pointer' class='text-primary'></u>").append(username);
			div_A_U.click(function(){
				member_show(user.uNickname,'${APP_PATH}/adminpage/member/member-show.jsp?uId='+user.uId,user.uId,'360','450')
			});
			var div_A_Time=$("<time></time>").attr("title",feedback.createtime).attr("datetime",feedback.createtime).text("").append(feedback.createtime);
			var div_A_SpanPhone=$("<span class='ml-20'></span>").append(feedback.userphone);
			var div_A_SpanEmail=$("<span class='ml-20'></span>").text("").append(user.uEmail);
			div_A.append(div_A_U).append(div_A_Time).append(div_A_SpanPhone).append(div_A_SpanEmail);
			
			var div_B=$("<div class='f-12 c-999'></div>");
			var div_B_A=$("<a></a>").attr("href","http://www.h-ui.net/Hui-4.22-comment.shtml").attr("target","_blank").append("http://www.h-ui.net/Hui-4.22-comment.shtml");
			div_B.append(div_B_A);
			//substance
			var info_substance="";
			var substance=feedback.substance;
			if(substance=="")
				info_substance="没有留言!";
			info_substance=substance;
			var div_C=$("<div></div>").append(info_substance);
			infoTd.append(div_A).append(div_B).append(div_C);
			
			//操作按钮
			var manageTd=$("<td class='td-manage'></td>");
			var del_A=$("<a class='ml-5' href='javascript:;' style='text-decoration:none'></a>");
			var del_A_I=$("<a class='Hui-iconfont'>&#xe6e2;</a>");
			del_A.append(del_A_I);
			del_A.click(function(){
				member_del(this,feedback.fid);
			});
			manageTd.append(del_A);
			tr.append(checkTd).append(fidTd).append(imgTd).append(infoTd).append(manageTd);
			$("#member_tbody_area").append(tr);
		});
		
	}
	
	
	function member_del(obj,id){
		layer.confirm('确认要删除吗？',function(index){
			//alert("id："+id);
			layer.close(index);
			var fid=id;
			delete_feedback(fid);
		});
	}
	function delete_feedback(fid){
 		if(fid==""){
			return false;
		}
		$.ajax({
			url:"${APP_PATH}/deleteFeedback",
			data:{"fid":fid},
			dataType: 'json',
			type:"POST",
			success:function(result){
				var code=result.code;
				if(code=="100"){
					//alert("删除:执行成功");
					$("#checkAll").prop("checked",false);
					findFeedbackList();
				}
			}
		});
	}
	/* function member_del(obj,id){
		layer.confirm('确认要删除吗？',function(index){
			layer.close(index);
			$.ajax({
				type: 'POST',
				url: '',
				dataType: 'json',
				success: function(data){
					$(obj).parents("tr").remove();
					layer.msg('已删除!',{icon:1,time:1000});
				},
				error:function(data) {
					console.log(data.msg);
				},
			});		
		});
	} */
	/* ************************************** */
});
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*用户-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}

/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!',{icon: 6,time:1000});
	});
}
/*用户-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*密码-修改*/
function change_password(title,url,id,w,h){
	layer_show(title,url,w,h);	
}
/*用户-删除*/

</script>
</body>
</html>