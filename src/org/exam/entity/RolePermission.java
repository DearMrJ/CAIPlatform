package org.exam.entity;

import java.io.Serializable;

import javax.persistence.Id;

@SuppressWarnings("serial")
public class RolePermission implements Serializable {
    @Id
    private Integer id;
    
    private String roleId;
    private String permissionId;
    
    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }

    public String getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(String permissionId) {
        this.permissionId = permissionId == null ? null : permissionId.trim();
    }
}