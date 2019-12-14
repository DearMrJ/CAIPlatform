/**
 * 
 */
package org.exam.util.test;

import java.util.ArrayList;
import java.util.List;

import org.exam.entity.AttendanceSheet;
import org.exam.entity.User;

import com.alibaba.fastjson.JSON;

/**
 * @author Lynch
 *
 */
public class TestAttendanceSheet {
	public static List<AttendanceSheet> resolve(){
		List<AttendanceSheet> ashList = new ArrayList<AttendanceSheet>();
		for(int i = 1 ; i<10 ; i++) {
			AttendanceSheet attendanceSheet = new AttendanceSheet();
			User user = new User();
			user.setUserId("10000000789415677"+i);
			user.setUsername("2016039000"+i);
			user.setNickname("黑夜硕风"+i);
			attendanceSheet.setId(i);
			attendanceSheet.setAttendanceId(5);
			attendanceSheet.setUserId("10000000789415677"+i);
			attendanceSheet.setUser(user);
			ashList.add(attendanceSheet);
		}
		return ashList;
	}
	
	public static void main(String[] args) {
//		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
//		AttendanceSheetServiceImpl ass = (AttendanceSheetServiceImpl) applicationContext.getBean("attendanceSheetServiceImpl");
//		AttendanceConditionVo vo = new AttendanceConditionVo();
//		vo.setAttendanceId(1);
//		List<AttendanceSheet> currentCheckInRecords = ass.currentCheckInRecords(vo);
//		System.out.println(currentCheckInRecords);
		
		List<AttendanceSheet> resolve = resolve();
		
		String jsonString = JSON.toJSONString(resolve);
		
		System.err.println(jsonString);
		
	}
}
