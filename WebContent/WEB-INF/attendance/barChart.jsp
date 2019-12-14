<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/bootstrap/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" href="/css/font-awesome/font-awesome.min.css"/>
    <link rel="stylesheet" href="/css/adminlte/css/AdminLTE.min.css"/>
    <link rel="stylesheet" href="/css/adminlte/css/all-skins.min.css"/>
    <link rel="stylesheet" href="/css/pace/pace.css"/>
    <link rel="stylesheet" href="/css/validate/validate.css"/>
    <link rel="stylesheet" href="/css/bootstrap-table/css/bootstrap-table.min.css"/>
    <link rel="stylesheet" href="/css/treegrid/jquery.treegrid.css"/>
    <link rel="stylesheet" href="/css/ztree/css/ztree-bootstrap.css"/>
    <link rel="stylesheet" href="/css/zplayer/css/zplayer.min.css"/>
    <link rel="stylesheet" href="/css/upload/css/webuploader.css"/>
    <link rel="stylesheet" href="/css/Ionicons/css/ionicons.min.css"/>
    <link rel="stylesheet" href="/css/markdown/simplemde.min.css">
    <link rel="stylesheet" href="/css/markdown/github-markdown.min.css">
    <link rel="stylesheet" href="/css/markdown/highlight.min.css">
    <link rel="stylesheet" href="/css/iCheck/minimal/blue.css"/>
    <link rel="stylesheet" href="/css/admin-common.css"/>
    <link rel="stylesheet" href="/css/examination.css"/>
    <script src="/js/jquery/jquery.min.js"></script>
    <script src="/js/bootstrap/bootstrap.min.js"></script>
    <script src="/js/bootstrap/bootstrap-datetimepicker.min.js"></script>
    <script src="/js/bootstrap/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="/js/pace/pace.js"></script>
    <script src="/js/jquery/jquery.slimscroll.min.js"></script>
    <script src="/js/jquery/fastclick.min.js"></script>
    <script src="/js/validate/validate.js"></script>
    <script src="/js/layer/layer.js"></script>
    <script src="/js/bootstrap-table/js/bootstrap-table.min.js"></script>
    <script src="/js/bootstrap-table/js/bootstrap-table-zh-CN.min.js"></script>
    <script src="/js/treegrid/jquery.treegrid.min.js"></script>
    <script src="/js/treegrid/jquery.treegrid.extension.js"></script>
    <script src="/js/treegrid/tree.table.js"></script>
    <script src="/js/ztree/js/jquery.ztree.core.js"></script>
    <script src="/js/ztree/js/jquery.ztree.excheck.js"></script>
    <script src="/js/ztree/js/jquery.ztree.exedit.js"></script>
    <script src="/js/upload/js/webuploader.js"></script>
    <script src="/js/upload/js/jax.uploader.js"></script>
    <script src="/js/upload/js/uploadCall.js"></script>
    <script src="/js/zplayer/js/zplayer.min.js"></script>
    <script src="/js/markdown/highlight.min.js"></script>
    <script src="/js/markdown/simplemde.min.js"></script>
    <script src="/js/iCheck/icheck.min.js"></script>
    <script src="/js/chartJs/chart.js"></script>
    <script src="/js/chartJs/echarts.min.js"></script>
    <script src="/js/inline-attachment.js"></script>
    <script src="/js/codemirror.inline-attachment.js"></script>
    <script src="/js/core.js"></script>
    <script src="/js/FileSaver.js"></script>
    <script src="/js/jquery.wordexport.js"></script>
