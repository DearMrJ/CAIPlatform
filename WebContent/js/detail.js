/**
 * JavaScript模块
 */

var examDetailPage = {
	data:{
		exam: [],
		currentQuestionIndex: 0,
	},
	init: function (exam){
		examDetailPage.data.exam = exam;
		console.log(exam);
		//考试倒计时
		$("#examTimeCountdown").countdown(new Date(examDetailPage.data.exam.endTime), function(event){
			//事件格式
			var format = event.strftime("%H:%M:%S");
			$("#examTimeCountdown").html(format);
		}).on('finish.countdown', function(){
			//交卷事件触发
			layer.msg("考试时间结束，请停止答题，系统将自动提交试卷！",{
				title: "系统提示",
				icon: 7
			},function(){
				examDetailPage.finishExamAction();
			});
		});
		
		
		if (examDetailPage.data.exam.questions[0].type == 0) {
            $('#currentQuetionTitle').html('( 单项选择题 )&nbsp;&nbsp;'+examDetailPage.data.exam.questions[0].title+'('+examDetailPage.data.exam.questions[0].score+'分)');
            var selectOptionStr = '<div class="article-body markdown-body editor-preview-active-side" style="margin-top:10px;">'+examDetailPage.data.exam.questions[0].content+'</div>\n' +
            	'    <div class="field" style="padding-top:5px;">\n' +
                '      <div class="ui radio checkbox">\n' +
	            '          <input type="radio" name="questionAnswer" value="A"/>\n' +
	            '          <label>A.&nbsp;&nbsp;'+examDetailPage.data.exam.questions[0].optionA+'</label>\n' +
                '      </div>\n' +
                '    </div>\n' +
                '    <div class="field">\n' +
                '      <div class="ui radio checkbox">\n' +
                '          <input type="radio" name="questionAnswer" value="B"/>\n' +
                '          <label>B.&nbsp;&nbsp;'+examDetailPage.data.exam.questions[0].optionB+'</label>\n' +
                '      </div>\n' +
                '    </div>\n' +
                '    <div class="field">\n' +
                '      <div class="ui radio checkbox">\n' +
                '          <input type="radio" name="questionAnswer" value="C"/>\n' +
                '          <label>C.&nbsp;&nbsp;'+examDetailPage.data.exam.questions[0].optionC+'</label>\n' +
                '      </div>\n' +
                '    </div>\n' +
                '    <div class="field">\n' +
                '      <div class="ui radio checkbox">\n' +
                '          <input type="radio" name="questionAnswer" value="D"/>\n' +
                '          <label>D.&nbsp;&nbsp;'+examDetailPage.data.exam.questions[0].optionD+'</label>\n' +
                '      </div>\n' +
                '    </div>';
            $('#currentQuestionAnswer').html(selectOptionStr);
        } else if (examDetailPage.data.exam.questions[0].type == 1) {
            $('#currentQuetionTitle').html('( 多项选择题 )&nbsp;&nbsp;'+examDetailPage.data.exam.questions[0].title+'('+examDetailPage.data.exam.questions[0].score+'分)');
            var selectOptionStr = '<div class="article-body markdown-body editor-preview-active-side" style="margin-top:10px;">'+examDetailPage.data.exam.questions[0].content+'</div>\n' +
            	'    <div class="field">\n' +
                '      <div class="ui checkbox checkbox">\n' +
                '          <input type="checkbox" name="questionAnswer" value="A"/>\n' +
                '          <label>A.&nbsp;&nbsp;'+examDetailPage.data.exam.questions[0].optionA+'</label>\n' +
                '      </div>\n' +
                '    </div>\n' +
                '    <div class="field">\n' +
                '      <div class="ui checkbox checkbox">\n' +
                '          <input type="checkbox" name="questionAnswer" value="B"/>\n' +
                '          <label>B.&nbsp;&nbsp;'+examDetailPage.data.exam.questions[0].optionB+'</label>\n' +
                '      </div>\n' +
                '    </div>\n' +
                '    <div class="field">\n' +
                '      <div class="ui checkbox checkbox">\n' +
                '          <input type="checkbox" name="questionAnswer" value="C"/>\n' +
                '          <label>C.&nbsp;&nbsp;'+examDetailPage.data.exam.questions[0].optionC+'</label>\n' +
                '      </div>\n' +
                '    </div>\n' +
                '    <div class="field">\n' +
                '      <div class="ui checkbox checkbox">\n' +
                '          <input type="checkbox" name="questionAnswer" value="D"/>\n' +
                '          <label>D.&nbsp;&nbsp;'+examDetailPage.data.exam.questions[0].optionD+'</label>\n' +
                '      </div>\n' +
                '    </div>';
            $('#currentQuestionAnswer').html(selectOptionStr);
        } else if(examDetailPage.data.exam.questions[0].type == 2){
        	$('#currentQuetionTitle').html('( 填空题 )&nbsp;&nbsp;'+examDetailPage.data.exam.questions[0].title+'('+examDetailPage.data.exam.questions[0].score+'分)');
            var selectOptionStr = '<div class="article-body markdown-body editor-preview-active-side" style="margin-top:10px;">'+examDetailPage.data.exam.questions[0].content+'</div>\n' +
            	'   <div class="form-group">\n' +
                '         <input id="questionAnswer" class="form-control" rows="3"/>\n' +
                '    </div>';
            $('#currentQuestionAnswer').html(selectOptionStr);
        } else if(examDetailPage.data.exam.questions[0].type == 3){
            $('#currentQuetionTitle').html('( 主观问答题 )&nbsp;&nbsp;'+examDetailPage.data.exam.questions[0].title+'('+examDetailPage.data.exam.questions[0].score+'分)');
            var selectOptionStr = '<div class="article-body markdown-body editor-preview-active-side" style="margin-top:10px;">'+examDetailPage.data.exam.questions[0].content+'</div>\n' +
            	'   <div class="form-group">\n' +
                '         <textarea id="questionAnswer" class="form-control" rows="3"></textarea>\n' +
                '    </div>';
            $('#currentQuestionAnswer').html(selectOptionStr);
        }else if (examDetailPage.data.exam.questions[0].type == 4) {
            $('#currentQuetionTitle').html('( 判断题 )&nbsp;&nbsp;'+examDetailPage.data.exam.questions[0].title+'('+examDetailPage.data.exam.questions[0].score+'分)');
            var selectOptionStr = '<div class="article-body markdown-body editor-preview-active-side" style="margin-top:10px;">'+examDetailPage.data.exam.questions[0].content+'</div>\n' +
            	'    <div class="field" style="padding-top:5px;">\n' +
                '      <div class="ui radio checkbox">\n' +
	            '          <input type="radio" name="questionAnswer" value="A"/>\n' +
	            '          <label>A.&nbsp;&nbsp;'+examDetailPage.data.exam.questions[0].optionA+'</label>\n' +
                '      </div>\n' +
                '    </div>\n' +
                '    <div class="field">\n' +
                '      <div class="ui radio checkbox">\n' +
                '          <input type="radio" name="questionAnswer" value="B"/>\n' +
                '          <label>B.&nbsp;&nbsp;'+examDetailPage.data.exam.questions[0].optionB+'</label>\n' +
                '      </div>\n' +
                '    </div>';
            $('#currentQuestionAnswer').html(selectOptionStr);
        } else {
			$('#currentQuetionTitle').html('( 编程题 )&nbsp;&nbsp;'+examDetailPage.data.exam.questions[0].title+'('+examDetailPage.data.exam.questions[0].score+'分)');
			var selectOptionStr = '<div class="article-body markdown-body editor-preview-active-side" style="margin-top:10px;">'+examDetailPage.data.exam.questions[0].content+'</div>\n' +
			'   <div class="form-group">\n' +
			'         <textarea id="questionAnswer" class="form-control" rows="10"></textarea>\n' +
			'    </div>';
			$('#currentQuestionAnswer').html(selectOptionStr);
		}
		$('.ui.checkbox').checkbox();   //使得单选框可以被选中
		var currentQuestionButtonStr = '';
        for (var i = 0; i < examDetailPage.data.exam.questions.length; i++) {
            var buttonStr = '';
            if (examDetailPage.data.currentQuestionIndex == i) buttonStr = '<button class="mini ui positive button" style="margin-top: 10px;margin-left: 5px;">'+(i+1)+'</button>';
            else buttonStr = '<button class="mini ui button" onclick="examDetailPage.targetQuestionAction('+i+')" style="margin-top: 10px;margin-left: 5px;">'+(i+1)+'</button>';
            currentQuestionButtonStr += buttonStr;
        }
        $('#currentQuestionButton').html(currentQuestionButtonStr);
	},
	
	preQuestionBtn: function(){
		examDetailPage.data.currentQuestionIndex --;
		if(examDetailPage.data.currentQuestionIndex >= 0){
			examDetailPage.targetQuestionAction(examDetailPage.data.currentQuestionIndex);
		}else{
			examDetailPage.data.currentQuestionIndex = 0;
		}
	},
	
	nextQuestionBtn: function(){
		examDetailPage.data.currentQuestionIndex ++;
		if(examDetailPage.data.currentQuestionIndex <= examDetailPage.data.exam.questions.length-1){
			examDetailPage.targetQuestionAction(examDetailPage.data.currentQuestionIndex);
		}else{
			examDetailPage.data.currentQuestionIndex = examDetailPage.data.exam.questions.length-1
		}
	},
	
	targetQuestionAction: function(index){
		var preIndex = examDetailPage.data.currentQuestionIndex;
		examDetailPage.data.currentQuestionIndex = index;

        //记录答案
        if (examDetailPage.data.exam.questions[preIndex].type == 0) {
        	examDetailPage.data.exam.questions[preIndex].stuAnswer = '';
            $.each($("input[name='questionAnswer']:checked"),function(){
            	examDetailPage.data.exam.questions[preIndex].stuAnswer += $(this).val();
            });
        } else if (examDetailPage.data.exam.questions[preIndex].type == 1) {
        	examDetailPage.data.exam.questions[preIndex].stuAnswer = '';
            $.each($("input[name='questionAnswer']:checked"),function(){
            	examDetailPage.data.exam.questions[preIndex].stuAnswer += $(this).val();
            });
        } else if (examDetailPage.data.exam.questions[preIndex].type == 4) {
        	examDetailPage.data.exam.questions[preIndex].stuAnswer = '';
            $.each($("input[name='questionAnswer']:checked"),function(){
            	examDetailPage.data.exam.questions[preIndex].stuAnswer += $(this).val();
            });
        }else {
        	examDetailPage.data.exam.questions[preIndex].stuAnswer = $("#questionAnswer").val();
        }
        
        if (examDetailPage.data.exam.questions[index].type == 0) {
            $('#currentQuetionTitle').html('( 单项选择题 )&nbsp;&nbsp;'+examDetailPage.data.exam.questions[index].title+'('+examDetailPage.data.exam.questions[index].score+'分)');
            var selectOptionStr = '<div class="article-body markdown-body editor-preview-active-side" style="margin-top:10px;">'+examDetailPage.data.exam.questions[index].content+'</div>\n' +
            	'    <div class="field" style="padding-top:5px;">\n' +
                '      <div class="ui radio checkbox">\n' +
	            '          <input type="radio" name="questionAnswer" value="A"/>\n' +
	            '          <label>A.&nbsp;&nbsp;'+examDetailPage.data.exam.questions[index].optionA+'</label>\n' +
                '      </div>\n' +
                '    </div>\n' +
                '    <div class="field">\n' +
                '      <div class="ui radio checkbox">\n' +
                '          <input type="radio" name="questionAnswer" value="B"/>\n' +
                '          <label>B.&nbsp;&nbsp;'+examDetailPage.data.exam.questions[index].optionB+'</label>\n' +
                '      </div>\n' +
                '    </div>\n' +
                '    <div class="field">\n' +
                '      <div class="ui radio checkbox">\n' +
                '          <input type="radio" name="questionAnswer" value="C"/>\n' +
                '          <label>C.&nbsp;&nbsp;'+examDetailPage.data.exam.questions[index].optionC+'</label>\n' +
                '      </div>\n' +
                '    </div>\n' +
                '    <div class="field">\n' +
                '      <div class="ui radio checkbox">\n' +
                '          <input type="radio" name="questionAnswer" value="D"/>\n' +
                '          <label>D.&nbsp;&nbsp;'+examDetailPage.data.exam.questions[index].optionD+'</label>\n' +
                '      </div>\n' +
                '    </div>';
            $('#currentQuestionAnswer').html(selectOptionStr);
            
            //显示之前作答区的答案
            if (examDetailPage.data.exam.questions[index].stuAnswer != null && examDetailPage.data.exam.questions[index].stuAnswer != '') {
                $.each($("input[name='questionAnswer']"),function(){
                    if (examDetailPage.data.exam.questions[index].stuAnswer.indexOf($(this).val()) != -1) {
                        $(this).attr("checked", "checked");
                    }
                });
            }
        } else if (examDetailPage.data.exam.questions[index].type == 1) {
            $('#currentQuetionTitle').html('( 多项选择题 )&nbsp;&nbsp;'+examDetailPage.data.exam.questions[index].title+'('+examDetailPage.data.exam.questions[index].score+'分)');
            var selectOptionStr = '<div class="article-body markdown-body editor-preview-active-side" style="margin:10px">'+examDetailPage.data.exam.questions[index].content+'</div>\n' +
            	'    <div class="field">\n' +
                '      <div class="ui checkbox checkbox">\n' +
                '          <input type="checkbox" name="questionAnswer" value="A"/>\n' +
                '          <label>A.&nbsp;&nbsp;'+examDetailPage.data.exam.questions[index].optionA+'</label>\n' +
                '      </div>\n' +
                '    </div>\n' +
                '    <div class="field">\n' +
                '      <div class="ui checkbox checkbox">\n' +
                '          <input type="checkbox" name="questionAnswer" value="B"/>\n' +
                '          <label>B.&nbsp;&nbsp;'+examDetailPage.data.exam.questions[index].optionB+'</label>\n' +
                '      </div>\n' +
                '    </div>\n' +
                '    <div class="field">\n' +
                '      <div class="ui checkbox checkbox">\n' +
                '          <input type="checkbox" name="questionAnswer" value="C"/>\n' +
                '          <label>C.&nbsp;&nbsp;'+examDetailPage.data.exam.questions[index].optionC+'</label>\n' +
                '      </div>\n' +
                '    </div>\n' +
                '    <div class="field">\n' +
                '      <div class="ui checkbox checkbox">\n' +
                '          <input type="checkbox" name="questionAnswer" value="D"/>\n' +
                '          <label>D.&nbsp;&nbsp;'+examDetailPage.data.exam.questions[index].optionD+'</label>\n' +
                '      </div>\n' +
                '    </div>';
            $('#currentQuestionAnswer').html(selectOptionStr);
            
            //显示之前作答区的答案
            if (examDetailPage.data.exam.questions[index].stuAnswer != null && examDetailPage.data.exam.questions[index].stuAnswer != '') {
                $.each($("input[name='questionAnswer']"),function(){
                    if (examDetailPage.data.exam.questions[index].stuAnswer.indexOf($(this).val()) != -1) {
                        $(this).attr("checked", "checked");
                    }
                });
            }
        } else if(examDetailPage.data.exam.questions[index].type == 4) {
            $('#currentQuetionTitle').html('( 判断题 )&nbsp;&nbsp;'+examDetailPage.data.exam.questions[index].title+'('+examDetailPage.data.exam.questions[index].score+'分)');
            var selectOptionStr = '<div class="article-body markdown-body editor-preview-active-side" style="margin-top:10px;">'+examDetailPage.data.exam.questions[index].content+'</div>\n' +
            	'    <div class="field" style="padding-top:5px;">\n' +
                '      <div class="ui radio checkbox">\n' +
	            '          <input type="radio" name="questionAnswer" value="A"/>\n' +
	            '          <label>A.&nbsp;&nbsp;'+examDetailPage.data.exam.questions[index].optionA+'</label>\n' +
                '      </div>\n' +
                '    </div>\n' +
                '    <div class="field">\n' +
                '      <div class="ui radio checkbox">\n' +
                '          <input type="radio" name="questionAnswer" value="B"/>\n' +
                '          <label>B.&nbsp;&nbsp;'+examDetailPage.data.exam.questions[index].optionB+'</label>\n' +
                '      </div>\n' +
                '    </div>';
            $('#currentQuestionAnswer').html(selectOptionStr);
            
            //显示之前作答区的答案
            if (examDetailPage.data.exam.questions[index].stuAnswer != null && examDetailPage.data.exam.questions[index].stuAnswer != '') {
                $.each($("input[name='questionAnswer']"),function(){
                    if (examDetailPage.data.exam.questions[index].stuAnswer.indexOf($(this).val()) != -1) {
                        $(this).attr("checked", "checked");
                    }
                });
            }
        } else if(examDetailPage.data.exam.questions[index].type == 2){
        	$('#currentQuetionTitle').html('( 填空题 )&nbsp;&nbsp;'+examDetailPage.data.exam.questions[index].title+'('+examDetailPage.data.exam.questions[index].score+'分)');
        	var selectOptionStr = '<div class="article-body markdown-body editor-preview-active-side" style="margin-top:10px;">'+examDetailPage.data.exam.questions[index].content+'</div>\n' +
        	'	 <div class="form-group" style="margin-top:10px">\n' +
        	'    	<input id="questionAnswer" class="form-control" rows="3"></input>\n' +
        	'    </div>';
        	$('#currentQuestionAnswer').html(selectOptionStr);
        } else if(examDetailPage.data.exam.questions[index].type == 3){
            $('#currentQuetionTitle').html('( 主观问答题 )&nbsp;&nbsp;'+examDetailPage.data.exam.questions[index].title+'('+examDetailPage.data.exam.questions[index].score+'分)');
            var selectOptionStr = '<div class="article-body markdown-body editor-preview-active-side" style="margin-top:10px;">'+examDetailPage.data.exam.questions[index].content+'</div>\n' +
            	'	 <div class="form-group" style="margin-top:10px">\n' +
                '    	<textarea id="questionAnswer" class="form-control" rows="10"></textarea>\n' +
                '    </div>';
            $('#currentQuestionAnswer').html(selectOptionStr);
        } else {
			$('#currentQuetionTitle').html('( 编程题 )&nbsp;&nbsp;'+examDetailPage.data.exam.questions[index].title+'('+examDetailPage.data.exam.questions[index].score+'分)');
			var selectOptionStr = '<div class="article-body markdown-body editor-preview-active-side" style="margin-top:10px;">'+examDetailPage.data.exam.questions[index].content+'</div>\n' +
			'	 <div class="form-group" style="margin-top:10px">\n' +
			'    	<textarea id="questionAnswer" class="form-control" rows="20"></textarea>\n' +
			'    </div>';
			$('#currentQuestionAnswer').html(selectOptionStr);
		}
        
		$('.ui.checkbox').checkbox();   //使得单选框可以被选中
		
		//显示之前作答区的答案
        if (examDetailPage.data.exam.questions[index].stuAnswer != null && examDetailPage.data.exam.questions[index].stuAnswer != '') {
            $('#questionAnswer').val(examDetailPage.data.exam.questions[index].stuAnswer);
        }
		
        var currentQuestionButtonStr = '';
        for (var i = 0; i < examDetailPage.data.exam.questions.length; i++) {
            var buttonStr = '';
            if (examDetailPage.data.currentQuestionIndex == i) {
                buttonStr = '<button class="mini ui positive button" style="margin-top: 10px;margin-left: 5px;">'+(i+1)+'</button>';
            } else if (examDetailPage.data.exam.questions[i].stuAnswer != null && examDetailPage.data.exam.questions[i].stuAnswer != '') {
                buttonStr = '<button class="mini ui green basic button" onclick="examDetailPage.targetQuestionAction('+i+')" style="margin-top: 10px;margin-left: 5px;">'+(i+1)+'</button>';
            } else {
                buttonStr = '<button class="mini ui button" onclick="examDetailPage.targetQuestionAction('+i+')" style="margin-top: 10px;margin-left: 5px;">'+(i+1)+'</button>';
            }
            currentQuestionButtonStr += buttonStr;
        }
        $('#currentQuestionButton').html(currentQuestionButtonStr);
	},
	
	//交卷事件触发
	finishExamAction: function(){
		var index = examDetailPage.data.currentQuestionIndex;
		//记录答案
        if(examDetailPage.data.exam.questions[index].type ==0){
        	examDetailPage.data.exam.questions[index].stuAnswer = '';
        	$.each($("input[name='questionAnswer']:checked"), function(){
        		examDetailPage.data.exam.questions[index].stuAnswer += $(this).val();
        	});
        }else if(examDetailPage.data.exam.questions[index].type == 1){
        	examDetailPage.data.exam.questions[index].stuAnswer = '';
        	$.each($("input[name='questionAnswer']:checked"), function(){
        		examDetailPage.data.exam.questions[index].stuAnswer += $(this).val;
        	});
        }else if(examDetailPage.data.exam.questions[index].type == 4){
        	examDetailPage.data.exam.questions[index].stuAnswer = '';
        	$.each($("input[name='questionAnswer']:checked"), function(){
        		examDetailPage.data.exam.questions[index].stuAnswer += $(this).val;
        	});
        }
        else{//2,3,5
        	examDetailPage.data.exam.questions[index].stuAnswer = $("#questionAnswer").val();
        }
        //交卷
        var answerJsonStr = '';
		for(var i = 0; i < examDetailPage.data.exam.questions.length; i++){
			console.log(examDetailPage.data.exam.questions[i].stuAnswer);
			answerJsonStr += examDetailPage.data.exam.questions[i].stuAnswer;
			if(i < examDetailPage.data.exam.questions.length-1){
				answerJsonStr += '~_~';
			}
		}
		layer.msg('提交试卷中', {
			icon: 16,
			shade: 0.01,
		},
		function(){
			//向后端发送答题卡
			$.ajax({
				url : "/exam/submitExam",
				type : "POST",
				dataType : "json",
				contentType : "application/json;charset=UTF-8",
				data : JSON.stringify({
					examId: examDetailPage.data.exam.id,
					answerJson: answerJsonStr,
				}),
				success:function(data){
					layer.msg(data.msg,function(){
						window.location.href = "/exam/examination";
					});
				},
				error:function(data){
					layer.msg(data.msg)
				}
			});
		});
	},
	
	/*提交试卷*/
	submitExamAction: function(){
		Core.confirm("确认交卷？",function () {
			var answerJsonStr = '';
			for(var i = 0; i < examDetailPage.data.exam.questions.length; i++){
				console.log(examDetailPage.data.exam.questions[i].stuAnswer);
				answerJsonStr += examDetailPage.data.exam.questions[i].stuAnswer;
				if(i < examDetailPage.data.exam.questions.length-1){
					answerJsonStr += '~_~';
				}
			}
			layer.msg('提交试卷中', {
				icon: 16,
				shade: 0.01,
			},
			function(){
				//向后端发送答题卡
				$.ajax({
					url : "/exam/submitExam",
					type : "POST",
					dataType : "json",
					contentType : "application/json;charset=UTF-8",
					data : JSON.stringify({
						examId: examDetailPage.data.exam.id,
						answerJson: answerJsonStr,
					}),
					success:function(data){
						layer.msg(data.msg,function(){
							window.location.href = "/exam/examination";
						});
					},
					error:function(data){
						layer.msg(data.msg)
					}
				});
			});
		});
	},
};
