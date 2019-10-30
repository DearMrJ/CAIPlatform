package org.exam.vo;

import org.exam.vo.base.BaseConditionVo;

public class ClassesConditionVo extends BaseConditionVo {

	private String className;
	
	private Integer insId;
	
	private Integer status;

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public Integer getInsId() {
		return insId;
	}

	public void setInsId(Integer insId) {
		this.insId = insId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
}
