<%@page pageEncoding="UTF-8"%>
<link href="${APP_PATH}/static/city/css/jquery.city.css" rel="stylesheet">
<link href="${APP_PATH}/static/city/css/animate.min.css" rel="stylesheet">
<script type="text/javascript" src="${APP_PATH}/static/city/js/jquery.city.js"></script>

<div style="" id="myDetailMsgID">
<form class="layui-form" action="">
		<table class="layui-table">
  <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  
  <thead>
    <!-- <tr>
      <th>昵称</th>
      <th>加入时间</th>
      <th>签名</th>
    </tr>  -->
  </thead>
  <tbody>
  	 <tr>
      <td>我的账号</td>
      <td id="login_ID">XXX_4</td>
     </tr>
    <tr>
      <td>注册时间</td>
      <td id="regist_Time">2016-11-29</td>
     </tr>
    <tr>
      <td>登录时间</td>
      <td id="login_Time">2016-11-28</td>
     </tr>
     <tr>
      <td>登录次数</td>
      <td id="login_Num">2016-11-28</td>
     </tr>
  </tbody>
</table>
 </form>
<!--  -->

<form class="layui-form" action="" id="form_id">
	<input type="hidden" name="uId" value="-100" id="uId" />
  <div class="layui-form-item">
    <label class="layui-form-label">昵称</label>
    <div class="layui-input-inline">
      <input style="width:250px;" type="text" name="title" id="uNickname" required  lay-verify="required" placeholder="昵称" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">邮箱</label>
    <div class="layui-input-inline">
      <input style="width:250px;" type="text" name="password" id="uEmail" required lay-verify="required" placeholder="邮箱" autocomplete="off" class="layui-input">
    </div>
    <div class="layui-form-mid layui-word-aux" style="margin-left: 55px;"></div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">手机</label>
    <div class="layui-input-inline">
      <input style="width:250px;"  type="text" name="password"  id="uPhone" required lay-verify="required" placeholder="手机" autocomplete="off" class="layui-input">
    </div>
    <div class="layui-form-mid layui-word-aux" style="margin-left: 55px;"></div>
  </div>
  <!--  -->
  <div class="layui-form-item">
    <label class="layui-form-label">地址</label>
    <div class="layui-input-inline">
      <input style="width:250px;" id="txt_city" type="text" name="password"  required lay-verify="required" placeholder="地址" autocomplete="off" class="layui-input">
    </div>
    <div class="layui-form-mid layui-word-aux" style="margin-left: 55px;"></div>
  </div>
  <!--  -->
  <div class="layui-form-item">
    <label class="layui-form-label">密保问题</label>
    <div class="layui-input-inline">
      <input style="width:250px;" type="text" name="password" id="uSafequest" required lay-verify="required" placeholder="密保问题" autocomplete="off" class="layui-input">
    </div>
    <div class="layui-form-mid layui-word-aux" style="margin-left: 55px;"></div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">密保答案</label>
    <div class="layui-input-inline">
      <input style="width:250px;" type="text" name="password" id="uSafeanswer" required lay-verify="required" placeholder="密保答案" autocomplete="off" class="layui-input">
    </div>
    <div class="layui-form-mid layui-word-aux" style="margin-left: 55px;"></div>
  </div>
 
  
  
  <div class="layui-form-item" >
    <label class="layui-form-label">性别</label>
    <div class="layui-input-block" id="userSex" >
      <input type="radio" name="sex" value="男" title="男">
      <input type="radio" name="sex" value="女" title="女" checked>
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">说点什么</label>
    <div class="layui-input-block">
      <textarea style="width:250px;" name="desc" id="introduce" placeholder="请输入内容" class="layui-textarea"></textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn changeInfoBtn" lay-submit lay-filter="formDemo">立即修改</button>
      <!-- <button type="reset" class="layui-btn layui-btn-primary">重置</button> -->
    </div>
  </div>
</form>
 
