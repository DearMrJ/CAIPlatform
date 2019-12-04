package org.exam.service.impl;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Deque;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.DefaultSessionKey;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.crazycake.shiro.RedisCacheManager;
import org.crazycake.shiro.RedisSessionDAO;
import org.exam.enmus.ResponseStatus;
import org.exam.entity.User;
import org.exam.entity.UserRole;
import org.exam.exception.ExcelException;
import org.exam.mapper.UserMapper;
import org.exam.mapper.UserRoleMapper;
import org.exam.service.UserService;
import org.exam.util.CoreConst;
import org.exam.util.PasswordHelper;
import org.exam.util.ResultUtil;
import org.exam.util.UUIDUtil;
import org.exam.vo.UserConditionVo;
import org.exam.vo.UserOnlineVo;
import org.exam.vo.base.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
/**
 * 
 * @author Lynch
 */
@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {
	
	private final static String XLS = "xls";
	private final static String XLSX = "xlsx";


    @Autowired
    private RedisSessionDAO redisSessionDAO;

    @Autowired
    private SessionManager sessionManager;

    @Autowired
    private RedisCacheManager redisCacheManager;

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserRoleMapper userRoleMapper;
    @Autowired
    private QuestionServiceImpl questionServiceImpl;

    @Override
    public User selectByUsername(String username) {
        return userMapper.selectByUsername(username);
    }

    @Override
    public int register(User user) {
        int a = userMapper.insert(user);
        return a;
    }

    @Override
    public void updateLastLoginTime(User user) {
        userMapper.updateLastLoginTime(user);
    }

    @Override
    public List<User> selectUsers(User user) {
        return userMapper.selectUsers(user);
    }

    @Override
    public User selectByUserId(String userId) {
        return userMapper.selectByUserId(userId);
    }

    @Override
    public int updateByUserId(User user) {
        return userMapper.updateByUserId(user);
    }

    @Override
    public int updateStatusBatch(List<String> userIds,Integer status) {
        Map<String,Object> params = new HashMap<String,Object>(2);
        params.put("userIds",userIds);
        params.put("status",status);
        return userMapper.updateStatusBatch(params);
    }

    @Override
    public ResponseVo addAssignRole(List<String> userIdList, List<String> roleIds) {
        try{
        	for(String userId : userIdList) {
        		UserRole userRole = new UserRole();
                userRole.setUserId(userId);
                userRoleMapper.delete(userRole);
                for(String roleId :roleIds){
                    userRole.setId(null);
                    userRole.setRoleId(roleId);
                    userRoleMapper.insert(userRole);
                }
        	}
            return ResultUtil.success("分配角色成功");
        }catch(Exception e){
            return ResultUtil.error("分配角色失败");
        }
    }

    @Override
    public int updateUserByPrimaryKey(User user) {
        return userMapper.updateByPrimaryKey(user);
    }

    @Override
    public List<UserOnlineVo> selectOnlineUsers(UserOnlineVo userVo) {
        // 因为我们是用redis实现了shiro的session的Dao,而且是采用了shiro+redis这个插件
        // 所以从spring容器中获取redisSessionDAO
        // 来获取session列表.
        Collection<Session> sessions = redisSessionDAO.getActiveSessions();
        Iterator<Session> it = sessions.iterator();
        List<UserOnlineVo> onlineUserList = new ArrayList<UserOnlineVo>();
        // 遍历session
        while (it.hasNext()) {
            // 这是shiro已经存入session的
            // 现在直接取就是了
            Session session = it.next();
            //标记为已提出的不加入在线列表
            if(session.getAttribute("kickout") != null) {
                continue;
            }
            UserOnlineVo onlineUser = getSessionBo(session);
            if(onlineUser!=null){
                /*用户名搜索*/
                if(StringUtils.isNotBlank(userVo.getUsername())){
                    if(onlineUser.getUsername().contains(userVo.getUsername()) ){
                        onlineUserList.add(onlineUser);
                    }
                }else{
                    onlineUserList.add(onlineUser);
                }
            }
        }
        return onlineUserList;
    }

    @Override
    public void kickout(Serializable sessionId, String username) {
        getSessionBysessionId(sessionId).setAttribute("kickout", true);
        //读取缓存,找到并从队列中移除
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


    private Session getSessionBysessionId(Serializable sessionId){
        Session kickoutSession = sessionManager.getSession(new DefaultSessionKey(sessionId));
        return kickoutSession;
    }

    private UserOnlineVo getSessionBo(Session session){
        //获取session登录信息。
        Object obj = session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
        if(null == obj){
            return null;
        }
        //确保是 SimplePrincipalCollection对象。
        if(obj instanceof SimplePrincipalCollection){
            SimplePrincipalCollection spc = (SimplePrincipalCollection)obj;
            obj = spc.getPrimaryPrincipal();
            if(null != obj && obj instanceof User){
                User user = (User) obj;
                //存储session + user 综合信息
                UserOnlineVo userBo = new UserOnlineVo();
                //最后一次和系统交互的时间
                userBo.setLastAccess(session.getLastAccessTime());
                //主机的ip地址
                userBo.setHost(user.getLoginIpAddress());
                //session ID
                userBo.setSessionId(session.getId().toString());
                //最后登录时间
                userBo.setLastLoginTime(user.getLastLogonTime());
                //回话到期 ttl(ms)
                userBo.setTimeout(session.getTimeout());
                //session创建时间
                userBo.setStartTime(session.getStartTimestamp());
                //是否踢出
                userBo.setSessionStatus(false);
                /*用户名*/
                userBo.setUsername(user.getUsername());
                return userBo;
            }
        }
        return null;
    }

	@Override
	public int userNums() {
		int userNums = userMapper.userNums();
		return userNums;
	}

	@Override
	public List<User> findByCondition(UserConditionVo vo) {
		return userMapper.findByCondition(vo);
	}

	@Override
	public List<String> selectGradeList() {
		return userMapper.selectGradeList();
	}

	@Override
	public List<HashMap<String, Object>> academyPassNumSta() {
		return userMapper.academyPassNumSta();
	}

	@Override
	public ResponseVo importUserExcel(MultipartFile file) {
		List<User> users = new ArrayList<>();
		Workbook workbook = null;
		//获取文件名
		String fileName = file.getOriginalFilename();
		if(fileName.endsWith(XLS)) {
			try {
				workbook = new HSSFWorkbook(file.getInputStream()); //2003版
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else if(fileName.endsWith(XLSX)) {
			try {
				workbook = new XSSFWorkbook(file.getInputStream()); //2007版
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			new ExcelException(ResponseStatus.FILE_IS_NOT_EXCEL); //文件不是excel文件
		}
		
		Sheet sheet = workbook.getSheet("sheet1");
		int rows = sheet.getLastRowNum();
		if(rows == 0) {
			new ExcelException(ResponseStatus.DATA_IS_NULL); //Excel为空，请上传有数据的Excel
		}
		
		for(int i = 1; i <= rows+1; i++) {
			Row row = sheet.getRow(i);
			if(row != null) {
				User user = new User();
				//学号
				String username = questionServiceImpl.getCellValue(row.getCell(0));
				User user2 = selectByUsername(username);
				if(user2 == null) {
					user.setUsername(username);
					String nickname = questionServiceImpl.getCellValue(row.getCell(1));
					user.setNickname(nickname);
					String grade = questionServiceImpl.getCellValue(row.getCell(2));
					user.setGrade(grade);
					String classId = questionServiceImpl.getCellValue(row.getCell(3));
					if(!classId.isEmpty()) {
						Integer class_id = Integer.parseInt(classId);
						user.setClassId(class_id);
					}
					String sex = questionServiceImpl.getCellValue(row.getCell(4));
					if(!sex.isEmpty()) {
						Integer new_sex = Integer.parseInt(sex);
						user.setSex(new_sex);
					}
					String age = questionServiceImpl.getCellValue(row.getCell(5));
					if(!age.isEmpty()) {
						Integer new_age = Integer.parseInt(age);
						user.setAge(new_age);
					}
					String phone = questionServiceImpl.getCellValue(row.getCell(6));
					user.setTel(phone);
					String email = questionServiceImpl.getCellValue(row.getCell(7));
					user.setEmail(email);
					String description = questionServiceImpl.getCellValue(row.getCell(8));
					user.setDescription(description);
					user.setUserId(UUIDUtil.getUniqueIdByUUID());
					user.setImg(CoreConst.DEFAULT_IMG);
					user.setStatus(CoreConst.STATUS_VALID);
					user.setPassword(CoreConst.DEFAULT_PASSWORD);
					PasswordHelper.encryptPassword(user);
					users.add(user);
				}else {
					rows--;
				}
			}
		}
		int j = userMapper.batchInsert(users); //批量插入
		if(j > 0) {
			return ResultUtil.success("成功导入"+ rows + "名用户");
		}else {
			return ResultUtil.error("导入失败");
		}
	}

	@Override
	public int deleteBatch(List<String> userIds) {
		 Map<String,Object> params = new HashMap<String,Object>(1);
	     params.put("userIds",userIds);
		return userMapper.deleteBatch(params);
	}

	@Override
	public List<String> selectRoleByUserId(String userId) {
		return userMapper.selectRoleByUserId(userId);
	}
}