
var answer = {
  "answerJson": "B~_~China~_~国际化~_~很大区别~_~AC~_~B~_~helloworld",
  "autoJson": "B~_~AC~_~B~_~",
  "autoResult": 10, "createTime": 1572774599000,
  "examId": 3,
  "examination": {
    "author": "师者", "classId": 1,
    "classes": { "id": 1 },
    "createTime": 1572762141000,
    "endTime": 1572848541000,
    "examTime": 1440,
    "grade": "2016",
    "id": 3,
    "questions": [{ "answer": "B", "content": "", "createTime": 1572774582000, "difficulty": 3, "id": 2, "optionA": "变量由字母、下划线、数字、$符号随意组成；", "optionB": "变量不能以数字作为开头；", "optionC": "A和a在java中是同一个变量；", "optionD": "不同类型的变量，可以起相同的名字；", "parse": "2解析B", "score": 5, "status": 0, "stuAnswer": "B", "subjectId": 1, "title": "变量命名规范说法正确的是（）。", "type": 0, "updateTime": 1572774582000 }, { "answer": "China", "content": "", "createTime": 1572774582000, "difficulty": 1, "id": 4, "optionA": "", "optionB": "", "optionC": "", "optionD": "", "parse": "首字母大写", "score": 5, "status": 0, "stuAnswer": "China", "subjectId": 1, "title": "中国的英文是___。", "type": 2, "updateTime": 1572774582000 }, { "answer": "", "content": "", "createTime": 1572774582000, "difficulty": 3, "id": 5, "optionA": "", "optionB": "", "optionC": "", "optionD": "", "parse": "i18n（其来源是英文单词 internationalization的首末字符i和n，18为中间的字符数）", "score": 5, "status": 0, "stuAnswer": "国际化", "subjectId": 1, "title": "i18n是指___。", "type": 2, "updateTime": 1572774582000 }, { "answer": "", "content": "", "createTime": 1572774582000, "difficulty": 3, "id": 6, "optionA": "", "optionB": "", "optionC": "", "optionD": "", "parse": "HashMap:实现了Map接口，实现了将唯一键隐射到特定值上。允许一个NULL键和多个NULL值。非线程安全。\tHashTable: 类似于HashMap，但是不允许NULL键和NULL值，比HashMap慢，因为它是同步的。HashTable是一个线程安全的类，它使用synchronized来锁住整张Hash表来实现线程安全，即每次锁住整张表让线程独占。\tConcurrentHashMap允许多个修改操作并发进行，其关键在于使用了锁分离技术。它使用了多个锁来控制对hash表的不同部分进行的修改。ConcurrentHashMap内部使用段(Segment)来表示这些不同的部分，每个段其实就是一个小的Hashtable，它们有自己的锁。只要多个修改操作发生在不同的段上，它们就可以并发进行。", "score": 5, "status": 0, "stuAnswer": "很大区别", "subjectId": 1, "title": "HashTable,HashMap,ConcurrentHashMap的区别？", "type": 3, "updateTime": 1572774582000 }, { "answer": "AC", "content": "", "createTime": 1572774582000, "difficulty": 4, "id": 7, "optionA": "String", "optionB": "char", "optionC": "用户自定义的Student类类型", "optionD": "int", "parse": "引用数据类型是对象类型/抽象类型，非基本类型", "score": 5, "status": 0, "stuAnswer": "AC", "subjectId": 1, "title": "下列（）属于引用数据类型。", "type": 1, "updateTime": 1572774582000 }, { "answer": "B", "content": "", "createTime": 1572774582000, "difficulty": 2, "id": 8, "optionA": "正确", "optionB": "错误", "optionC": "", "optionD": "", "parse": "单继承", "score": 5, "status": 0, "stuAnswer": "B", "subjectId": 1, "title": "JAVA中可以多继承。", "type": 4, "updateTime": 1572774582000 }, { "answer": "略", "content": "", "createTime": 1572774582000, "difficulty": 2, "id": 9, "optionA": "", "optionB": "", "optionC": "", "optionD": "", "parse": "略", "score": 5, "status": 0, "stuAnswer": "helloworld", "subjectId": 1, "title": "JAVA输出helloworld。", "type": 5, "updateTime": 1572774582000 }], "startTime": 1572762141000, "status": 1, "subject": { "id": 1, "name": "1号课程" }, "subjectId": 1, "title": "3标题", "totalScore": 35, "updateTime": 1572764572000, "userId": "Young"
  },
  "id": 1, "manulJson": "China~_~国际化~_~很大区别~_~helloworld~_~", "manulResult": 0, "result": 10, "status": 0, "updateTime": 1572774599000, "user": { "age": 21, "classId": 1, "classes": { "id": 1, "name": "16网络工程1班" }, "createTime": 1572268277000, "credentialsSalt": "examLynchee96b5d09e89e6896f45c3551493aece", "description": "98美少年，热爱写bug，热爱编程，热爱学习，共同学习，少走弯路。Just do it！", "email": "1776990136@qq.com", "faculty": { "name": "电子信息工程学院" }, "grade": "2016", "id": 3, "img": "https://avatar.csdnimg.cn/2/D/5/1_qq_41989047_1560760313.jpg", "lastLogonTime": 1572774533000, "nickname": "学徒", "password": "99438331fdd5293afa3d7c62a596d896", "roles": [], "salt": "ee96b5d09e89e6896f45c3551493aece", "sex": 1, "status": 1, "tel": "18244967180", "totalTime": 0, "updateTime": 1572268277000, "userId": "3", "username": "Lynch" }, "userId": "3"
}
//headerMain.setAttribute("style","background:#4F94CD");



