package org.exam.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Transient;

@SuppressWarnings("serial")
public class Grade implements Serializable{
	@Id
	private Integer id;			//id,自增
	private String userId;		//考生学号
	private Integer examId;		//试题号
	private Integer result;		//最终分数
	private Integer autoResult;	//自动阅卷答案
	private Integer manulResult;//手工阅卷答案
	private String autoJson;	//考生选择题答案
	private String manulJson;	//考生主观题答案
	private String answerJson;	//考生作答情况（选择题+主观题）
	private Date createTime;	//交卷时间
	private Date updateTime;	//改卷完成时间
	private Integer status;		//0未评卷,1及格2不及格3良好4优秀
	private Integer minutes;	//考生考试用时
	
	
	@Transient
	private User user;
	@Transient
	private Faculty Faculty;
	@Transient
	private Classes classes;
	@Transient
	private Subject subject;
	@Transient
	private Examination examination;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Integer getExamId() {
		return examId;
	}
	public void setExamId(Integer examId) {
		this.examId = examId;
	}
	public Integer getResult() {
		return result;
	}
	public void setResult(Integer result) {
		this.result = result;
	}
	public Integer getAutoResult() {
		return autoResult;
	}
	public void setAutoResult(Integer autoResult) {
		this.autoResult = autoResult;
	}
	public Integer getManulResult() {
		return manulResult;
	}
	public void setManulResult(Integer manulResult) {
		this.manulResult = manulResult;
	}
	public String getAutoJson() {
		return autoJson;
	}
	public void setAutoJson(String autoJson) {
		this.autoJson = autoJson;
	}
	public String getManulJson() {
		return manulJson;
	}
	public void setManulJson(String manulJson) {
		this.manulJson = manulJson;
	}
	public String getAnswerJson() {
		return answerJson;
	}
	public void setAnswerJson(String answerJson) {
		this.answerJson = answerJson;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getMinutes() {
		return minutes;
	}
	public void setMinutes(Integer minutes) {
		this.minutes = minutes;
	}
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Faculty getFaculty() {
		return Faculty;
	}
	public void setFaculty(Faculty faculty) {
		Faculty = faculty;
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
	public Examination getExamination() {
		return examination;
	}
	public void setExamination(Examination examination) {
		this.examination = examination;
	}
	
//	@Override
//	public String toString() {
//		return "\nGrade [id=" + id + ", userId=" + userId + ", examId=" + examId + ", result=" + result + ", autoResult="
//				+ autoResult + ", manulResult=" + manulResult + ", autoJson=" + autoJson + ", manulJson=" + manulJson
//				+ ", answerJson=" + answerJson + ", createTime=" + createTime + ", updateTime=" + updateTime
//				+ ", status=" + status + "]";
//	}
	
}