package org.exam.service;

import java.util.List;

import org.exam.entity.Examination;
import org.exam.vo.ExaminationConditionVo;

public interface ExaminationService extends BaseService<Examination> {
	
	
	List<Examination> findByConditionOnly(ExaminationConditionVo vo);
	
	/**
	 * 分页查询所有考试
	 * @param vo
	 * @return
	 */
	List<Examination> findByCondition(ExaminationConditionVo vo);
	
	/**
	 * 发布考试
	 * @param examination
	 * @return
	 */

	Examination insertExam(Examination examination);

	/**
	 * 根据id查询考试
	 * @param id
	 * @return
	 */
	Examination selectById(Integer id);

	/**
	 * 删除与批量删除
	 * @param ids
	 * @return
	 */
	
	Examination queryByExamId(Integer id);
	
	
	int deleteBatch(Integer[] ids);
	
	/*
	 * 获取已经结束的考试
	 */
	List<Examination> selectAllByStatus(Integer status);

	boolean updateExamToStart();

	boolean updateExamToEnd();

}
