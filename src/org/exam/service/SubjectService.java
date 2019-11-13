package org.exam.service;

import java.util.List;
import java.util.Map;

import org.exam.entity.Question;
import org.exam.entity.Subject;


public interface SubjectService extends BaseService<Subject> {
	
	List<Subject> selectSubjects(Subject subject);
	
    int deleteBatch(Integer[] ids);
    
    Subject selectById(Integer id);
    
    Subject subjectFromAttendance(Integer id);

    /**
     * 验证该课程是否有子数据
     * @param ids
     * @return
     */
	Question validateBySubjectIds(Integer[] ids);

	int totalNum();


}
