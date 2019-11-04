<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>45辅助教学平台</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
    integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

  <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
    integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
    integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
    crossorigin="anonymous"></script>
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
<body style="padding-top: 0px;">
  <nav class="navbar navbar-default" style="height: 85px;">
    <div class="container-fluid" style="height: 85px;">

      <!-- logo -->
      <div class="navbar-header" style="height: 85px;width: 40%;">
        <a class="navbar-brand" href="#">
          <img alt="Brand" style="margin-left: 90px;margin-top: 10px;"
            src="/img/logo1.png">

        </a>
        <h2 style="font-weight: 300; margin-top: 30px;margin-left:50px;">45辅教平台</h2>
      </div>

      <div class="nav navbar-nav" style="width: 60%; padding-left: 40%;">
        <ul class="nav navbar-nav" style="margin-top: 20px; margin-left: 5%;">
          <li><a href="#"><span class="glyphicon glyphicon-envelope" style="font-size: 25px;"></span></a></li>
          <li role="presentation" class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <span class="glyphicon glyphicon-user" style="font-size:25px;"></span>&nbsp admin<span
                class="caret"></span>
            </a>
            <ul class="dropdown-menu">
              <li><a href="#">主页</a></li>
              <li><a href="#">资料</a></li>
              <li role="separator" class="divider"></li>
              <li><a href="/logout">退出</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <div>
    <ol class="breadcrumb" style="padding-left:200px ;font-size:18px ;">
      <li><a href="/">首页</a></li>
      <li><a href="/exam/examination">考试列表</a></li>
      <li class="active" style="color: black;">${data.exam.title}</li>
    </ol>
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
                <td><span>
                    <fmt:formatDate value="${data.exam.startTime}" type="date" pattern="yyyy-MM-dd HH:mm" /></span>
                </td>
              </tr>
              <tr>
                <td><span style="font-weight: bolder;">结束时间:</span></td>
                <td><span>
                    <fmt:formatDate value="${data.exam.endTime}" type="date" pattern="yyyy-MM-dd HH:mm" /></span></td>
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