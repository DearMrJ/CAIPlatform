package org.exam.vo;

import org.exam.vo.base.BaseConditionVo;

public class UserConditionVo extends BaseConditionVo {
	
	private String username;
	
	private String nickname;
	
	private String grade;
	
	private Integer insId;
	
	private Integer classId;
	
	private Integer status;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
