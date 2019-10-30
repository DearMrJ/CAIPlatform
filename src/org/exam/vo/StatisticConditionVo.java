package org.exam.vo;

import org.exam.vo.base.BaseConditionVo;

public class StatisticConditionVo extends BaseConditionVo {
	private Integer examId;
	
	private String grade;
	
	private Integer insId;
	
	private Integer classId;
	
	private Integer subjectId;
	
	private Integer status;

	public Integer getExamId() {
		return examId;
	}

	public void setExamId(Integer examId) {
		this.examId = examId;
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
