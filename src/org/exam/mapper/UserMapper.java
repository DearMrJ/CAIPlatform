package org.exam.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.exam.entity.User;
import org.exam.util.MapperUtil;
import org.exam.vo.UserConditionVo;

public interface UserMapper extends MapperUtil<User> {
	
	/**
	 * 分页条件查询，关联学院，班级，角色
	 * @param vo
	 * @return
	 */
	List<User> findByCondition(UserConditionVo vo);
    /**
     * 根据user参数查询用户列表
     * @param user
     * @return list
     */
    List<User> selectUsers(User user);

    /**
     * 根据用户名查询用户
     * @param username
     * @return user
     */
    User selectByUsername(String username);

    /**
     * 根据用户ID查询用户
     * @param userId
     * @return user
     */
    User selectByUserId(String userId);

    /**
     * 更新最后登录时间
     * @param user
     */
    void updateLastLoginTime(User user);

    /**
     * 根据用户id更新用户信息
     * @param user
     * @return int
     */
    int updateByUserId(User user);

    /**
     * 根据参数批量修改用户状态
     * @param params
     * @return int
     */
    int updateStatusBatch(Map<String, Object> params);

    /**
     * 根据角色id查询用户list
     * @param roleId
     * @return list
     */
    List<User> findByRoleId(String roleId);

    /**
     * 根据角色id查询用户list
     * @param roleIds
     * @return list
     */
    List<User> findByRoleIds(List<String> roleIds);
    
    /**
     * 年级汇总
     * @return
     */
    List<String> selectGradeList();
    
    /**
     * 学院及学员人数统计
     */
    List<HashMap<String, Object>> academyPassNumSta();
    
    /**
     * 查询用户角色
     * @param userId
     * @return
     */
    List<String> selectRoleByUserId(String userId);
    
    @Select("select count(id) userNums from user")
    int userNums();
    /**
     * 批量导入用户
     * @param users
     * @return
     */
	int batchInsert(List<User> users);
	
	/**
	 * 批量删除
	 * @param params
	 * @return
	 */
	int deleteBatch(Map<String, Object> params);
}
