package org.exam.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Id;

@SuppressWarnings("serial")
public class StudentEvaluation implements Serializable{
	@Id
	private Integer id;
	private String userId;		//学生id
	private Integer classId;
	private Integer subjectId;
	private Integer totalScore;	//总成绩
	private String comment;		//文本评价
	private String year;
	private Integer term;
	private Date createTime;	//评价创建时间
	private Date updateTime;	//评价时间
//	private Date checkTime;
//	private Date endTime;
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
		this.userId = userId == null ? null : userId.trim();
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
	public Integer getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(Integer totalScore) {
		this.totalScore = totalScore;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year == null ? null : year.trim();
	}
	public Integer getTerm() {
		return term;
	}
	public void setTerm(Integer term) {
		this.term = term;
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
	
	
}
