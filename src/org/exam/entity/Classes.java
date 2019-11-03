package org.exam.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.exam.util.CoreConst;
@Table(name=CoreConst.CLASSES_TABLE)
@SuppressWarnings("serial")//去除序列号警告
public class Classes implements Serializable{
	@Id//orm中的主键@Id、其余@Column
	private Integer id;
	private Integer facultyId;	//学院id
	private String name;		//专业（班）名
	private Integer sort;		//
	private String author;
	private String description;	//描述 或 作备用
	private Integer status;		//废弃or在用
	private Date createTime;	//创建时间
	private Date updateTime;	//更新时间
	
	@Transient
	private Integer counts;
	
	@Transient
	private Faculty faculty;
	@Transient
	private List<User> listUser;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getFacultyId() {
		return facultyId;
	}
	public void setFacultyId(Integer facultyId) {
		this.facultyId = facultyId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	
	
	public Integer getCounts() {
		return counts;
	}
	public void setCounts(Integer counts) {
		this.counts = counts;
	}
	public Faculty getFaculty() {
		return faculty;
	}
	public void setFaculty(Faculty faculty) {
		this.faculty = faculty;
	}
	public List<User> getListUser() {
		return listUser;
	}
	public void setListUser(List<User> listUser) {
		this.listUser = listUser;
	}
	
	
	@Override
	public String toString() {
		return "Classes [id=" + id + ", facultyId=" + facultyId + ", name=" + name + ", description=" + description
				+ ", status=" + status + ", createTime=" + createTime + ", updateTime=" + updateTime + "]";
	}
	
}
