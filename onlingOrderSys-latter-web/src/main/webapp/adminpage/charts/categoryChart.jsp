<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/echarts.js"></script>
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"	rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<title>菜系信息</title>
</head>
<body>
	<div id="main" style="width: 800px;height:400px;"></div>
	<script type="text/javascript">
		 var myChart = echarts.init(document.getElementById('main'));
		$(function(){
			//先初始化模型
			myChart.setOption({
			    title: {
			        text: '分类下所属菜品数量'
			    },
			    tooltip: {},
			    legend: {
			        data:['数量']
			    },
			    xAxis: {
			        data: []
			    },
			    yAxis: {},
			    series: [{
			        name: '数量',
			        type: 'bar',
			        data: []
			    }]
			});
			 fillDate();
			//请求数据
			function fillDate(){
				/* var name[];
				var num[]; */
				$.ajax({
					url:"${APP_PATH}/findAllCateToMap",
					type:"POST",
					cache:false,
					success:function(result){
						var map=result.extend.map;
						//name.push();
						console.log("数据:"+map);
						subfilldata(result);
					},
					error:function(){
						alaert("出错了");
					}
				});
			}
			
			function subfilldata(result){
				var map=result.extend.map;
 				var isKey=new Array();
 				var isValue=new Array();
				$.each(map,function(keys,values){
					console.log("名称:"+keys+",数量:"+values);
					isKey.push(keys);
					isValue.push(values);
					//console.log("数据2:"+values);
				});
				/*  */
				myChart.setOption({
       				 xAxis: {
            		 data: isKey
       			 },
      		series: [{
            	// 根据名字对应到相应的系列
            	itemStyle:{
                    normal:{
                        color:'#ff7777'
                    }
                 },
            	name: '数量',
           		data: isValue
             }]
    });
				
				/*  */
				
			}
			
			
		});
			
	
	
	
	</script>
	
	
</body>
</html>