/**
 * 
 */
package org.exam.util.test;

import java.util.List;

import org.exam.entity.AttendanceSheet;
import org.exam.service.impl.AttendanceSheetServiceImpl;
import org.exam.vo.AttendanceConditionVo;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author Lynch
 *
 */
public class TestAttendanceSheet {
	public static void main(String[] args) {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		AttendanceSheetServiceImpl ass = (AttendanceSheetServiceImpl) applicationContext.getBean("attendanceSheetServiceImpl");
		AttendanceConditionVo vo = new AttendanceConditionVo();
		vo.setAttendanceId(1);
		List<AttendanceSheet> currentCheckInRecords = ass.currentCheckInRecords(vo);
		System.out.println(currentCheckInRecords);
		
	}
}
