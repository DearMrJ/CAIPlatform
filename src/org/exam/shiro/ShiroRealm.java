package org.exam.shiro;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.mgt.RealmSecurityManager;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.apache.shiro.util.ByteSource;
import org.crazycake.shiro.RedisSessionDAO;
import org.exam.entity.User;
import org.exam.service.PermissionService;
import org.exam.service.RoleService;
import org.exam.service.UserService;
import org.exam.util.CoreConst;
import org.exam.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;

public class ShiroRealm extends AuthorizingRealm{
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private PermissionService permissionService;
	@Autowired
    private RedisSessionDAO redisSessionDAO;


	//用于认证
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String username = (String) token.getPrincipal();
		User user = userService.selectByUsername(username);
		if (user == null) {//当前用户不存在
			throw new UnknownAccountException(username+" not exist!");
		}
		if (CoreConst.STATUS_INVALID==user.getStatus()) {//账号当前处于锁定状态
			throw new LockedAccountException(username+" 已锁定");
		}
		SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(
				user,	//principal:认证的实体信息，可以是username，也可以是数据表对应的用户的实体类对象
				user.getPassword(),	//credentials:库中密码
				ByteSource.Util.bytes(user.getCredentialsSalt()),//(ByteSource)
				getName()	//realmName:当前realm对象的name，调用父类的getName() 方法即可
		);
		return info;
	}

	//用于授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		if(principals == null){
            throw new AuthorizationException("principals should not be null");
        }
		User user = (User) principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		info.setRoles(roleService.findRoleByUserId(user.getUserId()));//用户对应角色 (Set<String>)
		info.setStringPermissions(permissionService.findPermsByUserId(user.getUserId()));//角色对应权限可访问路径
		return info;
	}
	
	/**清除缓存认证信息*/
    public void removeCachedAuthenticationInfo(List<String> userIds) {
        if(null == userIds || userIds.size() == 0)	{
            return ;
        }
        List<SimplePrincipalCollection> list = getSpcListByUserIds(userIds);
        RealmSecurityManager securityManager =
                (RealmSecurityManager) SecurityUtils.getSecurityManager();
        ShiroRealm realm = (ShiroRealm)securityManager.getRealms().iterator().next();
        for (SimplePrincipalCollection simplePrincipalCollection : list) {
            realm.clearCachedAuthenticationInfo(simplePrincipalCollection);
        }
    }

    /**
     * 根据userId 清除当前session存在的用户的权限缓存
     * @param userIds 已经修改了权限的userId
     */
    public void clearAuthorizationByUserId(List<String> userIds){
        if(null == userIds || userIds.size() == 0)	{
            return ;
        }
        List<SimplePrincipalCollection> list = getSpcListByUserIds(userIds);
        RealmSecurityManager securityManager =
                (RealmSecurityManager) SecurityUtils.getSecurityManager();
        ShiroRealm realm = (ShiroRealm)securityManager.getRealms().iterator().next();
        for (SimplePrincipalCollection simplePrincipalCollection : list) {
            realm.clearCachedAuthorizationInfo(simplePrincipalCollection);
        }
    }

    /**
     * 根据用户id获取所有spc
     * @param userIds 已经修改了权限的userId
     */
    private  List<SimplePrincipalCollection> getSpcListByUserIds(List<String> userIds){
        //获取所有session
        Collection<Session> sessions = redisSessionDAO.getActiveSessions();
        //定义返回
        List<SimplePrincipalCollection> list = new ArrayList<SimplePrincipalCollection>();
        for (Session session:sessions){
            //获取session登录信息。
            Object obj = session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
            if(null != obj && obj instanceof SimplePrincipalCollection){
                //强转
                SimplePrincipalCollection spc = (SimplePrincipalCollection)obj;
                //判断用户，匹配用户ID。
                obj = spc.getPrimaryPrincipal();
                if(null != obj && obj instanceof User){
                    User user = (User) obj;
                    System.out.println("user:"+user);
                    //比较用户ID，符合即加入集合
                    if(null != user && userIds.contains(user.getUserId())){
                        list.add(spc);
                    }
                }
            }
        }
        return list;
    }
	
    public static void main(String[] args) {
		String hashAlgorithmName = "md5";
		Object credentials = "123456";
		Object credentialsSalt = ByteSource.Util.bytes("examLynchee96b5d09e89e6896f45c3551493aece");
		int hashIterations = 2;
		Object result = new SimpleHash(hashAlgorithmName, credentials, credentialsSalt, hashIterations);
		System.out.println(result);
		//37f2dd3a7e5163c9373b7cf77044c2a0  password
		//347172bacda0929395c3ea4736444ec9  salt
	}
}
