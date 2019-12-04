package org.exam.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.exam.mapper.ExaminationMapper;
import org.exam.mapper.QuestionMapper;
import org.exam.entity.Examination;
import org.exam.service.ExaminationService;
import org.exam.vo.ExaminationConditionVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

@Service
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
public class ExaminationServiceImpl extends BaseServiceImpl<Examination> implements ExaminationService {
	
	@Autowired
	private ExaminationMapper examMapper;
	
	@Autowired
	private QuestionMapper questionMapper;

	@Override
	public List<Examination> findByCondition(ExaminationConditionVo vo) {
		List<Examination> examList = examMapper.findByCondition(vo);
		if(!CollectionUtils.isEmpty(examList)) {
			List<Integer> ids = new ArrayList<>();
			for(Examination examination : examList) {
				ids.add(examination.getId());
			}
			//试卷集合
			List<Examination> listQuestion = examMapper.listQuestionsByExamId(ids);
			//listQuestion,重新组装数据为{id: Examination}
			Map<Integer, Examination> questionMap = new LinkedHashMap<>(listQuestion.size());
			//以试卷的id号为key 将 试卷 存入LinkedHashMap,保存顺序
			for(Examination examination : listQuestion) {
				questionMap.put(examination.getId(), examination);
			}
			for(Examination examination : examList) {
				Examination questionExam = questionMap.get(examination.getId());
				examination.setQuestions(questionExam.getQuestions());
			}
		}
		return examList;
	}

	@Override
	public Examination insertExam(Examination examination) {
		Date date = new Date();
		examination.setCreateTime(date);
		examination.setUpdateTime(date);
		examMapper.insertSelective(examination);
		return examination;
	}

	@Override
	public Examination selectById(Integer id) {
		return examMapper.selectById(id);
	}
	
	@Override
	public Examination queryByExamId(Integer id) {
		return examMapper.ExaminationById(id);
	}

	@Override
	public int deleteBatch(Integer[] ids) {
		return examMapper.deleteBatch(ids);
	}

	@Override
	public boolean updateExamToStart() {
		return examMapper.updateExamToStart(new Date()) > 0;
	}

	@Override
	public boolean updateExamToEnd() {
		return examMapper.updateExamToEnd(new Date()) > 0;
	}

	@Override
	public List<Examination> selectAllByStatus(Integer status) {
		return examMapper.selectAllByStatus(status);
	}

}
