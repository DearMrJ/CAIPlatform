package org.exam.util.test;

import org.exam.controller.QuestionController;
import org.exam.entity.Examination;
import org.exam.mapper.QuestionMapper;
import org.exam.vo.QuestionConditionVo;
import org.exam.vo.base.PageResultVo;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.alibaba.fastjson.JSON;

/**
 * @author Lynch
 *
 */
public class TestQuestion {
	
	private QuestionMapper questionMapper;

	public static void main(String[] args) {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		
		/***********************************ExaminationMapper****************************************/
		QuestionController qc = (QuestionController) applicationContext.getBean("questionController");
		//ExaminationById
		QuestionConditionVo qcv = new QuestionConditionVo();
		PageResultVo loadQuestion = qc.loadQuestion(qcv,10,0);
		System.out.println(JSON.toJSON(loadQuestion.getRows()));
		
		
		/******************************************************************************************/
		
		
	}
}
