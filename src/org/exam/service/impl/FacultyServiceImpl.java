package org.exam.service.impl;

import java.util.List;

import org.exam.entity.Classes;
import org.exam.entity.Faculty;
import org.exam.mapper.FacultyMapper;
import org.exam.service.FacultyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
public class FacultyServiceImpl extends BaseServiceImpl<Faculty> implements FacultyService {

	@Autowired
	private FacultyMapper facultyMapper;
	
	@Override
	public List<Faculty> selectFacultys(Faculty faculty) {
		return facultyMapper.selectFacultys(faculty);
	}
	
	@Override
	public Faculty selectById(Integer id) {
		return facultyMapper.selectById(id);
	}

	@Override
	public Classes validateByInsIds(Integer[] ids) {
		return facultyMapper.validateByInsIds(ids);
	}

	@Override
	public int deleteBatch(Integer[] ids) {
		return facultyMapper.deleteBatch(ids);
	}


}
