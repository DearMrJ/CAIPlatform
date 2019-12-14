<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
</head>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/mainBody.css">
<link rel="stylesheet" href="/css/checkBT.css">
<script src="/js/jquery/jquery.min.js"></script>
<script src="/js/layer/layer.js"></script>
<script src="/js/core.js"></script>
<!-- <script src="/js/checkBT.js"></script> -->

<body>
	<div class="main-center" style="font-size: 20px;">>>${subject.name}(第${count+1}次考勤)</div>
	<div class="line"></div>
	<div class="main-bottom">
		<div class="select">
			<span>考勤方式</span> <label class="radio-inline"> <input
				type="radio" name="kaoqin" id="inlineRadio1" value="option1"> 顺序考勤
			</label> <label class="radio-inline"> <input type="radio"
				name="kaoqin" id="inlineRadio2" value="option2"> 随机考勤
			</label>
			<button class="start" id="start">
				<span>考勤开始</span>
			</button>
			<button class="end" id="end">
				<span>考勤结束</span>
			</button>
		</div>


		<div class="qiandao">
			学生名字 <span id="name">无</span>学生<span> </span> 人/已过检 <span> </span>
			人/未过检<span> </span> 人
			<button class="up" style="display: none;">
				<span style="color: rgba(19, 140, 136, 1);">返回上一个</span>
			</button>
		</div>


		<div class="button">
			<a href="javascript:;" id="down3" data-value="3" class="down" style="display: none;">旷课</a>
			<a href="javascript:;" id="down2" data-value="2" class="down" style="display: none;"> 请假</a>
			<a href="javascript:;" id="down1" data-value="1" class="down" style="display: none;">签到</a>
		</div>
	</div>

</body>

