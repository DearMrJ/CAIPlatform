/**
 * 
 */
package org.exam.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.exam.entity.Attendance;
import org.exam.util.CoreConst;
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
	
	/**
	 * 根据状态查询所有
	 * @return
	 */
	List<Attendance> selectAllByStatus(Integer status);

	
	@Update("update "+CoreConst.ATTENDANCE_TABLE+" set status = #{status} where id = #{id}")
	int updateStatusById(@Param("id") Integer id ,@Param("status") Integer status);
	
	
	
	
}
