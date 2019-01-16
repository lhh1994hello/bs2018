<%@page pageEncoding="UTF-8"%>

	<style>
		.feedback-wrap{
			display:none;
			position: fixed;
			left: 400px;
			top: 150px;
			background-color: white;
			/* z-index:20; */
			opacity: 1;
			z-index: 1000;
		}
		
		.linkStyle{
		
		}
		/* 遮罩层 */
		.modal-backdrop{
			position: fixed;
			/* display: block;  */  
			display:none;
			background-color:#515151;
			width:auto;
			height:auto;
			position: fixed; 
			top: 0; right: 0; 
			bottom: 0; 
			left: 0; 
			opacity:0.8;
			z-index: 999;
		}
		body{
			/* 弹出层之后禁止页面滚动 */
			/* overflow:hidden; */
		}
	</style>
	
	
<div class="modal-backdrop"></div>
<div class="feedback-wrap">
	<div class="f-form">
		<div class="form-group">
			<label>功能建议：</label>
			<div class="input-control">
				<textarea id="textarea_feedback_id" style="height: 100px;" name="content" placeholder="订餐系统还在不断完善和成长，我们真诚的期望听到您的反馈和建议" class="input placeholder-con"></textarea>
				 	
			</div>
			<!--  显示错误提示信息-->
			<div class="error-msg v-hide">AAA</div>
		</div>
		<br/>
		<div class="form-group linkStyle">
			<label>联系方式：</label>
			<div class="input-control">
				<input id="contact_feedback_id" type="text" name="contact" placeholder="请留下您的手机号或邮箱" class="input placeholder-con" style="height: 40px;">
 			</div>
			<div class="error-msg  v-hide"></div>
		</div>
		<div class="form-submit">
			<input type="button" value="提交" class="submitBtn">
			 <input type="button" value="取消" class="cancelBtn versa">
 		</div>
	</div>
</div>