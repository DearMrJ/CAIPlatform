package org.exam.mapper;

import java.util.List;

import org.exam.entity.ExamQuestion;
import org.exam.util.MapperUtil;

public interface ExamQuestionMapper extends MapperUtil<ExamQuestion>{

	List<ExamQuestion> selectByExamId(Integer examId);

	int deleteBatch(Integer[] ids);
	
	

}
