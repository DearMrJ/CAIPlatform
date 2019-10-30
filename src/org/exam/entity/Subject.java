package org.exam.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Transient;
@SuppressWarnings("serial")
public class Subject implements Serializable{
	@Id
	private Integer id;
	private String name;
	private String description;
	private String img;
	private String userId;		//创建者
    private String author;		//创建者
    private Integer sort;		//排序因子
	private Integer status;
	private Date createTime;
	private Date updateTime;
	
	@Transient
	private Integer nums;

	@Transient
	private User user;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
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
	
	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
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

	public Integer getNums() {
		return nums;
	}

	public void setNums(Integer nums) {
		this.nums = nums;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "\nSubject [id=" + id + ", name=" + name + ", description=" + description + ", img=" + img + ", userId="
				+ userId + ", author=" + author + ", sort=" + sort + ", status=" + status + ", createTime=" + createTime
				+ ", updateTime=" + updateTime + ", nums=" + nums + ", user=" + user + "]";
	}
	
}
