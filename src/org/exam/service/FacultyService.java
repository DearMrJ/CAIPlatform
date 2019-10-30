package org.exam.service;

import java.util.List;

import org.exam.entity.Classes;
import org.exam.entity.Faculty;

public interface FacultyService extends BaseService<Faculty> {
	
	/**
	 * 查询所有学院
	 * @param faculty
	 * @return
	 */
	List<Faculty> selectFacultys(Faculty faculty);

	/**
	 * 根据id查询学院信息
	 * @param id
	 * @return
	 */
	Faculty selectById(Integer id);

	/**
	 * 验证该学院下是否存在班级
	 * @param ids
	 * @return
	 */
	Classes validateByInsIds(Integer[] ids);

	/**
	 * 批量删除
	 * @param ids
	 * @return
	 */
	int deleteBatch(Integer[] ids);


}