<script>
//Demo
		layui.use('form', function(){
		  var form = layui.form;
		  
		  //监听提交
		  form.on('submit(formDemo)', function(data){
		    layer.msg(JSON.stringify(data.field));
		    return false;
		  });
		});
		/*  */
		/* <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/pintuer/pintuer.css" /> */

		$(function () {
			//当点击的时候调用它
			fillMyDetailMsgInfo();
			function fillMyDetailMsgInfo(){
				$.ajax({
					url:"${APP_PATH}/fillMyDetailMsgInfo",
					type:"POST",
					success:function(result){
						var code=result.code;
						if(code=="100"){
							fillDataWhenRequestSuccess(result);
						}else if(code=="200"){
							var msg = "还没登录，是否登录？"
	 							confirm(function() 
										{window.location.href = "${APP_PATH}/userpage/user/login2.jsp";
								}, "", msg);
						}
						
					}
					
				});
				
				//alert("我的信息");
				
			}
			//当AJAX请求成功后执行该方法
			function fillDataWhenRequestSuccess(result){
				var user=result.extend.user;
				var uId=user.uId;//用户主键
				$("#uId").val(uId);
				$("#login_ID").text("").append(user.uLoginid);
				$("#regist_Time").text("").append(user.uRegisttime);
				$("#login_Time").text("").append(user.uLogintime);
				$("#login_Num").text("").append(user.uScore);
				//表单数据
				$("#uNickname").val("").val(user.uNickname);
				$("#uEmail").val("").val(user.uEmail);
				$("#uPhone").val("").val(user.uPhone);
				$("#txt_city").val("").val(user.uAddress);
				
				$("#uSafequest").val("").val(user.uSafequest);
				$("#uSafeanswer").val("").val(user.uSafeanswer);
				$("#introduce").val("").val(user.introduce);
				//性别单独判断userSex
				var sexInfo=user.uSex;
				console.log("性别:"+sexInfo);
				if(sexInfo=="男"){
					$("#userSex").children("input:eq(0)").prop("checked",true);
					$("#userSex").children("input:eq(1)").prop("checked",false);
				}
				if(sexInfo=="女"){
					$("#userSex").children("input:eq(0)").prop("checked",false);
					$("#userSex").children("input:eq(1)").prop("checked",true);
				}
 				console.log("用户昵称:"+user.uNickname);
			}
			
			//点击提交按钮
			$(".changeInfoBtn").click(function(){
				//检验邮箱
				var email_flag=checkEmail();
 				if(email_flag==false) return false;
  				//校验手机号
				var phone_flag=checkPhone();
				if(phone_flag==false)return false;
				
				updateMyInfo();
				
			});
			
			//更新个人信息
			function updateMyInfo(){
				var uId=$("#uId").val();
				var uNickname= $("#uNickname").val();
				var uEmail=$("#uEmail").val();
				var uPhone=$("#uPhone").val();
				var uAddress=$("#txt_city").val();
				var uSafequest=$("#uSafequest").val();
				var uSafeanswer=$("#uSafeanswer").val();
				var introduce=$("#introduce").val();
				var uSex=$("input:radio:checked").val(); 
				//alert($("#form_id").serialize());
				//判断是否为空
				if(uNickname.length<1) return false;
				if(uAddress.length<1) return false;
				if(uSafequest.length<1) return false;
				if(uSafeanswer.length<1) return false;
				$.ajax({
					url:"${APP_PATH}/updateMyInfo",
					type:"POST",
					//data:$("#form_id").serialize(),
					data:{"uId":uId,"uNickname":uNickname,"uEmail":uEmail,"uPhone":uPhone,"uAddress":uAddress,"uSafequest":uSafequest,"uSafeanswer":uSafeanswer,"introduce":introduce,"uSex":uSex},
					success:function(result){
						var code=result.code;
						if(code=="100"){
							//alert("成功.");
							fillMyDetailMsgInfo();
							$.Huimodalalert('修改成功，10秒后可再次编辑', 1500);
							$(".changeInfoBtn").removeClass("layui-btn").addClass("layui-btn layui-btn-disabled");
							setTimeout(function(){
								$(".changeInfoBtn").removeClass("layui-btn layui-btn-disabled").addClass("layui-btn");
							},10000);
						}else if(code=="200"){
							var msg=result.extend.msg;
							alert("提示:"+msg);
						}
					}
				});
			}
			
			//校验手机是否能用
			function checkPhone(){
 				var myregPhone=/^[1][3,4,5,7,8][0-9]{9}$/;
				var uPhone=$("#uPhone").val();
				if(!myregPhone.test(uPhone)){
					var font_ele=$("<font>非法手机号!</font>").css("color","#ff9393");
					$("#uPhone").parent("div").next("div").text("").append(font_ele);
					return false;
				}
				var phone_flag=1;//手机能用
				$.ajax({
					url:"${APP_PATH}/checkPhoneIsUserByOther",
					type:"POST",
					data:{"uPhone":uPhone},
					async:false,
					success:function(result){
						var code=result.code;
						//邮箱能用
						if(code=="100"){
							phone_flag=1;
							$("#uPhone").parent("div").next("div").text("");
						}else if(code=="200"){
							//邮箱不能用
							phone_flag=0;
							var font_ele=$("<font>手机已被别人使用</font>").css("color","#ff9393");
							$("#uPhone").parent("div").next("div").text("").append(font_ele);
						}else if(code=="300"){
							phone_flag=0;
							var msg=result.extend.msg;
							alert("提示:"+msg);
						}
					}
					
				});
				if(phone_flag==0) return false;
				if(phone_flag==1) return true;
				
			}
			//校验邮箱是否符合格式，是否已被他人使用(该用户之外的)
			function checkEmail(){
				var uEmail=$("#uEmail").val();
 				var regEmail=/^([a-zA-Z0-9_\.-]+)@([\da-zA-Z\.-]+)\.([a-zA-Z\.]{2,12})$/;
				if(!regEmail.test(uEmail)){
					//alert(uEmail);
					var font_ele=$("<font>邮箱格式错误!</font>").css("color","#ff9393");
					$("#uEmail").parent("div").next("div").text("").append(font_ele);
					return false;
				}
				//校验这个邮箱是否被其他用户占用
				var emali_flag=1;//邮箱能用
				$.ajax({
					url:"${APP_PATH}/checkEmailIsUserByOther",
					type:"POST",
					data:{"uEmail":uEmail},
					async:false,
					success:function(result){
						var code=result.code;
						//邮箱能用
						if(code=="100"){
							emali_flag=1;
							$("#uEmail").parent("div").next("div").text("");
						}else if(code=="200"){
							//邮箱不能用
							emali_flag=0;
							var font_ele=$("<font>邮箱已被别人使用</font>").css("color","#ff9393");
							$("#uEmail").parent("div").next("div").text("").append(font_ele);
						}else if(code=="300"){
							emali_flag=0;
							var msg=result.extend.msg;
							alert("提示:"+msg);
						}
					}
					
				});
				if(emali_flag==0) return false;
				if(emali_flag==1) return true;
			}
			
			//当点击 详细信息按钮的时候之
			$("#showMyDetailMsgID").click(function(){
				fillMyDetailMsgInfo();
				$("#myDetailMsgID").css("display","block");
				$("#change_My_Password").css("display","none");//隐藏其他
			});
			
			
          $('#txt_city').jcity({
              urlOrData: '${APP_PATH}/static/city/js/citydata.json',
              animate: { showClass: 'animated flipInX', hideClass: 'animated flipOutX' },  // 需要第一步引用的animate.min.css文件，也可以自己定义动画 
              onChoice: function (data) {
                  console.log(data);
             }
          });
     });
</script>

<!--  -->
</div>
