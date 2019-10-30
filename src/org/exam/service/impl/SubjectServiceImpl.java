package org.exam.service.impl;

import java.util.List;

import org.exam.entity.Question;
import org.exam.entity.Subject;
import org.exam.mapper.QuestionMapper;
import org.exam.mapper.SubjectMapper;
import org.exam.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class SubjectServiceImpl extends BaseServiceImpl<Subject> implements SubjectService {
	
	@Autowired
	private SubjectMapper subjectMapper;
	@Autowired
	private QuestionMapper questionMapper;

	@Override
	public List<Subject> selectSubjects(Subject subject) {
		return subjectMapper.selectSubjects(subject);
	}

	@Override
	public int deleteBatch(Integer[] ids) {
		return subjectMapper.deleteBatch(ids);
	}

	@Override
	public Subject selectById(Integer id) {
		return subjectMapper.selectById(id);
	}

	@Override
	public Question validateBySubjectIds(Integer[] ids) {
		return questionMapper.validateBySubjectIds(ids);
	}

	@Override
	public int totalNum() {
		return subjectMapper.totalNum();
	}

}
