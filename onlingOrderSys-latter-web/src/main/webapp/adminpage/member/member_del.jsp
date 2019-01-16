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
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/static/h-ui.admin/css/style.css" />
<title>删除的用户</title>
<style type="text/css">
	#member_tbody_area td{
		 vertical-align: middle;
    	text-align: center;  
 	}
</style>
</head>
<body>
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 删除的用户<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" style="width:250px" placeholder="输入会员名称、电话、邮箱" id="stext" name="">
		<button type="submit" class="btn btn-success radius" id="search_member" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="javascript:;" id="del_batch" class="btn btn-danger radius">
			<i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
		</span> 
		<span class="l" style="margin-left: 10px;">
			<a href="javascript:;" id="rev_batch" class="btn btn-success radius">
			<i class="Hui-iconfont">&#xe66b;</i> 批量还原</a> 
		</span>
		<span class="r">共有数据：
		<strong id="total_strong">88</strong> 条</span> 
	</div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value="" id="checkAll"></th>
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
			<tr class="text-c">
				<td><input type="checkbox" value="1" name=""></td>
				<td>1</td>
				<td><u style="cursor:pointer" class="text-primary" onclick="member_show('张三','member-show.html','10001','360','400')">张三</u></td>
				<td>男</td>
				<td>13000000000</td>
				<td>admin@mail.com</td>
				<td class="text-l">北京市 海淀区</td>
				<td>2014-6-11 11:11:42</td>
				<td class="td-status"><span class="label label-danger radius">已删除</span></td>
				<td class="td-manage">
					<a style="text-decoration:none" href="javascript:;" onClick="member_huanyuan(this,'1')" title="还原">
					<i class="Hui-iconfont">&#xe66b;</i></a> 
					<a title="删除" href="javascript:;" onclick="member_del(this,'1')" class="ml-5" style="text-decoration:none">
					<i class="Hui-iconfont">&#xe6e2;</i></a>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="col-md-3" id="page_info_area" style="font-size: 18px;"></div>
	<div class="col-md-5 col-md-offset-4" id="page_nav_area">
				<!-- 导航条 -->
	</div>
	
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/hui/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${APP_PATH}/static/hui/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/laypage/1.2/laypage.js"></script> 
<script type="text/javascript">
<%@ include file="../public/confirmshow.jsp" %>
$(function(){
	var currentPage="1";
	var totalRecord="1";
	var beginTime="";
	var endTime="";
	var stext="";
	var pageSize=5;
	
	findUserList();
	//填充数据
	function findUserList(){
		uState="2";
		$.ajax({
			url:"${APP_PATH}/findUserListByState",
			//data:{"uState":uState,"pn":currentPage},
			data:{"uState":uState,"pn":currentPage,"beginTime":beginTime,"endTime":endTime,"stext":stext,"pageSize":pageSize},
			type:"POST",
			success:function(result){
				var userList=result.extend.userList;
				formElement(result);
				page_nav_area(result);
				page_info_area(result);
			}
		});
		
	}
	
	//批量还原
	$("#rev_batch").click(function(){
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
			info="确认还原:"+Nickname+" 吗?"
		 }
		 confirm(function(){
		     //在这里写删除逻辑，点击确认执行这里的代码 	
		     delete_user(del_idstr,"1");
			 
		    },"",info);
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
			info="确认删除:"+Nickname+" 吗?"
		 }
		 confirm(function(){
		     //在这里写删除逻辑，点击确认执行这里的代码 	
		     delete_user(del_idstr,"3");
			 
		    },"",info);
	});
	//执行假删除的方法
	function delete_user(uId,sta){
		if(uId==""){
			return false;
		}
		$.ajax({
			url:"${APP_PATH}/updateUserState",
			type:"POST",
			data:{"uId":uId,"uState":sta},
			success:function(result){
				findUserList();
				$("#checkAll").prop("checked",false);
				//弹框提示...
				$.Huimodalalert("执行成功!!!",1000);
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
		$("#total_strong").text("").text(pageInfo.total);
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
	//填充内容区域
	function formElement(result){
		$("#member_tbody_area").html("");
		var userList=result.extend.pageInfo.list;
		$.each(userList,function(index,user){
			var tr=$("<tr></tr>").addClass("text-c");
			var checkInput=$("<input />").attr("type","checkbox").addClass("checkAll_item");//复选框
			var checkTd=$("<td></td>").append(checkInput);//复选框的Td
			var uidTd=$("<td></td>").append(user.uId);//用户ID
			var nameU=$("<u></u>").addClass("text-primary").css("cursor","pointer").append(user.uNickname);//用户名
			nameU.click(function(){
				member_show(user.uNickname,'member-show.jsp?uId='+user.uId,user.uId,'360','450')
			});
			var nameTd=$("<td></td>").append(nameU);//用户名的Td
			var sexTd=$("<td></td>").append(user.uSex);//性别
			var phoneTd=$("<td></td>").append(user.uPhone);//手机
			var emailTd=$("<td></td>").append(user.uEmail);//邮箱
			var addressTd=$("<td></td>").append(user.uAddress).css("width","90px");//地址
			var registTimeTd=$("<td></td>").append(user.uRegisttime);//注册时间
			var flagTd_span=$("<span></span>");
			flagTd_span.addClass("label label-danger radius").append("已删除");
			var flagTd=$("<td></td>").addClass("td-status").append(flagTd_span);
			//操作
			var operateTd=$("<td></td>").addClass("td-manage");
				//撤回
			var ope_a_recall=$("<a></a>").css("text-decoration","none").attr("href","#").attr("title","还原");
			ope_a_recall.click(function(){
				member_huanyuan(this,user.uId);
			});
			var ope_a_recall_i=$("<i></i>").addClass("Hui-iconfont").append("&#xe66b;");
			ope_a_recall.append(ope_a_recall_i);
				//删除
			var ope_a_del=$("<a></a>").css("text-decoration","none").attr("href","#").attr("title","删除").addClass("ml-5");
			ope_a_del.click(function(){
				member_del(this,user.uId);
			});
			var ope_a_del_i=$("<i></i>").addClass("Hui-iconfont").append("&#xe6e2;");
			ope_a_del.append(ope_a_del_i);
			operateTd.append(ope_a_recall).append(ope_a_del);
			
			tr.append(checkTd).append(uidTd).append(nameTd).append(sexTd).append(phoneTd).
					append(emailTd).append(addressTd).append(registTimeTd).append(flagTd).append(operateTd);
			
			$("#member_tbody_area").append(tr);
		});
		
		
	}
	/*用户-查看*/
	function member_show(title,url,id,w,h){
		layer_show(title,url,w,h);
	}
	/*用户-删除*/
	function member_del(obj,id){
		layer.confirm('确认要删除吗？',function(index){
			alert("确定...");
			$.ajax({
				type: 'POST',
				url: '${APP_PATH}/updateUserState',
				dataType: 'json',
				data:{"uId":id,"uState":"3"},
				success: function(data){
					$(obj).parents("tr").remove();
					layer.msg('已删除!',{icon:1,time:1000});
					setTimeout(function() {
						findUserList();
					}, 800);
				},
				error:function(data) {
					console.log(data.msg);
				},
			});		
		});
	}
	/*用户-还原*/
	function member_huanyuan(obj,id){
		layer.confirm('确认要还原吗？',function(index){
			//发送AJAX请求，改变这个用户的状态。
			$.ajax({
				url:"${APP_PATH}/updateUserState",
				data:{"uId":id,"uState":"1"},
				type:"POST",
				success:function(result){
					$(obj).remove();
					layer.msg('已还原!',{icon: 6,time:1000});
					setTimeout(function() {
						findUserList();
					}, 800);
				}
			});
			
		});
	}
	//****************************************************************
	/* $('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
		]
	}); */
});




</script> 
</body>
</html>