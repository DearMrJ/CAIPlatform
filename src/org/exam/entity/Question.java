package org.exam.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Transient;

@SuppressWarnings("serial")
public class Question implements Serializable {
	@Id
	private Integer id;
	
	private String title;		//标题
	private Integer type;		//试题类型（1单选、2多选、3主观题）（可扩展）
	private Integer subjectId;	//科目id
	private Integer score;		//题目分值
	private String content;		//题目
	private String optionA;		//A项
	private String optionB;		//B项
	private String optionC;		//C项
	private String optionD;		//D项
//	private String optionE;		//E项
//	private String optionF;		//F项
	private String answer;		//答案
	private String parse;		//答案解析
	private Integer difficulty;	//难度
	private Integer status;		//0表示未考，1表示已经考过
	private Date createTime;	//创建时间
	private Date updateTime;	//更新时间
	
	@Transient
	private String stuAnswer;
	@Transient
	private Integer counts;
	@Transient
    private Subject subject;
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
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getOptionA() {
		return optionA;
	}
	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}
	public String getOptionB() {
		return optionB;
	}
	public void setOptionB(String optionB) {
		this.optionB = optionB;
	}
	public String getOptionC() {
		return optionC;
	}
	public void setOptionC(String optionC) {
		this.optionC = optionC;
	}
	public String getOptionD() {
		return optionD;
	}
	public void setOptionD(String optionD) {
		this.optionD = optionD;
	}
//	public String getOptionE() {
//		return optionE;
//	}
//	public void setOptionE(String optionE) {
//		this.optionE = optionE;
//	}
//	public String getOptionF() {
//		return optionF;
//	}
//	public void setOptionF(String optionF) {
//		this.optionF = optionF;
//	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getParse() {
		return parse;
	}
	public void setParse(String parse) {
		this.parse = parse;
	}
	public Integer getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(Integer difficulty) {
		this.difficulty = difficulty;
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
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	
	public String getStuAnswer() {
		return stuAnswer;
	}
	public void setStuAnswer(String stuAnswer) {
		this.stuAnswer = stuAnswer;
	}
	public Integer getCounts() {
		return counts;
	}
	public void setCounts(Integer counts) {
		this.counts = counts;
	}
	public Subject getSubject() {
		return subject;
	}
	public void setSubject(Subject subject) {
		this.subject = subject;
	}
	
	
	@Override
	public String toString() {
		return "\nQuestion [id=" + id + ", title=" + title + ", type=" + type + ", subjectId=" + subjectId + ", score="
				+ score + ", content=" + content + ", optionA=" + optionA + ", optionB=" + optionB + ", optionC="
				+ optionC + ", optionD=" + optionD + ", answer=" + answer + ", parse=" + parse + ", status=" + status
				+ ", createTime=" + createTime + ", updateTime=" + updateTime + ", stuAnswer=" + stuAnswer + ", counts="
				+ counts + ", subject=" + subject + "]";
	}
	
	
}
