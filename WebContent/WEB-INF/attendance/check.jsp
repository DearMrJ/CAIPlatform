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
  <style>
    table {
      width: 1033px;
      margin: 30px auto;


    }

    tr {
      border-style: solid;
      border-width: 1px;
    }

    td,
    th {

      height: 60px;
      font-size: 17px;
      text-align: center;
      border: 1px;

    }

    thead tr {
      height: 40px;
      background-color: rgba(242, 242, 242, 1);
    }
  </style>
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
        <h2 style="font-weight: 300; margin-top: 30px;margin-left:50px;">辅助教学平台（教师端）</h2>
      </div>

      <div class="nav navbar-nav" style="width: 60%; padding-left: 40%;">
        <ul class="nav navbar-nav" style="margin-top: 20px; margin-left: 5%;">
          <li><a href="#"><span class="glyphicon glyphicon-envelope" style="font-size: 25px;"></span></a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <span class="glyphicon glyphicon-user" style="font-size:25px;"></span>&nbsp admin<span
                class="caret"></span>
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
        <li role="presentation" class="active"><a
            href="file:///C:/Users/Mr.Xiao/Desktop/%E8%BE%85%E5%8A%A9%E6%95%99%E5%AD%A6%E5%B9%B3%E5%8F%B0/teacher1.html"><span
              class="glyphicon glyphicon-home" style="font-size:25px; padding-right: 45px;">&nbsp首页</span></a></li>
        <li> &nbsp</li>
        <li role="presentation" class="disabled"><a href="#"><span class="glyphicon glyphicon-th-list"
              style="font-size:25px; padding-right: 45px;">&nbsp管理</span></a></li>
        <li role="presentation"><a
            href="file:///C:/Users/Mr.Xiao/Desktop/%E8%BE%85%E5%8A%A9%E6%95%99%E5%AD%A6%E5%B9%B3%E5%8F%B0/teacher2.html"
            style="font-size: 18px; color: black;margin-top: 10px;">课程管理</a>
        </li>
        <li role="presentation"><a
            href="file:///C:/Users/Mr.Xiao/Desktop/%E8%BE%85%E5%8A%A9%E6%95%99%E5%AD%A6%E5%B9%B3%E5%8F%B0/teacher3.html"
            style="font-size: 18px; margin-top: 10px;">成绩管理</a>
        </li>
        <li role="presentation"><a href="#" style=" font-size: 18px; margin-top: 10px;">考勤管理</a></li>

        <li role="presentation"><a
            href="file:///C:/Users/Mr.Xiao/Desktop/%E8%BE%85%E5%8A%A9%E6%95%99%E5%AD%A6%E5%B9%B3%E5%8F%B0/teacher6.html"
            style="font-size: 18px; margin-top: 10px;">学生评价</a>
        </li>
      </ul>

    </aside>
    <div class="main" style="margin-top: 30px; background-color: #F6F8F9;">
      <span style="font-size: 30px;">课程管理</span>
    </div>

    <!-- 全部课程 -->
    <div class="main" style="margin-top: 25px;">
      <div class="font" style="margin: 25px 0 25px 25px;"><span style="font-size:20px">课程考勤（计算机概论）</span> </div>
    </div>
    <div class="main" style="margin-top: 5px;">

      <div class="select" style="margin:60px; font-size: 16px; ">
        <span>考勤方式</span>
        <label class="radio-inline" style="margin-left: 20px;">
          <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 随机考勤
        </label>
        <label class="radio-inline" style="margin-left: 20px;">
          <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 顺序考勤
        </label>
        <button
          style="background:rgba(19, 140, 136, 1);  border-radius: 5px; width: 150px; height: 40px; margin-left: 20px;"
          id="start"><span style="color:white">考勤开始</span>
        </button> <button style="background:white;  border-radius: 5px; width: 150px; height: 40px; margin-left: 20px;"
          id="end"><span style="color:rgba(19, 140, 136, 1);">考勤结束</span></button>
      </div>


      <div class="qiandao" style=" margin:50px 30px 20px 60px;font-size: 16px;">学生名字 <span
          style="font-size:40px; margin-left: 20px;margin-right: 20px;" id="name">无</span>学生<span> </span>人/已签到
        <span> </span> 人/未签到<span> </span> 人 <button class="up" disabled="disabled"
          style="background:white;  border-radius: 5px; width: 150px; height: 40px; margin-left: 20px;"><span
            style="color:rgba(19, 140, 136, 1);">返回上一个</span></button></div>

      <div style=" margin:30px 30px 80px 20px;font-size: 16px;"><button value="3" class="down" disabled="disabled"
          style=" background:red;  border-radius: 5px; width: 100px; height: 40px; margin-left: 20px;"><span
            style="color:white;">旷课</span></button><button value="2" class="down" disabled="disabled"
          style="background:orange;  border-radius: 5px; width: 100px; height: 40px; margin-left: 20px;"><span
            style="color:white">请假</span></button><button value="1" class="down" disabled="disabled"
          style="background:rgba(19, 140, 136, 1);  border-radius: 5px; width: 100px; height: 40px; margin-left: 20px;"><span
            style="color:white">签到</span></button></div>


    </div>

</body>
<script>
  var datas = [
    {
      student_id: 1,
      name: '肖锦锋',
      date: '',
      statute: 0
    },
    {
      student_id: 1,
      name: '将麒麟',
      date: '',
      statute: 1
    },

    {
      student_id: 1,
      name: '讲起吧',
      date: '计算机概论',
      statute: 2
    },
  ];
  $(function () {



    i = 0;

    $("#start").click(function () {
      if (i < datas.length) {
        $("#name").text(datas[i].name);
        $('.down').removeAttr("disabled");
        $('.up').removeAttr("disabled");
        $(".qiandao span").eq(1).text($(datas).length);
        $(".qiandao span").eq(2).text(i);
        $(".qiandao span").eq(3).text($(datas).length - i);
      }
    })
    $('.down').click(function () {
      if (i < datas.length) {
        datas[i].statute = $(this).val();


        console.log(datas[i].statute);
        i = i + 1;
        $(".qiandao span").eq(2).text(i);
        $(".qiandao span").eq(3).text($(datas).length - i);
        if (i < datas.length) {
          $("#name").text(datas[i].name);
        }
        else $("#name").text('无');
      }


    });

    $(".up").click(function () {
      if (i > 0) {
        i = i - 1;
        $("#name").text(datas[i].name);
        $(".qiandao span").eq(2).text(i);
        $(".qiandao span").eq(3).text($(datas).length - i);
      }
    })

  })

</script>

</html>