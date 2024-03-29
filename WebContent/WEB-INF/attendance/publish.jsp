<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<div class="weadmin-body">
		<div class="layui-row">
			<form class="layui-form layui-col-md12 we-search">
				<input type="hidden" value="${id}" name="attendanceId">
				<div class="layui-inline">
					<input class="layui-input" placeholder="班级" name="className" id="className">
				</div>
				<div class="layui-inline">
					<input class="layui-input" placeholder="学号" name="studentUsername" id="studentUsername">
				</div>
				<div class="layui-inline">
					<input class="layui-input" placeholder="姓名" name="studentNickname" id="studentNickname">
				</div>
				<div class="layui-input-inline">
					<select name="status">
						<option value="">状态</option>
						<option value="0">未签到</option>
						<option value="1">已签到</option>
						<option value="2">已请假</option>
					</select>
				</div>
				<button class="layui-btn" lay-submit="" lay-filter="search">
					<i class="layui-icon">&#xe615;</i>
				</button>
			</form>
		</div>
		<div class="weadmin-block">
			<button class="layui-btn layui-btn-green" onclick="checkInSelected()">
				<i class="layui-icon">&#xe60c;</i>批量签到
			</button>
			<button class="layui-btn layui-btn-warm" onclick="onLeaveSelected()">
				<i class="layui-icon">&#xe664;</i>批量请假
			</button>
			<button class="layui-btn layui-btn-danger" onclick="checkOutSelected()">
				<i class="layui-icon">&#xe69c;</i>批量签退
			</button>
			<span id="toRandom" class="fr" style="line-height: 40px"></span>
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
					<th>班级</th>
					<th>学号</th>
					<th>姓名</th>
					<th>签到时间</th>
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
					<td class="td-manager"><a title="查看"
						onclick="WeAdminShow('编辑','/attendance/publish')" href="javascript:;">
							<i class="layui-icon">&#xe63c;</i>
					</a> <a title="删除" onclick="member_del(this,'要删除的id')"
						href="javascript:;"> <i class="layui-icon">&#xe640;</i>
					</a>
					</td>
				</tr> -->
			</tbody>
		</table>
		<!-- 显示分页信息 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6" id="page_info_area">
			</div>
			<div class="col-md-6" id="page_nav_area">
			</div>
		</div>

	</div>
	<script>
		var requestTarget = ${id}; 
	
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
				$.post('/attendance/publish', extend(data.field,pageInfo), function (result) {
					console.log(extend(data.field,pageInfo));
					build_stus_table(result);//1考勤表单
		            build_page_info(result);//2页码控制
		            build_page_nav(result);//3底部分页
		            examIndexPage.init(result.rows);
		            console.log(result);
				})
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
			
			function checkOutSelected(argument) {
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
			Core.postAjax("/attendance/publish?attendanceId="+requestTarget,{"limit":10,"offset":offset},function (result) {
	            build_stus_table(result);//1考勤表单
	            build_page_info(result);//2页码控制
	            build_page_nav(result);//3底部分页
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
			var type = 1;
			var attendances = result.rows;
			if(!attendances.length==0){
				$("#attendance_table tbody").empty();
				$.each(attendances, function(index, items){
					var statusTd,operateBtn,typeTd;
					if(items.status==0){//<span class="layui-btn layui-btn-normal layui-btn-xs">已启用</span>
						statusTd = $("<td></td>").addClass("td-status").append($("<span>未签到</span>").addClass("layui-btn layui-btn-danger layui-btn-xs"));
						operateBtn =$("<a title=\"补签\" onclick=\"checkIn("+items.id+")\" href=\"javascript:;\"><i class=\"layui-icon\">&#xe60c;</i></a>"
								+"<a title=\"请假\" onclick=\"onLeave("+items.id+")\" href=\"javascript:;\"> <i class=\"layui-icon\">&#xe664;</i></a>"
								+"<a title=\"签退\" onclick=\"checkOut("+items.id+")\" href=\"javascript:;\"> <i class=\"layui-icon\">&#xe69c;</i></a>");
					}else if(items.status == 1){
						statusTd = $("<td></td>").addClass("td-status").append($("<span>已签到</span>").addClass("layui-btn layui-btn-green layui-btn-xs"));
						operateBtn =$("<a title=\"补签\" onclick=\"checkIn("+items.id+")\" href=\"javascript:;\"><i class=\"layui-icon\">&#xe60c;</i></a>"
								+"<a title=\"请假\" onclick=\"onLeave("+items.id+")\" href=\"javascript:;\"> <i class=\"layui-icon\">&#xe664;</i></a>"
								+"<a title=\"签退\" onclick=\"checkOut("+items.id+")\" href=\"javascript:;\"> <i class=\"layui-icon\">&#xe69c;</i></a>");
					}else{
						statusTd = $("<td></td>").addClass("td-status").append($("<span>已请假</span>").addClass("layui-btn layui-btn-warm layui-btn-xs"));
						operateBtn =$("<a title=\"补签\" onclick=\"checkIn("+items.id+")\" href=\"javascript:;\"><i class=\"layui-icon\">&#xe60c;</i></a>"
								+"<a title=\"请假\" onclick=\"onLeave("+items.id+")\" href=\"javascript:;\"> <i class=\"layui-icon\">&#xe664;</i></a>"
								+"<a title=\"签退\" onclick=\"checkOut("+items.id+")\" href=\"javascript:;\"> <i class=\"layui-icon\">&#xe69c;</i></a>");
					}
					if(index==0 && items.attendance.type==0){
						type = 0;
					}else if(index==0 && items.attendance.type==1){
						type = 1;
					}
					var headTd = $("<td></td>").append("<div class='layui-unselect layui-form-checkbox' lay-skin='primary' data-id='2'> <i class='layui-icon'>&#xe605;</i> </div>");
					var classTd = $("<td></td>").append(items.classes.name);
					var usernameTd = $("<td></td>").append(items.user.username);
					var nicknameTd = $("<td></td>").append(items.user.nickname);
					var checkTimeTd = $("<td></td>").append(new Date(items.checkTime).Format('yyyy-MM-dd hh:mm:ss'));
					var presentRateTd = $("<td></td>").append(((items.presentTotal*100)/items.courseTotal).toFixed(2)+"%");
					//var statusTd = $("<td></td>").append(tableTail);
					var operateTd = $("<td></td>").addClass("td-manager").append(operateBtn);
					$("<tr></tr>").append(headTd)
					 			  .append(classTd)
								  .append(usernameTd)
								  .append(nicknameTd)
								  .append(checkTimeTd)
								  .append(statusTd)
								  .append(operateTd)
								  .appendTo("#attendance_table tbody");
				})
			}else{
				$("#attendance_table tbody").empty();
				$("<tr style='text-align:center'><td colspan='7'>当前没有记录</td></tr>").appendTo("#attendance_table tbody");
			}
			if(type==0){
				$('#toRandom').empty();//清空必要
				var toRandomBtn = $("<button onclick=\"toRandom("+requestTarget+")\"></button>").addClass("layui-btn layui-btn-normal").append("<i>&#xe66c;</i> 去考勤").addClass("layui-icon"); 
				$('#toRandom').append(toRandomBtn);
			}
		}
		
		function toRandom(id){
			window.location.href="/attendance/random?id="+id;
		}
		
		/***********************补签、请假、签退 开始************************/
		/*****补签开始******/
		function checkIn(id){
			Core.postAjax("/attendance/checkInByTeacher",{"id":id}, function(data){
				if(data.status==200){
					layer.msg("补签成功...", {
						title: "系统提示",
					    icon: 1,
					    time: 800
					},function(){
						window.location.reload();
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
		function onLeave(id){
			Core.postAjax("/attendance/onLeave",{"id":id}, function(data){
				if(data.status==200){
					layer.msg("请假成功...", {
						title: "系统提示",
					    icon: 1,
					    time: 800
					},function(){
						window.location.reload();
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
		function checkOut(id){
			Core.postAjax("/attendance/checkOut",{"id":id}, function(data){
				if(data.status==200){
					layer.msg("签退成功...", {
						title: "系统提示",
					    icon: 1,
					    time: 800
					},function(){
						window.location.reload();
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
		/***********************补签、请假、签退 结束************************/
		/*
		<td class="td-manager"><a title="查看"
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
						requestPage(offset-=10)	
					});
				}
				
				var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
				var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href", "#"));
				if(pageInfo.hasNextPage == false){
					nextPageLi.addClass("disabled");
					lastPageLi.addClass("disabled");
				}else{
					nextPageLi.click(function(){
						requestPage(offset+=10);
					});
					lastPageLi.click(function(){
						requestPage(pageInfo.pages*10);
					});
				}
				ul.append(firstPageLi).append(prePageLi),
				$.each(pageInfo.navigatepageNums, function(index, items){
					var numLi = $("<li></li>").append($("<a></a>").append(items));
					if(pageInfo.pageNum == items){
						numLi.addClass("active");
						}
					numLi.click(function(){
						requestPage(items*10-1);
						});
					ul.append(numLi);
					});
				ul.append(nextPageLi).append(lastPageLi);
				var nav = $("<nav></nav>").css("float","right").append(ul);
				nav.appendTo("#page_nav_area");
				}
			};
			/*********分页结束*********/
		    /******请求已发布考勤信息结束*******/
	</script>
</html>