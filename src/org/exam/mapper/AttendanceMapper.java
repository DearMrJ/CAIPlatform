package org.exam.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.exam.entity.Attendance;
import org.exam.entity.AttendanceSheet;
import org.exam.entity.User;
import org.exam.util.CoreConst;
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
	
	List<User> listTargetedStudents(AttendanceConditionVo vo);
	
	int updateAttendanceToStart(@Param("currentTime") Date currentTime);

	int updateAttendanceToEnd(@Param("currentTime") Date currentTime);
	
	@Select("select ash.* from "+CoreConst.ATTENDANCE_TABLE+" a "
			+ "left join "+CoreConst.ATTENDANCE_SHEET_TABLE+" ash on a.id = ash.attendance_id "
			+ "where a.id = #{id}"
			+ "		and ash.user_id = #{userId}")
	AttendanceSheet validateAttendance(@Param("id") Integer id,@Param("userId") String userId);
	
	int deleteBatch(Map<String, Object> params);
	
	List<AttendanceSheet> queryRecordForRandom(Integer id);
	
	Attendance validateEnd(Integer id);
}
