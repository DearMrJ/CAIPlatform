<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加考勤</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="/js/bootstrap/bootstrap.min.css"/>
<link rel="stylesheet" href="/js/semantic-ui/semantic.min.css" />
<link rel="stylesheet" href="/js/zplayer/css/zplayer.min.css"/>
<link rel="stylesheet" href="/css/exam-common.css"/>
<link rel="stylesheet" href="/css/web-common.css"/>
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
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
	      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
	      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
</head>

<body>
	<div class="weadmin-body">
		<div class="layui-row">
			<form class="layui-form layui-col-md12 we-search">
				<div class="layui-input-inline">
					<select name="subjectId" id="subjectId">
						<option value="">课程名称</option>
						<c:forEach items="${subjects}" var="subject">
						<option value="${subject.id}">${subject.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="layui-input-inline">
					<select name="type" id="type">
						<option value="">考勤类型</option>
						<option value="0">随机考勤</option>
						<option value="1">全体考勤</option>
					</select>
				</div>
				<div class="layui-inline">
					<input class="layui-input" placeholder="开始时间" autocomplete="off" name="startTime" id="start">
				</div>
				<div class="layui-inline">
					<input class="layui-input" placeholder="截止时间" autocomplete="off" name="endTime" id="end">
				</div>
				
				<button class="layui-btn" lay-submit="" lay-filter="search">
					<i class="layui-icon">&#xe609;</i>
				</button>
			</form>
		</div>
		<!-- <div class="weadmin-block">
			<button class="layui-btn layui-btn-danger" onclick="delAll()">
				<i class="layui-icon"></i>批量删除
			</button>
			<button class="layui-btn" onclick="WeAdminShow('添加考勤','./add.html')">
				<i class="layui-icon"></i>新建考勤
			</button>
			<span class="fr" style="line-height: 40px">共有数据：88 条</span>
		</div> -->
		<!-- <div class="page">
			<div>
				<a class="prev" href="">&lt;&lt;</a> <a class="num" href="">1</a> <span
					class="current">2</span> <a class="num" href="">3</a> <a
					class="num" href="">489</a> <a class="next" href="">&gt;&gt;</a>
			</div>
		</div> -->

	</div>
	<script>
		layui.extend({
			admin : '{/}/js/admin'
		});
		layui.use([ 'laydate', 'jquery', 'admin' ], function() {
			var laydate = layui.laydate, $ = layui.jquery, admin = layui.admin, form = layui.form;
			
			var nowTime = new Date().valueOf();
			//执行一个laydate实例
			laydate.render({
				elem : '#start', //指定元素
				type: 'datetime',
				min: nowTime,
				format: 'yyyy-MM-dd HH:mm:ss',//HH,hh出现问题，且后台实体类也必须是HH，出大问题
				//没有什么卵用的时间控制
				done: function(value, date, endDate) {
					var startDate = new Date(value).getTime();
					var endTime = new Date($('#end').val()).getTime();
					if(endTime < startDate) {
						layer.msg('结束时间不能小于开始时间');
						$('#start').val($('#end').val());
					}
				}
			});
			//执行一个laydate实例
			laydate.render({
				elem : '#end', //指定元素
				type: 'datetime',
				min: nowTime,
				format: 'yyyy-MM-dd HH:mm:ss',
				//并没有什么卵用的时间控制
				done: function(value, date, endDate) {
					var startDate = new Date($('#start').val()).getTime();
					var endTime = new Date(value).getTime();
					if(endTime < startDate) {
						layer.msg('结束时间不能小于开始时间');
						$('#end').val($('#start').val());
					}
				}
			});

			
			/***********************提交表单开始*************************/
			form.on('submit(search)', function (data) {
				/***********限制输入非空开始************/
				var $1 = $.trim($('#subjectId').val());
	            var $2 = $.trim($("#type").val());
	            var $3 = $.trim($("#start").val());
	            var $4 = $.trim($("#end").val());
	            if($1 == null || $1 == ''){  
	                layer.msg('请选择目标课程！',function() {time:1000}); 
	                return false;  
	            }
	            if($2 == null || $2 == ''){  
	                layer.msg('请选择考勤类型！',function() {time:1000});
	                return false; 
	            }
	            if($3 == null || $3 == ''){  
	                layer.msg('开始时间需非空！',function() {time:1000});
	                return false; 
	            }
	            if($4 == null || $4 == ''){  
	                layer.msg('结束时间需非空！',function() {time:1000});
	                return false; 
	            }
	            if($3 >= $4){  
	                layer.msg('结束时间必须大于开始时间！',function() {time:1000});
	                return false; 
	            }
	            /***********限制输入非空开始************/
	            /***********表单数据提交开始************/
				Core.postAjax("/attendance/add",data.field, function(result){
					if(result.status==200){
						layer.msg(result.msg, {
							title: "系统提示",
						    icon: 1,
						    time: 800
						},function(){
							window.parent.location.reload();//刷新父窗口
							window.close(); //关闭当前窗口
					    }); 
					}else{
						layer.alert(result.msg, {
							title:"系统提示",
							icon: 2
						});
					}
				})
				/***********表单数据提交结束************/
				return false;//这里是拦截layui自带的提交 
			});
			/***********************提交表单结束*************************/
			/*用户-停用*/
			/* function member_stop(obj, id) {
				layer.confirm('确认要停用吗？', function(index) {
					if($(obj).attr('title') == '启用') {
						//发异步把用户状态进行更改
						$(obj).attr('title', '停用')
						$(obj).find('i').html('&#xe62f;');
			
						$(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
						layer.msg('已停用!', {
							icon: 5,
							time: 1000
						});
			
					} else {
						$(obj).attr('title', '启用')
						$(obj).find('i').html('&#xe601;');
			
						$(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
						layer.msg('已启用!', {
							icon: 5,
							time: 1000
						});
					}
				});
			} */

			/*用户-删除*/
			/* function member_del(obj, id) {
				layer.confirm('确认要删除吗？', function(index) {
					//发异步删除数据
					$(obj).parents("tr").remove();
					layer.msg('已删除!', {
						icon: 1,
						time: 1000
					});
				});
			}
			
			function delAll(argument) {
				var data = tableCheck.getData();
				layer.confirm('确认要删除吗？' + data, function(index) {
					//捉到所有被选中的，发异步进行删除
					layer.msg('删除成功', {
						icon: 1
					});
					$(".layui-form-checked").not('.header').parents('tr').remove();
				});
			} */
		});
	</script>
</body>

</html>