</head>
<body>
	<section class="content-header">
		<ol class="breadcrumb">
			<li><a href="/manage"><i class="fa fa-dashboard"></i> 首页</a></li>
			<li><a href="#">考勤管理</a></li>
			<li class="active">考勤情况</li>
		</ol>
	</section>
	<!-- Main content -->
	<section class="content">
		<div class="jax-box">
			<form id="formSearch" class="form-horizontal form-search">
				<div class="form-group" style="padding: 10px">
					<div class="col-md-4 col-sm-6">
						<label class="control-label  col-xs-4">考勤名称:</label>
						<div class="col-xs-8">
							<select class="form-control" name="examId">
								<c:forEach items="${exams}" var="exam">
									<option value="${exam.id}">${exam.title}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<label class="control-label  col-xs-4" for="grade">年级:</label>
						<div class="col-xs-8">
							<select class="form-control" name="grade">
								<option value="">请选择</option>
								<c:forEach items="${grades}" var="grade">
									<option value="${grade}">${grade}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<label class="control-label  col-xs-4" for="facultyId">考勤学院:</label>
						<div class="col-xs-8">
							<select class="form-control" name="facultyId">
								<option value="">请选择</option>
								<c:forEach items="${faculties}" var="faculty">
									<option value="${faculty.id}">${faculty.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="form-group" style="padding: 10px">
					<div class="col-md-4 col-sm-6">
						<label class="control-label  col-xs-4" for="classId">考勤班级:</label>
						<div class="col-xs-8">
							<select class="form-control" name="classId">
								<option value="">请选择</option>
								<c:forEach items="${classes}" var="cls">
									<option value="${cls.id}">${cls.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<label class="control-label  col-xs-4" for="subject">考勤课程:</label>
						<div class="col-xs-8">
							<select class="form-control" name="subjectId">
								<option value="">请选择</option>
								<c:forEach items="${subjects}" var="subject">
									<option value="${subject.id}">${subject.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<label class="control-label col-xs-4"></label>
						<div class="col-xs-8">
							<shiro:hasPermission name="datas:list">
								<button type="button" id="btn_query"
									class="btn btn-primary pull-right">查 询</button>
							</shiro:hasPermission>
							<button type="button" id="btn_requery"
								class="btn btn-primary pull-right" style="margin-right: 5px">重
								填</button>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title">考勤情况条形统计图</h3>
				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool"
						data-widget="collapse">
						<i class="fa fa-minus"></i>
					</button>
					<button type="button" class="btn btn-box-tool" data-widget="remove">
						<i class="fa fa-times"></i>
					</button>
				</div>
			</div>
			<div class="box-body pb20" id="pieChart" style="height: 520px"></div>
		</div>
	</section>
	<script>
		$(function() {
			getData();
			/*查询*/
			$("#btn_query").click(function() {
				getData();
			});
			/* 重置表单 */
			$("#btn_requery").click(function() {
				$("#formSearch")[0].reset();
			});
		})

		function getData() {
			Core.postAjax("/data/list", $("#formSearch").serialize(),
					function(data) {
						if (data.status == 200) {
							//初始化echarts实例
							var myChart = echarts.init(document
									.getElementById('pieChart'));
							//app.title = '坐标轴刻度与标签对齐';
							option = {
								color : [ '#3398DB' ],
								tooltip : {
									trigger : 'axis',
									axisPointer : { // 坐标轴指示器，坐标轴触发有效
										type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
									}
								},
								grid : {
									left : '3%',
									right : '4%',
									bottom : '4%',
									containLabel : true
								},
								xAxis : [ {
									type : 'category',
									data : [ '参加考勤总人数', '未批阅人数', '及格人数（60分以上）',
											'未及格人数（60分以下不含60分）',
											'合格人数（60分-79分）', '良好人数（80分-89分）',
											'优秀人数（90分以上）', '及格率(单位：%)' ],
									axisTick : {
										alignWithLabel : true
									},
									axisLabel : {
										interval : 0,
										rotate : 40
									}
								} ],
								yAxis : [ {
									type : 'value'
								} ],
								series : [ {
									name : '直接访问',
									type : 'bar',
									barWidth : '60%',
									data : data.data
								} ]
							}
							//使用刚指定的配置项和数据显示图表。
							myChart.setOption(option);
						} else {
							layer.msg(data.msg);
						}
					})
		}
	</script>
</body>
</html>