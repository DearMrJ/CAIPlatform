package org.exam.vo;

import org.exam.vo.base.BaseConditionVo;

public class ExaminationConditionVo extends BaseConditionVo {
	
	private String keywords;
	
	private String author;
	
	private String grade;
	
	private Integer insId;
	
	private Integer classId;
	
	private Integer subjectId;
	
	private Integer status;
	
	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
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

	public Integer getInsId() {
		return insId;
	}

	public void setInsId(Integer insId) {
		this.insId = insId;
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
	
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
