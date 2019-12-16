package org.exam.mapper;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.exam.entity.Examination;
import org.exam.util.MapperUtil;
import org.exam.vo.ExaminationConditionVo;
import org.exam.vo.SendEmailVo;

public interface ExaminationMapper extends MapperUtil<Examination> {
	
	int insertAndReturnId(Examination examination);
	
	/**
	 * 分页查询考试、关联课程
	 * @param vo
	 * @return
	 */
	List<Examination> findByCondition(ExaminationConditionVo vo);

	
	List<Examination> findByConditionOnly(ExaminationConditionVo vo);
	
	/**
	 * 统计指定考试的题目集合
	 * @param ids
	 * @return
	 */
	List<Examination> listQuestionsByExamId(List<Integer> ids);

	/**
	 * 根据id查询试卷
	 * @param id
	 * @return
	 */
	Examination ExaminationById(Integer id);
	
	Examination selectById(Integer id);

	int deleteBatch(Integer[] ids);

	int updateExamToStart(@Param("currentTime") Date currentTime);

	int updateExamToEnd(@Param("currentTime") Date currentTime);
	
	List<Examination> selectAllByStatus(Integer status);
	
	List<HashMap<String, Object>> recAddExamSta();
	
	/**
	 * 邮件通知对象+其他信息
	 * @return
	 */
	List<SendEmailVo> mailNotifyTarget();

}
