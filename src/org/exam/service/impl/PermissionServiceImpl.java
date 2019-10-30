package org.exam.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Set;

import org.exam.mapper.PermissionMapper;
import org.exam.entity.Permission;
import org.exam.service.PermissionService;
import org.exam.util.CoreConst;
import org.exam.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    public Set<String> findPermsByUserId(String userId) {
        return permissionMapper.findPermsByUserId(userId);
    }

    @Override
    public List<Permission> selectAll(Integer status) {
        return permissionMapper.selectAllPerms(status);
    }

    @Override
    public List<Permission> selectAllMenuName(Integer status) {
        return permissionMapper.selectAllMenuName(status);
    }

    @Override
    public List<Permission> selectMenuByUserId(String userId) {
        return permissionMapper.selectMenuByUserId(userId);
    }

    @Override
    public int insert(Permission permission) {
        Date date = new Date();
        permission.setPermissionId(UUIDUtil.getUniqueIdByUUID());
        permission.setStatus(CoreConst.STATUS_VALID);
        permission.setCreateTime(date);
        permission.setUpdateTime(date);
        return permissionMapper.insert(permission);
    }

    @Override
    public int updateStatus(String  permissionId,Integer status) {
        return permissionMapper.updateStatusByPermissionId(permissionId,status);
    }

    @Override
    public Permission findByPermissionId(String permissionId) {
        return permissionMapper.selectByPermissionId(permissionId);
    }

    @Override
    public Permission findById(Integer id) {
        Permission permission = new Permission();
        permission.setId(id);
        return permissionMapper.selectByPrimaryKey(permission);
    }

    @Override
    public int updateByPermissionId(Permission permission) {
        return permissionMapper.updateByPermissionId(permission);
    }

    @Override
    public int selectSubPermsByPermissionId(String permissionId) {
        return permissionMapper.selectSubPermsByPermissionId(permissionId);
    }
}
