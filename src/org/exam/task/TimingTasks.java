package org.exam.task;

import org.exam.service.AttendanceService;
import org.exam.service.ExaminationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
/**
 * 
 * @author Lynch
 *
 */
@Service
public class TimingTasks {
	@Autowired
	private ExaminationService examService;
	@Autowired
	private AttendanceService attendanceService;
	
	/**
	 * 每五秒更新一次试卷状态
	 */
//	@Scheduled(cron="0/5 * * * * ? ")
//	public void updateExamStatus() {
//		examService.updateExamToStart();
//		examService.updateExamToEnd();
//	}
	
	/**
	 * 每五秒更新一次考勤状态
	 */
//	@Scheduled(cron="0/5 * * * * ? ")
//	public void updateAttendanceStatus() {
//		attendanceService.updateAttendanceToStart();
//		attendanceService.updateAttendanceToEnd();
//	}
	 
}
