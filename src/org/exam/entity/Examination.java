package org.exam.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.exam.util.CoreConst;

@Table(name=CoreConst.EXAMINATION_TABLE)
@SuppressWarnings("serial")
public class Examination implements Serializable{
	@Id
    private Integer id;
    
	private String title;		//考试标题
	private String userId;		//用户id，出题者id
    private String author;		//出卷人
    private String grade;		//成绩
    private Integer status;		//考卷状态
	private Integer totalScore;	//总成绩（选择题自动阅卷成绩+手工阅卷成绩）
	private Integer classId;	//班级id
	private Integer subjectId;	//科目id
	private Date startTime;		//答题开始时间
	private Date endTime;		//答题结束时间
	private Date createTime;	//记录插入时间
    private Date updateTime;	//记录更新时间
	
	@Transient
	private long examTime;
	@Transient
	List<Question> questions;
	@Transient
	private Faculty faculty;
	@Transient
	private Classes classes;
	@Transient
	private Subject subject;
	@Transient
	private User user;
	
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public Integer getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(Integer totalScore) {
		this.totalScore = totalScore;
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
	
	
	
	public long getExamTime() {
		return examTime;
	}
	public void setExamTime(long examTime) {
		this.examTime = examTime;
	}
	
	
	public List<Question> getQuestions() {
		return questions;
	}
	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}
	public Faculty getFaculty() {
		return faculty;
	}
	public void setFaculty(Faculty faculty) {
		this.faculty = faculty;
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
	
	
//	@Override
//	public String toString() {
//		return "\nExamination [id=" + id + ", title=" + title + ", userId=" + userId + ", author=" + author + ", grade="
//				+ grade + ", status=" + status + ", totalScore=" + totalScore + ", classId=" + classId + ", subjectId="
//				+ subjectId + ", startTime=" + startTime + ", endTime=" + endTime + ", createTime=" + createTime
//				+ ", updateTime=" + updateTime + ", examTime=" + examTime + ", \n\tquestions="
//				+ questions + ", \n\tfaculty=" + faculty + ", \n\tclasses=" + classes + ", \n\tsubject=" + subject + ", \n\tuser="
//				+ user + "\n]";
//	}
	
}
