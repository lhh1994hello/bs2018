<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<!--  -->
			<div id="page_nav_area_A">
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
<!--  -->
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
					
					
					<td class="text-l">
						<div class="c-999 f-12">
							<u style="cursor:pointer" class="text-primary" onclick="member_show('张三','member-show.html','10001','360','400')">张三</u> 
							<time title="2014年8月31日 下午3:20" datetime="2014-08-31T03:54:20">2014-8-31 15:20</time>
							 <span class="ml-20">13000000000</span> 
							 <span class="ml-20">admin@mail.com</span>
						</div>
						<div class="f-12 c-999">
							<a href="http://www.h-ui.net/Hui-4.22-comment.shtml" target="_blank">http://www.h-ui.net/Hui-4.22-comment.shtml</a>
						</div>
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
</body>
</html>