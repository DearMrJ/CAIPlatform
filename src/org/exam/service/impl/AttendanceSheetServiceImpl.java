package org.exam.service.impl;

import java.util.List;

import org.exam.entity.AttendanceSheet;
import org.exam.mapper.AttendanceSheetMapper;
import org.exam.service.AttendanceSheetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Lynch
 *
 */
@Service
public class AttendanceSheetServiceImpl extends BaseServiceImpl<AttendanceSheet> implements AttendanceSheetService{

	@Autowired
	private AttendanceSheetMapper attendanceSheetMapper;
	
	/**
	 * 学生签到时可看见的名单信息
	 */
	@Override
	public List<AttendanceSheet> currentCheckInRecords(Integer id) {
		return attendanceSheetMapper.currentCheckInRecords(id);
	}

	/**
	 * 学生签到
	 */
	@Override
	public int checkIn(AttendanceSheet attendanceSheet) {
		return attendanceSheetMapper.checkIn(attendanceSheet);
	}

	/**
	 * 签退学生
	 */
	@Override
	public int checkOut(AttendanceSheet attendanceSheet) {
		return attendanceSheetMapper.checkOut(attendanceSheet);
	}

	/**
	 * 请假
	 */
	@Override
	public int onLeave(AttendanceSheet attendanceSheet) {
		return attendanceSheetMapper.onLeave(attendanceSheet);
	}

	/**
	 * 是否已签到/请假
	 */
	@Override
	public AttendanceSheet validate(Integer id, String userId) {
		return attendanceSheetMapper.validate(id, userId);
	}

}
