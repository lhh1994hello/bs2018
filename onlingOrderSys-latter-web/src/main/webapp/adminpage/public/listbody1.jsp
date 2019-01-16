<%@page pageEncoding="UTF-8"%>
<div class="container">
		<div class="row">
			<div class="col-md-2">
				<%-- <%@ include file="../public/left.jsp"%> --%>
			</div>
			<div class="col-md-10" id="d1">
				<h3>显示菜单</h3>
				<div class="row" id="imagebox">
					<c:forEach items="${pageInfo.list}" var="menu">

						<div class="col-md-3 text-center myclass" id="myid">
							<a 
								href="<c:url value='/BookServlet?method=load&bid=${book.bid }'/>">
								<img src="${menu.image}" class="img-rounded  img-circle" />
							</a> <br /> 
							<a
								href="<c:url value='/BookServlet?method=load&bid=${book.bid }'/>">${menu.mname}</a>
							<span > ￥<font style="color:red">${menu.price}</font>元</span>	<br/>
							<button type="button" class="btn btn-info btn btn-default btn-sm edit_btn"  update_id="${menu.mid}" id="menu_update_modal_btn">修&nbsp;&nbsp;改</button>
							
							
						</div>
					</c:forEach>	
				</div>
				<!-- 第二行 -->
				<div class="row">
					
			<div class="col-md-6" id="page_info_area">		
	当前第${pageInfo.pageNum}页 ,共${pageInfo.pages}页,共${pageInfo.total}条记录
						</div>
						
		<div class="col-md-6" id="page_info_nav">
			<nav aria-label="Page navigation">
				<ul class="pagination">
				<c:choose>
					<c:when test="${pageInfo.hasPreviousPage}">
						<li  ><a href="${APP_PATH}/adminLookMenu?pn=1" >首页</a></li>
						<li><a href="${APP_PATH}/adminLookMenu?pn=${pageInfo.pageNum-1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li  class="disabled" ><a href="${APP_PATH}/adminLookMenu?pn=1" >首页</a></li>
						<li  class="disabled"><a href="${APP_PATH}/adminLookMenu?pn=${pageInfo.pageNum-1}"
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
						<li><a href="${APP_PATH}/adminLookMenu?pn=${pageInfo.pageNum+1}" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
						<li><a href="${APP_PATH}/adminLookMenu?pn=${pageInfo.pages}">尾页</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="${APP_PATH}/adminLookMenu?pn=${pageInfo.pageNum+1}" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
						<li class="disabled"><a href="${APP_PATH}/adminLookMenu?pn=${pageInfo.pages}">尾页</a></li>
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
	<!-- js部分 -->
	<script type="text/javascript">
		 var  pageNum= ${pageInfo.pageNum};
		// alert("当前页："+pageNum);
	
			//给更新按钮绑定事件
			$("#menu_update_btn").click(function(){
					var mid=$(this).attr("menu_id");
					//获得form表单数据，包括文件类型的
					var formData = new FormData($( "#form_data")[0]);
				//发送AJAX请求
				$.ajax({
					url:"${APP_PATH}/updateMenu/"+mid,
					type:"POST",
					//data:$("#menuUpdateModal form").serialize(),
					data:formData,
					dataType : 'json',
					contentType: false, //必须
			        processData: false, //必须
					success:function(result){
						 $("#menuUpdateModal").modal('hide');
					},
				});
				setTimeout(function() {
					$("#form_data").submit();					
				},1000);				
			});
			
			//进行模态框表单校验
			//校验评价的长度
			$("#text_introduce").change(function(){
				check_introduce("#text_introduce")
			});
			//校验价格
			$("#price_update_input").change(function(){
				check_price("#price_update_input")
			});
			
			function check_onsubmit(){
				var price_flag=check_price("#price_update_input");
				if(price_flag==false){
					return false;
				}
				var introduce_flag=check_introduce("#text_introduce");
				if(introduce_flag==false){
					return false;
				}
				return true;
			}
			
			//检查介绍的长度
			function check_introduce(id){
				var introduce=$(id).val();
			 	 var len= introduce.length;
			 	 if(len>10){
			 		show_validate_msg(id,"fail","介绍太长，数据库装不下");
			 		return false;
			 	 }
			 	 return true;
			}
			//价格校验
			function check_price(id){
			//reset_css(id);
					var price=	$(id).val();
					//alert("价格："+price);
					if(price==null||price==""){	
						show_validate_msg(id,"warning","金额不能为空");
						return false;
					}
					if(isNaN(price)){
						show_validate_msg(id,"fail","只能是数字");
						return false;
					}
					if(price<0){
						show_validate_msg(id,"fail","金额不能小于0");
						return false;
					}
					var reg = new RegExp("^\\d+(\\.\\d{0,2})?$");
					if(!reg.test(price)){
						show_validate_msg(id,"fail","只能保留两位小数");
						return false;
					}
					//如果都成功，就清除样式
					reset_form("#menuUpdateModal form");
					return true;
			}
			//
			//每次点击修改都把样式设为默认，防止上次残留
			function reset_form(ele){
				//[0]使用dom对象的方法
				//$(ele)[0].reset();
				$(ele).find("*").removeClass("has-error has-success");
				$(ele).find(".help-block").text("");
			}
			//显示校验结果的提示信息
					function show_validate_msg(ele,status,msg){
						//每次清除之前都先清除父元素的样式
						$(ele).parent().removeClass("has-success has-error");
						//提示内容默认是空
						$(ele).next("span").text("");
						if("success"==status){
							$(ele).parent().parent().addClass("has-success");
							 $(ele).next("span").text(msg);
						}else if("fail"==status){
							console.log($(ele));
							 $(ele).parent().addClass("has-error");
							 $(ele).next("span").text(msg);							
						}
					}
			//给修改按钮绑定事件
			$(document).on("click",".edit_btn",function(){
				//清除之前的样式
				reset_form("#menuUpdateModal form");
			    var mid=	$(this).attr("update_id");//得到要修改菜品的主键
			    //* alert("对应的ID:"+mid);  category_update_select
			    //获得分类信息
			    getCategory("#category_update_select");
			    //获得菜单信息
			    getMenu(mid);
			    //给更新按钮设置一个属性
			    $("#menu_update_btn").attr("menu_id",mid);
			    //打开模态框
				$("#menuUpdateModal").modal({
					backdrop:"static"
				
				});
			});
	
			//根据id查询菜品信息，发送AJAX请求
			function getMenu(mid){
				$.ajax({
					url:"${APP_PATH}/getMenu/"+mid,
					type:"GET",
					success:function(result){
						console.log(result);
						var menuData=result.extend.menu;
						//给input框赋值，直接用val()
						$("#mname_update_input").val(menuData.mname);
						$("#price_update_input").val(menuData.price);
						$("#menuUpdateModal input[name=mstate]").val([menuData.mstate]);
						$("#menuUpdateModal select").val([menuData.mcId]);
						$("#my_image").attr("src",menuData.image);
						$("#text_introduce").val(menuData.introduce);
					}
				});
			}
			//查出分类信息
			function getCategory(ele){
				//清空下拉列表的记忆选择
				$(ele).empty();
				$.ajax({
					url:"${APP_PATH}/getAllCategory",
					type:"GET",
					success:function(result){
						console.log(result);
						//遍历
						$.each(result.extend.categoryList,function(index,item){
							
							var optionEle=$("<option ></option>").append(item.cname).attr("value",item.cid);
							
							//把这个变量添加到这个id指向的标签
							optionEle.appendTo(ele);
						});
					}
				});
			}
		//给图片div注册鼠标经过事件，高亮显示
		$("#imagebox div ").mouseenter(function(){
			$(this).css("opacity","1").siblings().css("opacity","0.8");
		});
		//注册鼠标离开事件
		$("#imagebox ").mouseleave(function(){
			$(this).find("div").css("opacity","1");
		});
	</script>