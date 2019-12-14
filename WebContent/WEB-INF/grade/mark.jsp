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
<link rel="stylesheet" href="/css/exam-common.css" />
<link rel="stylesheet" href="/css/web-common.css" />
<link rel="stylesheet" href="css/easy.css">
<script src="/js/jquery/jquery.min.js"></script>
<script src="/js/jquery/jquery.countdown.min.js"></script>
<script src="/js/semantic-ui/semantic.min.js"></script>
<script src="/js/layer/layer.js"></script>
<script src="/js/core.js"></script>
<script src="/js/detail.js"></script>
</head>

<body>
	<nav class="navbar navbar-default" style="height: 85px;">
		<div class="container-fluid" style="height: 85px;">

			<!-- logo -->
			<div class="navbar-header" style="height: 85px; width: 40%;">
				<a class="navbar-brand" href="#"> <img alt="Brand"
					style="margin-left: 90px; margin-top: 10px;" src="/img/logo1.png">

				</a>
				<h2 style="font-weight: 300; margin-top: 30px; margin-left: 50px;">辅助教学平台（学生端）</h2>
			</div>

			<div class="nav navbar-nav" style="width: 60%; padding-left: 40%;">
				<ul class="nav navbar-nav"
					style="margin-top: 20px; margin-left: 5%;">
					<li><a href="#"><span class="glyphicon glyphicon-envelope"
							style="font-size: 25px;"></span></a></li>
					<li role="presentation" class="dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"> <span
							class="glyphicon glyphicon-user" style="font-size: 25px;"></span>&nbsp
							admin<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="#">主页</a></li>
							<li><a href="#">资料</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">退出</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<div>
		<ol class="breadcrumb" style="padding-left: 200px; font-size: 18px;"
			id="headerMain">
			<li><a href="#">课程管理</a></li>
			<li><a href="#">计算机概论</a></li>

		</ol>
	</div>

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


    exam.questions.forEach((val, index) => {
      console.log(answer.examination.questions[index].answer);
      /* if (exam.questions[index].type == 0) {
        if (answer.examination.questions[index].stuAnswer == 'A') {
          var $selectOptionStr = `<label>第` + (index + 1) + `题.&nbsp&nbsp( 单项选择题 )&nbsp;&nbsp;` + exam.questions[index].title + `(` + exam.questions[index].score + `分)</label >
          <div class="grouped fields"><div class="article-body markdown-body editor-preview-active-side" style="margin-top:10px;"></div>
          <div class="field" style="padding-top:5px;"> <div class="ui radio checkbox"><input type="radio" checked="checked" name="questionAnswer`+ index + `" value="A"/><label>A.&nbsp;&nbsp;` + exam.questions[0].optionA + `</label></div></div>
          <div class="field" style="padding-top:5px;"> <div class="ui radio checkbox"><input type="radio" name="questionAnswer`+ index + `" value="B"/><label>B.&nbsp;&nbsp;` + exam.questions[0].optionB + `</label></div></div>
          <div class="field" style="padding-top:5px;"> <div class="ui radio checkbox"><input type="radio" name="questionAnswer`+ index + `" value="C"/><label>C.&nbsp;&nbsp;` + exam.questions[0].optionC + `</label></div></div>
          <div class="field" style="padding-top:5px;"> <div class="ui radio checkbox"><input type="radio" name="questionAnswer`+ index + `" value="D"/><label>D.&nbsp;&nbsp;` + exam.questions[0].optionD + `</label></div></div>
          <p >正确答案:&nbsp`+ answer.examination.questions[index].answer + `</p><p style="margin-bottom:40px">解析:&nbsp` + answer.examination.questions[index].parse + `</p>
          </div>`;
          $('#question').append($selectOptionStr);
        } else if (answer.examination.questions[index].stuAnswer == 'B') {
          var $selectOptionStr = `<label>第` + (index + 1) + `题.&nbsp&nbsp( 单项选择题 )&nbsp;&nbsp;` + exam.questions[index].title + `(` + exam.questions[index].score + `分)</label >
          <div class="grouped fields"><div class="article-body markdown-body editor-preview-active-side" style="margin-top:10px;"></div>
          <div class="field" style="padding-top:5px;"> <div class="ui radio checkbox"><input type="radio"  name="questionAnswer`+ index + `" value="A"/><label>A.&nbsp;&nbsp;` + exam.questions[0].optionA + `</label></div></div>
          <div class="field" style="padding-top:5px;"> <div class="ui radio checkbox"><input type="radio" checked="checked" name="questionAnswer`+ index + `" value="B"/><label>B.&nbsp;&nbsp;` + exam.questions[0].optionB + `</label></div></div>
          <div class="field" style="padding-top:5px;"> <div class="ui radio checkbox"><input type="radio" name="questionAnswer`+ index + `" value="C"/><label>C.&nbsp;&nbsp;` + exam.questions[0].optionC + `</label></div></div>
          <div class="field" style="padding-top:5px;"> <div class="ui radio checkbox"><input type="radio" name="questionAnswer`+ index + `" value="D"/><label>D.&nbsp;&nbsp;` + exam.questions[0].optionD + `</label></div></div>
          <p >正确答案:&nbsp`+ answer.examination.questions[index].answer + `</p><p style="margin-bottom:40px">解析:&nbsp` + answer.examination.questions[index].parse + `</p>
          </div>`;
          $('#question').append($selectOptionStr);
        } else if (answer.examination.questions[index].stuAnswer == 'C') {
          var $selectOptionStr = `<label>第` + (index + 1) + `题.&nbsp&nbsp( 单项选择题 )&nbsp;&nbsp;` + exam.questions[index].title + `(` + exam.questions[index].score + `分)</label >
          <div class="grouped fields"><div class="article-body markdown-body editor-preview-active-side" style="margin-top:10px;"></div>
          <div class="field" style="padding-top:5px;"> <div class="ui radio checkbox"><input type="radio"  name="questionAnswer`+ index + `" value="A"/><label>A.&nbsp;&nbsp;` + exam.questions[0].optionA + `</label></div></div>
          <div class="field" style="padding-top:5px;"> <div class="ui radio checkbox"><input type="radio"  name="questionAnswer`+ index + `" value="B"/><label>B.&nbsp;&nbsp;` + exam.questions[0].optionB + `</label></div></div>
          <div class="field" style="padding-top:5px;"> <div class="ui radio checkbox"><input type="radio" checked="checked" name="questionAnswer`+ index + `" value="C"/><label>C.&nbsp;&nbsp;` + exam.questions[0].optionC + `</label></div></div>
          <div class="field" style="padding-top:5px;"> <div class="ui radio checkbox"><input type="radio" name="questionAnswer`+ index + `" value="D"/><label>D.&nbsp;&nbsp;` + exam.questions[0].optionD + `</label></div></div>
          <p >正确答案:&nbsp`+ answer.examination.questions[index].answer + `</p><p style="margin-bottom:40px">解析:&nbsp` + answer.examination.questions[index].parse + `</p>
          </div>`;
          $('#question').append($selectOptionStr);
        } else if (answer.examination.questions[index].stuAnswer == 'D') {
          var $selectOptionStr = `<label>第` + (index + 1) + `题.&nbsp&nbsp( 单项选择题 )&nbsp;&nbsp;` + exam.questions[index].title + `(` + exam.questions[index].score + `分)</label >
          <div class="grouped fields"><div class="article-body markdown-body editor-preview-active-side" style="margin-top:10px;"></div>
          <div class="field" style="padding-top:5px;"> <div class="ui radio checkbox"><input type="radio"  name="questionAnswer`+ index + `" value="A"/><label>A.&nbsp;&nbsp;` + exam.questions[0].optionA + `</label></div></div>
          <div class="field" style="padding-top:5px;"> <div class="ui radio checkbox"><input type="radio"  name="questionAnswer`+ index + `" value="B"/><label>B.&nbsp;&nbsp;` + exam.questions[0].optionB + `</label></div></div>
          <div class="field" style="padding-top:5px;"> <div class="ui radio checkbox"><input type="radio"  name="questionAnswer`+ index + `" value="C"/><label>C.&nbsp;&nbsp;` + exam.questions[0].optionC + `</label></div></div>
          <div class="field" style="padding-top:5px;"> <div class="ui radio checkbox"><input type="radio" checked="checked" name="questionAnswer`+ index + `" value="D"/><label>D.&nbsp;&nbsp;` + exam.questions[0].optionD + `</label></div></div>
          <p >正确答案:&nbsp`+ answer.examination.questions[index].answer + `</p><p style="margin-bottom:40px">解析:&nbsp` + answer.examination.questions[index].parse + `</p>
          </div>`;
          $('#question').append($selectOptionStr);
        }

      } else if (exam.questions[index].type == 1) {
        var $selectOptionStr = `<label style="margin-top:20px">第` + (index + 1) + `题.&nbsp&nbsp( 多项选择题 )&nbsp;&nbsp;` + exam.questions[index].title + `(` + exam.questions[index].score + `分)</label >
          <div class="grouped fields"><div class="article-body markdown-body editor-preview-active-side" style="margin-top:10px;"></div>
          <div class="field"><div class="ui checkbox checkbox"><input type="checkbox" name="questionAnswer`+ index + `" value="A"/><label>A.&nbsp;&nbsp;` + exam.questions[index].optionA + `</label></div></div>
          <div class="field"><div class="ui checkbox checkbox"><input type="checkbox" name="questionAnswer`+ index + `" value="B"/><label>B.&nbsp;&nbsp;` + exam.questions[index].optionB + `</label></div></div>
          <div class="field"><div class="ui checkbox checkbox"><input type="checkbox" name="questionAnswer`+ index + `" value="C"/><label>C.&nbsp;&nbsp;` + exam.questions[index].optionC + `</label></div></div>
          <div class="field"><div class="ui checkbox checkbox"><input type="checkbox" name="questionAnswer`+ index + `" value="D"/><label>D.&nbsp;&nbsp;` + exam.questions[index].optionD + `</label></div></div><p>正确答案:&nbsp` + answer.examination.questions[index].answer + `</p><p style="margin-bottom:40px">解析:&nbsp` + answer.examination.questions[index].parse + `</p>
          </div>`;
        $('#question').append($selectOptionStr);
      } else if (exam.questions[index].type == 2) {
        if (answer.examination.questions[index].stuAnswer == 'A') {
          var $selectOptionStr = `<label style="margin-top:20px">第` + (index + 1) + `题.&nbsp&nbsp( 判断题 )&nbsp;&nbsp;` + exam.questions[index].title + `(` + exam.questions[index].score + `分)</label >
          <div class="field" style="padding-top:5px;"><div class="ui radio checkbox"><input type="radio"  checked="checked" name="questionAnswer`+ index + `" value="A"/><label>A.&nbsp;&nbsp;` + exam.questions[index].optionA + `</label></div></div>
          <div class="field" style="padding-top:5px;"><div class="ui radio checkbox"><input type="radio" name="questionAnswer`+ index + `" value="B"/><label>B.&nbsp;&nbsp;` + exam.questions[index].optionB + `</label></div></div><p>正确答案:&nbsp` + answer.examination.questions[index].answer + `</p><p style="margin-bottom:40px">解析:&nbsp` + answer.examination.questions[index].parse + `</p>
          </div>`;
          $('#question').append($selectOptionStr);
        } else if (answer.examination.questions[index].stuAnswer == 'B') {
          var $selectOptionStr = `<label style="margin-top:20px">第` + (index + 1) + `题.&nbsp&nbsp( 判断题 )&nbsp;&nbsp;` + exam.questions[index].title + `(` + exam.questions[index].score + `分)</label >
          <div class="field" style="padding-top:5px;"><div class="ui radio checkbox"><input type="radio" name="questionAnswer`+ index + `" value="A"/><label>A.&nbsp;&nbsp;` + exam.questions[index].optionA + `</label></div></div>
          <div class="field" style="padding-top:5px;"><div class="ui radio checkbox"><input checked="checked" type="radio" name="questionAnswer`+ index + `" value="B"/><label>B.&nbsp;&nbsp;` + exam.questions[index].optionB + `</label></div></div><p >正确答案:` + answer.examination.questions[index].answer + `</p><p style="margin-bottom:40px">解析:&nbsp` + answer.examination.questions[index].parse + `</p>
          </div>`;
          $('#question').append($selectOptionStr);
        }
      } else if (exam.questions[index].type == 3) {
        var $selectOptionStr = `<label style="margin-top:20px">第` + (index + 1) + `题.&nbsp&nbsp( 填空题 )&nbsp;&nbsp;` + exam.questions[index].title + `(` + exam.questions[index].score + `分)</label >
          <div class="grouped fields"><div class="article-body markdown-body editor-preview-active-side" style="margin-top:10px;"></div>
          <div class="form-group"><input id="questionAnswer`+ index + `" class="form-control" rows="3" value="` + answer.examination.questions[index].stuAnswer + `"> 打分:&nbsp<input class="score" style=" margin-top:10px; margin-bottom:10px;">&nbsp&nbsp该题满分:` + exam.questions[index].score + `分<p>正确答案:&nbsp` + answer.examination.questions[index].answer + `</p><p style="margin-bottom:40px">解析:&nbsp;` + answer.examination.questions[index].parse + `</p>
          </div>`;
        $('#question').append($selectOptionStr);

      } else if (exam.questions[index].type == 4) {
        var $selectOptionStr = `<label style="margin-top:20px">第` + (index + 1) + `题.&nbsp&nbsp( 主观问答题 )&nbsp;&nbsp;` + exam.questions[index].title + `(` + exam.questions[index].score + `分)</label >
          <div class="form-group"><textarea id="questionAnswer`+ index + `" class="form-control" rows="3" >` + answer.examination.questions[index].stuAnswer + `</textarea> 打分:&nbsp<input class="score" style=" margin-top:10px;margin-bottom:10px;">&nbsp&nbsp该题满分:` + exam.questions[index].score + `分<p>正确答案:&nbsp` + answer.examination.questions[index].answer + `</p><p style="margin-bottom:40px">解析:&nbsp` + answer.examination.questions[index].parse + `</p>
          </div>`;
        $('#question').append($selectOptionStr); index
      } else if (exam.questions[index].type == 5) {
        var $selectOptionStr = `<label style="margin-top:20px">第` + (index + 1) + `题.&nbsp&nbsp( 编程题 )&nbsp;&nbsp;` + exam.questions[index].title + `(` + exam.questions[index].score + `分)</label >
          <div class="form-group"><textarea id="questionAnswer`+ index + `" class="form-control" rows="10">` + answer.examination.questions[index].stuAnswer + `</textarea> 打分:&nbsp<input class="score" style=" margin-top:10px;margin-bottom:10px;">&nbsp&nbsp该题满分:` + exam.questions[index].score + `分 <p >正确答案:&nbsp` + answer.examination.questions[index].answer + `</p><p style="margin-bottom:40px">解析:&nbsp` + answer.examination.questions[index].parse + `</p>
          </div>`;
        $('#question').append($selectOptionStr);
      }
 */
	  if (exam.questions[index].type == 3) {
	     var $selectOptionStr = `<label style="margin-top:20px">第` + (index + 1) + `题.&nbsp&nbsp( 填空题 )&nbsp;&nbsp;` + exam.questions[index].title + `(` + exam.questions[index].score + `分)</label >
	       <div class="grouped fields"><div class="article-body markdown-body editor-preview-active-side" style="margin-top:10px;"></div>
	       <div class="form-group"><input id="questionAnswer`+ index + `" class="form-control" rows="3" value="` + answer.examination.questions[index].stuAnswer + `"> 打分:&nbsp<input class="score" style=" margin-top:10px; margin-bottom:10px;">&nbsp&nbsp该题满分:` + exam.questions[index].score + `分<p>正确答案:&nbsp` + answer.examination.questions[index].answer + `</p><p style="margin-bottom:40px">解析:&nbsp;` + answer.examination.questions[index].parse + `</p>
	       </div>`;
	     $('#question').append($selectOptionStr);
	
	   } else if (exam.questions[index].type == 4) {
	     var $selectOptionStr = `<label style="margin-top:20px">第` + (index + 1) + `题.&nbsp&nbsp( 主观问答题 )&nbsp;&nbsp;` + exam.questions[index].title + `(` + exam.questions[index].score + `分)</label >
	       <div class="form-group"><textarea id="questionAnswer`+ index + `" class="form-control" rows="3" >` + answer.examination.questions[index].stuAnswer + `</textarea> 打分:&nbsp<input class="score" style=" margin-top:10px;margin-bottom:10px;">&nbsp&nbsp该题满分:` + exam.questions[index].score + `分<p>正确答案:&nbsp` + answer.examination.questions[index].answer + `</p><p style="margin-bottom:40px">解析:&nbsp` + answer.examination.questions[index].parse + `</p>
	       </div>`;
	     $('#question').append($selectOptionStr); index
	   } else if (exam.questions[index].type == 5) {
	     var $selectOptionStr = `<label style="margin-top:20px">第` + (index + 1) + `题.&nbsp&nbsp( 编程题 )&nbsp;&nbsp;` + exam.questions[index].title + `(` + exam.questions[index].score + `分)</label >
	       <div class="form-group"><textarea id="questionAnswer`+ index + `" class="form-control" rows="10">` + answer.examination.questions[index].stuAnswer + `</textarea> 打分:&nbsp<input class="score" style=" margin-top:10px;margin-bottom:10px;">&nbsp&nbsp该题满分:` + exam.questions[index].score + `分 <p >正确答案:&nbsp` + answer.examination.questions[index].answer + `</p><p style="margin-bottom:40px">解析:&nbsp` + answer.examination.questions[index].parse + `</p>
	       </div>`;
	     $('#question').append($selectOptionStr);
	   }


      // console.log(exam.questions[0].score)
      // console.log(val);
      // switch (val.type) {
      //   case 0: radio(val, index)

      //     break;
      //   case 1: checkbox(val, index)

      //     break;
      //   case 2: text(val, index)

      //     break;
      //   case 3: jianda(val, index)

      //     break;
      //   case 4: panduan(val, index)

      //     break;

      //   default:
      //     break;
      // }
      // let $question = `
      //   <div>
      //       <p>val.title</p>
      //   </div>
      // `
    })
    var $selectOptionStr = `<button id='getscore' style="margin-left:35%;width:200px">确定</button>`
    $('#question').append($selectOptionStr);

    var getscore = document.querySelector('#getscore');
    var allscore = 0;
    var scores = document.querySelectorAll('.score');
    getscore.addEventListener('click', function () {
      for (var i = 0; i < scores.length; i++) {
        allscore += parseInt(scores[i].value);
        console.log(allscore);
      }
        console.log(allscore);

      $.ajax({
        url : "/grade/mark",
        type : "POST",
		dataType : "json",
		contentType : "application/json;charset=UTF-8",
        data : JSON.stringify({
			id: answer.id,
			manulResult: allscore,
		}),
        success: function (data) {
          layer.msg(data.msg, function () {//成功则返回考试列表
            window.location.href = "/";
          });
        },
        error: function (data) {//失败打印失败信息
          layer.msg(data.msg)
        }
      });
    })

    // function radio(data, index) {
    //   let $question = `<div>
    //       <p>${index + 1} . ${data.title}</p>
    //         <label><input type="radio" name="${data.classId}" value="A" />A.${data.optionA}</label>
    //           <br />
    //         <label><input type="radio" name="${data.classId}" value="B" />B.${data.optionB}</label>
    //           <br />
    //         <label><input type="radio" name="${data.classId}" value="C" />C.${data.optionC}</label>
    //           <br />
    //         <label><input type="radio" name="${data.classId}" value="D" />D.${data.optionD}</label>
    //         <p>学生答案:${answer.examination.questions[index].stuAnswer}</p>
    //       </div>`;
    //   $('#currentQuestionAnswer').append($question);
    // }
    // function checkbox(data, index) {
    //   let $question = `<div>
    //       <p>${index + 1} . ${data.title}</p>
    //         <label><input type="checkbox" name="${data.classId}" value="A" />A.${data.optionA}</label>
    //           <br />
    //         <label><input type="checkbox" name="${data.classId}" value="B" />B.${data.optionB}</label>
    //           <br />
    //         <label><input type="checkbox" name="${data.classId}" value="C" />C.${data.optionC}</label>
    //           <br />
    //         <label><input type="checkbox" name="${data.classId}" value="D" />D.${data.optionD}</label>
    //         <p>学生答案:${answer.examination.questions[index].stuAnswer}</p>
    //       </div>`;
    //   $('#currentQuestionAnswer').append($question);
    // }
    // function text(data, index) {
    //   let $question = `<div>
    //       <p>${index + 1} . ${data.title}</p><input type='text' value=''/>
    //       <p>学生答案:${answer.examination.questions[index].stuAnswer}</p>
    //       </div>`;
    //   $('#currentQuestionAnswer').append($question);
    // }
    // function panduan(data, index) {
    //   let $question = `<div>
    //       <p>${index + 1} . ${data.title}</p>
    //         <label><input type="radio" name="${data.classId}" value="A" />A.${data.optionA}</label>
    //           <br />
    //         <label><input type="radio" name="${data.classId}" value="B" />B.${data.optionB}</label>
    //         <p>学生答案:${answer.examination.questions[index].stuAnswer}</p>
    //       </div>`;
    //   $('#currentQuestionAnswer').append($question);
    // }
    // function jianda(data, index) {
    //   let $question = `<div>
    //       <p>${index + 1} . ${data.title}</p>
    //         <p>学生答案:${answer.examination.questions[index].stuAnswer}</p>
    //       </div>`;
    //   $('#currentQuestionAnswer').append($question);
    // }
    // $(function () {
    //   examDetailPage.init(exam);
    //   var $title = `<li class="active" style="color: black;">${exam.title}</li>`;
    //   $('#headerMain').append($title);
    //   var $classId = `<span>${exam.classId}</span>`
    //   $('td:eq(1)').append($classId);
    //   var $name = `<span>${exam.author}</span>`
    //   $('td:eq(3)').append($name);
    //   var $score = `<span>${exam.totalScore}</span>`
    //   $('td:eq(11)').append($score);
    // });
  </script>
</body>

</html>