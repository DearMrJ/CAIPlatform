package org.exam.controller;

import java.io.Serializable;
import java.util.Deque;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.subject.Subject;
import org.crazycake.shiro.RedisCacheManager;
import org.exam.entity.Permission;
import org.exam.entity.User;
import org.exam.service.PermissionService;
import org.exam.service.UserService;
import org.exam.util.ResultUtil;
import org.exam.vo.base.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 认证踢出控制器
 * @author Lynch
 */
@Controller
public class SystemController {
	
	@Autowired
	private UserService userService;
	@Autowired
    private PermissionService permissionService;
	@Autowired
    private RedisCacheManager redisCacheManager;
	
	//跳转登录页
    @GetMapping("/login")
    public String login(Model model){
        if(SecurityUtils.getSubject().isAuthenticated()){//已认证
            return "redirect:/";
        }
        return "system/login";
    }
    
    //提交登录表单
    @PostMapping("/login")
    @ResponseBody
    public ResponseVo login(HttpServletRequest request, String username, String password, 
                            @RequestParam(value = "rememberMe", defaultValue = "0") Integer rememberMe) {
    	UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        try{
            token.setRememberMe(1 == rememberMe);
            Subject subject = SecurityUtils.getSubject();
            subject.login(token);
        } catch (LockedAccountException e) {
            token.clear();
            return ResultUtil.error("用户已经被锁定不能登录，请联系管理员！");
        } catch (AuthenticationException e) {
            token.clear();
            return ResultUtil.error("用户名或者密码错误！");
        }
        //更新最后登录时间
        userService.updateLastLoginTime((User) SecurityUtils.getSubject().getPrincipal());
        return ResultUtil.success("登录成功！");
    }
    
    
    //登出
    @RequestMapping("/logout")
    public ResponseVo logout() {
    	Subject subject = SecurityUtils.getSubject();
        if(null!=subject){
            String username = ((User) SecurityUtils.getSubject().getPrincipal()).getUsername();
            Serializable sessionId = SecurityUtils.getSubject().getSession().getId();
            Cache<String, Deque<Serializable>> cache = redisCacheManager.getCache(redisCacheManager.getKeyPrefix()+username);
            Deque<Serializable> deques = cache.get(username);
            for(Serializable deque : deques){
                if(sessionId.equals(deque)){
                    deques.remove(deque);
                    break;
                }
            }
            cache.put(username,deques);
        }
        subject.logout();
        return ResultUtil.success("退出成功");
    }
    
    //获取当前登录用户的菜单
    @PostMapping("/menu")
    @ResponseBody
    public List<Permission> getMenus(){
    	return permissionService.selectMenuByUserId(((User)SecurityUtils.getSubject().getPrincipal()).getUserId());
    }
    
    
    
    
    
}