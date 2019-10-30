package org.exam.controller;

import java.util.HashMap;
import java.util.List;

import org.exam.entity.Examination;
import org.exam.mapper.ExaminationMapper;
import org.exam.service.ExaminationService;
import org.exam.service.GradeService;
import org.exam.service.UserService;
import org.exam.util.ResultUtil;
import org.exam.vo.base.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 进入控制台时——立即加载
 * @author Lynch
 */
//@Controller
public class DesktopController {

	@Autowired
	private UserService userService;
	@Autowired
	private GradeService gradeService;
	@Autowired
	private ExaminationService examinationService;
	@Autowired
	private ExaminationMapper examMapper;
	
	/**
	 * 学院及格人数统计接口
	 * @return
	 */
	@PostMapping("/api/aps")
	@ResponseBody
	public ResponseVo academyPassNumSta() {
		List<HashMap<String, Object>> list = userService.academyPassNumSta();
		if(!list.isEmpty()) {
			return ResultUtil.success("数据更新成功", list);
		}else {
			return ResultUtil.error("没有数据");
		}
	}
	
	/**
	 * 最近发布考试
	 * @return
	 */
	@PostMapping("/api/aes")
	@ResponseBody
	public ResponseVo recAddExamSta() {
		List<HashMap<String, Object>> examList = examMapper.recAddExamSta();
		if(!examList.isEmpty()) {
			return ResultUtil.success("数据更新成功", examList);
		}else {
			return ResultUtil.error("没有数据");
		}
	}
	
	
}
