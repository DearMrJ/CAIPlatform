package org.exam.service;

import java.util.List;

import org.exam.entity.AttendanceSheet;
import org.exam.vo.AttendanceConditionVo;

/**
 * @author Lynch
 *
 */
public interface AttendanceSheetService extends BaseService<AttendanceSheet>{
	
	List<AttendanceSheet> currentCheckInRecords(AttendanceConditionVo vo);
	
	int checkIn(AttendanceSheet attendanceSheet);
	
	int checkInByTeacher(Integer id);
	
	int checkOut(AttendanceSheet attendanceSheet);

	int onLeave(AttendanceSheet attendanceSheet);
	
	AttendanceSheet validate(Integer id, String userId);
}
