/**
 * 
 */
package org.exam.service.impl;

import java.util.Date;
import java.util.List;

import org.exam.entity.Attendance;
import org.exam.entity.User;
import org.exam.mapper.AttendanceMapper;
import org.exam.service.AttendanceService;
import org.exam.vo.AttendanceConditionVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Lynch
 *
 */
@Service
public class AttendanceServiceImpl extends BaseServiceImpl<Attendance> implements AttendanceService{
	
	@Autowired
	private AttendanceMapper attendanceMapper;

	/**
	 * 分页条件查询
	 */
	@Override
	public List<Attendance> findByCondition(AttendanceConditionVo vo) {
		List<Attendance> attendanceList = attendanceMapper.findByCondition(vo);
		//封装考勤信息
		return attendanceList;
	}


	/**
	 * 更新考勤为开始状态
	 */
	@Override
	public boolean updateAttendanceToStart() {
		return attendanceMapper.updateAttendanceToStart(new Date()) > 0;
	}

	/**
	 * 更新考勤为结束态
	 */
	@Override
	public boolean updateAttendanceToEnd() {
		return attendanceMapper.updateAttendanceToEnd(new Date()) > 0;
	}


	/**
	 * 学生查看进行中的考勤活动
	 */
	@Override
	public List<Attendance> listOngoingAttendances(AttendanceConditionVo vo) {
		return attendanceMapper.listOngoingAttendances(vo);
	}


	/**
	 * 返回考勤目标 科目/班级 人员信息(老师用于单体考勤)
	 */
	@Override
	public List<User> listTargetedStudents(AttendanceConditionVo vo) {
		return attendanceMapper.listTargetedStudents(vo);
	}

	
}