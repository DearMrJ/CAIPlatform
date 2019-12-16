<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>grade</title>
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
	<!-- 顶部开始 -->
	<div class="container">
		<div class="logo">
			<a href="/manage">45后台管理</a>
		</div>
		<div class="left_open">
			<!-- <i title="展开左侧栏" class="iconfont">&#xe699;</i> -->
			<i title="展开左侧栏" class="layui-icon layui-icon-shrink-right"></i>

		</div>
		<ul class="layui-nav left fast-add" lay-filter="">
			<li class="layui-nav-item"><a href="javascript:;">+新增</a>
				<dl class="layui-nav-child">
					<!-- 二级菜单 -->
					<dd>
						<a onclick="WeAdminShow('资讯','https://www.baidu.com/')"><i
							class="layui-icon layui-icon-list"></i>资讯</a>
					</dd>
					<dd>
						<a onclick="WeAdminShow('图片','http://www.baidu.com')"><i
							class="layui-icon layui-icon-picture-fine"></i>图片</a>
					</dd>
					<dd>
						<a onclick="WeAdminShow('用户','https://www.jiuwei.com/')"><i
							class="layui-icon layui-icon-user"></i>用户</a>
					</dd>
				</dl></li>
		</ul>
		<ul class="layui-nav right" lay-filter="">
			<li class="layui-nav-item"><a href="javascript:;"><shiro:principal property="nickname"/></a>
				<dl class="layui-nav-child">
					<!-- 二级菜单 -->
					<dd>
						<a onclick="WeAdminShow('个人信息','http://www.baidu.com')">个人信息</a>
					</dd>
					<dd>
						<a onclick="WeAdminShow('切换帐号','/logout')">切换帐号</a>
					</dd>
					<dd>
						<a class="loginout" href="/logout">退出</a>
					</dd>
				</dl></li>
			<li class="layui-nav-item to-index"><a href="/" target="_blank">前台首页</a>
			</li>
		</ul>

	</div>
	<!-- 顶部结束 -->

	<div class="weadmin-nav">
		<span class="layui-breadcrumb"> <a href="">首页</a> <a href="">考试管理</a>
			<a><cite>考试列表</cite></a>
		</span> <a class="layui-btn layui-btn-sm"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="javascript:window.location.reload();" title="刷新"> <i
			class="layui-icon" style="line-height: 30px">&#xe669;</i></a>
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
					<select name="status">
						<option value="">状态</option>
						<option value="0">未开始</option>
						<option value="1">进行中</option>
						<option value="2">已结束</option>
					</select>
				</div>
				<div class="layui-inline">
					<input class="layui-input" autocomplete="off" placeholder="起始时间" name="startTime" id="start">
				</div>
				<div class="layui-inline">
					<input class="layui-input" autocomplete="off" placeholder="截止时间" name="endTime" id="end">
				</div>
				<div class="layui-inline">
					<input class="layui-input" autocomplete="off" placeholder="年份" name="year" id="year">
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
			<button class="layui-btn layui-btn-danger" onclick="delSelected()">
				<i class="layui-icon"></i>批量删除
			</button>
			<span class="fr" style="line-height: 40px">...</span>
		</div>
		<table class="layui-table" id="exam_table">
			<thead>
				<tr>
					<th> 
						<div class="layui-unselect header layui-form-checkbox"
							lay-skin="primary" data-id="">
							<i class="layui-icon">&#xe605;</i>
						</div>
					</th>
					<th>班级</th>
					<th>学号</th>
					<th>姓名</th>
					<th>客观题分数</th>
					<th>主观题分数</th>
					<th>总分</th>
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
					<td>全体考试</td>
					<td>2019-11-14 17:30</td>
					<td>2017-11-14 17:35</td>
					<td>已结束</td>
					<td class="td-manager"><a title="查看"
						onclick="WeAdminShow('编辑','/grade/publish')" href="javascript:;">
							<i class="layui-icon">&#xe63c;</i>
					</a> <a title="删除" onclick="delAttend("+items.id+")"
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
	layui.extend({
		admin : '{/}/js/admin'
	});
	layui.use([ 'laydate', 'jquery', 'admin' ], function() {
		var laydate = layui.laydate, $ = layui.jquery, admin = layui.admin, form = layui.form;
		//执行一个laydate实例
		laydate.render({
			elem : '#start', //指定元素
			type: 'datetime'
		});
		//执行一个laydate实例
		laydate.render({
			elem : '#end', //指定元素
			type: 'datetime'
			//与后台接收参数相匹配，可以指定type: datetime/time/year/month,默认只有日期选择
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
			$.post('/grade/list', extend(data.field,pageInfo), function (result) {
				console.log(extend(data.field,pageInfo));
				build_stus_table(result);//1考试表单
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
			/* function delAttend(obj, id) {
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
		
		/******请求已发布考试信息开始*******/
		var totalPage,currentPage,offset=0;
		$(function(){
			requestPage(offset);
		});

		function requestPage(offset){
			Core.postAjax("/grade/list",{"limit":10,"offset":offset},function (result) {
	            build_stus_table(result);//1考试表单
	            build_page_info(result);//2页码控制
	            build_page_nav(result);//3底部分页
	            examIndexPage.init(result.rows);
	        })
		}
		Date.prototype.Format = function(fmt)   
		{  
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
			var exams = result.rows;
			if(!exams.length==0){
				$("#exam_table tbody").empty();
				$.each(exams, function(index, items){
					var statusTd,operateBtn,typeTd;
					if(items.status==0){//<span class="layui-btn layui-btn-normal layui-btn-xs">已启用</span>
						statusTd = $("<td></td>").addClass("td-status").append($("<span>未批改</span>").addClass("layui-btn layui-btn-warm layui-btn-xs"));
						operateBtn = $("<a title=\"批改\" onclick=\"WeAdminShow('批改','/grade/mark?id="+items.id+"\')\" href=\"javascript:;\"><i class=\"layui-icon\">&#xe63c;</i></a>");
					}else{
						statusTd = $("<td></td>").addClass("td-status").append($("<span>已批改</span>").addClass("layui-btn layui-btn-green layui-btn-xs"));
						operateBtn = $("<a title=\"查看\" onclick=\"WeAdminShow('查看','/grade/mark?id="+items.id+"\')\" href=\"javascript:;\"><i class=\"layui-icon\">&#xe63c;</i></a>");
					}
					/* <th>班级</th>
					<th>学号</th>
					<th>姓名</th>
					<th>客观题分数</th>
					<th>主观题分数</th>
					<th>状态</th> */
					
					if(items.status == 0){
						var typeTd = $("<td></td>").append("作业");
					}else{
						var typeTd = $("<td></td>").append("测试");
					}
					var headTd = $("<td></td>").append("<div class='layui-unselect layui-form-checkbox' lay-skin='primary' data-id='"+items.id+"'> <i class='layui-icon'>&#xe605;</i> </div>");
					var classTd = $("<td></td>").append(items.classes.name);
					var usernameTd = $("<td></td>").append(items.user.username);
					var nicknameTd = $("<td></td>").append(items.user.nickname);
					var autoTd = $("<td></td>").append(items.autoResult);
					var manulTd = $("<td></td>").append(items.manulResult);
					var totalTd = $("<td></td>").append(items.manulResult+items.autoResult);
					//var yearAndTermTd = $("<td></td>").append(items.year+'~'+(++items.year)+'/'+items.term);
					//var typeTd = $("<td></td>").append();
					var operateTd = $("<td></td>").addClass("td-manager").append(operateBtn);
					$("<tr></tr>").append(headTd)
					 			  .append(classTd)
								  .append(usernameTd)
								  .append(nicknameTd)
								  .append(autoTd)
								  .append(manulTd)
								  .append(totalTd)
								  .append(statusTd)
								  .append(operateTd)
								  .appendTo("#exam_table tbody");
				})
			}else{
				$("#exam_table tbody").empty();
				$("<tr style='text-align:center'><td colspan='11'>当前没有记录</td></tr>").appendTo("#exam_table tbody");
			}
		}
		
		function delAttend(id){
			layer.msg("确定删除吗，操作将不可恢复！", {
				title: "系统提示",
			    time: 0,//不自动关闭
			    icon: 3,
			    btn: ['执意删除', '再考虑一下'],
			    yes: function(index){
					    layer.close(index);
						Core.postAjax("/grade/delete",{"id":id}, function(data){
							if(data.status==200){
								layer.msg(data.msg, {
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
			});
		}
		
		function delSelected(){
			var data = $('.layui-form-checked');
			var len = data.length;
			if (len == 0) {
				parent.layer.msg('请至少选择一行记录后再操作！',{icon: 2,time: 1000});
				return;
			}
			var idStr = "";
			data.each(function(index,item){
				if (index < len-1 && index !=0) {
					idStr += (""+$(this).attr('data-id'))+",";
				}else {
					idStr += (""+$(this).attr('data-id'));
				}
			})
			console.log("idStr:"+idStr);
			layer.msg("确定删除吗，操作将不可恢复！", {
				title: "系统提示",
			    time: 0,//不自动关闭
			    icon: 3,
			    btn: ['执意删除', '再考虑一下'],
			    yes: function(index){
					    layer.close(index);
						Core.postAjax("/grade/batch/delete",{"idStr":idStr}, function(data){
							if(data.status==200){
								layer.msg(data.msg, {
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
			});
		}
		
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
				var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));//首页
				var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));//上一页
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
				
				var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));//下一页
				var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href", "#"));//尾页
				if(pageInfo.hasNextPage == false){
					nextPageLi.addClass("disabled");
					lastPageLi.addClass("disabled");
				}else{
					nextPageLi.click(function(){
						requestPage(offset+=10);
					});//自offset+=10开始 到 offset+=10+=limit
					lastPageLi.click(function(){
						requestPage(pageInfo.pages*10);//页数*10，到尾页
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
		    /******请求已发布考试信息结束*******/
	</script>
	
</body>

</html>