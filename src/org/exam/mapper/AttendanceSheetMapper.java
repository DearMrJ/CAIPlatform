package org.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.exam.entity.AttendanceSheet;
import org.exam.util.CoreConst;
import org.exam.util.MapperUtil;
import org.exam.vo.AttendanceConditionVo;

/**
 * @author Lynch
 *
 */
public interface AttendanceSheetMapper extends MapperUtil<AttendanceSheet>{
	
	/**
	 * 学生查看时可看到已签到名单
	 * @param id
	 * @return
	 */
	List<AttendanceSheet> currentCheckInRecords(AttendanceConditionVo vo);
	
	/**
	 * 学生签到
	 * @param attendanceSheet
	 * @return
	 */
	int checkIn(AttendanceSheet attendanceSheet);
	
	/**
	 * 签退学生
	 * @param attendanceSheet
	 * @return
	 */
	int checkOut(AttendanceSheet attendanceSheet);
	
	/**
	 * 学生请假
	 * @param attendanceSheet
	 * @return
	 */
	int onLeave(AttendanceSheet attendanceSheet);
	
	/**
	 * 校验是否已经签到
	 * @param attendanceSheet
	 * @return
	 */
	@Select("select * from "+CoreConst.ATTENDANCE_SHEET_TABLE+" "
			+ "where attendance_id = #{id} and user_id = #{userId} and status > 0")
	AttendanceSheet validate(@Param("id") Integer id,@Param("userId") String userId);
	

}
