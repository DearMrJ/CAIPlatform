package org.exam.util.test;

import org.exam.mapper.ExaminationMapper;
import org.exam.entity.Examination;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestExamination {
	
	
	public static void main(String[] args) {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		
		/***********************************ExaminationMapper****************************************/
		ExaminationMapper examinationMapper = (ExaminationMapper) applicationContext.getBean("examinationMapper");
		//ExaminationById
		Examination examination = examinationMapper.ExaminationById(1);
		if (examination!=null) {
			System.out.println(examination);
		}else {
			System.out.println("ohoo, it's null!");
		}
		
		
		/******************************************************************************************/
		
		
	}
}
