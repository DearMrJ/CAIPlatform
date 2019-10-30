package org.exam.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Transient;

@SuppressWarnings("serial")
public class AttendanceSheet implements Serializable{
	@Id
	private Integer id;
	
	private Integer attendanceId;
	private String userId;		
	private Integer status;		//1出席，0缺席
	private Date checkTime;		//签到时间
	
	
	@Transient
	private User user;
	@Transient
	private Attendance attendance;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getAttendanceId() {
		return attendanceId;
	}
	public void setAttendanceId(Integer attendanceId) {
		this.attendanceId = attendanceId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getCheckTime() {
		return checkTime;
	}
	public void setCheckTime(Date checkTime) {
		this.checkTime = checkTime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Attendance getAttendance() {
		return attendance;
	}
	public void setAttendance(Attendance attendance) {
		this.attendance = attendance;
	}
	
	
	
}
