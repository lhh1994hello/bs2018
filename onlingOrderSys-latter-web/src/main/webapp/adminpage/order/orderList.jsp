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
<link rel="Bookmark" href="${APP_PATH}/static/hui/favicon.ico" >
<link rel="Shortcut Icon" href="${APP_PATH}/static/hui/favicon.ico" />
<%-- <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/static/h-ui/css/H-ui.min.css" /> --%>

<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/hui/static/h-ui.admin/css/style.css" />
<link rel="shortcut icon" href="${APP_PATH}/images/logo/favicon.ico">
<!--_footer 作为公共模版分离出去-->
<%-- <script type="text/javascript" src="${APP_PATH}/static/hui/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/hui/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/hui/static/h-ui.admin/js/H-ui.admin.js"></script>  --%>

<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${APP_PATH}/static/hui/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<title>后台订单列表</title>
<style type="text/css">
	#search{
		/* background-color:  pink; */
		height: 40px;
	}
	#search div{
		float: left;
		height: 30px;
		text-align: center;
		padding-left: 5px;
		
	}
	#search_md{
		background-color:  orange;
	}
	#page_info_area{
		font-size: 18px;
		/* letter-spacing: 6px; */
	}
	#modal_orderItem_tbody img{
		height: 60px;
		width: 80px;
	}

	
</style>

</head>
<body  >

	<!--模态框，员工修改信息 -->
<div class="modal fade" id="detail" tabindex="-1" role="dialog" data-backdrop="false" aria-labelledby="myModalLabel" style="z-index:9999999">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">订单详情</h4>
      </div>
      <div class="modal-body">
    	   
	
			  <!-- **************************************** -->
			  		<table  class="table table-striped table-hover success  table-bordered"
						id="modal_orderItem">

						<thead>
							<tr id="order_show_area">
								<!-- 	<th colspan="5">AAA</th> -->
							</tr>
							<tr id="order_show_area2">
								
							</tr>
							<tr class="hover-style1">
								
								<th>图片</th>
								<!-- <th>ID</th> -->
								<th>单价</th>
								<th>菜名</th>
								<th>数量</th>
								<th>小计</th>
								<th>菜系</th>	
							</tr>
						</thead>
						<tbody id="modal_orderItem_tbody" >
								
								
						</tbody>
					</table>
			  <!-- **************************************** -->
			
			
			   	       	          	   
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关&nbsp;闭</button>
        <button type="button" class="btn btn-primary" id="emp_update_btn">更 &nbsp;新</button>
      </div>
    </div>
  </div>
