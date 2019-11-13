package org.exam.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.exam.entity.Subject;
import org.exam.util.MapperUtil;

public interface SubjectMapper extends MapperUtil<Subject> {
	
	List<Subject> selectSubjects(Subject subject);
	
	int deleteBatch(Integer[] ids);
	
	Subject selectById(Integer id);
	
	Subject subjectFromAttendance(Integer id);

	@Select("select count(id) nums from subject")
	int totalNum();
}
