package org.exam.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Id;

@SuppressWarnings("serial")
public class Attendance implements Serializable{
	@Id
	private Integer id;			//自增

	private Integer classId;
	private Integer subjectId;
	private Integer status;		//1有效，0失效(过时)
	private Date createTime;	//签到创建时间
	private Date endTime;		//签到截至时间
	
	
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
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
	
}
