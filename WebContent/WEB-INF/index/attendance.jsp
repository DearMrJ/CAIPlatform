<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script src="/js/attendance.js"></script>
</head>
<body>
<div id="header" class="nav-header">
</div>
<div class="exam-content">
	<div class="ui countdownTime container">
	    <div class="red ui tiny horizontal statistic">
	        <div class="value">
	            <i class="alarm large icon"></i>
	            <span id="exam-time-countdown"></span>
	        </div>
	    </div>
	</div>
	<div class="ui examList container">
		<table class="ui table" id="exam_table">
			<thead><tr>
	            <th class="five wide">考勤科目</th>
	            <th class="four wide">活动标题</th>
	            <th class="third wide">开始时间</th>
	            <th class="third wide">结束时间</th>
	            <th class="second wide">操作</th>
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
	$(function(){
		requestPage(offset);
	});

	function requestPage(offset){
		Core.postAjax("/attendance/list",{"limit":10,"offset":offset},function (result) {
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
					tableHeader = $("<span>未开始</span>").addClass("ui yellow ribbon label");
					operateBtn = $("<a>进入考勤</a>").addClass("small disabled positive ui button");
				}else if(items.status == 1){
					tableHeader = $("<span>进行中</span>").addClass("ui green ribbon label");
					operateBtn = $("<a onclick='startToAttendanceAction("+items.id+")'>进入考勤</a>").addClass("small positive ui button");
				}else{
					tableHeader = $("<span>已结束</span>").addClass("ui red ribbon label");
					operateBtn = $("<a>进入考勤</a>").addClass("small disabled grey ui button");
				}
				var subjectTd = $("<td></td>").append(tableHeader).append($("<span></span>").addClass("ui header").append(items.subject.name));
				var titleTd = $("<td></td>").append(items.title);
				var startTimeTd = $("<td></td>").append(new Date(items.startTime).Format('yyyy-MM-dd hh:mm:ss'));
				var endTimeTd = $("<td></td>").append(new Date(items.endTime).Format('yyyy-MM-dd hh:mm:ss'));
				var operateTd = $("<td></td>").append(operateBtn);
				$("<tr></tr>").append(subjectTd)
							  .append(titleTd)
							  .append(startTimeTd)
							  .append(endTimeTd)
							  .append(operateTd)
							  .appendTo("#exam_table tbody");
			})
		}else{
			$("#exam_table tbody").empty();
			$("<tr style='text-align:center'><td colspan='5'>当前没有考勤</td></tr>").appendTo("#exam_table tbody");
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
		/*进入考勤*/
	    function startToAttendanceAction(id) {
				layer.msg("loading...", {
					title: "系统提示",
				    icon: 1,
				    time: 800
				},function(){
					window.location.href="/attendance/startAttendance?id="+id;
			    }); 
				/* if(data.status==200){
					layer.msg("loading...", {
						title: "系统提示",
					    icon: 1,
					    time: 800
					},function(){
						window.location.href="/attendance/startAttendance?id="+id;
				    }); 
				}else{
					layer.alert(data.msg, {
						title:"系统提示",
						icon: 2
					});
				} */
	        //window.location.href="/attendance/startattendance?id="+id;
	    }
</script>
</body>
</html>