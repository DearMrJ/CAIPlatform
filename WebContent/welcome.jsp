<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>45后台管理</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="/js/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="/js/bootstrap/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" href="/js/font-awesome/font-awesome.min.css"/>
    <link rel="stylesheet" href="/js/adminlte/css/AdminLTE.min.css"/>
    <link rel="stylesheet" href="/js/adminlte/css/all-skins.min.css"/>
    <link rel="stylesheet" href="/js/pace/pace.css"/>
    <link rel="stylesheet" href="/js/validate/validate.css"/>
    <link rel="stylesheet" href="/js/bootstrap-table/css/bootstrap-table.min.css"/>
    <link rel="stylesheet" href="/js/treegrid/jquery.treegrid.css"/>
    <link rel="stylesheet" href="/js/ztree/css/ztree-bootstrap.css"/>
    <link rel="stylesheet" href="/js/zplayer/css/zplayer.min.css"/>
    <link rel="stylesheet" href="/js/upload/css/webuploader.css"/>
    <link rel="stylesheet" href="/js/Ionicons/css/ionicons.min.css"/>
    <link rel="stylesheet" href="/js/markdown/simplemde.min.css">
    <link rel="stylesheet" href="/js/markdown/github-markdown.min.css">
    <link rel="stylesheet" href="/js/markdown/highlight.min.css">
    <link rel="stylesheet" href="/js/iCheck/minimal/blue.css"/>
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
    <script src="/js/chartJs/Chart.js"></script>
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
		<li><a href="/welcome.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
		<li class="active">管理首页</li>
	</ol>
</section>
<!-- Main content -->
<section class="content">
	<div class="row">
		<div class="col-lg-3 col-xs-3">
			<div class="small-box bg-aqua">
				<div class="inner">
					<h3>${commentNums}<sup style="font-size:20px">人</sup></h3>
					<p>学生总数</p>
				</div>
				<div class="icon">
					<i class="ion ion-person-stalker"></i>
				</div>
				<a href="/manage#students" class="small-box-footer" target="container">更多 <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<div class="col-lg-3 col-xs-3">
			<div class="small-box bg-green">
				<div class="inner">
					<h3>
					${subjectNums}<sup style="font-size:20px">%</sup>
					</h3>
					<p>课程总数</p>
				</div>
				<div class="icon">
					<i class="icon ion-film-marker"></i>
				</div>
				<a href="/manage#subjects" class="small-box-footer" target="container">更多 <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<div class="col-lg-3 col-xs-3">
			<div class="small-box bg-yellow">
				<div class="inner">
					<h3>${userNums}<sup style="font-size:20px">人</sup></h3>
					<p>用户量</p>
				</div>
				<div class="icon">
					<i class="ion ion-person-add"></i>
				</div>
				<a href="/manage#users" class="small-box-footer" target="container">更多 <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
		<div class="col-lg-3 col-xs-3">
			<div class="small-box bg-red">
				<div class="inner">
					<h3>${questionNums}<sup style="font-size:20px">道</sup></h3>

					<p>题库量</p>
				</div>
				<div class="icon">
					<i class="ion ion-cube"></i>
				</div>
				<a href="/manage#questions" class="small-box-footer" target="container">更多 <i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">最近发布的考试</h3>
					<div class="box-tools pull-right">
						<button type="button" class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button type="button" class="btn btn-box-tool" data-widget="remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<div class="box-body">
					<ul class="products-list product-list-in-box" id="examList"></ul>
				</div>
				<div class="box-footer text-center">
              		<a href="/manage#exams" class="uppercase" target="container">查 看 更 多 考 试</a>
            	</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="box box-danger">
				<div class="box-header with-border">
					<h3 class="box-title">学院和学生人数统计</h3>
					<div class="box-tools pull-right">
						<button type="button" class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button type="button" class="btn btn-box-tool" data-widget="remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<div class="box-body">
					<div id="pieChart" style="width:100%;height:325px"></div>
				</div>
			</div>
		</div>
	</div>
</section>
	
	
	<script type="text/javascript">
		$(function () {
			Core.postAjax("/api/aes","",function (data) {//最近考试
	            if(data.status==200){
	            	build_exam_li(data);//239行
	            }else{
	            	layer.msg(data.msg);
	            }
	        })
	        
			Core.postAjax("/api/aps","",function (data) {//学院人数统计
	            if(data.status==200){
	                getData(data);//191行
	            }else{
	            	layer.msg(data.msg);
	            }
	        })
	        
	        function getData(data){//学院人数统计
				var data = data.data;
				var legendData = [];//
	            var seriesData = [];//
	            for (var i = 0; i < data.length; i++) {
	                name = data[i].faculty_name;
	                legendData.push(name); //装学院名
	                seriesData.push({ //学院名+学生数量	
	                    name: name,
	                    value: data[i].num
	                });
	            }
	
				//初始化echarts实例，作学院人数统计
		        var myChart = echarts.init(document.getElementById('pieChart'));
				
		        //指定图表的配置项和数据
		        option = {
		       	    tooltip : {
		       	        trigger: 'item',
		       	        formatter: "{a} <br/>{b} : {c} 人"
		       	    },
		       	    legend: {
		       	        left: 'left',
		       	        data: legendData
		       	    },
		       	    series : [
		       	        {
		       	            name: '数据来源',
		       	            type: 'pie',
		       	            radius : '70%',
		       	            center: ['50%', '50%'],
		       	            data: seriesData,
		       	            itemStyle: {
		       	                emphasis: {
		       	                    shadowBlur: 10,
		       	                    shadowOffsetX: 0,
		       	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		       	                }
		       	            }
		       	        }
		       	    ]
		       	}
		      	//使用刚指定的配置项和数据显示图表。
		        myChart.setOption(option);
			}
		})
		
		function build_exam_li(data){
			var exams = data.data;
			if(!exams.length == 0){
				$.each(exams, function(index, items){
					var statusSpan;
					//var imgDiv = $("<div class='product-img'></div>").append("<img src='"+items.img+"'/>");
					var imgDiv = $("<div class='product-img'></div>").append("<img src='/icon/test1.png'/>");
					if(items.status == 0){
						statusSpan = $("<span>未开始</span>").addClass("label label-warning pull-right");
					}else if(items.status == 1){
						statusSpan = $("<span>进行中</span>").addClass("label label-success pull-right");
					}else{
						statusSpan = $("<span>已结束</span>").addClass("label label-danger pull-right");
					}
					var titleA = $("<a href='/exam/list' class='product-title'></a>").append(items.title).append(statusSpan);
					/***********将Unix时间戳转换为 普通时间格式****************/
					var unixTimestamp = new Date(items.create_time);
					var commonTime = unixTimestamp.toLocaleString();
					/*************************************************/
					var desSpan = $("<span style='padding-top:5px'>"+items.nickname+"于"+commonTime+"发布考试啦!</span>").addClass("product-description");
					var infoDiv = $("<div class='product-info'></div>").append(titleA).append(desSpan);
					$("<li class='item'></li>").append(imgDiv).append(infoDiv).appendTo("#examList");
				})
			}else{
				$("<li class='item'>最近没有发布考试</li>").appendTo("#examList");
			}
		}
	</script>
	
</body>
</html>