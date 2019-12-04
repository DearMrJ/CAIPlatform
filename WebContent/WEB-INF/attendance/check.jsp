<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>
</head>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/mainBody.css">
<link rel="stylesheet" href="/css/checkBT.css">
<script src="/js/jquery/jquery.min.js">
</script>
<script src="/js/checkBT.js"></script>

<body>
  <div class="main-top">
    <h1 class="bigtitle">课程管理</h1>
  </div>
  <div class="main-center">
    <h4 class="smalltitle"> 课程考勤(计算机概论)</h4>
  </div>
  <div class="line"></div>
  <div class="main-bottom">
    <div class="select">
      <span>考勤方式</span>
      <label class="radio-inline">
        <input type="radio" name="kaoqin" id="inlineRadio1" value="1"> 顺序考勤
      </label>
      <label class="radio-inline">
        <input type="radio" name="kaoqin" id="inlineRadio2" value="0"> 随机考勤
      </label>
      <button class="start" id="start"><span>考勤开始</span>
      </button> <button class="end" id="end"><span>考勤结束</span></button>
    </div>


    <div class="qiandao">学生名字 <span id="name">无</span>学生<span> </span> 人/已签到
      <span> </span> 人/未签到<span> </span> 人 <button class="up" style="display: none;"><span
          style="color:rgba(19, 140, 136, 1);">返回上一个</span></button></div>


    <div class="button">
      <a href="javascript:;" id="down3" data-value="0" class="down" style="display: none;">旷课</a>
      <a href="javascript:;" id="down2" data-value="2" class="down" style="display: none;"> 请假</a>
      <a href="javascript:;" id="down1" data-value="1" class="down" style="display: none;">签到</a>
    </div>
  </div>

</body>

</html>