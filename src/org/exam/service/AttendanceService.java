/**
 * 
 */
package org.exam.service;

import java.util.List;

import org.exam.entity.Attendance;
import org.exam.entity.AttendanceSheet;
import org.exam.entity.User;
import org.exam.vo.AttendanceConditionVo;

/**
 * @author Lynch
 *
 */
public interface AttendanceService extends BaseService<Attendance>{
	
	/**
	 * 分页查询考勤活动(特定teacher、科目)
	 * @return
	 */
	List<Attendance> findByCondition(AttendanceConditionVo vo);
	
	List<Attendance> listOngoingAttendances(AttendanceConditionVo vo);
	
	List<User> listTargetedStudents(AttendanceConditionVo vo);
	
	int deleteBatch(List<String> attendanceIds);
	
	boolean updateAttendanceToStart();
	
	boolean updateAttendanceToEnd();
	
	List<AttendanceSheet> queryRecordForRandom(Integer id);
	
	Attendance validateEnd(Integer id);
	
}
