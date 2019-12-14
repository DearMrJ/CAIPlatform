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
<title>Document</title>
</head>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/科目管理(教师端).css">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="/css/font.css">
<link rel="stylesheet" href="/css/weadmin.css">
<script type="text/javascript" src="/lib/layui/layui.js" charset="utf-8"></script>
<script src="/js/jquery/jquery.min.js"></script>
<script src="/js/bootstrap.js"></script>
<script src="/js/科目管理(教师端).js"></script>

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

	<div>
		<ol class="breadcrumb">
			<li><a href=" #">课程管理</a></li>
			<li class="active" style="color: black;">计算机概论</li>
		</ol>
	</div>

	<!-- 主体部分 -->
	<div class="main-bottom">
		<div class="top clearfix">
			<div class="one">
				<h1>
					计算机概论 <a href=""><img src="/img/u326.png" alt=""></a>
				</h1>
				<h2>2019-2020学年 第一学期</h2>
			</div>
			<div class="two">
				<h1>22</h1>
				<h2>成员数量</h2>
			</div>
			<div class="three">
				<h1>36</h1>
				<h2>未读消息</h2>
			</div>
			<div class="four">
				<h1>03</h1>
				<h2>发布测试</h2>
			</div>
			<div class="five">
				<h1>01</h1>
				<h2>发布测试</h2>
			</div>
		</div>
		<div class="list clearfix">
			<ul>
				<li class="current"><a href="javascript:;">学习资料</a></li>
				<li><a href="javascript:;">作业</a></li>
				<li><a href="javascript:;">测试</a></li>
				<li><a href="javascript:;">公告</a></li>
				<li><a href="javascript:;">讨论</a></li>
				<li><a href="javascript:;">关于课程</a></li>
			</ul>
		</div>
		<!-- 项目 -->
		<div class="content">
			<!-- 第一个list学习资料 -->
			<div class="item">
				<div>
					<button class="btn" data-toggle="modal" data-target="#popUpWindow1">上传学习资料</button>
				</div>
				<!-- 文件上传弹出框 -->
				<div class="modal fade" id="popUpWindow1">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h3 class="modal-title" style="float: left;">文件上传</h3>
							</div>
							<div class="modal-body" style="height: 220px">
								<form action="upload0" enctype="multipart/form-data"
									method="post">
									<table>
										<tr>
											<td>文件描述:</td>
											<td><input class="form-control" type="text"
												name="description"></td>
										</tr>
										<tr>
											<td>请选择文件:</td>
											<td><input type="file" name="file"></td>
										</tr>

									</table>
									<p class="message">提示信息</p>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary" id='btn'>确定</button>
										<button class="btn btn-primary" data-dismiss="modal">取消</button>
									</div>
							</form>
							</div>

						</div>
					</div>
				</div>



				<div class="box clearfix">
					<div class="left">
						<h5>2019/09/28 20:46</h5>
						<h3>
							<img class="image1" src="/img/u318.png" style="color: black;"
								alt=""> 计算机概论第一章 <a href=""><img src="/img/2.png"
								class="image2" alt=""></a>
						</h3>
					</div>
					<div class="right">
						<a href="">下载</a> <a href="">删除</a>
					</div>
				</div>



			</div>

			<!-- 第二个list作业 -->
			<div class="item" style="display: none;">
				<a href="/exam/add"><button class="btn" data-toggle="modal" data-target="#popUpWindow3">发布作业</button></a>
				<!-- 发布作业弹出框 -->
				<!-- <div class="modal fade" id="popUpWindow2">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h3 class="modal-title" style="float: left;">发布作业</h3>
							</div>
							<div class="modal-body" style="height: 300px">

								<table>
									<tr>
										<td>作业名称:</td>
										<td><input type="text" class="form-control" name="name"></td>
										<td>作业描述:</td>
										<td><input type="text" class="form-control"
											name="description"></td>
									</tr>

									<tr>
										<td>题目类型:</td>
										<td><select class="form-control" name="type" id="type">
												<option value="">题目类型</option>
												<option value="0">单项选择题</option>
												<option value="1">多项选择题</option>
												<option value="2">填空题</option>
												<option value="3">主观问答题</option>
												<option value="4">判断题</option>
												<option value="5">编程题</option>
										</select></td>

									</tr>

								</table>
								<div>
									<ul id="homework">

									</ul>
								</div>


							</div>

							<div class="modal-footer">
								显示分页信息
								<div class="row">
									分页文字信息
									<div class="col-md-6" id="page_info_area"></div>
									<div class="col-md-6" id="page_nav_area"></div>
								</div>
								<button type="submit" class="btn btn-primary" id='btn'>确定</button>
								<button class="btn btn-primary" data-dismiss="modal">取消</button>
							</div>

						</div>
					</div>
				</div> -->

				<!-- 第一章作业 -->
				<c:forEach items="${exams}" var="exam">
					<div class="box clearfix">
						<div class="left">
							<h5>2019/09/28 20:46</h5>
							<h3>${exam.title}</h3>
							<h4>xxxx</h4>
							<span>截至日期：2019/09/29 20:46</span>
						</div>
						<div class="right">
							<a href="">批改</a><a href="">修改</a> <a href="">删除</a>
						</div>
						<div class="center">
							<div>
								<h1>28</h1>
								<h4>已批</h4>
							</div>
							<div>
								<h1>03</h1>
								<h4>未批</h4>
							</div>
							<div>
								<h1>01</h1>
								<h4>未交</h4>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- 第三个list测试 -->
			<div class="item" style="display: none;">
				<div>
					<a href="/exam/add"><button class="btn" data-toggle="modal" data-target="#popUpWindow3">发布测试</button></a>
				</div>
				<!-- 发布测试弹出框 -->
				<!-- <div class="modal fade" id="popUpWindow3">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h3 class="modal-title" style="float: left;">发布测试</h3>
							</div>
							<div class="modal-body" style="height: 300px">

								<table>
									<tr>
										<td>测试名称:</td>
										<td><input type="text" class="form-control" name="name"></td>
										<td>测试描述:</td>
										<td><input type="text" class="form-control"
											name="description"></td>
									</tr>

									<tr>
										<td>题目类型:</td>
										<td><select class="form-control" name="type1" id="type1">
												<option value="">题目类型</option>
												<option value="0">单项选择题</option>
												<option value="1">多项选择题</option>
										</select></td>

									</tr>

								</table>
								<div>
									<ul id="exam">

									</ul>
								</div>


							</div>

							<div class="modal-footer">
								显示分页信息
								<div class="row">
									分页文字信息
									<div class="col-md-6" id="page_info_area"></div>
									<div class="col-md-6" id="page_nav_area"></div>
								</div>
								<button type="submit" class="btn btn-primary" id='btn'>确定</button>
								<button class="btn btn-primary" data-dismiss="modal">取消</button>
							</div>

						</div>
					</div>
				</div> -->


				<!-- 第一章测试 -->
				<div class="box clearfix">
					<div class="left">
						<h5>2019/09/28 20:46</h5>
						<h3>计算机概论第一章测试</h3>
						<h4>测试内容描述</h4>
						<span>考试时间：2019/09/29 20:46 至 2019/10/10 20:46</span>
					</div>
					<div class="right">
						<a href="">批改</a><a href="">修改</a> <a href="">删除</a>
					</div>
					<div class="center">
						<div>
							<h1>28</h1>
							<h4>已批</h4>
						</div>
						<div>
							<h1>03</h1>
							<h4>未批</h4>
						</div>
						<div>
							<h1>01</h1>
							<h4>未交</h4>
						</div>
					</div>
				</div>
				<!-- 第一章测试结束 -->
				

			</div>

			<!-- 第四个list公告 -->
			<div class="item" style="display: none;">
				<div>
					<button class="btn" data-toggle="modal" data-target="#popUpWindow4">发布公告</button>
				</div>
				<!-- 发布公告弹出框 -->
				<div class="modal fade" id="popUpWindow4">
					<div class="modal-dialog">
						<div class="modal-content" style="right: 10%; width: 800px;">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h3 class="modal-title" style="float: left;">发布公告</h3>
							</div>
							<div class="modal-body" style="height: 300px">
								<div>
									公告标题:<input
										style="margin-bottom: 10px; margin-left: 10px; width: 695px; display: inline-block"
										class="form-control" type="text" placeholder="请输入公告标题">
								</div>
								<div>
									<span style="margin-top: 20xp;">公告内容:</span>
									<textarea class="form-control"
										style="width: 767px; height: 200px; display: inline-block"
										placeholder="请输入公告内容"></textarea>
								</div>


							</div>

							<div class="modal-footer">

								<button type="submit" class="btn btn-primary" id='btn'>确定</button>
								<button class="btn btn-primary" data-dismiss="modal">取消</button>
							</div>

						</div>
					</div>
				</div>



				<!-- 第一个公告 -->
				<div class="box clearfix">
					<div class="left">
						<h5>2019/09/28 20:46</h5>
						<h3>停课通知</h3>
						<h4>同学们：
							按照校历安排，学院定于2014年10月17日（星期五）—10月18日（星期六）举行第二十一届校运会。10月17日的课程停上一次
							...</h4>
						<span>发布人：admin</span>
					</div>
					<div class="right">
						<a href="">修改</a> <a href="">删除</a>
					</div>

				</div>

			</div>
			<!-- 第五个list讨论 -->
			<div class="item" style="display: none;">
				<div class="talkbox ">
					<ul id="talk" class="talk">

					</ul>
				</div>
				<div class="talkopera">
					<textarea id="content" placeholder="请输入讨论内容"></textarea>
					<a class="send" href="javascript:;" id='send'>发布</a><a
						class="return" href="javascript:;">返回</a>
				</div>
			</div>
			<!-- 第六个list关于课程 -->
			<div class="item" style="display: none;">
				<textarea name="" id="" cols="30" rows="10" placeholder="请输入有关课程的介绍"></textarea>
				<a href="" class="upload">发布</a>

			</div>


		</div>
		<script>
			$(function() {
				//  根据类型获取题目
				// $(".uploadhomework").click(function () {
				//   $.ajax({
				//     url: "",
				//     data: {
				//       "id": "1"
				//     },
				//     type: "post",
				//     success: function (data) {
				//     },
				//   })
				// })
				var totalPage, currentPage, offset = 0;
				// requestPage(offset);

				var questions = [
						{
							"subject" : {
								"description" : "Python天下第一",
								"name" : "Python宝鉴",
								"id" : 1
							},
							"optionC" : "JAVA程序中类名必须与文件名一样",
							"optionD" : "JAVA程序的main方法中如果只有一条语句，可以不用{}(大括号)括起来",
							"optionA" : "JAVA程序的main方法必须写在类里面",
							"updateTime" : 1572803686000,
							"optionB" : "JAVA程序中可以有多个main方法",
							"parse" : "A",
							"title" : "下列说法正确的是（）。",
							"type" : 0,
							"content" : "",
							"subjectId" : 1,
							"difficulty" : 2,
							"score" : 5,
							"answer" : "A",
							"createTime" : 1572803686000,
							"id" : 1,
							"status" : 0
						},
						{
							"subject" : {
								"description" : "Python天下第一",
								"name" : "Python宝鉴",
								"id" : 1
							},
							"optionC" : "A和a在java中是同一个变量；",
							"optionD" : "不同类型的变量，可以起相同的名字；",
							"optionA" : "变量由字母、下划线、数字、$符号随意组成；",
							"updateTime" : 1572803686000,
							"optionB" : "变量不能以数字作为开头；",
							"parse" : "2解析B",
							"title" : "变量命名规范说法正确的是（）。",
							"type" : 0,
							"content" : "",
							"subjectId" : 1,
							"difficulty" : 3,
							"score" : 5,
							"answer" : "B",
							"createTime" : 1572803686000,
							"id" : 2,
							"status" : 0
						},
						{
							"subject" : {
								"description" : "Python天下第一",
								"name" : "Python宝鉴",
								"id" : 1
							},
							"optionC" : "构造方法不可以重载",
							"optionD" : "构造方法绝对不能有返回值",
							"optionA" : "构造方法的名称必须与类名相同",
							"updateTime" : 1572803686000,
							"optionB" : "构造方法可以带参数",
							"parse" : "3解析C",
							"title" : "在Java中,关于构造方法，下列说法错误的是( )。",
							"type" : 0,
							"content" : "",
							"subjectId" : 1,
							"difficulty" : 4,
							"score" : 5,
							"answer" : "C",
							"createTime" : 1572803686000,
							"id" : 3,
							"status" : 0
						},
						{
							"subject" : {
								"description" : "Python天下第一",
								"name" : "Python宝鉴",
								"id" : 1
							},
							"optionC" : "",
							"optionD" : "",
							"optionA" : "",
							"updateTime" : 1572803686000,
							"optionB" : "",
							"parse" : "首字母大写",
							"title" : "中国的英文是___。",
							"type" : 2,
							"content" : "",
							"subjectId" : 1,
							"difficulty" : 1,
							"score" : 5,
							"answer" : "China",
							"createTime" : 1572803686000,
							"id" : 4,
							"status" : 0
						},
						{
							"subject" : {
								"description" : "Python天下第一",
								"name" : "Python宝鉴",
								"id" : 1
							},
							"optionC" : "",
							"optionD" : "",
							"optionA" : "",
							"updateTime" : 1572803686000,
							"optionB" : "",
							"parse" : "i18n（其来源是英文单词 internationalization的首末字符i和n，18为中间的字符数）",
							"title" : "i18n是指___。",
							"type" : 2,
							"content" : "",
							"subjectId" : 1,
							"difficulty" : 3,
							"score" : 5,
							"answer" : "国际化",
							"createTime" : 1572803686000,
							"id" : 5,
							"status" : 0
						},
						{
							"subject" : {
								"description" : "Python天下第一",
								"name" : "Python宝鉴",
								"id" : 1
							},
							"optionC" : "",
							"optionD" : "",
							"optionA" : "",
							"updateTime" : 1572803686000,
							"optionB" : "",
							"parse" : "HashMap:实现了Map接口，实现了将唯一键隐射到特定值上。允许一个NULL键和多个NULL值。非线程安全。\tHashTable: 类似于HashMap，但是不允许NULL键和NULL值，比HashMap慢，因为它是同步的。HashTable是一个线程安全的类，它使用synchronized来锁住整张Hash表来实现线程安全，即每次锁住整张表让线程独占。\tConcurrentHashMap允许多个修改操作并发进行，其关键在于使用了锁分离技术。它使用了多个锁来控制对hash表的不同部分进行的修改。ConcurrentHashMap内部使用段(Segment)来表示这些不同的部分，每个段其实就是一个小的Hashtable，它们有自己的锁。只要多个修改操作发生在不同的段上，它们就可以并发进行。",
							"title" : "HashTable,HashMap,ConcurrentHashMap的区别？",
							"type" : 3,
							"content" : "",
							"subjectId" : 1,
							"difficulty" : 3,
							"score" : 5,
							"answer" : "",
							"createTime" : 1572803686000,
							"id" : 6,
							"status" : 0
						}, {
							"subject" : {
								"description" : "Python天下第一",
								"name" : "Python宝鉴",
								"id" : 1
							},
							"optionC" : "用户自定义的Student类类型",
							"optionD" : "int",
							"optionA" : "String",
							"updateTime" : 1572803686000,
							"optionB" : "char",
							"parse" : "引用数据类型是对象类型/抽象类型，非基本类型",
							"title" : "下列（）属于引用数据类型。",
							"type" : 1,
							"content" : "",
							"subjectId" : 1,
							"difficulty" : 4,
							"score" : 5,
							"answer" : "AC",
							"createTime" : 1572803686000,
							"id" : 7,
							"status" : 0
						}, {
							"subject" : {
								"description" : "Python天下第一",
								"name" : "Python宝鉴",
								"id" : 1
							},
							"optionC" : "",
							"optionD" : "",
							"optionA" : "正确",
							"updateTime" : 1572803686000,
							"optionB" : "错误",
							"parse" : "单继承",
							"title" : "JAVA中可以多继承。",
							"type" : 4,
							"content" : "",
							"subjectId" : 1,
							"difficulty" : 2,
							"score" : 5,
							"answer" : "B",
							"createTime" : 1572803686000,
							"id" : 8,
							"status" : 0
						}, {
							"subject" : {
								"description" : "Python天下第一",
								"name" : "Python宝鉴",
								"id" : 1
							},
							"optionC" : "",
							"optionD" : "",
							"optionA" : "",
							"updateTime" : 1572803686000,
							"optionB" : "",
							"parse" : "略",
							"title" : "JAVA输出helloworld。",
							"type" : 5,
							"content" : "",
							"subjectId" : 1,
							"difficulty" : 2,
							"score" : 5,
							"answer" : "略",
							"createTime" : 1572803686000,
							"id" : 9,
							"status" : 0
						} ]

				$("#type")
						.click(
								function() {
									$("#homework").empty();
									a = $("#type").find("option:selected")
											.val();
									$
											.each(
													questions,
													function(index, val) {
														if (questions[index].type == a) {
															var $question = `<li><input name="question" type="checkbox" value="` + questions[index].id + `" />`
																	+ questions[index].title
																	+ `</li>`;
															$("#homework")
																	.append(
																			$question);
														}
													});

								})

				$("#type1")
						.click(
								function() {
									$("#exam").empty();
									b = $("#type1").find("option:selected")
											.val();
									$
											.each(
													questions,
													function(index, val) {
														if (questions[index].type == b) {
															var $question = `<li><input name="question" type="checkbox" value="` + questions[index].id + `" />`
																	+ questions[index].title
																	+ `</li>`;
															$("#exam").append(
																	$question);
														}
													});

								})

			})

			function requestPage(questions) {
				Core.postAjax("/attendance/list", {
					"limit" : 10,
					"offset" : offset
				}, function(result) {

					build_page_info(questions);//2页码控制
					build_page_nav(questions);//3底部
				})
			}

			function build_page_info(result) {
				var pageInfo = result.pageInfo;
				if (!pageInfo.pageNum == 0) {
					$("#page_info_area").empty();
					$("#page_info_area").append(
							"当前第" + pageInfo.pageNum + "页,总共" + pageInfo.pages
									+ "页,总共" + result.total + "条记录");
					totalPage = pageInfo.total;
					currentPage = pageInfo.pageNum;
				}
			}

			function build_page_nav(result) {
				var pageInfo = result.pageInfo;
				if (!pageInfo.pageNum == 0) {
					$("#page_nav_area").empty();
					var ul = $("<ul></ul>").addClass("pagination");
					var firstPageLi = $("<li></li>").append(
							$("<a></a>").append("首页").attr("href", "#"));
					var prePageLi = $("<li></li>").append(
							$("<a></a>").append("&laquo;").attr("href", "#"));
					if (pageInfo.hasPreviousPage == false) {
						firstPageLi.addClass("disabled");
						prePageLi.addClass("disabled");
					} else {
						firstPageLi.click(function() {
							requestPage(0);
							offset = 0;
						});
						prePageLi.click(function() {
							requestPage(offset -= 10)
						});
					}

					var nextPageLi = $("<li></li>").append(
							$("<a></a>").append("&raquo;").attr("href", "#"));
					var lastPageLi = $("<li></li>").append(
							$("<a></a>").append("尾页").attr("href", "#"));
					if (pageInfo.hasNextPage == false) {
						nextPageLi.addClass("disabled");
						lastPageLi.addClass("disabled");
					} else {
						nextPageLi.click(function() {
							requestPage(offset += 10);
						});
						lastPageLi.click(function() {
							requestPage(pageInfo.pages * 10);
						});
					}
					ul.append(firstPageLi).append(prePageLi), $.each(
							pageInfo.navigatepageNums, function(index, items) {
								var numLi = $("<li></li>").append(
										$("<a></a>").append(items));
								if (pageInfo.pageNum == items) {
									numLi.addClass("active");
								}
								numLi.click(function() {
									requestPage(items * 10 - 1);
								});
								ul.append(numLi);
							});
					ul.append(nextPageLi).append(lastPageLi);
					var nav = $("<nav></nav>").css("float", "right").append(ul);
					nav.appendTo("#page_nav_area");
				}
			};
			function build_page_info(result) {
				var pageInfo = result.pageInfo;
				if (!pageInfo.pageNum == 0) {
					$("#page_info_area").empty();
					$("#page_info_area").append(
							"当前第" + pageInfo.pageNum + "页,总共" + pageInfo.pages
									+ "页,总共" + result.total + "条记录");
					totalPage = pageInfo.total;
					currentPage = pageInfo.pageNum;
				}
			}

			function build_page_nav(result) {
				var pageInfo = result.pageInfo;
				if (!pageInfo.pageNum == 0) {
					$("#page_nav_area").empty();
					var ul = $("<ul></ul>").addClass("pagination");
					var firstPageLi = $("<li></li>").append(
							$("<a></a>").append("首页").attr("href", "#"));
					var prePageLi = $("<li></li>").append(
							$("<a></a>").append("&laquo;").attr("href", "#"));
					if (pageInfo.hasPreviousPage == false) {
						firstPageLi.addClass("disabled");
						prePageLi.addClass("disabled");
					} else {
						firstPageLi.click(function() {
							requestPage(0);
							offset = 0;
						});
						prePageLi.click(function() {
							requestPage(offset -= 10)
						});
					}

					var nextPageLi = $("<li></li>").append(
							$("<a></a>").append("&raquo;").attr("href", "#"));
					var lastPageLi = $("<li></li>").append(
							$("<a></a>").append("尾页").attr("href", "#"));
					if (pageInfo.hasNextPage == false) {
						nextPageLi.addClass("disabled");
						lastPageLi.addClass("disabled");
					} else {
						nextPageLi.click(function() {
							requestPage(offset += 10);
						});
						lastPageLi.click(function() {
							requestPage(pageInfo.pages * 10);
						});
					}
					ul.append(firstPageLi).append(prePageLi), $.each(
							pageInfo.navigatepageNums, function(index, items) {
								var numLi = $("<li></li>").append(
										$("<a></a>").append(items));
								if (pageInfo.pageNum == items) {
									numLi.addClass("active");
								}
								numLi.click(function() {
									requestPage(items * 10 - 1);
								});
								ul.append(numLi);
							});
					ul.append(nextPageLi).append(lastPageLi);
					var nav = $("<nav></nav>").css("float", "right").append(ul);
					nav.appendTo("#page_nav_area");
				}
			};
		</script>
</body>

</html>