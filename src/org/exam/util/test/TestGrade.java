/**
 * 
 */
package org.exam.util.test;

import java.util.Arrays;
import java.util.List;

import org.exam.entity.Examination;
import org.exam.entity.Grade;
import org.exam.entity.Question;
import org.exam.entity.User;
import org.exam.mapper.ExaminationMapper;
import org.exam.service.ExaminationService;
import org.exam.service.GradeService;
import org.exam.service.UserService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.alibaba.fastjson.JSON;

/**
 * @author Lynch
 *
 */
public class TestGrade {
	
	
	private ExaminationService examService;
	
	public static void main(String[] args) {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		GradeService gradeService = (GradeService) applicationContext.getBean("gradeServiceImpl");
		ExaminationService examService = (ExaminationService) applicationContext.getBean("examinationServiceImpl");
		UserService userService = (UserService) applicationContext.getBean("userServiceImpl");
		Grade grade = gradeService.selectById(1);
		List<String> answerStr = Arrays.asList(grade.getAnswerJson().split("~_~"));
		Examination examination = examService.queryByExamId(grade.getExamId());//获取目标试卷+题集+答案
		long examTime = (examination.getEndTime().getTime()-examination.getStartTime().getTime())/(1000*60);
		examination.setExamTime(examTime);
		List<Question> questions = examination.getQuestions();
		for(int i = 0; i < questions.size(); i++) {
			Question question = questions.get(i);
			question.setStuAnswer(answerStr.get(i));
		}
		User user = userService.selectByUserId(grade.getUserId());
		grade.setExamination(examination);
		grade.setUser(user);
		System.out.println(JSON.toJSONString(grade));
	}
}
