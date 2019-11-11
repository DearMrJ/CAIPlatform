<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>辅助教学平台（教师端）</title>
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
  <link rel="stylesheet" href="css/easy.css">

</head>

<body style="background-color:#F6F8F9;">
  <nav class="navbar navbar-default" style="height: 85px;">
    <div class="container-fluid" style="height: 85px;">

      <!-- logo -->
      <div class="navbar-header" style="height: 85px;width: 40%;">
        <a class="navbar-brand" href="#">
          <img alt="Brand" style="margin-left: 90px;margin-top: 10px;"
            src="/img/logo1.png">

        </a>
        <h2 style="font-weight: 300; margin-top: 30px;margin-left:50px;">辅助教学平台</h2>
      </div>

      <div class="nav navbar-nav" style="width: 60%; padding-left: 40%;">
        <ul class="nav navbar-nav" style="margin-top: 20px; ">
          <li><a href="#"><span class="glyphicon glyphicon-envelope" style="font-size: 25px;"></span></a></li>
          <li role="presentation" class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <span class="glyphicon glyphicon-user" style="font-size:25px;"></span id='user'><span id='user'>&nbsp
                admin</span>
              <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
              <li><a href="#">主页</a></li>
              <li><a href="#">资料</a></li>
              <li role="separator" class="divider"></li>
              <li><a href="#">退出</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <div class="container1 clearfix">
    <aside class="aside" style="margin-top: 25px; padding-left: 30px;">

      <ul class="nav nav-nav nav-stacked " style="text-align:center;">
        <li role="presentation" class="active"><a href="#" style="color: black;"><span class="glyphicon glyphicon-home"
              style="font-size:25px; padding-right: 45px;">&nbsp首页</span></a></li>
        <li> &nbsp</li>
        <li role="presentation" class="disabled"><a href="#"><span class="glyphicon glyphicon-th-list"
              style="font-size:25px; padding-right: 45px;">&nbsp管理</span></a></li>
        <li role="presentation"><a
            href="#"
            style="font-size: 18px; margin-top: 10px;">课程管理</a>
        </li>
        <li role="presentation"><a
            href="#"
            style="font-size: 18px; margin-top: 10px;">成绩管理</a>
        </li>
        <li role="presentation"><a
            href="/attendance/list"
            style="font-size: 18px; margin-top: 10px;">考勤管理</a>
        </li>

        <li role="presentation"><a
            href="#"
            style="font-size: 18px; margin-top: 10px;">学生评价</a>
        </li>
      </ul>

    </aside>

    <div class="main" style="margin-top: 25px;">
      <div class="font" style="margin: 25px 0 25px 25px;;"><span style="font-size:20px">整体统计</span> </div>
      <div class="box3" style="text-align:center;"><span class="glyphicon glyphicon-eye-open"
          style="font-size:25px;">学生数</span></div>
      <div class="box1" style="text-align:center;"><span class="glyphicon glyphicon-comment"
          style="font-size:25px;">新消息</span></div>
      <div class="box2" style="text-align:center;"><span class="glyphicon glyphicon-bookmark"
          style="font-size:25px;">课程数</span></div>

      <div class="box3" style="text-align:center; margin:25px 0 25px 0;"><span style="font-size:40px;">25</span></div>
      <div class="box1" style="text-align:center; margin:25px 0 25px 0;"><span style="font-size:40px;">05</span></div>
      <div class="box2" style="text-align:center; margin:25px 0 25px 0;"><span style="font-size:40px;">956</span></div>
    </div>


    <div class="main" style="margin-top: 25px;">
      <div class="font" style="margin: 25px 0 25px 25px;;"><span style="font-size:20px">全部课程</span> </div>
      <div class="container">
        <div class="row">


          <div class="col-md-4">
            <div class="head"><span style="display: block; height: 40px;">计算机概论</span><span
                style="font-size: 15px;">课程码：JK256</span><a href="#"><span class="glyphicon glyphicon-tag"
                  style="margin-left: 40px; font-size: 25px;width: 100px; ">签到</a></span></div>
            <div class="body">
              <div class="p" style="margin-top: 10px; font-size: 45px;text-align:center;"><span
                  class="glyphicon glyphicon-cloud" style="display: block;"></span><span
                  style="font-size: 30px;">36人</span> </div><span
                style="display: block; color:rgb(85, 88, 88); margin-left: 15px;">近期作业</span><span
                style="display: block; font-size: 15px; margin-left: 15px; margin-bottom: 15px;">计算机概率论第一章作业</span>
            </div>
            <div class="foot" style="text-align:right;"><a href="">置顶 </a><a href=""> 编辑 </a><a href=""> 删除</a> </div>
          </div>




          <div class="col-md-4">
            <div class="head"><span style="display: block; height: 40px;">计算机概论</span><span
                style="font-size: 15px;">课程码：JK256</span><a href="#"><span class="glyphicon glyphicon-tag"
                  style="margin-left: 40px; font-size: 25px;width: 100px; ">签到</a></span></div>
            <div class="body">
              <div class="p" style="margin-top: 10px; font-size: 45px;text-align:center;"><span
                  class="glyphicon glyphicon-cloud" style="display: block;"></span><span
                  style="font-size: 30px;">36人</span> </div><span
                style="display: block; color:rgb(85, 88, 88); margin-left: 15px;">近期作业</span><span
                style="display: block; font-size: 15px; margin-left: 15px; margin-bottom: 15px;">计算机概率论第一章作业</span>
            </div>
            <div class="foot" style="text-align:right;"><a href="">置顶 </a><a href=""> 编辑 </a><a href=""> 删除</a> </div>
          </div>


        </div>
      </div>

    </div>

  </div>

  <script>
    var user = document.querySelector('#user');
    console.log(user);
    console.log(location.search);
    var arr = location.search.split('&');
    console.log(arr);
    var username = arr[0].substr(10);
    var password = arr[1].substr(9);
    user.innerHTML = '&nbsp' + username;
  </script>
  .
</body>

</html>