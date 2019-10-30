package org.exam.entity;

import java.io.Serializable;

import javax.persistence.Id;

@SuppressWarnings("serial")
public class ExamQuestion implements Serializable{
	@Id
	private Integer id;
	
	private Integer examId;
	private Integer questionId;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getExamId() {
		return examId;
	}
	public void setExamId(Integer examId) {
		this.examId = examId;
	}
	public Integer getQuestionId() {
		return questionId;
	}
	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}
	
	
}
