package org.exam.controller;

import java.util.HashMap;
import java.util.List;

import org.exam.mapper.CommentMapper;
import org.exam.mapper.ExaminationMapper;
import org.exam.service.GradeService;
import org.exam.service.UserService;
import org.exam.util.ResultUtil;
import org.exam.vo.base.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class ExamApiController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private GradeService gradeService;
	
	@Autowired
	private ExaminationMapper examMapper;
	
	@Autowired
	private CommentMapper commentMapper;
	
	
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
	
	/**
	 * 未审核的留言
	 * @return
	 */
//	@PostMapping("/api/msg")
//	@ResponseBody
//	public ResponseVo noReadMessage() {
//		List<HashMap<String, Object>> messageList = commentMapper.noReadMessage();
//		if(!messageList.isEmpty()) {
//			return ResultUtil.success("数据更新成功", messageList);
//		}else {
//			return ResultUtil.error("暂时没有未审核的留言");
//		}
//	}
	
	/*@PostMapping("/api/uns")
	@ResponseBody
	public ResponseVo userNumSta(StatisticConditionVo vo) {
		List<HashMap<String, Object>> users = gradeService.examUserNumsAnalysis(vo);
		if(!users.isEmpty()) {
			return ResultUtil.success("数据更新成功", users);
		}else {
			return ResultUtil.error("没有数据");
		}
	}*/
	
}
