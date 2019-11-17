<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="/js/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="/js/semantic-ui/semantic.min.css" />
<link rel="stylesheet" href="/js/zplayer/css/zplayer.min.css" />
<link rel="stylesheet" href="/css/exam-common.css" />
<link rel="stylesheet" href="/css/web-common.css" />
<link rel="stylesheet" href="/css/font.css">
<link rel="stylesheet" href="/css/weadmin.css">
<script src="/js/jquery/jquery.min.js"></script>
<script src="/js/jquery/jquery.countdown.min.js"></script>
<script src="/js/bootstrap/bootstrap.min.js"></script>
<script src="/js/semantic-ui/semantic.min.js"></script>
<script src="/js/layer/layer.js"></script>
<script src="/js/core.js"></script>
<script src="/lib/layui/layui.js" charset="utf-8"></script>
<script src="/js/attendance.js"></script>
<style>
.box {
	width: 600px;
	border: 0px solid #999;
	position: absolute;
	left: 50%;
	top: 25%;
	bottom: 20%;
	text-align: center;
	padding: 20px;
	/*margin-left:-200px;
            margin-top:-150px;*/
	-webkit-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}

.content {
	border: 1px solid #999;
	padding: 20px;
	font-size: 30px;
}


.custom {
	padding: 20px;
	border: 1px solid green;
	border-radius: 5px;
	margin-top: 10px;
	text-align: center;
}
</style>
</head>
<body>
	<div class="box">
		<div class="content" id="content">随机点名器</div>
		<div class="" style="padding:5px">
			<button class="layui-btn layui-btn-green layui-btn-sm fordisabled" onclick="checkIn()">
				<i class="layui-icon">&#xe60c;</i>出勤
			</button>
			<button class="layui-btn layui-btn-warm layui-btn-sm fordisabled" onclick="onLeave()">
				<i class="layui-icon">&#xe664;</i>请假
			</button>
			<button class="layui-btn layui-btn-danger layui-btn-sm fordisabled" onclick="checkOut()">
				<i class="layui-icon">&#xe69c;</i>缺勤
			</button>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs4 layui-col-sm12 layui-col-md4">
				<button class="layui-btn layui-btn-normal" onclick="gotoRand()" id="btn">开 始</button>
			</div>
			<div class="layui-col-xs4 layui-col-sm12 layui-col-md4 layui-col-md-offset4">
				<button class="layui-btn layui-btn-normal" onclick="backAndReload()" id="btn">返回</button>
			</div>
		</div>
		<div class="custom" id="custom">
			<table class="layui-table" id="attendance_table">
				<thead>
					<tr>
						<th>学号</th>
						<th>姓名</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
	<script>
		var requestTarget = ${id};
		$(function() {
			requestForRandom(requestTarget);
		});

		function requestForRandom(id) {
			Core.postAjax("/attendance/random", {
				"id" : id
			}, function(result) {
				if (result.status == 200) {
					layer.msg(result.msg, {
						title : "系统提示",
						icon : 4,
						time : 800
					}, function() {
						buildArray(result);//填充至数组
					});
				} else {
					layer.alert(result.msg, {
						title : "系统提示",
						icon : 2
					});
				}
			})
		}

		
		function buildArray(result) {
			var data = result.data;
			$.each(data, function(i, items) {
				nameList.push(items.user.username + ' ' + items.user.nickname);
				ashIdList.push(items.id);
				console.log(nameList);
				console.log(ashIdList);
			})
		}
		
		
		//声明 所有的人名 组成的数组
		var nameList = new Array();
		//声明 人名对应的 考勤记录id
		var ashIdList = new Array();
		//声明时间的变量
		var timer = null;
		//定义全局变量
		var index = null;
		//当前指向
		var ashId = 0;
		//开始 随机的函数
		function gotoRand() {
			//获取button 元素
			var button = document.getElementById('btn');
			//判断 是开始还是结束
			if (timer === null) {
				//开启定时
				timer = setInterval(getName, 100);
				//把button的内容改掉
				button.innerHTML = "暂 停";
			} else {
				//清除定时
				clearInterval(timer);
				//修改button的内容
				button.innerHTML = "开 始";
				//把timer赋值为null
				timer = null;
				if (nameList.length > 0) {
					//取出数据 放在custom里
					/* document.getElementById('custom').innerHTML += nameList[index]
							+ '<br>'; */
					//把取过数据删掉
					ashId = ashIdList.splice(index, 1);
					var usernameTd = $("<td></td>").append(nameList[index].split(" ")[0]);
					var nicknameTd = $("<td></td>").append(nameList[index].split(" ")[1]);
					var operateBtn =$("<a title=\"补签\" onclick=\"checkIn2("+ashId+")\" href=\"javascript:;\"><i class=\"layui-icon\">&#xe60c;</i></a>"
							+"<a title=\"请假\" onclick=\"onLeave2("+ashId+")\" href=\"javascript:;\"> <i class=\"layui-icon\">&#xe664;</i></a>"
							+"<a title=\"签退\" onclick=\"checkOut2("+ashId+")\" href=\"javascript:;\"> <i class=\"layui-icon\">&#xe69c;</i></a>");
					var operateTd = $("<td></td>").addClass("td-manager").append(operateBtn);
					$("<tr></tr>").append(usernameTd)
							  .append(nicknameTd)
							  .append(operateTd)
							  .appendTo("#attendance_table tbody");
					nameList.splice(index, 1);
				}
			}
		}
		//随机获取姓名函数
		function getName() {
			//判断
			if (nameList.length <= 0) {
				document.getElementById('content').innerHTML = "没了,别取了";
				$('.fordisabled').addClass("layui-btn-disabled").attr("disabled","");//layui-btn禁用分 <样式>和<功能>的禁用
				console.log("禁用");
				return;
			}
			//取随机数
			index = Math.floor(Math.random() * 10000000 % nameList.length);
			//取出姓名放入 div中
			document.getElementById('content').innerHTML = nameList[index];
		}
		
		
		/*****补签开始******/
		function checkIn(){
			$.post('/attendance/checkInByTeacher?id='+ashId, function (result) {
				console.log("checkIn:"+ashId);
				if(result.status==200){
					layer.msg("签到成功...", {
						title: "系统提示",
					    icon: 1,
					    time: 800
					},function(){
						//window.location.reload();
				    }); 
				}else{
					layer.alert(result.msg, {
						title:"系统提示",
						icon: 2
					});
				}
			});
			//下面这个方法，后台获取id值始终为空
			/* Core.postAjax("/attendance/checkInByTeacher",{"id":ashId}, function(data){
				console.log("checkIn:"+ashId);
				if(data.status==200){
					layer.msg("签到成功...", {
						title: "系统提示",
					    icon: 1,
					    time: 800
					},function(){
						//window.location.reload();
				    }); 
				}else{
					layer.alert(data.msg, {
						title:"系统提示",
						icon: 2
					});
				}
			}) */
		}
		/*****补签结束******/
		/*****请假开始******/
		function onLeave(){
			$.post('/attendance/onLeave?id='+ashId, function (result) {
				console.log("checkIn:"+ashId);
				if(result.status==200){
					layer.msg("请假成功...", {
						title: "系统提示",
					    icon: 1,
					    time: 800
					},function(){
						//window.location.reload();
				    }); 
				}else{
					layer.alert(result.msg, {
						title:"系统提示",
						icon: 2
					});
				}
			});
		}
		/*****请假结束******/
		/*****签退开始******/
		function checkOut(){
			$.post('/attendance/checkOut?id='+ashId, function (result) {
				console.log("checkIn:"+ashId);
				if(result.status==200){
					layer.msg("签退成功...", {
						title: "系统提示",
					    icon: 1,
					    time: 800
					},function(){
						//window.location.reload();
				    }); 
				}else{
					layer.alert(result.msg, {
						title:"系统提示",
						icon: 2
					});
				}
			});
		}
		/*****签退结束******/
		
		
		
		
		
		
		
		
		/*****补签开始******/
		function checkIn2(id){
			Core.postAjax("/attendance/checkInByTeacher",{"id": id}, function(data){
				if(data.status==200){
					layer.msg("签到成功...", {
						title: "系统提示",
					    icon: 1,
					    time: 800
					},function(){
						//window.location.reload();
				    }); 
				}else{
					layer.alert(data.msg, {
						title:"系统提示",
						icon: 2
					});
				}
			})
		}
		/*****补签结束******/
		/*****请假开始******/
		function onLeave2(id){
			Core.postAjax("/attendance/onLeave",{"id": id}, function(data){
				if(data.status==200){
					layer.msg("请假成功...", {
						title: "系统提示",
					    icon: 1,
					    time: 800
					},function(){
						//window.location.reload();
				    }); 
				}else{
					layer.alert(data.msg, {
						title:"系统提示",
						icon: 2
					});
				}
			})
		}
		/*****请假结束******/
		/*****签退开始******/
		function checkOut2(id){
			Core.postAjax("/attendance/checkOut",{"id": id}, function(data){
				if(data.status==200){
					layer.msg("签退成功...", {
						title: "系统提示",
					    icon: 1,
					    time: 800
					},function(){
						//window.location.reload();
				    }); 
				}else{
					layer.alert(data.msg, {
						title:"系统提示",
						icon: 2
					});
				}
			})
		}
		/*****签退结束******/
		
		function backAndReload(){
			window.parent.location.reload();//刷新父窗口
			window.close(); //关闭当前窗口
		}
		
	</script>

</body>
</html>