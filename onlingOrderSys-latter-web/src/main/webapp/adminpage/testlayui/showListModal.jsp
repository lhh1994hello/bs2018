<!-- 模态框 -->
		<!--模态框，菜品修改信息 -->
<div class="modal fade" id="menuUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">修改菜单</h4>
      </div>
      <div class="modal-body">
    	   
		<form class="form-horizontal"  method="post" enctype="multipart/form-data"  id="form_data" action="${APP_PATH}/adminLookMenu"  onsubmit="return check_onsubmit()">
				<input type="hidden"  name="pn" value="${pageInfo.pageNum}"/>
			  <div class="form-group">
			    <label for="empName_add_input" class="col-sm-2 control-label">菜名</label>
			    <div class="col-sm-10">
			    	<!-- <p class="form-control-static" id="empName_update_static"></p> -->
			      <input type="text" name="mname" class="form-control" id="mname_update_input" readonly="readonly">
			      <span id="menu_add_span"  class="help-block"></span>
			    </div>
			  </div>
			  
			   <div class="form-group ">
				    <label for="email_add_input" class="col-sm-2 control-label">价&nbsp;&nbsp;格</label>
				    <div class="col-sm-10" id="div_price_update_input">
				      <input type="text" name="price" class="form-control" id="price_update_input" >
				      <span  id="price_add_span" class="help-block"></span>
				    </div>
			  </div>
			 
			
			  <!-- 菜系选项 -->
			  <div class="form-group">
				    <label  class="col-sm-2 control-label">菜系</label>
				    <div class="col-sm-4">
				      	<select  class="form-control" name="mcId" id="category_update_select">
						 	<!-- 提交部门ID即可，外键 -->
						</select>				      	
				    </div>
				    <!--  -->
				    <label  class="col-sm-2 control-label">是否有效&nbsp;&nbsp;</label>
				    <div class="col-sm-4">
				       <label class="radio-inline">
						  <input type="radio" name="mstate" id="gender1_update_input" value="1" checked="checked"> 是
					</label>
					<label class="radio-inline">
						  <input type="radio" name="mstate" id="gender2_update_input" value="0"> 否
					</label>
				    </div>
				    <!--  -->
			  </div>	
			  <!--  显示图片-->
			  	 <div class="form-group">
				    <label for="email_add_input" class="col-sm-2 control-label">原&nbsp;&nbsp;图</label>
				    <div class="col-sm-10" id="div_price_update_input_image">
				    	<img alt="" src="/onlingOrderSys/images/menu/2F0E698A_58661e56N263e903b.jpg"  class="img-rounded  img-circle"  id="my_image">
				    	
				     	<span  id="image_add_span" class="help-block"></span>
				    </div>
			     </div>
			  	  <!--  选择新的图片-->
			  	 <div class="form-group">
				    <label for="email_add_input" class="col-sm-2 control-label">换&nbsp;&nbsp;图</label>
				    <div class="col-sm-10" id="div_update_input_update">				     
				     <input type="file" name="file" id="image_update_input" />
				      <span  id="image_add_span" class="help-block"></span>
				    </div>
			     </div>
			  <!-- 评价选项 -->					
			   <div class="form-group">
				    <label for="email_add_input" class="col-sm-2 control-label">评&nbsp;&nbsp;价</label>
				    <div class="col-sm-10" id="div_pingjia_update_input">
				     <!--  <input type="text" name="email" class="form-control" id="intro_update_input" /> -->
				      <textarea rows="2" cols="60" name="introduce" id="text_introduce"></textarea>
				      <span  id="intro_add_span" class="help-block"></span>
				    </div>
			  </div>
			</form>    	       	          	   
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关&nbsp;闭</button>
        <button type="button" class="btn btn-primary" id="menu_update_btn">修 &nbsp;改</button>
      </div>
    </div>
  </div>
</div>
<!-- 模态框结束-->