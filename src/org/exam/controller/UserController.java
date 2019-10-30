package org.exam.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import org.exam.entity.Classes;
import org.exam.entity.Role;
import org.exam.entity.User;
import org.exam.service.ClassesService;
import org.exam.service.RoleService;
import org.exam.service.UserService;
import org.exam.shiro.ShiroRealm;
import org.exam.util.CopyUtil;
import org.exam.util.CoreConst;
import org.exam.util.PageUtil;
import org.exam.util.PasswordHelper;
import org.exam.util.ResultUtil;
import org.exam.util.UUIDUtil;
import org.exam.vo.ChangePasswordVo;
import org.exam.vo.UserConditionVo;
import org.exam.vo.base.PageResultVo;
import org.exam.vo.base.ResponseVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private ShiroRealm shiroRealm;
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private ClassesService classesService;

    /**用户列表数据*/
    @PostMapping("/list")
    @ResponseBody
    public PageResultVo loadUsers(UserConditionVo userConditionVo, Integer limit, Integer offset){
        PageHelper.startPage(PageUtil.getPageNo(limit, offset),limit);
        List<User> userList = userService.findByCondition(userConditionVo);
        PageInfo<User> pages = new PageInfo<>(userList);
        return ResultUtil.table(userList,pages.getTotal(),pages);
    }

    /**新增用户*/
    @PostMapping("/add")
    @ResponseBody
    public ResponseVo add(User userForm, String confirmPassword, Integer passwordType){
        String username = userForm.getUsername();
        User user = userService.selectByUsername(username);
        if (null != user) {
            return ResultUtil.error("该学号已存在");
        }
        if(passwordType == 0) {
        	String password = userForm.getPassword();
        	//判断两次输入密码是否相等
        	if (confirmPassword != null && password != null) {
        		if (!confirmPassword.equals(password)) {
        			return ResultUtil.error("两次密码不一致");
        		}
        	}
        	
        }else {
        	userForm.setPassword(CoreConst.DEFAULT_PASSWORD);
        }
        userForm.setUserId(UUIDUtil.getUniqueIdByUUID());
        userForm.setImg(CoreConst.DEFAULT_IMG);
        userForm.setStatus(CoreConst.STATUS_VALID);
        Date date = new Date();
        userForm.setCreateTime(date);
        userForm.setUpdateTime(date);
        userForm.setLastLogonTime(date);
        PasswordHelper.encryptPassword(userForm);
        int num = userService.register(userForm);
        if(num > 0){
            return ResultUtil.success("添加用户成功");
        }else {
            return ResultUtil.error("添加用户失败");
        }
    }

    /**编辑用户详情*/
    @GetMapping("/edit")
    public String userDetail(Model model, String userId){
        User user = userService.selectByUserId(userId);
        List<Classes> classes = classesService.selectAll();
        List<String> grades = userService.selectGradeList();
        model.addAttribute("user", user);
        model.addAttribute("classes", classes);
        model.addAttribute("grades", grades);
        return "user/userDetail";
    }

    /**编辑用户*/
    @PostMapping("/edit")
    @ResponseBody
    public ResponseVo editUser(User userFrom){
        int a = userService.updateByUserId(userFrom);
        if (a > 0) {
            return ResultUtil.success("编辑用户成功！");
        } else {
            return ResultUtil.error("编辑用户失败");
        }
    }
    /**
     * 禁用用户
     * @param userId
     * @return
     */
    @PostMapping("/ban")
    @ResponseBody
    public ResponseVo banUser(String userId) {
    	List<String> userIdsList = Arrays.asList(userId);
    	int a = userService.updateStatusBatch(userIdsList,CoreConst.STATUS_INVALID);
    	if(a > 0) {
    		return ResultUtil.success("禁用用户成功");
    	}else {
    		return ResultUtil.error("禁用用户失败");
    	}
    }
    
    /**批量禁用用户*/
    @PostMapping("/batch/ban")
    @ResponseBody
    public ResponseVo batchBanUser(String userIdStr) {
        String[] userIds = userIdStr.split(",");
        List<String> userIdsList = Arrays.asList(userIds);
        int a = userService.updateStatusBatch(userIdsList,CoreConst.STATUS_INVALID);
        if (a > 0) {
            return ResultUtil.success("批量禁用用户成功");
        } else {
            return ResultUtil.error("批量禁用用户失败");
        }
    }
    
    /**
     * 启用用户
     * @param userId
     * @return
     */
    @PostMapping("/enable")
    @ResponseBody
    public ResponseVo enableUser(String userId) {
    	List<String> userIdsList = Arrays.asList(userId);
    	int a = userService.updateStatusBatch(userIdsList,CoreConst.STATUS_VALID);
    	if(a > 0) {
    		return ResultUtil.success("启用用户成功");
    	}else {
    		return ResultUtil.error("启用用户失败");
    	}
    }
    
    /**批量启用用户*/
    @PostMapping("/batch/enable")
    @ResponseBody
    public ResponseVo batchEnableUser(String userIdStr) {
        String[] userIds = userIdStr.split(",");
        List<String> userIdsList = Arrays.asList(userIds);
        int a = userService.updateStatusBatch(userIdsList,CoreConst.STATUS_VALID);
        if (a > 0) {
            return ResultUtil.success("批量启用用户成功");
        } else {
            return ResultUtil.error("批量启用用户失败");
        }
    }

    /**删除用户*/
    @PostMapping("/delete")
    @ResponseBody
    public ResponseVo deleteUser(String userId) {
    	List<String> userIdsList = Arrays.asList(userId);
        int a = userService.deleteBatch(userIdsList);
        if (a > 0) {
            return ResultUtil.success("删除用户成功");
        } else {
            return ResultUtil.error("删除用户失败");
        }
    }

    /**批量删除用户*/
    @PostMapping("/batch/delete")
    @ResponseBody
    public ResponseVo batchDeleteUser(String userIdStr) {
    	String[] userIds = userIdStr.split(",");
        List<String> userIdsList = Arrays.asList(userIds);
        int a = userService.deleteBatch(userIdsList);
        if (a > 0) {
            return ResultUtil.success("批量删除用户成功");
        } else {
            return ResultUtil.error("批量删除用户失败");
        }
    }

    /**分配角色列表查询*/
    @PostMapping("/assign/role/list")
    @ResponseBody
    public Map<String,Object> assignRoleList(String userId){
        List<Role> roleList = roleService.selectRoles(new Role());
        Set<String> hasRoles = roleService.findRoleByUserId(userId);
        Map<String, Object> jsonMap = new HashMap<>(2);
        jsonMap.put("rows", roleList);
        jsonMap.put("hasRoles",hasRoles);
        return jsonMap;
    }

    /**保存分配角色*/
    @PostMapping("/assign/role")
    @ResponseBody
    public ResponseVo assignRole(String userId, String roleIdStr){
    	List<String> userIdList = new ArrayList<>();
    	userIdList.add(userId);
        String[] roleIds = roleIdStr.split(",");
        List<String> roleIdsList = Arrays.asList(roleIds);
        ResponseVo responseVo = userService.addAssignRole(userIdList,roleIdsList);
        shiroRealm.clearAuthorizationByUserId(userIdList);
        return responseVo;
    }
    
    /**批量分配角色列表查询*/
    @PostMapping("/batch/assign/role/list")
    @ResponseBody
    public Map<String,Object> batchAssignRoleList(String userId){
        List<Role> roleList = roleService.selectRoles(new Role());
        Set<String> hasRoles = roleService.findRoleByUserId(userId);
        Map<String, Object> jsonMap = new HashMap<>(2);
        jsonMap.put("rows", roleList);
        jsonMap.put("hasRoles",hasRoles);
        return jsonMap;
    }
    
    /**批量保存分配角色*/
    @PostMapping("/batch/assign/role")
    @ResponseBody
    public ResponseVo batchAssignRole(String userIdStr, String roleIdStr){
    	String[] userIds = userIdStr.split(",");
    	List<String> userIdList = Arrays.asList(userIds);
        String[] roleIds = roleIdStr.split(",");
        List<String> roleIdsList = Arrays.asList(roleIds);
        ResponseVo responseVo = userService.addAssignRole(userIdList,roleIdsList);
        shiroRealm.clearAuthorizationByUserId(userIdList);
        return responseVo;
    }

    /*修改密码*/
    @RequestMapping(value = "/changePassword",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo changePassword(ChangePasswordVo changePasswordVo) {
        if(!changePasswordVo.getNewPassword().equals(changePasswordVo.getConfirmNewPassword())){
            return ResultUtil.error("两次密码输入不一致");
        }
        User loginUser = userService.selectByUserId(((User) SecurityUtils.getSubject().getPrincipal()).getUserId());
        User newUser = CopyUtil.getCopy(loginUser,User.class);
        String sysOldPassword = loginUser.getPassword();
        newUser.setPassword(changePasswordVo.getOldPassword());
        String entryOldPassword = PasswordHelper.getPassword(newUser);
        if(sysOldPassword.equals(entryOldPassword)){
            newUser.setPassword(changePasswordVo.getNewPassword());
            PasswordHelper.encryptPassword(newUser);
            userService.updateUserByPrimaryKey(newUser);
            //*清除登录缓存*//
            List<String> userIds = new ArrayList<>();
            userIds.add(loginUser.getUserId());
            shiroRealm.removeCachedAuthenticationInfo(userIds);
            /*SecurityUtils.getSubject().logout();*/
        }else{
            return ResultUtil.error("您输入的旧密码有误");
        }
        return ResultUtil.success("修改密码成功");
    }

}
