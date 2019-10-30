<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="org.exam.entity.Examination" %>
<%@ page import="net.sf.json.JSONObject" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>45在线</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="stylesheet" href="/js/bootstrap/bootstrap.min.css"/>
	<link rel="stylesheet" href="/js/semantic-ui/semantic.min.css" />
	<link rel="stylesheet" href="/css/exam-common.css"/>
	<link rel="stylesheet" href="/css/web-common.css"/>
	<script src="/js/jquery/jquery.min.js"></script>
	<script src="/js/jquery/jquery.countdown.min.js"></script>
	<script src="/js/bootstrap/bootstrap.min.js"></script>
    <script src="/js/semantic-ui/semantic.min.js"></script>
    <script src="/js/layer/layer.js"></script>
    <script src="/js/core.js"></script>
    <script src="/js/detail.js"></script>
</head>
<body>
<header id="header" class="nav-header">
</header>
<div class="exam-content" style="padding-bottom:1em;margin-top:10px">
	<div class="ui header container">
	    <div class="ui large breadcrumb">
	        <a class="section" href="/exam/examination"><i class="home icon"></i>在线考试列表</a>
	        <i class="right chevron icon divider"></i>
	        <div class="section" value="${data.exam.id}">${data.exam.title}</div>
	    </div>
	</div>
	<div class="ui problemDetail container">
	    <div class="ui grid">
	        <div class="ten wide column">
	            <div class="row" style="padding-left: 2.5em">
	                <div class="ui stacked segment">
	                    <h4 class="ui horizontal divider header"><i class="help circle icon"></i>题目描述</h4>
	                    <label id="currentQuetionTitle"></label>
	                    <div class="grouped fields" id="currentQuestionAnswer"></div>
	                </div>
	            	<div id="preAndNextButton"></div>
	            </div>
	        </div>
	        
	        <div class="five wide column" style="margin-left:2em">
	            <div class="row">
	                <table class="ui table">
	                    <tbody>
	                    <tr>
	                        <td><span style="font-weight: bolder;">考生学号:</span></td>
	                        <td><span>${user.username}</span></td>
	                    </tr>
	                    <tr>
	                        <td><span style="font-weight: bolder;">当前考生:</span></td>
	                        <td><span>${user.nickname}</span></td>
	                    </tr>
	                    <tr>
	                        <td><span style="font-weight: bolder;">剩余时间:</span></td>
	                        <td><span style="font-weight: bolder;color:red;" id="examTimeCountdown"></span></td>
	                    </tr>
	                    <tr>
	                        <td><span style="font-weight: bolder;">开始时间:</span></td>
	                        <td><span><fmt:formatDate value="${data.exam.startTime}" type="date" pattern="yyyy-MM-dd HH:mm"/></span></td>
	                    </tr>
	                    <tr>
	                        <td><span style="font-weight: bolder;">结束时间:</span></td>
	                        <td><span><fmt:formatDate value="${data.exam.endTime}" type="date" pattern="yyyy-MM-dd HH:mm"/></span></td>
	                    </tr>
	                    <tr>
	                        <td><span style="font-weight: bolder;">总分:</span></td>
	                        <td><span>${data.exam.totalScore}</span></td>
	                    </tr>
	                    </tbody>
	                </table>
	            </div>
	            <div class="row" style="margin-top: 1em;">
	                <div class="ui segment">
	                    <div class="title">答题卡</div>
	                    	<div class="content ui segment" id="currentQuestionButton">
	                    </div>
	                    <div class="extra content">
	                        <button type="button" onclick="examDetailPage.finishExamAction()" class="ui positive button">交卷</button>
	                    </div>
	                </div>
	            </div>
            </div>
	   </div>
   </div>
</div>
<div class="return_top"><a class="fa fa-arrow-up"></a></div>
<script type="text/javascript">
	var headerMain = document.getElementById('headerMain');
	//headerMain.setAttribute("style","background:#4F94CD");
	var exam= ${data.examJson};
	console.log(exam.title);
	//headerMain.setAttribute("style","background:#4F94CD");
	//var exam = ${data.exam.id}
	/* {
			/*id=2, title=1标题, userId=Young, author=师者, grade=2016, status=1, totalScore=10, classId=1, subjectId=1, startTime=Mon Oct 28 22:18:08 CST 2019, endTime=Tue Oct 29 22:18:08 CST 2019, createTime=Mon Oct 28 22:18:08 CST 2019, updateTime=Mon Oct 28 22:18:12 CST 2019, examTime=0, 
			questions=[org.exam.entity.Question@10208e9, org.exam.entity.Question@d935a1], 
			faculty=null, 
			classes=Classes [id=1, facultyId=null, name=null, description=null, status=null, createTime=null, updateTime=null], 
			subject=org.exam.entity.Subject@e17a73, 
			user=null*//*
			id:2,
			title:'1标题',
			userId:'young',
			author:'zzz',
			grade:'2016',
			status:1,
			totalScore:10,
			classId:1,
			questions:[1, 2],
	} */
	$(function(){
		examDetailPage.init(exam);
	});
</script>
</body>
</html>