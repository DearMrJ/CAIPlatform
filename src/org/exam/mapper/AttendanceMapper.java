/**
 * 
 */
package org.exam.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.exam.entity.Attendance;
import org.exam.util.MapperUtil;
import org.exam.vo.AttendanceConditionVo;

/**
 * @author Lynch
 *
 */
public interface AttendanceMapper extends MapperUtil<Attendance>{
	
	/**
	 * 老师查询考勤列表+出勤率等信息
	 * @param vo
	 * @return
	 */
	List<Attendance> findByCondition(AttendanceConditionVo vo);
	
	/**
	 * 学生查询待考勤列表
	 * @param username
	 * @return
	 */
	List<Attendance> listOngoingAttendances(AttendanceConditionVo vo);
	
	int updateAttendanceToStart(@Param("currentTime") Date currentTime);

	int updateAttendanceToEnd(@Param("currentTime") Date currentTime);
}
