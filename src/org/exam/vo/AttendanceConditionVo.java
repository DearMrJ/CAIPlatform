/**
 * 
 */
package org.exam.vo;

import java.util.Date;

import org.exam.vo.base.BaseConditionVo;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author Lynch
 *
 */
public class AttendanceConditionVo extends BaseConditionVo{

	private String teacherUsername;
	
	private String teacherUserId;
	
	private String teacherNickname;
	
	private String grade;
	
	private Integer status;
	
	private Integer classId;
	
	private String className;
	
	private Integer subjectId;
	
	private String year;
	
	private Integer term;
	
	private Integer type;
	
	private String studentUsername;
	
	private String studentNickname;
	
	private String studentUserId;
	//！！重要！！ 数据格式需要 与 前端传来的数据格式一致，不可多，不可少yyyy-MM-dd
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endTime;
	
	private Integer attendanceId;
	
	private Integer attendanceSheetId;

	public String getTeacherUsername() {
		return teacherUsername;
	}

	public void setTeacherUsername(String teacherUsername) {
		this.teacherUsername = teacherUsername;
	}

	public String getTeacherUserId() {
		return teacherUserId;
	}

	public void setTeacherUserId(String teacherUserId) {
		this.teacherUserId = teacherUserId;
	}

	public String getTeacherNickname() {
		return teacherNickname;
	}

	public void setTeacherNickname(String teacherNickname) {
		this.teacherNickname = teacherNickname;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public Integer getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public Integer getTerm() {
		return term;
	}

	public void setTerm(Integer term) {
		this.term = term;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getStudentUsername() {
		return studentUsername;
	}

	public void setStudentUsername(String studentUsername) {
		this.studentUsername = studentUsername;
	}

	public String getStudentNickname() {
		return studentNickname;
	}

	public void setStudentNickname(String studentNickname) {
		this.studentNickname = studentNickname;
	}

	public String getStudentUserId() {
		return studentUserId;
	}

	public void setStudentUserId(String studentUserId) {
		this.studentUserId = studentUserId;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public Integer getAttendanceId() {
		return attendanceId;
	}

	public void setAttendanceId(Integer attendanceId) {
		this.attendanceId = attendanceId;
	}

	public Integer getAttendanceSheetId() {
		return attendanceSheetId;
	}

	public void setAttendanceSheetId(Integer attendanceSheetId) {
		this.attendanceSheetId = attendanceSheetId;
	}
	
	
}
