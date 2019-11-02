<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>辅助教学平台（学生端）</title>
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


  <style>
    .top {
      border-style: solid;
      border-width: 1px;
      border-radius: 5px 5px 0px 0px;
      padding: 30px;
      font-size: 15px;
    }

    .body {
      border-style: solid;
      border-width: 0px 1px 1px;
      padding: 30px;
    }

    .foot {
      border-style: solid;
      border-width: 0px 1px 1px;
      border-radius: 0px 0px 5px 5px;
      padding: 20px;
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
            src="/icon/book.png">

        </a>
        <h2 style="font-weight: 300; margin-top: 30px;margin-left:50px;">辅助教学平台（学生端）</h2>
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
              <li><a href="#">退出</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <div>
    <ol class="breadcrumb" style="padding-left:200px ;font-size:18px ;">
      <li><a href="#">课程管理</a></li>
      <li><a href="#">计算机概论</a></li>
      <li class="active" style="color: black;">开始测试</li>
    </ol>
  </div>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="top">
          <h2>计算机概论第一章测试</h2>
          <span style="display: block;margin-bottom: 5px;">测试简介XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</span>
          <span>考试时间：2019/09/29 20:46 至 2019/10/10 20:46</span>
        </div>
        <div class="body">
          <form action="" method="POST" style="padding-left:20px; font-size: 20px;" id="test">
            <p>单选题</p>
            <!-- <div class="question">
              <p id="1">1: “长风破浪会有时, 直挂云帆济沧海。” 出自下列哪一首诗？</p>
              <label><input type="radio" name="answer1" value="A" />《行路难》</label>
              <br />
              <label><input type="radio" name="answer1" value="B" />《蜀道难》</label>
              <br />
              <label><input type="radio" name="answer1" value="C" />《长恨歌》</label>
            </div> -->

		<button type="button"
            style="width: 100px; margin-left:38%;margin-top:20px; margin-bottom:20px;" id="btn">提交</button>
          <button type="reset" style="width: 100px;">重置</button></div>
        </form>

        </div>
        <div class="foot">

      </div>
    </div>
  </div>


</body>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<script>
  /* $(document).ready(function () {
    $.ajax({
      async: true,
      url: "/exam/startexam",
      type: 'post',
      success: function (data) {
        var questions = data.questions;
        questions.forEach((i, index) => {
          var $question = `
                  <div class="question">
                    <p id="1" style="margin-top: 50px;">${index + 1}.${i.content}</p>
                    <label><input type="radio" name="${i.id}" value="A" />${i.optionA}</label>
                    <br />
                    <label><input type="radio" name="${i.id}" value="B" />${i.optionB}</label>
                    <br />
                    <label><input type="radio" name="${i.id}" value="C" />${i.optionC}</label>
                    <br />
                  </div>`;
          $('#test').append($question);
        });
      },
      error: function () {
        console.log('error');
      },
      dataType: 'json',
    })
  }) */
  
  var exam = ${data.examJson};
  
  //console.log(exam);
  // var json = {
  //   "id": 2,
  //   "title": "1标题",
  //   "userId": "Young",
  //   "author": "师者",
  //   "classId": 1,
  //   "subjectId": 1,
  //   "grade": "2016",
  //   "status": 1,
  //   "totalScore": 10,
  //   "createTime": 1572272288000,
  //   "updateTime": 1572272292000,
  //   "startTime": 1572272288000,
  //   "endTime": 1572358688000,
  //   "examTime": 0,
  //   "questions": [
  //     { "answer": "2答案", "content": "2内容", "createTime": 1572239923000, "difficulty": 3, "id": 2, "optionA": "选项A", "optionB": "选项B", "optionC": "选项C", "optionD": "选项D", "parse": "2解析", "score": 5, "status": 0, "subjectId": 1, "title": "2号题目", "type": 0, "updateTime": 1572239923000 },
  //     { "answer": "2答案", "content": "3内容", "createTime": 1572273176000, "difficulty": 4, "id": 3, "optionA": "选项A", "optionB": "选项B", "optionC": "选项C", "optionD": "选项D", "parse": "3解析", "score": 5, "status": 0, "subjectId": 1, "title": "3号题目", "type": 0, "updateTime": 1572273176000 }
  //   ],
  //   "classes": { "id": 1 },
  //   "subject": { "id": 1, "name": "1号课程" ,
  // };
  
  	function success(data) {
	    //data = JSON.parse(data);
  		var questions = data.questions;
	     questions.forEach((val, index) => {
	    	//console.log(val);
	    	if(val.type==0){//单选
		        var $question = `
		             <div class="questionAnswer">
		               <p  style="margin-top: 50px;">${"${index + 1}"}.${"${val.content}"}</p>
		               <label><input type="radio" name="${'${val.id}'}" value="A" />${"${val.optionA}"}</label>
		               <br />
		               <label><input type="radio" name="${'${val.id}'}" value="B" />${"${val.optionB}"}</label>
		               <br />
		               <label><input type="radio" name="${'${val.id}'}" value="C" />${"${val.optionC}"}</label>
		               <br />
		               <label><input type="radio" name="${'${val.id}'}" value="D" />${"${val.optionD}"}</label>
		               <br />
		             </div>`;
		             //var $question = `<div>${index}</div>`;
		         //var $question = "<div>"+val.content+"</div>"
	    	}else if(val.type==1){//多选
	    		 var $checkbox = `
		             <div class="questionAnswer">
		               <p  style="margin-top: 50px;">${"${index + 1}"}.${"${val.content}"}</p>
		               <label><input type="checkbox" name="${'${val.id}'}" value="a" />${"${val.optionA}"}</label>
		               <br />
		               <label><input type="checkbox" name="${'${val.id}'}" value="b" />${"${val.optionB}"}</label>
		               <br />
		               <label><input type="checkbox" name="${'${val.id}'}" value="c" />${"${val.optionC}"}</label>
		               <br />
		               <label><input type="checkbox" name="${'${val.id}'}" value="d" />${"${val.optionD}"}</label>
		               <br />
		             </div>`;
	    		 $('#test').append($checkbox);
	    	}else if(val.type==2){//填空
	    		 var $tiankong = `
		             <div class="questionAnswer">
		               <p  style="margin-top: 50px;">${"${index + 1}"}.${"${val.content}"}</p>
		               <input type='text' />
		             </div>`;
	    		 $('#test').append($tiankong);
	    	}else if(val.type==3){//简答
	    		 var $jianda = `
		             <div class="questionAnswer">
		               <p  style="margin-top: 50px;">${"${index + 1}"}.${"${val.content}"}</p>
		               <textarea cols="100" rows="10"></textarea>
		               <br />
		             </div>`;
	    		 $('#test').append($jianda);
	    	}else if(val.type==4){//判断题（使用A,B选项存储）
	    		 var $panduan = `
		             <div class="questionAnswer">
		               <p  style="margin-top: 50px;">${"${index + 1}"}.${"${val.content}"}</p>
		               <label><input type="radio" name="${'${val.id}'}" value="A" />${"${val.optionA}"}</label>
		               <br />
		               <label><input type="radio" name="${'${val.id}'}" value="B" />${"${val.optionB}"}</label>
		              
		             </div>`;
	    		 $('#test').append($panduan);
	    	}else if(val.type==5){//编程题
	    		 var $biancheng = `
		             <div class="questionAnswer">
		               <p  style="margin-top: 50px;">${"${index + 1}"}.${"${val.content}"}</p>
		              	
		             </div>`;
	    		 $('#test').append($biancheng);
	    	}
	       $('#test').append($question);
	    });
	}
  	success(exam);
  	$('#btn').click(function(){
  		var questions = exam.questions;
    	var $questionAnswer = $('.questionAnswer input[type="text"],:checked,textarea');//所有单选
    	var answerJson= getConcatAnswer($questionAnswer);
    	console.log(answerJson);
    })
    function getConcatAnswer(val){
    	var str = '';
    	if(val.length>0){
    		for(var i=0;i<val.length;i++){
    			if(val[i].value===val[i].value.toUpperCase()){
    				str += val[i].value;
        			if(i < val.length-1){
            			str += '~_~';
        			} 
    			}else{
    				str += val[i].value;
    				//console.log(i);
    			}
    			
        	};
    		
    	}else{
    	}
    	return str;
    };
    function IsUpper(code) {
        return code === code.toUpperCase()
    };
  	/* $('#btn').click(function(){
    	var $radio = $('.radio-question :checked');//所有单选
    	var $checkbox = $('.checkbox-question :checked');
    	var $panduan = $('.panduan-question :checked');//所有单选
    	var $jianda = $('.jianda-question textarea');//所有单选
    	var $tiankong = $('.tiankong-question input');//所有单选
    	var radiostr= radio($radio);
    	var checkboxstr = checkbox($checkbox);
    	var panduanstr = panduan($panduan);
    	var tiankongstr = tiankong($tiankong);
    	var jiandastr = jianda($jianda);
    	var answer = radiostr+checkboxstr+panduanstr+tiankongstr+jiandastr ;
    	console.log(answer);
    })
    function radio(val){
    	var str = '';
    	if(val.length>0){
    		for(var i=0;i<val.length;i++){
        		str = str+val[i].value+'~_~';
        	}       	
    	}else{
    		//str = '没有单选~_~';
    	}
    	return str;
    };
    function checkbox(val){
    	var str = '';
    	if(val.length>0){
    		for(var i=0;i<val.length;i++){
        		str = str+val[i].value;
        		//console.log(val[i].value);
        	} 
    		str = str+'~_~'
    	}else{
    		//str = '没有多选~_~';
    	}
 
    	return str;
    };
    function jianda(val){
    	var str = '';
    	if(val.length>0){
    		for(var i=0;i<val.length;i++){
    			str = str+val[i].value+'~_~';
        	}   	
    	}else{
    		//str = '没有简答~_~';
    	}
    	return str;
    };
    function panduan(val){
    	var str = '';
    	if(val.length>0){
    		for(var i=0;i<val.length;i++){
        		str = str+val[i].value+'~_~';
        	} 	
    	}else{
    		//str = '没有判断~_~';
    	}
    	
    	return str;
    };
    function tiankong(val){
    	var str = '';
    	if(val.length>0){
    		for(var i=0;i<val.length;i++){
        		str = str+val[i].value+'~_~';
        	} 	
    	}else{
    		//str = '没有填空';
    	}
    	
    	return str;
    }; */
    
    
  // var $question = `
  //           <div class="question">
  //             <p id="1" style="margin-top: 50px;">${n}.${i.content}</p>
  //             <label><input type="radio" name="${i.id}" value="A" />${i.optionA}</label>
  //             <br />
  //             <label><input type="radio" name="${i.id}" value="B" />${i.optionB}</label>
  //             <br />
  //             <label><input type="radio" name="${i.id}" value="C" />${i.optionC}</label>
  //             <br />
  //           </div>`;
  //     $('#test').append($question);
  //     n++;
  // var exam = ${ exam.examJson };
  
  // var btn = document.querySelector('#btn');
  // var question = document.querySelectorAll('.question');
  // console.log(question);
  // var answerJson = '';
  // btn.addEventListener('click', function () {
  //   for (var i = 0; i < question.length; i++) {
  //     var answer = document.getElementsByName("answer" + (i + 1));
  //     for (var j = 0; j < answer.length; j++) {
  //       if (answer[j].checked) {
  //         answerJson = answerJson + '~_~' + answer[j].value;
  //       }
  //     }


  //   }
  //   answerJson = answerJson.substr(3);
  //   console.log(answerJson);
  // })

</script>

</html>