<script type="text/javascript">
	  var subjectId = ${subject.id};
	  var datas = [];
		/****************************************************/
	  $(function () {
	  layer.confirm('此考勤通道节省了多数配置，需要自定义考勤活动请前往考勤管理中心！', {icon: 3, title:'提示'}, function(index){
    	  //do something
    	  
    	  layer.close(index);
    	});
	    i = 0;
	    console.log(1111);
	    $("#start").click(function () {
		    console.log(2222);
	      if ($("input:checked").val() == 'option1') {
		    console.log("全体考勤");
		    layer.confirm('考勤已经开始，请不要中途离开！', {icon: 3, title:'提示'}, function(index){
		    	  //do something
		    	  
		    	  layer.close(index);
		    });
		  	//创建考勤并返回 ——目标学生数据
	    	//科目，类型，开始、结束时间
	    	/***********创建考勤开始************/
			Core.postAjax("/attendance/add",{"subjectId":subjectId,"type":1},function(result){
				if(result.status==200){
					console.log("old datas"+datas);
					datas = result.data;
					console.log("new datas"+datas);
					var i = 0;
			        if (i < datas.length) {
					    console.log(4444);
			          $("#name").text(datas[i].user.nickname);
			          $('.down').css("display", "");
			          $('.up').css("display", "");
			          $(".qiandao span").eq(1).text($(datas).length);
			          $(".qiandao span").eq(2).text(i);
			          $(".qiandao span").eq(3).text($(datas).length - i);
			        }
				}else{
					layer.alert(result.msg, {
						title:"系统提示",
						icon: 2
					});
				}
			});
		  	/***************创建考勤结束**************/
	        

	        //  学生签到面板
	        $('#down1').click(function () {
	        	console.log("签到");
	          /*****签到开始******/
	            $.post('/attendance/checkInByTeacher?id=' + datas[i].id, function (result) {
	              console.log("checkIn:" + datas[i].id +" "+datas[i].user.userId+" "+datas[i].user.username+" "+datas[i].user.nickname);
	              if (result.status == 200) {
	                /* layer.msg("签到成功...", {
	                  title: "系统提示",
	                  icon: 1,
	                  time: 300
	                }, function () {
	                }); */
		                // 下一个学生
		  	          if (i < datas.length) {
		  	            i = i + 1;
		  	            $(".qiandao span").eq(2).text(i);
		  	            $(".qiandao span").eq(3).text($(datas).length - i);
		  	            if (i < datas.length) {
		  	              $("#name").text(datas[i].user.nickname);
		  	            }
		  	            else $("#name").text('## End ##');
		  	          }
	              } else {
	                layer.alert(result.msg, {
	                  title: "系统提示",
	                  icon: 2
	                });
	              }
	            });
	          /****签到结束******/
	         
	        });

	        $('#down2').click(function () {
	          /*****请假开始******/
	            $.post('/attendance/onLeave?id=' + datas[i].id, function (result) {
	              console.log("onLeave:" + datas[i].id+" "+datas[i].user.userId+" "+datas[i].user.username+" "+datas[i].user.nickname);
	              if (result.status == 200) {
	                /* layer.msg("请假成功...", {
	                  title: "系统提示",
	                  icon: 1,
	                  time: 300
	                }, function () {
	                }); */
		             // 下一个学生
		  	          if (i < datas.length) {
		  	            i = i + 1;
		  	            $(".qiandao span").eq(2).text(i);
		  	            $(".qiandao span").eq(3).text($(datas).length - i);
		  	            if (i < datas.length) {
		  	              $("#name").text(datas[i].user.nickname);
		  	            }
		  	            else $("#name").text('## End ##');
		  	          }
	              } else {
	                layer.alert(result.msg, {
	                  title: "系统提示",
	                  icon: 2
	                });
	              }
	            });
	          /*****请假结束******/
	          
	        });

	        $('#down3').click(function () {
	          /*****旷课开始******/
	            $.post('/attendance/checkOut?id=' + datas[i].id, function (result) {
	            	console.log("checkOut:" + datas[i].id+" "+datas[i].user.userId+" "+datas[i].user.username+" "+datas[i].user.nickname);
	              if (result.status == 200) {
	                /* layer.msg("旷课成功...", {
	                  title: "系统提示",
	                  icon: 1,
	                  time: 300
	                }, function () {
	                }); */
		             // 下一个学生
		  	          if (i < datas.length) {
		  	            i = i + 1;
		  	            $(".qiandao span").eq(2).text(i);
		  	            $(".qiandao span").eq(3).text($(datas).length - i);
		  	            if (i < datas.length) {
		  	              $("#name").text(datas[i].user.nickname);
		  	            }
		  	            else $("#name").text('## End ##');
		  	          }
	              } else {
	                layer.alert(result.msg, {
	                  title: "系统提示",
	                  icon: 2
	                });
	              }
	            });
	          /*****旷课结束******/
	          
	        });

	        $(".up").click(function () {
	          if (i > 0) {
	            i = i - 1;
	            $("#name").text(datas[i].user.nickname);
	            $(".qiandao span").eq(2).text(i);
	            $(".qiandao span").eq(3).text($(datas).length - i);
	          }
	        })
	        // 随机考勤
	      } else if ($("input:checked").val() == 'option2') {
	    	  console.log("随机考勤");
	    	  layer.confirm('考勤已经开始，请不要中途离开！', {icon: 3, title:'提示'}, function(index){
		    	  //do something
		    	  
		    	  layer.close(index);
		    	});
	    	  i = 0;
	    	  var ch = 0;
		        var arr = new Array();
		        var number = 0;
			  	//创建考勤并返回 ——目标学生数据
		    	//科目，类型，开始、结束时间
		    	/***********创建考勤开始************/
				Core.postAjax("/attendance/add",{"subjectId":subjectId,"type":0},function(result){
			    	  console.log("随机add");
			    	
					if(result.status==200){
						console.log("old datas"+datas);
						datas = result.data;
						console.log("new datas"+datas);
				        arr[0] = Math.floor(Math.random() * $(datas).length);
				        while (i < ($(datas).length * 0.5) - 1) {
				          number = Math.floor(Math.random() * $(datas).length);
				          console.log(number);
				          for (j = 0; j < arr.length; j++) {
				            if (arr[j] == number) {
				              ch = 1;
				              break;
				            }
				          }
				          if (ch == 0) {
				            arr[i + 1] = number;
				            i = i + 1;
				          }
				          ch = 0;
				        }
				        i = 0;
				        if (i < arr.length) {
				          $("#name").text(datas[arr[i]].user.nickname);
				          $('.down').css("display", "");
				          $('.up').css("display", "");
				          $(".qiandao span").eq(1).text(arr.length);
				          $(".qiandao span").eq(2).text(i);
				          $(".qiandao span").eq(3).text(arr.length - i);
				        }
					}else{
						layer.alert(result.msg, {
							title:"系统提示",
							icon: 2
						});
					}
				});
	        


	        $('#down1').click(function () {
	          /*****签到开始******/
	            $.post('/attendance/checkInByTeacher?id=' + datas[arr[i]].id, function (result) {
	            	console.log("checkIn:" + datas[arr[i]].id+" "+datas[arr[i]].user.userId+" "+datas[arr[i]].user.username+" "+datas[arr[i]].user.nickname);
	              if (result.status == 200) {
	                /* layer.msg("签到成功...", {
	                  title: "系统提示",
	                  icon: 1,
	                  time: 300
	                }, function () {
	                }); */
	                /****签到结束******/
		  	          if (i < arr.length) {
		  	            i = i + 1;
		  	            $(".qiandao span").eq(2).text(i);
		  	            $(".qiandao span").eq(3).text(arr.length - i);
		  	            if (i < arr.length) {
		  	              $("#name").text(datas[arr[i]].user.nickname);
		  	            }
		  	            else $("#name").text('## End ##');
		  	          }
	              } else {
	                layer.alert(result.msg, {
	                  title: "系统提示",
	                  icon: 2
	                });
	              }
	            });
	          


	        });
	        $('#down2').click(function () {
	          /*****请假开始******/
	            $.post('/attendance/onLeave?id=' + datas[arr[i]].id, function (result) {
	            	console.log("onLeave:" + datas[arr[i]].id+" "+datas[arr[i]].user.userId+" "+datas[arr[i]].user.username+" "+datas[arr[i]].user.nickname);
	              if (result.status == 200) {
	                /* layer.msg("请假成功...", {
	                  title: "系统提示",
	                  icon: 1,
	                  time: 300
	                }, function () {
	                }); */
	                /*****请假结束******/
	  	          if (i < arr.length) {
	  	            i = i + 1;
	  	            $(".qiandao span").eq(2).text(i);
	  	            $(".qiandao span").eq(3).text(arr.length - i);
	  	            if (i < arr.length) {
	  	              $("#name").text(datas[arr[i]].user.nickname);
	  	            }
	  	            else $("#name").text('## End ##');
	  	          }
	              } else {
	                layer.alert(result.msg, {
	                  title: "系统提示",
	                  icon: 2
	                });
	              }
	            });
	          


	        });
	        $('#down3').click(function () {
	          /*****旷课开始******/
	            $.post('/attendance/checkOut?id=' + datas[arr[i]].id, function (result) {
	            	console.log("checkOut:" + datas[arr[i]].id+" "+datas[arr[i]].user.userId+" "+datas[arr[i]].user.username+" "+datas[arr[i]].user.nickname);
	              if (result.status == 200) {
	                /* layer.msg("旷课成功...", {
	                  title: "系统提示",
	                  icon: 1,
	                  time: 300
	                }, function () {
	                }); */
	                /*****旷课结束******/
	  	          if (i < arr.length) {
	  	            i = i + 1;
	  	            $(".qiandao span").eq(2).text(i);
	  	            $(".qiandao span").eq(3).text(arr.length - i);
	  	            if (i < arr.length) {
	  	              $("#name").text(datas[arr[i]].user.nickname);
	  	            }
	  	            else $("#name").text('## End ##');
	  	          }
	              } else {
	                layer.alert(result.msg, {
	                  title: "系统提示",
	                  icon: 2
	                });
	              }
	            });
	          
	        });

	        $(".up").click(function () {
	          if (i > 0) {
	            i = i - 1;
	            $("#name").text(datas[arr[i]].user.nickname);
	            $(".qiandao span").eq(2).text(i);
	            $(".qiandao span").eq(3).text(arr.length - i);
	          }
	        });
	      }
	    });

	    $("#end").click(function () {
	      $('.down').css("display", "none");
	      $('.up').css("display", "none");
	      $("#name").text('无');
	      $(".qiandao span").eq(1).text('');
	      $(".qiandao span").eq(2).text('');
	      $(".qiandao span").eq(3).text('');
	      layer.confirm('考勤已经结束，查看明细、补签、签退等更多操作请前往考勤管理中心！', {icon: 3, title:'提示'}, function(index){
	    	  //do something
	    	  layer.close(index);
    		});
	    });
	});
</script>

</html>