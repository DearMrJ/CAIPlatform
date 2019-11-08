/**
 * 
 */
package org.exam.mapper;

import java.util.List;

import org.exam.entity.Attendance;
import org.exam.util.MapperUtil;
import org.exam.vo.AttendanceConditionVo;

/**
 * @author Lynch
 *
 */
public interface AttendanceMapper extends MapperUtil<Attendance>{
	
	List<Attendance> findByCondition(AttendanceConditionVo vo);

}
