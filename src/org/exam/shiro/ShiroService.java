package org.exam.shiro;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.mgt.DefaultFilterChainManager;
import org.apache.shiro.web.filter.mgt.PathMatchingFilterChainResolver;
import org.apache.shiro.web.servlet.AbstractShiroFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.exam.entity.Permission;
import org.exam.holder.SpringContextHolder;
import org.exam.service.PermissionService;
import org.exam.util.CoreConst;

@Service
public class ShiroService {
    @Autowired
    private PermissionService permissionService;
    /**
     * 初始化权限
     */
    public Map<String, String> loadFilterChainDefinitions() {
        //权限控制map.从数据库获取
    	//anon，authcBasic，auchc，user是认证过滤器
        Map<String, String> filterChainDefinitionMap = new LinkedHashMap<String, String>();
        filterChainDefinitionMap.put("/login", "anon");
        filterChainDefinitionMap.put("/api/**", "anon");
        filterChainDefinitionMap.put("/exam/**", "anon");
        filterChainDefinitionMap.put("/register", "anon");
        filterChainDefinitionMap.put("/logout", "logout");
        filterChainDefinitionMap.put("/kickout", "anon");
        filterChainDefinitionMap.put("/error/**", "anon");
        filterChainDefinitionMap.put("/css/**","anon");
        filterChainDefinitionMap.put("/js/**","anon");
        filterChainDefinitionMap.put("/img/**","anon");
        filterChainDefinitionMap.put("/libs/**","anon");
        filterChainDefinitionMap.put("/favicon.ico", "anon");
        filterChainDefinitionMap.put("/verificationCode", "anon");
        filterChainDefinitionMap.put("/", "anon");
        filterChainDefinitionMap.put("/**", "authc");
        //perms，roles，ssl，rest，port是授权过滤器
        List<Permission> permissionList = permissionService.selectAll(CoreConst.STATUS_VALID);
        for(Permission permission : permissionList){
            if (StringUtils.isNotBlank(permission.getUrl()) && StringUtils.isNotBlank(permission.getPerms())) {
                String perm = "perms[" + permission.getPerms()+ "]";//perms[xxx]、roles[xxx],perms[]粒度小
                //导入   【所有】   非空权限信息（url+权限标识）
                filterChainDefinitionMap.put(permission.getUrl(),perm+",kickout");
                //在shiroRealm中授权方法doGetAuthorizationInfo()中为AuthorizationInfo info设置个体的 角色 和 权限标识
            }
        }
        filterChainDefinitionMap.put("/**", "user,kickout");
        System.out.println("Here is filterChainDefinitionMap!"+filterChainDefinitionMap.toString());
        return filterChainDefinitionMap;
    }

    /**
     * 重新加载权限
     */
    public void updatePermission() {
        ShiroFilterFactoryBean shiroFilterFactoryBean = SpringContextHolder.getBean(ShiroFilterFactoryBean.class);
        synchronized (shiroFilterFactoryBean) {

            AbstractShiroFilter shiroFilter = null;
            try {
                shiroFilter = (AbstractShiroFilter) shiroFilterFactoryBean
                        .getObject();
            } catch (Exception e) {
                throw new RuntimeException(
                        "get ShiroFilter from shiroFilterFactoryBean error!");
            }

            PathMatchingFilterChainResolver filterChainResolver = (PathMatchingFilterChainResolver) shiroFilter
                    .getFilterChainResolver();
            DefaultFilterChainManager manager = (DefaultFilterChainManager) filterChainResolver
                    .getFilterChainManager();

            // 清空老的权限控制
            manager.getFilterChains().clear();

            shiroFilterFactoryBean.getFilterChainDefinitionMap().clear();
            shiroFilterFactoryBean
                    .setFilterChainDefinitionMap(loadFilterChainDefinitions());
            // 重新构建生成
            Map<String, String> chains = shiroFilterFactoryBean
                    .getFilterChainDefinitionMap();
            for (Map.Entry<String, String> entry : chains.entrySet()) {
                String url = entry.getKey();
                String chainDefinition = entry.getValue().trim()
                        .replace(" ", "");
                manager.createChain(url, chainDefinition);
            }
        }
    }
}
