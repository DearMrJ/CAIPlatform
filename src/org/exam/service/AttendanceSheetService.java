package org.exam.service;

import java.util.List;

import org.exam.entity.AttendanceSheet;

/**
 * @author Lynch
 *
 */
public interface AttendanceSheetService extends BaseService<AttendanceSheet>{
	
	List<AttendanceSheet> currentCheckInRecords(Integer id);
	
	int checkIn(AttendanceSheet attendanceSheet);
	
	int checkOut(AttendanceSheet attendanceSheet);

	int onLeave(AttendanceSheet attendanceSheet);
	
	AttendanceSheet validate(Integer id, String userId);
}
