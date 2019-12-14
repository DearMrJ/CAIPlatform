<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>课程管理(教师端)</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/commonNav.css">
<link rel="stylesheet" href="/css/subjectAdmin.css">
<script src="/js/jquery/jquery.min.js"></script>
<script src="/js/bootstrap.js"></script>
<script src="/js/subjectAdmin.js"></script>
</head>


<body>

	<div class="main-bottom clearfix">
		<ul id="father">

			<!-- 课程模板 -->
			<c:forEach items="${subjects}" var="subject">
				<li>
					<div class="head clearfix">
						<div class="one">
							<a href="/subject/teacherView?id=${subject.id}" target="_blank">
								<h3>${subject.name}</h3>
							</a>
							<h4>2019-2020学年第一学期</h4>
						</div>
						<div class="two">
							<a href="/attendance/check?id=${subject.id}"><img src="/img/课程管理(教师端)/1.png"
								alt=""> 考勤</a>
						</div>
					</div>
					<div class="body">
						<div class="one">
							<a href="#"> <img src="/img/课程管理(教师端)/2.png" alt="" />
								<h1>36人</h1>
							</a>
						</div>
						<div class="two">
							<h5>近期作业</h5>
							<h4>《${subject.name}》第一章作业</h4>
						</div>
					</div>

					<div class="foot">
						<a href="javascript:;" class="setTop">置顶</a> <a
							href="javascript:;" data-toggle="modal"
							data-target="#popUpWindow1" class="edit">编辑</a> <a
							href="javascript:;" class="delete">删除</a>
						<!-- 课程编辑弹出框 -->
						<div class="modal fade" id="popUpWindow1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h3 class="modal-title" style="float: left;">课程编辑</h3>
									</div>
									<div class="modal-body" style="height: 220px">
										<form role="form">
											<div class="form-group">
												<label for="课程名称" class="col-sm-2 control-label"
													style="margin-top: 8px;">课程名称:</span></label>
												<div class="col-sm-10">
													<input type="text" id="name2" class="form-control"
														placeholder="请输入课程名称">
												</div>
											</div>
											<div class="formgroup">&nbsp;</div>
											<div class="form-group">
												<label for="选择学年" class="col-sm-2 control-label"
													style="margin-top: 8px;"><span>选择学年:</span></label>
												<div class="col-sm-10">
													<select class="form-control" id='year1'>
														<option value="">请选择学年</option>
														<option value="2018-2019学年">2018-2019学年</option>
														<option value="2018-2019学年">2018-2019学年</option>
														<option value="2017-2018学年">2017-2018学年</option>
													</select>
												</div>
											</div>
											<div class="formgroup">&nbsp;</div>
											<div class="form-group">
												<label for="选择学期" class="col-sm-2 control-label"
													style="margin-top: 8px;"><span>选择学期:</span></label>
												<div class="col-sm-10">
													<select class="form-control" id="team1">
														<option value="">请选择学期</option>
														<option value="全年&nbsp&nbsp&nbsp&nbsp&nbsp">全年</option>
														<option value="第一学期">第一学期</option>
														<option value="第二学期">第二学期</option>
													</select>
												</div>
											</div>
											<p class="message">请输入课程信息</p>
										</form>
									</div>

									<div class="modal-footer">
										<button class="btn btn-primary" id='btn1'>确定</button>
										<button class="btn btn-primary" data-dismiss="modal">取消</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</li>
			</c:forEach>
			<!-- 创建课程 -->
			<li>
				<div class="head clearfix">
					<div class="one">
						<h3></h3>
						<h4></h4>
					</div>
					<div class="two">
						<a href="#"><img src="" alt=""> </a>
					</div>
				</div>
				<div class="body" style="height: 210px;">
					<div class="one">
						<a href="#" data-toggle="modal" data-target="#popUpWindow"> <img
							src="/img/课程管理(教师端)/u226.png" alt="">
							<h3 style="color: #999999; margin-top: 20px;">创建课程</h3>
						</a>
					</div>
					<!-- 创建课程模态框 -->
					<div class="modal fade" id="popUpWindow">
						<div class="modal-dialog">
							<div class="modal-content" id='modal-content'>
								<div class="modal-header" id='modal-header'>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h3 class="modal-title">课程创建</h3>
								</div>
								<div class="modal-body" style="height: 220px">
									<form role="form">
										<div class="form-group">
											<label for="课程名称" class="col-sm-2 control-label"
												style="margin-top: 8px;">课程名称:</span></label>
											<div class="col-sm-10">
												<input type="text" id="name1" class="form-control"
													placeholder="请输入课程名称">
											</div>
										</div>
										<div class="formgroup">&nbsp;</div>
										<div class="form-group">
											<label for="选择学年" class="col-sm-2 control-label"
												style="margin-top: 8px;"><span>选择学年:</span></label>
											<div class="col-sm-10">
												<select class="form-control" id='year'>
													<option value="">请选择学年</option>
													<option value="2018-2019学年">2018-2019学年</option>
													<option value="2018-2019学年">2018-2019学年</option>
													<option value="2017-2018学年">2017-2018学年</option>
												</select>
											</div>
										</div>
										<div class="formgroup">&nbsp;</div>
										<div class="form-group">
											<label for="选择学期" class="col-sm-2 control-label"
												style="margin-top: 8px;"><span>选择学期:</span></label>
											<div class="col-sm-10">
												<select class="form-control" id="team">
													<option value="">请选择学期</option>
													<option value="全年&nbsp&nbsp&nbsp&nbsp&nbsp">全年</option>
													<option value="第一学期">第一学期</option>
													<option value="第二学期">第二学期</option>
												</select>
											</div>
										</div>
										<p class="message">请输入课程信息</p>
									</form>
								</div>

								<div class="modal-footer">
									<button class="btn btn-primary" id="btn">确定</button>
									<button class="btn btn-primary" data-dismiss="modal">取消</button>
								</div>
							</div>
						</div>
					</div>
			</li>


			<!-- 结尾 -->
		</ul>
	</div>

</body>