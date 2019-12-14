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
		<li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
		<li><a href="#">考试管理</a></li>
		<li class="active">发布考试</li>
	</ol>
</section>
<!-- Main content -->
<section class="content">
	<div class="jax-box">
		<div class="box-body">
			<form id="examForm" class="form-horizontal">
				<input id="status" type="hidden" name="status">
				<input id="question" type="hidden" name="question">
				<input id="orderBy" type="hidden">
				<div class="col-lg-4 exam-extra">
					<div class="form-group">
						<div class="col-xs-12">
							<label class="control-label label-four">考试标题:</label>
							<div class="ml80">
								<input type="text" class="form-control" id="title" name="title" placeholder="请输入考试标题" require="">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12">
							<label class="control-label label-four">考试年级:</label>
							<div class="ml80">
								<select class="form-control" name="grade" require="必填项">
		                            <option  value="">请选择</option>
		                            <c:forEach items="${grades}" var="grade">
	                            		<option value="${grade}">${grade}</option>
		                            </c:forEach>
                        		</select>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12">
							<label class="control-label label-four">考试班级:</label>
							<div class="ml80">
								<select class="form-control" name="classId" require="必填项">
		                            <option  value="">请选择</option>
		                            <c:forEach items="${classes}" var="cls">
		                            	<option value="${cls.id}">${cls.name}</option>
		                            </c:forEach>
                        		</select>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12 ">
							<label class="control-label label-four">考试课程:</label>
							<div class="ml80">
								<select id="subject-select" onchange="selectValue();" class="form-control" name="subjectId" require="">
									<option value="">请选择</option>
									<c:forEach items="${subjects}" var="subject">
		                            	<option value="${subject.id}">${subject.name}</option>
		                            </c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12">
							<label class="control-label label-four">考试分值:</label>
							<div class="ml80">
								<input type="text" class="form-control" id="totalScore" name="totalScore" readonly>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12">
							<label class="control-label label-four">出卷方式:</label>
							<div class="question radio icheck ml80" require="">
								<label> 
									<input class="minimal" type="radio" name="type" checked value="0"> 从题库中导入
								</label> 
								<label> 
									<input class="minimal" type="radio" name="type" value="1" disabled> 自动随机组卷
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12">
							<label class="control-label label-four">开始时间:</label>
							<div class="ml80">
								<input type="text" class="form-control" name="startTime" id="startExamTime" placeholder="请选择开始考试时间" readonly="readonly" require=""/>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12">
							<label class="control-label label-four">结束时间:</label>
							<div class="ml80">
								<input type="text" class="form-control" name="endTime" id="endExamTime" placeholder="请选择结束考试时间" readonly="readonly" require=""/>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12">
							<a class="btn btn-primary col-xs-12 btn-style" style="height: 100px" onclick="saveExam(0)"> 
								<span class="glyphicon glyphicon-blackboard"></span> 发布考试
							</a>
						</div>
					</div>
				</div>
				<div class="col-lg-8 form-editor">
					<div id="manual">
						<div class="form-group">
							<div class="col-xs-12">
								<div id="toolbar" class="btn-group">
									<button id="orderType" type="button" class="btn btn-default">按题目类型排序</button>
                      				<button id="orderDifficult" type="button" class="btn btn-default">按难度排序</button>
                      				<button id="orderScore" type="button" class="btn btn-default">按题目分值排序</button>
						        </div>
								<table id="table" style="table-layout: fixed"></table>
							</div>
						</div>
					</div>
					<div id="automatic">
						<div class="box box-success">
							<div class="box-header with-border">
								<h3 class="box-title">自动随机组卷</h3>
							</div>
							<div class="box-body">
								<div class="row">
									<div class="col-xs-3">
										<input type="text" class="form-control" placeholder="单项选择题">
									</div>
									<div class="col-xs-4">
										<input type="text" class="form-control" placeholder="多项选择题">
									</div>
									<div class="col-xs-5">
										<input type="text" class="form-control" placeholder="主管问答题">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<script>
	$("#automatic").hide();
	//日期时间控件
	$('#startExamTime').datetimepicker({
		language : 'zh-CN',
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		forceParse : false,
		showMeridian : 1,
		startDate : new Date(),
		todayBtn : true,
		format : "yyyy-mm-dd hh:ii", //时间格式
	}).on("click",function() {
		$("#startExamTime").datetimepicker("setEndDate", $("#endExamTime").val())
		});
	
	$('#endExamTime').datetimepicker({
		language : 'zh-CN',
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		forceParse : false,
		showMeridian : 1,
		todayBtn : true,
		format : "yyyy-mm-dd hh:ii", //时间格式
	}).on("click",function() {
		$("#endExamTime").datetimepicker("setStartDate", $("#startExamTime").val())
		});
	
	function selectValue(){
		var subjectId = $("#subject-select").val();
		Core.refreshTable("#table");
	}
	
	$('[type="radio"].minimal').on('ifChecked', function(event) {
		var checkVal = $("input[class=minimal]:checked").val();
		if (checkVal == 0) {
			Core.refreshTable("#table");
			$("#manual").show();
			$("#automatic").hide();
		} else {
			Core.refreshTable("#table");
			$("#manual").hide();
			$("#automatic").show();
		}
	}).iCheck({
		checkboxClass : 'icheckbox_minimal-blue',
		radioClass : 'iradio_minimal-blue',
	});
	var overAllIds = new Array(); //全局数组
	var score = 0;
	var columns = [ {
		align : 'center',
		checkbox : true,
		formatter : function(i, row) {
			if ($.inArray(row.id, Array.from(overAllIds)) != -1) {
				return {
					checked : true
				}
			}
		}

	}, {
		field : 'title',
		title : '题名',
		width : '33%',
		cellStyle : {
			css : {
				"overflow" : "hidden",
				"text-overflow" : "ellipsis",
				"white-space" : "nowrap",
				"word-break" : "keep-all",
				"white-space" : "nowrap",
			}
		},
	}, {
		field : 'type',
		title : '题目类型',
		align : "center",
		width : '10%',
		formatter : function(type) {
			var typeName = '';
			if (type == 0) {
				typeName = '单项选择题';
			} else if (type == 1) {
				typeName = '多项选择题';
			} else if (type == 2) {
				typeName = '判断题';
			} else if (type == 3) {
				typeName = '填空题';
			} else if (type == 4) {
				typeName = '主观问答题';
			} else if (type == 5) {
				typeName = '编程题';
			}
			return typeName;
		}
	}, {
		field : 'difficulty',
		title : '难度',
		align : "center",
		width : '10%',
		formatter : function(difficulty) {
			var diffHtml = '';
			if (difficulty == 1) {
				diffHtml = "★☆☆☆☆";
			} else if (difficulty == 2) {
				diffHtml = "★★☆☆☆";
			} else if (difficulty == 3) {
				diffHtml = "★★★☆☆";
			} else if (difficulty == 4) {
				diffHtml = "★★★★☆";
			} else if (difficulty == 5) {
				diffHtml = "★★★★★";
			}
			return diffHtml;
		}
	}, {
		field : 'score',
		title : '分值',
		align : "center",
		width : '10%',
	} ];
	var options = {
		id : "#table",
		url : '/question/list',
		columns : columns,
		toolbar: '#toolbar',
        showRefresh: true,
		queryParams : queryParams
	}
	Core.initTable(options);
	/*查询参数*/
	function queryParams(params) {
		var temp = { //这里的键的名字和控制器的变量名必须一致，这边改动，控制器也需要改成一样的
			limit : params.limit, //页面大小
			offset : params.offset, //页码
			orderBy : $("#orderBy").val(),
			subjectId : $("#subject-select").val(),

		};
		return temp;
	}

	$('#table').on('uncheck.bs.table check.bs.table check-all.bs.table uncheck-all.bs.table',
		function(e, rows) {
				var datas = $.isArray(rows) ? rows : [ rows ]; // 点击时获取选中的行或取消选中的行
				examine(e.type, datas); // 保存到全局 Array() 里
				});

	function examine(type, datas) {
		if (type.indexOf('uncheck') == -1) {
			$.each(datas, function(i, v) {
				// 添加时，判断一行或多行的 id 是否已经在数组里 不存则添加　
				overAllIds.indexOf(v.id) == -1 ? overAllIds.push(v.id) : -1;
				score += v.score;
			});
		} else {
			$.each(datas, function(i, v) {
				overAllIds.splice(overAllIds.indexOf(v.id), 1); //删除取消选中行
				score -= v.score;
			});
		}
		$("#totalScore").val(score);
	}

	$(function() {
		/*排序*/
		$("#orderType").click(function() {
			$("#orderBy").val('q.type');
			Core.refreshTable("#table");
		});
		$("#orderDifficult").click(function() {
			$("#orderBy").val('q.difficulty');
			Core.refreshTable("#table");
		});
		$("#orderScore").click(function() {
			$("#orderBy").val('q.score');
			Core.refreshTable("#table");
		});
	})

	function saveExam(status) {
		if (validExam()) {
			Core.confirm("确认发布考试？", function() {
				var startTime = new Date($('#startExamTime').val());
				var endTime = new Date($('#endExamTime').val());
				$('#startExamTime').val(startTime);
				$('#endExamTime').val(endTime);
				$("#status").val(status);
				$("#question").val(overAllIds);
				Core.postAjax("/exam/add", $("#examForm").serialize(),
						function(data) {
							if (data.status = 200) {
								$("#examForm")[0].reset(); //清空表单
							}
							layer.msg(data.msg)
						})
			})
		}
	}

	function validExam() {
		if (doValidForm(examForm)) {
			var checkedRows = Core.selectMutiData("#table");
			var ids = [];
			$.each(checkedRows, function(i, item) {
				ids.push(item.id);
			})
			if (ids.length > 0) {
				return true;
			} else {
				layer.msg("请添加题目！")
			}
		}
		return false;
	}
</script>
</body>
</html>