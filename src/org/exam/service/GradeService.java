package org.exam.service;

import java.util.List;

import org.exam.entity.Grade;
import org.exam.vo.GradeConditionVo;
import org.exam.vo.StatisticConditionVo;
import org.springframework.stereotype.Service;


public interface GradeService extends BaseService<Grade> {
	
	/**
	 * 分页查询
	 * @param vo
	 * @return
	 */
	List<Grade> findByCondition(GradeConditionVo vo);
	
	/**
	 * 记录考试成绩
	 * @param grade
	 * @return
	 */
	
	Grade insertGrade(Grade grade);

	Grade selectById(Integer id);

	/**
	 * 批量删除成绩
	 * @param integers
	 * @return
	 */
	int deleteBatch(Integer[] integers);

	/**
	 * 验证该用户是否已经参加过考试
	 * @param id
	 * @param userId
	 * @return
	 */
	Grade validateExam(Integer id, String userId);
	
	/**
	 * 参加考试人数统计
	 * @return
	 */
	List<Integer> getUserNumsAnalysis(StatisticConditionVo vo);
	
}