</div>
	<!--  -->
	<!-- <div class="layui-layout layui-layout-admin"> -->
		<div style="padding: 15px;">
			<div class="container-fluid">
				<div class="row" id="search">
					<div style="margin-left: 200px; font-size: 16px; padding-top: 5px;">日期范围:</div>
					<div ><input type="text" class="layui-input" id="beginTime"  style="width:150px;"></div>
					<div style="padding-top: 8px;">--</div>
					<div ><input type="text" class="layui-input" id="endTime"  style="width:150px;"></div>
					<div><input type="text"  class="layui-input" name="stext"  id="stext" placeholder="输入会员名称、邮箱、" /></div>
					<div >
						<button type="button" class="btn btn-success" id="sbtn">
							<i class="layui-icon" style="color: white;">&#xe615;</i>
							<font style="margin-left: 1px;">搜订单</font>
						</button>
						<button type="button" class="layui-btn  layui-btn-normal" id="export_excel">
							<i class="layui-icon" style="color: white; ">&#xe601;</i>
							<font style="margin-left: 1px;">导出到Excel</font>
						</button>
							<!-- <div class="skin-minimal" style="position: fixed;top:26px;right: 50px;" >
								<div class="check-box" >
		    						<input type="checkbox" id="checkbox-1">
		   							 <label for="checkbox-1">导当前页</label>
	  							</div>
							</div> -->
							<input type="checkbox" id="checkboxID">
							 <label for="checkbox-1" >导当前页</label>
						
					</div>
					
				</div>
			
				<!--支付状态，默认是0，代表未支付，-1代表超时，0：未付款，1:已付款未发货，2:已发货未确认收货，3:确认收货，  -->
				<div class="row"  style="margin-bottom: 30px; margin-top: 20px;">
					<div class="col-md-1">
						<select name="payState" class="select" id="select_id" style="height: 30px; width: 100px">
							<option value="-100">全部订单</option>
							<option value="0">未付款</option>
							<option value="1">未发货</option>
							<option value="2">未收货</option>
							<option value="3">已完成</option>
							<option value="-1">已超时</option>
						</select>
					</div>
					
					<!-- 设置一页显示多少条数据 -->
					<div class="col-md-3" style="margin-left: 30px;">
						<label>显示
					 <select name="pageSize" class="select" id="select_pageSise" style="height: 30px; width: 60px;padding-left: 15px;">
						 <option value="5">&nbsp;5</option>
						 <option value="10">10</option>
						 <option value="15">15</option>
						 <option value="20">20</option>
						 <option value="30">30</option>
					 </select> 条
					</label>
					</div>
					
					
				</div>
				<!-- <hr style="height: 2px; border: none; border-top: 2px dotted #185598;" /> -->
				<div class="row">
					<!-- table table-striped table-hover success -->
					<table  class="table table-striped table-hover success  table-bordered"
						id="order_table">

						<thead>
							<tr class="hover-style1">
								<!-- <th><input type="checkbox" id="checkAll"/></th> -->
								<th>订单号</th>
								<th>下单账号</th>
								<th>收货人</th>
								<th>手机号</th>
								<th>时间</th>
								<th>地址</th>
								<th>金额</th>
								<th>状态</th>
								<th>留言</th>
								<th><a href="#">操 作</a></th>
							</tr>
						</thead>
						<tbody id="order_tbody">
							

						</tbody>
					</table>
				</div>
				<div class="row" >
					<div class="col-md-5" id="page_info_area">
						<!-- 页码信息 -->
					</div>
					<div class="col-md-5 col-md-offset-2" id="page_nav_area" >
						<!-- 页码信息 -->
					</div>
				</div>

			</div>
		</div>
	<script>
		$(function(){
			var oidList="";
			var paystate="-100";
			//记录当前页
			var currentPage="1";
			var totalRecord="1";
			var beginTime="";
			var endTime="";
			var stext="";
			var pageSize=5;
			//调用这个方法:查询记录
			getOrdersByPaystate();
			
			//把当前数据，导出到Excel,
			$("#export_excel").click(function(){
				//alert(oids);
				var checkFlag=$("#checkboxID").prop("checked");
				if(checkFlag==true){
					getThisPages();
				}else if(checkFlag==false){
					getAllBycondition();
				}
				
				//alert("导出到Excel"+checkFlag);
			});
			//导当前页面
			function getThisPages(){
				var trList= $("#order_tbody tr");
				$.each(trList,function(index,trItem){
					var oid=$(trItem).find("th:eq(0)").text();
					if(oidList==""){
						oidList=oidList+oid;
					}else{
						oidList=oidList+"-"+oid;
					}
				});
				alert(oidList);
				//发送AJAX请求
				$.ajax({
					url:"${APP_PATH}/ImportThisPageToExcel?oidList="+oidList,
					type:"GET",
					success:function(result){
						oidList="";
						alert("成功了..");
					},
					error:function(){
						oidList="";
						alert("失败了...");
					}
				});
			}
			//按条件导出所有
			function getAllBycondition(){
				$.ajax({
					url: "${APP_PATH}/ImportDataToExcelByCondition",
					data:{"paystate":paystate,"beginTime":beginTime,"endTime":endTime,"stext":stext},
					type:"GET",
					success:function(result){
						alert("成功了");
					},
					error:function(result){
						alert("失败了");
					}
					
				});
			}
			
			//改变页面显示的条目数量
			$("#select_pageSise").click(function(){
				pageSize=$("#select_pageSise").val();
				getOrdersByPaystate();
			});
			//条件查询
			$("#sbtn").click(function(){
				 beginTime=$("#beginTime").val();
				 endTime=$("#endTime").val();
				 stext=$("#stext").val();
				// alert(beginTime+","+endTime+","+stext);
				 getOrdersByPaystate();
			});
			
			//详情显示方法:
			$(document).on("click",".edit_btn",function(){
				var oid= $(this).attr("edit_id");
				//之前先查询出订单对应的订单项内容
				$.ajax({
					url:"${APP_PATH}/getOrdersByOid/"+oid,
					type:"POST",
					success:function(result){
						 putOrderToModal(result);
					}
				});
				$("#detail").modal({
					backdrop:"static"
				}); 
			});
			//把订单内容放到模态框
			function putOrderToModal(result){
				$("#order_show_area").html("");
				$("#order_show_area2").html("");
				$("#modal_orderItem_tbody").html("");
				var order=result.extend.order;
				var orderItemList=order.orderItemList;
				//order_show_area
				var head_thID=$("<th></th>").attr("colspan","2").append("单号:").append(order.oid);
				var head_thTIme=$("<th></th>").attr("colspan","1").append("时间:").append(order.createtime);
				var head_thTotals=$("<th></th>").attr("colspan","1").append("总计:").append(order.totals);
				var head_thpurchaser=$("<th></th>").attr("colspan","2").append("下单人:").append(order.purchaser);
				var head_thUserPhone=$("<th></th>").attr("colspan","1").append("手机:").append(order.userphone);
				var head_thaddress=$("<th></th>").attr("colspan","3").append("地址:").append(order.address);
				var infoSpan=$("<span><span>");
				var payState=order.paystate;
				var payStateInfo=order.paystate;
				if(payState==-1){
					payStateInfo="已超时";
					infoSpan.addClass("label label-warning radius").append(payStateInfo);
				}else if(payState=="0"){
					payStateInfo="未付款";
					infoSpan.addClass("label label-danger radius").append(payStateInfo);
				}else if(payState=="1"){
					payStateInfo="未发货";	
					infoSpan.addClass("label label-primary radius").append(payStateInfo);
					infoSpan.click(function(){
						sendGoods(order.oid);
					});
				}else if(payState=="2"){
					payStateInfo="已发货";
					infoSpan.addClass("label label-success radius").append(payStateInfo);
				}else if(payState=="3"){
					payStateInfo="已完成";
					infoSpan.addClass("label label-warning radius").append(payStateInfo);
				}
				var paystate=$("<th></th>").attr("colspan","2").append(infoSpan).attr("payState",payState);
				$("#order_show_area").append(head_thID).append(head_thTIme).append(head_thTotals).append(paystate);
				$("#order_show_area2").append(head_thpurchaser).append(head_thUserPhone).append(head_thaddress);
				//订单项 modal_orderItem_tbody
				$.each(orderItemList,function(index,orderItem){
					//alert("AAA")
					var tr=$("<tr></tr>");
					var th_image=$("<img />").attr("src",orderItem.menu.image);
					var th_itemID=$("<th></th>").append(orderItem.oiid);
					var th_menuName=$("<th></th>").append(orderItem.menu.mname);
					var th_menuPrice=$("<th></th>").append("￥").append(orderItem.menu.price);
					var th_count=$("<th></th>").append(orderItem.count);
					var th_subtotal=$("<th></th>").append("￥").append(orderItem.subtotal);
					var th_categoryName=$("<th></th>").append(orderItem.menu.category.cname);
					tr.append(th_image).append(th_menuPrice).append(th_menuName).append(th_count).append(th_subtotal).append(th_categoryName);
					$("#modal_orderItem_tbody").append(tr);
				});
				
			}
			
			//查询订单列表，
			function getOrdersByPaystate(){
				//alert(payState);
				$.ajax({
					url : "${APP_PATH}/getOrderByPayStateWithAjax",
					data:{"paystate":paystate,"pn":currentPage,"beginTime":beginTime,"endTime":endTime,"stext":stext,"pageSize":pageSize},
					type : "POST",
					success:function(result){
						page_table_area(result);
						//解析分页信息
						page_info_area(result);
						//解析分页栏
						page_nav_area(result);
						//addDataSelect(result);
					}
				});
			}
							
			//设置下拉框的值 "select_pageSise" ,暂时没用到，会抖动
			function addDataSelect(result){
				$("#select_pageSise").html("");
				 var pageInfo=result.extend.pageInfo;
				 var op1=$("<option></option>").attr("value","5").append(5);
				 var op2=$("<option></option>").attr("value","10").append(10);
				 var op3=$("<option></option>").attr("value","15").append(15);
				 var op4=$("<option></option>").attr("value","20").append(20);
				 var op5=$("<option></option>").attr("value","30").append(30);
				 var op6=$("<option></option>").attr("value",pageInfo.total).append("All");
				 $("#select_pageSise").append(op1).append(op2).append(op3).append(op4).append(op5).append(op6);
				 
			}
			//解析内容,表格数据
			function	page_table_area(result){
				var orderList=result.extend.pageInfo.list;
				$("#order_tbody").html("");
				$.each(orderList,function(index,order){
					var eleTr=$("<tr></tr>");
					var checkBoxTd=$("<td><input type='checkbox' class='check_item'></input></td>");
					var oid=$("<th></th>").append(order.oid).css("width","160px");//订单ID
					var uLoginID=$("<th></th>").append(order.user.uLoginid);//用户账号
					var purchaser=$("<th></th>").append(order.purchaser); //购买者名称
					var userPhone=$("<th></th>").append(order.userphone).css("width","100px");//购买时填写的手机号
					var createTime=$("<th></th>").append(order.createtime).css("width","160px");//下单时间
					var address_text=order.address;
					if(address_text.length>5){
						address_text=address_text.substring(0,5)+"...";
					}
					var address=$("<th></th>").append(address_text);//订单地址
					var totalsIcon=$("<i></i>").addClass("layui-icon").append("&#xe65e;").css("font-size","15px");
					var totals=$("<th></th>").append("￥ ").append(order.totals);
					var infoSpan=$("<span><span>");
					//状态
					var payState=order.paystate;
					var payStateInfo=order.paystate;
					if(payState==-1){
						payStateInfo="已超时";
						infoSpan.addClass("label label-warning radius").append(payStateInfo);
					}else if(payState=="0"){
						payStateInfo="未付款";
						infoSpan.addClass("label label-danger radius").append(payStateInfo);
					}else if(payState=="1"){
						payStateInfo="未发货";		
						infoSpan.addClass("label label-primary radius").append(payStateInfo);
						infoSpan.click(function(){
							sendGoods(order.oid);
						});
					}else if(payState=="2"){
						payStateInfo="已发货";
						infoSpan.addClass("label label-success radius").append(payStateInfo);
					}else if(payState=="3"){
						payStateInfo="已完成";
						infoSpan.addClass("label label-warning radius").append(payStateInfo);
					}
					///<span class="label label-success radius">成功</span>
					var paystate=$("<th></th>").append(infoSpan).attr("payState",payState).css("width","50px");
					var note_text=order.notes;
					if(note_text.length>6){
						note_text=note_text.substring(0,6)+"...";
					}
					var notes=$("<th></th>").append(note_text).addClass("notes");
					var editbtn = $("<button></button>").addClass("btn btn-primary  btn-sm edit_btn").append($("<span></span>")
							.addClass("glyphicon glyphicon-pencil")).append("详  情");
					//把订单主键放到里面
					editbtn.attr("edit_id",order.oid);
					
					var delbtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>")
							.addClass("glyphicon glyphicon glyphicon-trash")).append("  删 除");
					var btnTh=$("<th></th>").append(editbtn);//.append("||").append(delbtn);
					eleTr.append(oid).append(uLoginID).append(purchaser).append(userPhone).append(createTime).append(address).append(totals).append(paystate).append(notes)
							.append(btnTh);
					$("#order_tbody").append(eleTr);
				});
			}
			
			
			function sendGoods(oid){
				//alert("发货...."+oid);
				$.ajax({
					url:"${APP_PATH}/sendGoods/"+oid,
					type:"POST",
					success:function(result){
						var code=result.code;
						var msg=result.extend.msg;
						if(code=="100"){
							getOrdersByPaystate();
						}else if(code=="200"){
							alert("提示:"+msg);
						}
					},
					error:function(){
						alert("出错了..");
					}
					
					
				});
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
						getOrdersByPaystate();
					});
					 prePageLi.click(function(){
						 currentPage=currentPage-1;
						 getOrdersByPaystate();
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
						getOrdersByPaystate();
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
						getOrdersByPaystate();
					});
					lastPageLi.click(function(){
						currentPage=pageInfo.pages;
						getOrdersByPaystate();
					});
				}
				ul.append(nextPageLi).append(lastPageLi);
				var navEle= nav.append(ul);
				navEle.appendTo("#page_nav_area");
				
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
			
				currentPage=pageInfo.pageNum;
			}
			
			//获得下拉列表的值，查询不同的状态
			$("#select_id").change(function() {
				paystate= $("#select_id").val();
				//alert("下拉"+payState);
				getOrdersByPaystate();
				console.log(paystate);
			});
			//一个渲染单选框，复选框的
			$(function(){
				$('.skin-minimal input').iCheck({
					checkboxClass: 'icheckbox-blue',
					radioClass: 'iradio-blue',
					increaseArea: '20%'
				})});
			
			//日期组件
			layui.use('laydate', function() {
				var laydate = layui.laydate;
				laydate.render({
					elem : '#beginTime' //指定元素
				});
			});
			layui.use('laydate', function() {
				var laydate = layui.laydate;
				laydate.render({
					elem : '#endTime' //指定元素
				});
			});
			
			
		});
		
		
		//JavaScript代码区域
		/* layui.use('element', function() {
			var element = layui.element;

		}); */
	</script>
</body>
</html>