package org.exam.controller;

import java.util.List;

import org.exam.exception.ExamException;
import org.exam.service.GradeService;
import org.exam.util.ResultUtil;
import org.exam.vo.StatisticConditionVo;
import org.exam.vo.base.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("data")
public class StatisticsController {
	
	@Autowired
	private GradeService gradeService;

	
	@PostMapping("list")
	@ResponseBody
	public ResponseVo loadData(Integer examId, String grade, Integer facultyId, Integer classId, Integer subjectId) {
		try {
			StatisticConditionVo vo = new StatisticConditionVo();
			vo.setExamId(examId);
			vo.setGrade(grade);
			vo.setFacultyId(facultyId);
			vo.setClassId(classId);
			vo.setSubjectId(subjectId);
			List<Integer> userList = gradeService.getUserNumsAnalysis(vo);
			if(!userList.isEmpty()) {
				return ResultUtil.success("数据更新成功", userList);
			}else {
				return ResultUtil.error("数据获取失败");
			}
		} catch (ExamException e) {
			return ResultUtil.error("该门考试还一张卷子都没改呢~");
		} catch (Exception e) {
			return ResultUtil.error("服务器内部异常！");
		}
	}
}
