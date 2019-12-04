package org.exam.service.impl;

import java.util.Date;
import java.util.List;

import org.exam.entity.Grade;
import org.exam.mapper.GradeMapper;
import org.exam.service.GradeService;
import org.exam.vo.GradeConditionVo;
import org.exam.vo.StatisticConditionVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
public class GradeServiceImpl extends BaseServiceImpl<Grade> implements GradeService {
	
	@Autowired
	private GradeMapper gradeMpper;
	
	@Override
	public List<Grade> findByCondition(GradeConditionVo vo) {
		return gradeMpper.findByCondition(vo);
	}

	@Override
	public Grade insertGrade(Grade grade) {
		Date date = new Date();
		grade.setCreateTime(date);
		grade.setUpdateTime(date);
		gradeMpper.insertSelective(grade);
		return grade;
	}

	@Override
	public Grade selectById(Integer id) {
		return gradeMpper.selectById(id);
		
	}

	@Override
	public int deleteBatch(Integer[] ids) {
		return gradeMpper.deleteBatch(ids);
	}

	@Override
	public Grade validateExam(Integer id, String userId) {
		return gradeMpper.validateExam(id,userId);
	}

	/* (non-Javadoc)
	 * @see org.exam.service.GradeService#getUserNumsAnalysis(org.exam.vo.StatisticConditionVo)
	 */
	@Override
	public List<Integer> getUserNumsAnalysis(StatisticConditionVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

}
