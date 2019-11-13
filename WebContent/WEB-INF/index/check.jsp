<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>考勤</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="stylesheet" href="/js/bootstrap/bootstrap.min.css"/>
	<link rel="stylesheet" href="/js/semantic-ui/semantic.min.css" />
	<link rel="stylesheet" href="/js/zplayer/css/zplayer.min.css"/>
	<link rel="stylesheet" href="/css/exam-common.css"/>
	<link rel="stylesheet" href="/css/web-common.css"/>
	<script src="/js/jquery/jquery.min.js"></script>
	<script src="/js/jquery/jquery.countdown.min.js"></script>
	<script src="/js/bootstrap/bootstrap.min.js"></script>
    <script src="/js/semantic-ui/semantic.min.js"></script>
    <script src="/js/layer/layer.js"></script>
    <script src="/js/core.js"></script>
    <script src="/js/attendanceSheet.js"></script>
</head>
<body>
<div id="header" class="nav-header">
	<div style="margin-left: -80px">
	    <ol class="breadcrumb" style="padding-left:200px ;font-size:18px ;">
	      <li><a href="/">首页</a></li>
	      <li><a href="/attendance/attendance">考勤列表</a></li>
	      <li class="active" style="color: black;">《 ${attendance.subject.name} 》</li>
	    </ol>
 	</div>
</div>
<div class="exam-content">
	<div class="jax-box">
        <form id="formSearch" class="form-horizontal form-search">
            <div class="form-group" style="padding-left:50px">
                <div class="col-md-4 col-sm-6">
                    <label class="control-label  col-xs-4" for="grade">学 号:</label>
                    <div class="col-xs-8">
                    	${user.username}
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <label class="control-label  col-xs-4" for="insId">姓 名:</label>
                    <div class="col-xs-8">
                        ${user.nickname}
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="col-xs-8">
                        <button type="button" id="checkIn" class="btn btn-primary pull-right">签 到</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
	<div class="ui examList container">
		<table class="ui table" id="exam_table">
			<thead><tr>
	            <th class="eight wide">班级</th>
	            <th class="second wide">学号</th>
	            <th class="second wide">姓名</th>
	            <th class="second wide">签到时间</th>
	            <th class="second wide">状态</th>
	        </tr></thead>
	        <tbody></tbody>
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
</div>
<script type="text/javascript">
	var totalPage,currentPage,offset=0;
	var attendanceId = ${attendance.id};
	var userId = ${user.userId}
	$(function(){
		requestPage(offset);
	});

	function requestPage(offset){
		Core.postAjax("/attendance/startAttendance?id="+attendanceId,{"limit":15,"offset":offset},function (result) {
            build_stus_table(result);//1考勤表单
            build_page_info(result);//2页码控制
            build_page_nav(result);//3底部
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
			$("#exam_table tbody").empty();
			$.each(attendances, function(index, items){
				var tableHeader,operateBtn;
				if(items.status==0){
					tableHeader = $("<span>未签到</span>").addClass("ui yellow ribbon label");
					operateBtn = $("<a>进入考勤</a>").addClass("small disabled positive ui button");
				}else if(items.status == 1){
					tableHeader = $("<span>已签到</span>").addClass("ui green ribbon label");
					operateBtn = $("<a onclick='startToAttendanceAction("+items.id+")'>进入考勤</a>").addClass("small positive ui button");
				}else{
					tableHeader = $("<span>请假中</span>").addClass("ui red ribbon label");
					operateBtn = $("<a>进入考勤</a>").addClass("small disabled grey ui button");
				}
				var classTd = $("<td></td>").append(tableHeader).append($("<span></span>").addClass("ui header").append(items.classes.name));
				var usernameTd = $("<td></td>").append(items.user.username);
				var nicknameTd = $("<td></td>").append(items.user.nickname);
				var checkTimeTd = $("<td></td>").append(new Date(items.checkTime).Format('yyyy-MM-dd hh:mm:ss'));
				var statusTd = $("<td></td>").append(items.status);
				$("<tr></tr>").append(classTd)
							  .append(usernameTd)
							  .append(nicknameTd)
							  .append(checkTimeTd)
							  .append(statusTd)
							  .appendTo("#exam_table tbody");
			})
		}else{
			$("#exam_table tbody").empty();
			$("<tr style='text-align:center'><td colspan='5'>当前没有记录</td></tr>").appendTo("#exam_table tbody");
		}
	}

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
		
		
	    $("#checkIn").click(function () {
	        Core.postAjax("/attendance/validate",{"id":attendanceId,"userId":userId},function (data) {
	        	if(data.status==200){
		            layer.msg(data.msg, {
		                offset: '30%',
		                time: 800
		            }, function () {
		            	Core.postAjax("/attendance/checkIn",{"id":attendanceId,"userId":userId},function (data) {
		    	        	if(data.status==200){
		    		            layer.msg(data.msg, {
		    		                offset: '30%',
		    		                time: 800
		    		            }, function () {
		    		            	window.location.reload();//刷新此页
		    		            });
		    	        	}else{
		    	        		layer.alert(data.msg, {
		    						title:"系统提示",
		    						icon: 2
		    					});
		    	        	}
		    	        })
		            });
	        	}else{
	        		layer.alert(data.msg, {
						title:"系统提示",
						icon: 2
					});
	        	}
	        })
	    })
		
</script>
</body>
</html>