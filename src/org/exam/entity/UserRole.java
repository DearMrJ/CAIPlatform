package org.exam.entity;

import java.io.Serializable;

import javax.persistence.Id;

@SuppressWarnings("serial")
public class UserRole implements Serializable{
	@Id
	private Integer id;
	private String userId;
	private String roleId;
	
	public UserRole() {
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId == null ? null : userId.trim();
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId == null ? null : roleId.trim();
	}
	
	
}
