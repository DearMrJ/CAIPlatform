<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>辅助教学平台（学生端）</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>


<link rel="stylesheet" href="/js/semantic-ui/semantic.min.css" />
<!-- <link rel="stylesheet" href="/css/exam-common.css" />
<link rel="stylesheet" href="/css/web-common.css" /> -->
<link rel="stylesheet" href="css/easy.css">
<script src="/js/jquery/jquery.min.js"></script>
<script src="/js/jquery/jquery.countdown.min.js"></script>
<script src="/js/semantic-ui/semantic.min.js"></script>
<script src="/js/layer/layer.js"></script>
<script src="/js/core.js"></script>
<script src="/js/detail.js"></script>
</head>

<body>

	<div class="ui problemDetail container">
		<div class="ui grid">
			<div class="ten wide column">
				<div class="row" style="padding-left: 2.5em">
					<div class="ui stacked segment" id="question">
						<h4 class="ui horizontal divider header">
							<i class="help circle icon"></i>题目描述
						</h4>
						<label id="currentQuetionTitle"></label>
						<div class="grouped fields" id="currentQuestionAnswer"></div>
					</div>

					<div id="preAndNextButton"></div>
				</div>
			</div>

			<div class="five wide column" style="margin-left: 2em">
				<div class="row">
					<table class="ui table">
						<tbody>
							<tr>
								<td><span style="font-weight: bolder;">考生学号:</span></td>
								<td></td>
							</tr>
							<tr>
								<td><span style="font-weight: bolder;">当前考生:</span></td>
								<td></td>
							</tr>
							<tr>
								<td><span style="font-weight: bolder;">剩余时间:</span></td>
								<td><span style="font-weight: bolder; color: red;"
									id="examTimeCountdown"></span></td>
							</tr>
							<tr>
								<td><span style="font-weight: bolder;">开始时间:</span></td>
								<td></td>
							</tr>
							<tr>
								<td><span style="font-weight: bolder;">结束时间:</span></td>
								<td><span> <fmt:formatDate
											value="${data.exam.endTime}" type="date"
											pattern="yyyy-MM-dd HH:mm" /></span></td>
							</tr>
							<tr>
								<td><span style="font-weight: bolder;">总分:</span></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="row" style="margin-top: 1em;">
					<!-- <div class="ui segment">
            <div class="title">答题卡</div> -->
					<!-- <div class="content ui segment" id="currentQuestionButton">
          </div> -->
					<!-- <div class="extra content">
              <button type="button" onclick="examDetailPage.finishExamAction()" class="ui positive button">交卷</button>
            </div> -->
					<!-- </div>
        </div> -->
				</div>
			</div>
		</div>
	</div>
	<div class="return_top">
		<a class="fa fa-arrow-up"></a>
	</div>
	<script type="text/javascript">

    //headerMain.setAttribute("style","background:#4F94CD");
    var answer = ${gradeJson};
    var exam = answer.examination;
    console.log(answer.examination.questions);


    $(function () {
    	  $.each(answer.examination.questions, function (index, val) {

    	    if (answer.examination.questions[index].type == 3) {
    	      var $selectOptionStr = `<div class="ui stacked segment" style="margin-bottom:50px;"><label style="margin-top:20px">第` + (index + 1) + `题.&nbsp&nbsp( 填空题 )&nbsp;&nbsp;` + answer.examination.questions[index].title + `(` + answer.examination.questions[index].score + `分)</label >
    	          <div class="grouped fields"><div class="article-body markdown-body editor-preview-active-side" style="margin-top:10px;"></div>
    	          <div class="form-group"><input id="questionAnswer`+ index + `" class="form-control" rows="3" value="` + answer.examination.questions[index].stuAnswer + `"> 打分:&nbsp<input class="score"  style=" margin-top:10px; margin-bottom:10px;">&nbsp&nbsp该题满分:` + answer.examination.questions[index].score + `分<p>正确答案:&nbsp` + answer.examination.questions[index].answer + `</p><p>解析:&nbsp;` + answer.examination.questions[index].parse + `</p>
    	  
    	            </div></div>`;
    	      $('#question').append($selectOptionStr);

    	    } else if (answer.examination.questions[index].type == 4) {
    	      var $selectOptionStr = `<div class="ui stacked segment" style="margin-bottom:50px;"><label style="margin-top:20px">第` + (index + 1) + `题.&nbsp&nbsp( 主观问答题 )&nbsp;&nbsp;` + answer.examination.questions[index].title + `(` + answer.examination.questions[index].score + `分)</label >
    	          <div class="form-group"><textarea id="questionAnswer`+ index + `" class="form-control" rows="3" >` + answer.examination.questions[index].stuAnswer + `</textarea> 打分:&nbsp<input class="score"  style=" margin-top:10px;margin-bottom:10px;">&nbsp&nbsp该题满分:` + answer.examination.questions[index].score + `分<p>正确答案:&nbsp` + answer.examination.questions[index].answer + `</p><p>解析:&nbsp` + answer.examination.questions[index].parse + `</p>
    	   
    	          </div> </div>`;
    	      $('#question').append($selectOptionStr); index

    	    } else if (answer.examination.questions[index].type == 5) {
    	      var $selectOptionStr = `<div class="ui stacked segment" style="margin-bottom:50px;"><label style="margin-top:20px">第` + (index + 1) + `题.&nbsp&nbsp( 编程题 )&nbsp;&nbsp;` + answer.examination.questions[index].title + `(` + answer.examination.questions[index].score + `分)</label >
    	          <div class="form-group"><textarea id="questionAnswer`+ index + `" class="form-control" rows="10">` + answer.examination.questions[index].stuAnswer + `</textarea> 打分:&nbsp<input class="score"  style=" margin-top:10px;margin-bottom:10px;">&nbsp&nbsp该题满分:` + answer.examination.questions[index].score + `分 <p >正确答案:&nbsp` + answer.examination.questions[index].answer + `</p><p >解析:&nbsp` + answer.examination.questions[index].parse + `</p>

    	            </div>`;

    	      $('#question').append($selectOptionStr);
    	    }



    	  })
    	  var $selectOptionStr = `<button id='getscore' style="margin-left:35%;width:200px">确定</button>`
    	  $('#question').append($selectOptionStr);

    	  var getscore = document.querySelector('#getscore');
    	  var allscore = 0;
    	  var scores = document.querySelectorAll('.score');

    	  var isClick = true;
    	  getscore.addEventListener('click', function () {

    	    allscore = 0;
    	    for (var i = 0; i < scores.length; i++) {
    	      if (scores[i].value == '') { scores[i].value = 0; }
    	      allscore += parseInt(scores[i].value);
    	    }



    	    if (isClick) {
    	      isClick = false;
    	      $.ajax({
    	        url: "/grade/mark",
    	        type: "POST",
    	        dataType: "json",
    	        contentType: "application/json;charset=UTF-8",
    	        data: JSON.stringify({
    	          id: answer.id,//xxxxxx(从后台来的grade.id),
    	          manulResult: allscore, //xxxx(统计所有主观题的分数和，注意是主观题)
    	        }),
    	        success: function (data) {
    	          layer.msg(data.msg, function () {//成功则返回
    	            window.location.href = "/manage";
    	          });
    	        },
    	        error: function (data) {//失败打印失败信息
    	          layer.msg(data.msg)
    	        }
    	      });
    	      //定时器
    	      setTimeout(function () {
    	        isClick = true;
    	      }, 3000);//三秒内不能重复点击
    	    }



    	  })

    	});
  </script>
</body>

</html>