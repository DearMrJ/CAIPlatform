package org.exam.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.exam.mapper.GradeMapper;
import org.exam.entity.Grade;
import org.exam.service.GradeService;
import org.exam.util.CoreConst;
import org.exam.vo.GradeConditionVo;
import org.exam.vo.StatisticConditionVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
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

	@Override
	public List<Integer> getUserNumsAnalysis(StatisticConditionVo vo) {
		//参加考试的总人数
		Integer totalUserNums = gradeMpper.getUserNums(vo);
		//未批阅的人数
		vo.setStatus(CoreConst.STATUS_INVALID);
		Integer noMarkUserNums = gradeMpper.getUserNums(vo);
		//（60分-79分）合格人数
		vo.setStatus(CoreConst.EXAM_STANDARD);
		Integer standardUserNums = gradeMpper.getUserNums(vo);
		//（80分-89）良好人数
		vo.setStatus(CoreConst.EXAM_GOOD);
		Integer goodUserNums = gradeMpper.getUserNums(vo);
		//（90分以上）优秀人数
		vo.setStatus(CoreConst.EXAM_FINE);
		Integer fineUserNums = gradeMpper.getUserNums(vo);
		//（60分以上）及格人数
		Integer passUserNums = standardUserNums+goodUserNums+fineUserNums;
		//（60分以下不含60分）不及格人数
		vo.setStatus(CoreConst.EXAM_END);
		Integer noPassUserNums = gradeMpper.getUserNums(vo);
		List<Integer> userList = new ArrayList<>();
		userList.add(totalUserNums);
		userList.add(noMarkUserNums);
		userList.add(passUserNums);
		userList.add(noPassUserNums);
		userList.add(standardUserNums);
		userList.add(goodUserNums);
		userList.add(fineUserNums);
		if(totalUserNums != 0) {
			BigDecimal b = new BigDecimal((float)passUserNums/(totalUserNums-noMarkUserNums));
			Integer passRate = (int) (b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue()*100);
			userList.add(passRate);
		}else {
			Integer passRate = 0;
			userList.add(passRate);
		}
		return userList;
	}
}
