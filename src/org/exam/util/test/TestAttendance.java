/**
 * 
 */
package org.exam.util.test;

import java.util.List;

import org.exam.controller.AttendanceController;
import org.exam.entity.Attendance;
import org.exam.service.impl.AttendanceServiceImpl;
import org.exam.vo.AttendanceConditionVo;
import org.exam.vo.base.PageResultVo;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author Lynch
 *
 */
public class TestAttendance {
	public static void main(String[] args) {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		
		/**********************************AttendanceServiceImpl**************************************/
//		AttendanceServiceImpl ac = (AttendanceServiceImpl) applicationContext.getBean("attendanceServiceImpl");
							/*****************findByCondition*****************/
//		AttendanceConditionVo vo = new AttendanceConditionVo();
//		vo.setTeacherUsername("Young");
//		List<Attendance> attendanceList = ac.findByCondition(vo);
//		System.out.println(attendanceList);
//		System.out.println("=================================================");
		
						/*****************listOngoingAttendances*****************/
//		AttendanceConditionVo vo1 = new AttendanceConditionVo();
//		vo1.setStudentUsername("Lynch");
//		List<Attendance> listOngoingAttendances = ac.listOngoingAttendances(vo1);
//		System.out.println(listOngoingAttendances);
		
		/**********************************attendanceController**************************************/
							/*****************loadAttendance*****************/
		AttendanceController ac = (AttendanceController) applicationContext.getBean("attendanceController");
		AttendanceConditionVo vo = new AttendanceConditionVo();
		vo.setTeacherUsername("Young");
		PageResultVo attendanceTable = ac.loadAttendance(vo, 5, 5);
		System.out.println(attendanceTable.getRows());
		
	}
}
