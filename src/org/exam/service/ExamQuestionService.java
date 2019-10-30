package org.exam.service;

import java.util.List;

import org.exam.entity.ExamQuestion;

public interface ExamQuestionService extends BaseService<ExamQuestion> {

	List<ExamQuestion> selectByExamId(Integer examId);
	/**
	 * 通过考试id删除考试-标签关联数据
	 * @param examId
	 * @return
	 */
	int removeByExamId(Integer examId);
	
	/**
	 * 批量添加试题
	 * @param questionIds
	 * @param examId
	 */
	void insertList(Integer examId, Integer[] questionIds);
	
	
	int deleteBatch(Integer[] ids);
}
