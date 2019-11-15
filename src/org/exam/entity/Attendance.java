package org.exam.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.exam.util.CoreConst;
import org.springframework.format.annotation.DateTimeFormat;
@Table(name = CoreConst.ATTENDANCE_TABLE)//整合通用mapper，实体类名与数据库表名不一致时候使用 @Table
@SuppressWarnings("serial")
public class Attendance implements Serializable{
	@Id
	private Integer id;			//自增

	private Integer classId;
	private Integer subjectId;
	private String title;
	private String year;
	private Integer term;
	private String userId;		//发布者id
	private String author;		//发布人名字
	private Integer type;
	private Integer status;		//1有效，0失效(过时)
	private Date createTime;	//签到创建时间
	private Date updateTime;	//更新时间
	private Date startTime;		//开始时间
	private Date endTime;		//签到截至时间
	
	
	@Transient
	private Integer courseTotal;//课程总人数
	@Transient
	private Integer presentTotal;//出席总人数
	@Transient
	private List<User> users;
	@Transient
	private Subject subject;
	@Transient
	private List<Classes> classes;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
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
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
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
	
	
	
	
	public Integer getCourseTotal() {
		return courseTotal;
	}
	public void setCourseTotal(Integer courseTotal) {
		this.courseTotal = courseTotal;
	}
	public Integer getPresentTotal() {
		return presentTotal;
	}
	public void setPresentTotal(Integer presentTotal) {
		this.presentTotal = presentTotal;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public Subject getSubject() {
		return subject;
	}
	public void setSubject(Subject subject) {
		this.subject = subject;
	}
	public List<Classes> getClasses() {
		return classes;
	}
	public void setClasses(List<Classes> classes) {
		this.classes = classes;
	}
	@Override
	public String toString() {
		return "Attendance [id=" + id + ", classId=" + classId + ", subjectId=" + subjectId + ", userId=" + userId
				+ ", author=" + author + ", status=" + status + ", createTime=" + createTime + ", updateTime="
				+ updateTime + ", startTime=" + startTime + ", endTime=" + endTime + ", courseTotal=" + courseTotal
				+ ", presentTotal=" + presentTotal + ", users=" + users + ", subject=" + subject + ", classes="
				+ classes + "]";
	}
	
	
	
}
