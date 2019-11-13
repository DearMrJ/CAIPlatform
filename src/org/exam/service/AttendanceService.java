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
	 * 分页查询考勤活动(特定老师、科目)
	 * @return
	 */
	List<Attendance> findByCondition(AttendanceConditionVo vo);
	
	List<Attendance> listOngoingAttendances(AttendanceConditionVo vo);
	
	List<User> listTargetedStudents(AttendanceConditionVo vo);
	
	boolean updateAttendanceToStart();
	
	boolean updateAttendanceToEnd();
	
}
