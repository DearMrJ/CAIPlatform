package org.exam.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.exam.util.CoreConst;
@Table(name = CoreConst.ATTENDANCE_SHEET_TABLE)//整合通用mapper，实体类名与数据库表名不一致时候使用 @Table
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
	@Transient
	private Classes classes;
	@Transient
	private Subject subject;
	
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
	public Classes getClasses() {
		return classes;
	}
	public void setClasses(Classes classes) {
		this.classes = classes;
	}
	public Subject getSubject() {
		return subject;
	}
	public void setSubject(Subject subject) {
		this.subject = subject;
	}
	
	
	@Override
	public String toString() {
		return "AttendanceSheet [id=" + id + ", attendanceId=" + attendanceId + ", userId=" + userId + ", status="
				+ status + ", checkTime=" + checkTime + ", user=" + user + ", attendance=" + attendance + ", classes="
				+ classes + ", subject=" + subject + "]";
	}
	
}