$(function () {
  $.each(answer.examination.questions, function (index, val) {

    if (answer.examination.questions[index].type == 2) {
      var $selectOptionStr = `<div class="ui stacked segment" style="margin-bottom:50px;"><label style="margin-top:20px">第` + (index + 1) + `题.&nbsp&nbsp( 填空题 )&nbsp;&nbsp;` + answer.examination.questions[index].title + `(` + answer.examination.questions[index].score + `分)</label >
          <div class="grouped fields"><div class="article-body markdown-body editor-preview-active-side" style="margin-top:10px;"></div>
          <div class="form-group"><input id="questionAnswer`+ index + `" class="form-control" rows="3" value="` + answer.examination.questions[index].stuAnswer + `"> 打分:&nbsp<input class="score" style=" margin-top:10px; margin-bottom:10px;">&nbsp&nbsp该题满分:` + answer.examination.questions[index].score + `分<p>正确答案:&nbsp` + answer.examination.questions[index].answer + `</p><p>解析:&nbsp;` + answer.examination.questions[index].parse + `</p>
  
            </div></div>`;
      $('#question').append($selectOptionStr);

    } else if (answer.examination.questions[index].type == 3) {
      var $selectOptionStr = `<div class="ui stacked segment" style="margin-bottom:50px;"><label style="margin-top:20px">第` + (index + 1) + `题.&nbsp&nbsp( 主观问答题 )&nbsp;&nbsp;` + answer.examination.questions[index].title + `(` + answer.examination.questions[index].score + `分)</label >
          <div class="form-group"><textarea id="questionAnswer`+ index + `" class="form-control" rows="3" >` + answer.examination.questions[index].stuAnswer + `</textarea> 打分:&nbsp<input class="score" style=" margin-top:10px;margin-bottom:10px;">&nbsp&nbsp该题满分:` + answer.examination.questions[index].score + `分<p>正确答案:&nbsp` + answer.examination.questions[index].answer + `</p><p>解析:&nbsp` + answer.examination.questions[index].parse + `</p>
   
          </div> </div>`;
      $('#question').append($selectOptionStr); index

    } else if (answer.examination.questions[index].type == 5) {
      var $selectOptionStr = `<div class="ui stacked segment" style="margin-bottom:50px;"><label style="margin-top:20px">第` + (index + 1) + `题.&nbsp&nbsp( 编程题 )&nbsp;&nbsp;` + answer.examination.questions[index].title + `(` + answer.examination.questions[index].score + `分)</label >
          <div class="form-group"><textarea id="questionAnswer`+ index + `" class="form-control" rows="10">` + answer.examination.questions[index].stuAnswer + `</textarea> 打分:&nbsp<input class="score" style=" margin-top:10px;margin-bottom:10px;">&nbsp&nbsp该题满分:` + answer.examination.questions[index].score + `分 <p >正确答案:&nbsp` + answer.examination.questions[index].answer + `</p><p >解析:&nbsp` + answer.examination.questions[index].parse + `</p>

            </div>`;

      $('#question').append($selectOptionStr);
    }



  })
  var $selectOptionStr = `<button id='getscore' style="margin-left:35%;width:200px">确定</button>`
  $('#question').append($selectOptionStr);

  var getscore = document.querySelector('#getscore');
  var allscore = 0;
  var scores = document.querySelectorAll('.score');
  console.log(getscore);
  console.log(scores);
  getscore.addEventListener('click', function () {
    for (var i = 0; i < scores.length; i++) {
      allscore += parseInt(scores[i].value);
    }

    $.ajax({
      url: "/grade/mark",
      type: "POST",
      dataType: "json",
      contentType: "application/json;charset=UTF-8",
      data: JSON.stringify({
        id: 1,//xxxxxx(从后台来的grade.id),
        manulResult: allscores, //xxxx(统计所有主观题的分数和，注意是主观题)
      }),
      success: function (data) {
        layer.msg(data.msg, function () {//成功则返回考试列表
          window.location.href = "/exam/examination";
        });
      },
      error: function (data) {//失败打印失败信息
        layer.msg(data.msg)
      }
    });
  })

})