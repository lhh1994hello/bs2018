	

/* 五星评价的JS */
							/*over()是鼠标移过事件的处理方法*/
				function over(param){
				    if(param == 1){
				        $("#star1").attr("src","${APP_PATH}/images/star/star_red.png");//第一颗星星亮起来，下面以此类推
				        $("#message").html("很差");//设置提示语，下面以此类推
				    }else if(param == 2){
				        $("#star1").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#star2").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#message").html("比较差");
				    }else if(param == 3){
				        $("#star1").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#star2").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#star3").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#message").html("一般");
				    }else if(param == 4){
				        $("#star1").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#star2").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#star3").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#star4").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#message").html("比较好");
				    }else if(param == 5){
				    	$("#star1").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#star2").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#star3").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#star4").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#star4").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#message").html("很好");
				    }
				}
				/*out 方法是鼠标移除事件的处理方法，当鼠标移出时，恢复到我的打分情况*/
				function out(){
				    if(check == 1){//打分是1，设置第一颗星星亮，其他星星暗，其他情况以此类推
				        $("#star1").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#star2").attr("src","${APP_PATH}/images/star/star.png");
				        $("#star3").attr("src","${APP_PATH}/images/star/star.png");
				        $("#star4").attr("src","${APP_PATH}/images/star/star.png");
				        $("#star5").attr("src","${APP_PATH}/images/star/star.png");
				        $("#message").html("");
				    }else if(check == 2){
				        $("#star1").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#star2").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#star3").attr("src","${APP_PATH}/images/star/star.png");
				        $("#star4").attr("src","${APP_PATH}/images/star/star.png");
				        $("#star5").attr("src","${APP_PATH}/images/star/star.png");
				        $("#message").html("");
				    }else if(check == 3){
				        $("#star1").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#star2").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#star3").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#star4").attr("src","${APP_PATH}/images/star/star.png");
				        $("#star5").attr("src","${APP_PATH}/images/star/star.png");
				        $("#message").html("");
				    }else if(check == 4){
				        $("#star1").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#star2").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#star3").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#star4").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#star5").attr("src","${APP_PATH}/images/star/star.png");
				        $("#message").html("");
				    }else if(check == 5){
				    	 $("#star1").attr("src","${APP_PATH}/images/star/star_red.png");
				         $("#star2").attr("src","${APP_PATH}/images/star/star_red.png");
				         $("#star3").attr("src","${APP_PATH}/images/star/star_red.png");
				         $("#star4").attr("src","${APP_PATH}/images/star/star_red.png");
				         $("#star5").attr("src","${APP_PATH}/images/star/star_red.png");
				        $("#message").html("");
				    }else if(check == 0){
				        $("#star1").attr("src","${APP_PATH}/images/star/star.png");
				        $("#star2").attr("src","${APP_PATH}/images/star/star.png");
				        $("#star3").attr("src","${APP_PATH}/images/star/star.png");
				        $("#star4").attr("src","${APP_PATH}/images/star/star.png");
				        $("#star5").attr("src","${APP_PATH}/images/star/star.png");
				        $("#message").html("");
				    }
				}
				/*click()点击事件处理，记录打分*/
				function click(param){
				    time++;//记录打分次数
				    check = param;//记录当前打分
				    out();//设置星星数
				}
		/* 五星评价的JS */