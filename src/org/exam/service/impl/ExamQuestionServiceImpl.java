package org.exam.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.exam.entity.ExamQuestion;
import org.exam.mapper.ExamQuestionMapper;
import org.exam.service.ExamQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.mybatis.mapper.entity.Example;

@Service
public class ExamQuestionServiceImpl extends BaseServiceImpl<ExamQuestion> implements ExamQuestionService {

	@Autowired
	private ExamQuestionMapper examQuestionMapper;
	
	
	@Override
	public int removeByExamId(Integer examId) {
		Example example = new Example(ExamQuestion.class);
		Example.Criteria criteria = example.createCriteria();
		criteria.andEqualTo("examId", examId);
		return examQuestionMapper.deleteByExample(example);
	}

	@Override
	public void insertList(Integer examId, Integer[] questionIds) {
		Date date = new Date();
		List<ExamQuestion> examQuestions = new ArrayList<>();
		for(Integer questionId : questionIds) {
			ExamQuestion examQuestion = new ExamQuestion();
			examQuestion.setExamId(examId);
			examQuestion.setQuestionId(questionId);
			examQuestionMapper.insert(examQuestion);
		}
	}

	@Override
	public List<ExamQuestion> selectByExamId(Integer examId) {
		return examQuestionMapper.selectByExamId(examId);
	}

	@Override
	public int deleteBatch(Integer[] ids) {
		return examQuestionMapper.deleteBatch(ids);
	}

}
