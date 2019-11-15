<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>考勤列表</title>
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
	<div class="weadmin-nav">
		<span class="layui-breadcrumb"> <a href="">首页</a> <a href="">考勤管理</a>
			<a><cite>考勤列表</cite></a>
		</span> <a class="layui-btn layui-btn-sm"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="javascript:location.replace(location.href);" title="刷新"> <i
			class="layui-icon" style="line-height: 30px">ဂ</i></a>
	</div>
	<div class="weadmin-body">
		<div class="layui-row">
			<form class="layui-form layui-col-md12 we-search">
				<div class="layui-input-inline">
					<select name="subjectId">
						<option value="">课程名称</option>
						<c:forEach items="${subjects}" var="subject">
						<option value="${subject.id}">${subject.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="layui-input-inline">
					<select name="type">
						<option value="">类型</option>
						<option value="0">随机</option>
						<option value="1">全体</option>
					</select>
				</div>
				<div class="layui-input-inline">
					<select name="status">
						<option value="">状态</option>
						<option value="0">未开始</option>
						<option value="1">进行中</option>
						<option value="2">已结束</option>
					</select>
				</div>
				<div class="layui-inline">
					<input class="layui-input" placeholder="开始日" name="startTime" id="start">
				</div>
				<div class="layui-inline">
					<input class="layui-input" placeholder="截止日" name="endTime" id="end">
				</div>
				<div class="layui-inline">
					<input class="layui-input" placeholder="年份" name="year" id="year">
				</div>
				<div class="layui-inline">
					<select name="term">
						<option value="">学期</option>
						<option value="1">第一学期</option>
						<option value="2">第二学期</option>
					</select>
				</div>
				
				<button class="layui-btn" lay-submit="" lay-filter="search">
					<i class="layui-icon">&#xe615;</i>
				</button>
			</form>
		</div>
		<div class="weadmin-block">
			<button class="layui-btn layui-btn-danger" onclick="delAll()">
				<i class="layui-icon"></i>批量删除
			</button>
			<button class="layui-btn" onclick="WeAdminShow('添加考勤','/attendance/add')">
				<i class="layui-icon"></i>新建考勤
			</button>
			<span class="fr" style="line-height: 40px">...</span>
		</div>
		<table class="layui-table" id="attendance_table">
			<thead>
				<tr>
					<th>
						<div class="layui-unselect header layui-form-checkbox"
							lay-skin="primary">
							<i class="layui-icon">&#xe605;</i>
						</div>
					</th>
					<th>课程名称</th>
					<th>年份/学期</th>
					<th>类型</th>
					<th>开始时间</th>
					<th>结束时间</th>
					<th>目标数</th>
					<th>出勤数</th>
					<th>出勤率</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<!-- <tr>
					<td>
						<div class="layui-unselect layui-form-checkbox" lay-skin="primary"
							data-id='2'>
							<i class="layui-icon">&#xe605;</i>
						</div>
					</td>
					<td>Java修炼手册</td>
					<td>2019~2020/第一学期</td>
					<td>全体考勤</td>
					<td>2019-11-14 17:30</td>
					<td>2017-11-14 17:35</td>
					<td>已结束</td>
					<td class="td-manage"><a title="查看"
						onclick="WeAdminShow('编辑','/attendance/publish')" href="javascript:;">
							<i class="layui-icon">&#xe63c;</i>
					</a> <a title="删除" onclick="member_del(this,'要删除的id')"
						href="javascript:;"> <i class="layui-icon">&#xe640;</i>
					</a>
					</td>
				</tr> -->
			</tbody>
		</table>
		<div class="page">
			<div>
				<a class="prev" href="">&lt;&lt;</a> <a class="num" href="">1</a> <span
					class="current">2</span> <a class="num" href="">3</a> <a
					class="num" href="">489</a> <a class="next" href="">&gt;&gt;</a>
			</div>
		</div>

	</div>
	<script>
	layui.extend({
		admin : '{/}/js/admin'
	});
	layui.use([ 'laydate', 'jquery', 'admin' ], function() {
		var laydate = layui.laydate, $ = layui.jquery, admin = layui.admin, form = layui.form;
		//执行一个laydate实例
		laydate.render({
			elem : '#start' //指定元素
		});
		//执行一个laydate实例
		laydate.render({
			elem : '#end' //指定元素
		});
		
		/******合并json函数开始*****/
		function extend(target, source) {
		       for (var obj in source) {
		           target[obj] = source[obj];
		       }
		       return target;
		}
		/*****合并json函数结束******/
		var pageInfo = {"limit":10,"offset":offset};//查询明细时分页信息
		form.on('submit(search)', function (data) {//合并表单内容和分页信息
			$.post('/attendance/list', extend(data.field,pageInfo), function (result) {
				console.log(extend(data.field,pageInfo));
				build_stus_table(result);//1考勤表单
	            build_page_info(result);//2页码控制
	            build_page_nav(result);//3底部分页
	            examIndexPage.init(result.rows);
	            console.log(result);
			});
			return false;//这里是拦截layui自带的提交
		});
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
		
		/******请求已发布考勤信息开始*******/
		var totalPage,currentPage,offset=0;
		$(function(){
			requestPage(offset);
		});

		function requestPage(offset){
			Core.postAjax("/attendance/list",{"limit":10,"offset":offset},function (result) {
	            build_stus_table(result);//1考勤表单
	            build_page_info(result);//2页码控制
	            build_page_nav(result);//3底部分页
	            console.log(result.id);
	            examIndexPage.init(result.rows);
	        })
		}
		Date.prototype.Format = function(fmt)   
		{ //author: meizz   
		  var o = {   
		    "M+" : this.getMonth()+1,                 //月份   
		    "d+" : this.getDate(),                    //日   
		    "h+" : this.getHours(),                   //小时   
		    "m+" : this.getMinutes(),                 //分   
		    "s+" : this.getSeconds(),                 //秒   
		    "q+" : Math.floor((this.getMonth()+3)/3), //季度   
		    "S"  : this.getMilliseconds()             //毫秒   
		  };   
		  if(/(y+)/.test(fmt))   
		    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
		  for(var k in o)   
		    if(new RegExp("("+ k +")").test(fmt))   
		  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
		  return fmt;   
		}  
		function build_stus_table(result){
			var attendances = result.rows;
			if(!attendances.length==0){
				$("#attendance_table tbody").empty();
				$.each(attendances, function(index, items){
					var statusTd,operateBtn,typeTd;
					if(items.status==0){//<span class="layui-btn layui-btn-normal layui-btn-xs">已启用</span>
						statusTd = $("<td></td>").addClass("td-status").append($("<span>未开始</span>").addClass("layui-btn layui-btn-warm layui-btn-xs"));
						operateBtn = $("<a title=\"明细\" onclick=\"WeAdminShow('详情','/attendance/publish?id="+items.id+"\')\" href=\"javascript:;\"><i class=\"layui-icon\">&#xe63c;</i></a>"
								+"<a title=\"删除\" onclick=\"member_del(this,'要删除的id')\" href=\"javascript:;\"> <i class=\"layui-icon\">&#xe640;</i></a>");
					}else if(items.status == 1){
						statusTd = $("<td></td>").addClass("td-status").append($("<span>进行中</span>").addClass("layui-btn layui-btn-green layui-btn-xs"));
						operateBtn = $("<a title=\"明细\" onclick=\"WeAdminShow('详情','/attendance/publish?id="+items.id+"\')\" href=\"javascript:;\"><i class=\"layui-icon\">&#xe63c;</i></a>"
										+"<a title=\"删除\" onclick=\"member_del(this,'要删除的id')\" href=\"javascript:;\"> <i class=\"layui-icon\">&#xe640;</i></a>");
					}else{
						statusTd = $("<td></td>").addClass("td-status").append($("<span>已结束</span>").addClass("layui-btn layui-btn-danger layui-btn-xs"));
						operateBtn =$("<a title=\"明细\" onclick=\"WeAdminShow('详情','/attendance/publish?id="+items.id+"\')\" href=\"javascript:;\"><i class=\"layui-icon\">&#xe63c;</i></a>"
								+"<a title=\"删除\" onclick=\"member_del(this,'要删除的id')\" href=\"javascript:;\"> <i class=\"layui-icon\">&#xe640;</i></a>");
					}
					if(items.type==0){
						typeTd = $("<td></td>").append("<span>随机</span>");
					}else if(items.type==1){
						typeTd = $("<td></td>").append("<span>全体</span>");
					}
					var headTd = $("<td></td>").append("<div class='layui-unselect layui-form-checkbox' lay-skin='primary' data-id='2'> <i class='layui-icon'>&#xe605;</i> </div>");
					var subjectTd = $("<td></td>").append(items.subject.name);
					var yearAndTermTd = $("<td></td>").append(items.year+'~'+(++items.year)+'/'+items.term);
					//var typeTd = $("<td></td>").append();
					var startTimeTd = $("<td></td>").append(new Date(items.startTime).Format('yyyy-MM-dd hh:mm:ss'));
					var endTimeTd = $("<td></td>").append(new Date(items.endTime).Format('yyyy-MM-dd hh:mm:ss'));
					var studentNumsTd = $("<td></td>").append(items.courseTotal);
					var presentTd = $("<td></td>").append(items.presentTotal);
					var presentRateTd = $("<td></td>").append(((items.presentTotal*100)/items.courseTotal).toFixed(2)+"%");
					//var statusTd = $("<td></td>").append(tableTail);
					var operateTd = $("<td></td>").addClass("td-manage").append(operateBtn);
					$("<tr></tr>").append(headTd)
					 			  .append(subjectTd)
								  .append(yearAndTermTd)
								  .append(typeTd)
								  .append(startTimeTd)
								  .append(endTimeTd)
								  .append(studentNumsTd)
								  .append(presentTd)
								  .append(presentRateTd)
								  .append(statusTd)
								  .append(operateTd)
								  .appendTo("#attendance_table tbody");
				})
			}else{
				$("#attendance_table tbody").empty();
				$("<tr style='text-align:center'><td colspan='5'>当前没有记录</td></tr>").appendTo("#attendance_table tbody");
			}
		}
		/*
		<td class="td-manage"><a title="查看"
			onclick="WeAdminShow('编辑','/attendance/publish')" href="javascript:;">
				<i class="layui-icon">&#xe63c;</i>
		</a> <a title="删除" onclick="member_del(this,'要删除的id')"
			href="javascript:;"> <i class="layui-icon">&#xe640;</i>
		</a>
		</td>*/
		/*********分页开始*********/
		function build_page_info(result){
			var pageInfo = result.pageInfo;
			if(!pageInfo.pageNum == 0){
				$("#page_info_area").empty();
				$("#page_info_area").append("当前第"+ 
					pageInfo.pageNum +"页,总共"+ 
					pageInfo.pages +"页,总共"+  
					result.total +"条记录");
				totalPage=pageInfo.total;
				currentPage=pageInfo.pageNum;
			}
		}
		
		

		function build_page_nav(result){
			var pageInfo = result.pageInfo;
			if(!pageInfo.pageNum == 0){
				$("#page_nav_area").empty();
				var ul = $("<ul></ul>").addClass("pagination");
				var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
				var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
				if(pageInfo.hasPreviousPage == false){
					firstPageLi.addClass("disabled");
					prePageLi.addClass("disabled");
				}else{
					firstPageLi.click(function(){
						requestPage(0);
						offset=0;
					});
					prePageLi.click(function(){
						requestPage(offset-=5)	
					});
				}
				
				var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
				var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href", "#"));
				if(pageInfo.hasNextPage == false){
					nextPageLi.addClass("disabled");
					lastPageLi.addClass("disabled");
				}else{
					nextPageLi.click(function(){
						requestPage(offset+=5);
					});
					lastPageLi.click(function(){
						requestPage(pageInfo.pages*5);
					});
				}
				ul.append(firstPageLi).append(prePageLi),
				$.each(pageInfo.navigatepageNums, function(index, items){
					var numLi = $("<li></li>").append($("<a></a>").append(items));
					if(pageInfo.pageNum == items){
						numLi.addClass("active");
						}
					numLi.click(function(){
						requestPage(items*5-1);
						});
					ul.append(numLi);
					});
				ul.append(nextPageLi).append(lastPageLi);
				var nav = $("<nav></nav>").css("float","right").append(ul);
				nav.appendTo("#page_nav_area");
				}
			};
			/*********分页结束*********/
			/*进入考勤*/
		    function startToAttendanceAction(id) {
				Core.postAjax("/attendance/validate",{"id":id}, function(data){
					if(data.status==200){
						layer.msg("loading...", {
							title: "系统提示",
						    icon: 3,
						    time: 800
						},function(){
							window.location.href="/attendance/startAttendance?attendanceId="+id;
					    }); 
					}else{
						layer.alert(data.msg, {
							title:"系统提示",
							icon: 2
						});
					}
				})
		        //window.location.href="/attendance/startattendance?attendanceId="+id;
		    }
		    /******请求已发布考勤信息结束*******/
	</script>
</body>

</html>