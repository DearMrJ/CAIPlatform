package org.exam.controller;

import java.util.Arrays;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.exam.entity.Examination;
import org.exam.entity.Grade;
import org.exam.entity.Question;
import org.exam.entity.User;
import org.exam.service.ExaminationService;
import org.exam.service.GradeService;
import org.exam.service.UserService;
import org.exam.util.CoreConst;
import org.exam.util.PageUtil;
import org.exam.util.ResultUtil;
import org.exam.vo.GradeConditionVo;
import org.exam.vo.base.PageResultVo;
import org.exam.vo.base.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("grade")
public class GradeController {
	
	@Autowired
	private GradeService gradeService;
	@Autowired
	private ExaminationService examService;
	@Autowired
	private UserService userService;
	
	@GetMapping("list")
	public String listOfGrade(Model model,GradeConditionVo gradeConditionVo) {
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		List<String> roleList = userService.selectRoleByUserId(user.getUserId());
		if(!roleList.contains("administrator")) {
			if(roleList.contains("teacher")) {
				gradeConditionVo.setAuthor(user.getNickname());
			}else {
				gradeConditionVo.setUserId(user.getUserId());
			}
		}
		List<Grade> gradeList = gradeService.findByCondition(gradeConditionVo);
		PageInfo<Grade> pages = new PageInfo<>(gradeList);
		model.addAttribute("table",ResultUtil.table(gradeList, pages.getTotal(), pages));
		return "grade/list";
	}
	
	@PostMapping("list")
	@ResponseBody
	public PageResultVo loadGrade(GradeConditionVo gradeConditionVo, Integer limit, Integer offset) {
		PageHelper.startPage(PageUtil.getPageNo(limit, offset),limit);
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		List<String> roleList = userService.selectRoleByUserId(user.getUserId());
		if(!roleList.contains("administrator")) {
			if(roleList.contains("teacher")) {
				gradeConditionVo.setAuthor(user.getNickname());
			}else {
				gradeConditionVo.setUserId(user.getUserId());
			}
		}
		List<Grade> gradeList = gradeService.findByCondition(gradeConditionVo);
		PageInfo<Grade> pages = new PageInfo<>(gradeList);
		return ResultUtil.table(gradeList, pages.getTotal(), pages);
	}
	
	/**
	 * 批阅试卷
	 * @param grade
	 * @return
	 */
	@GetMapping("/mark")
	public String mark(Model model, Integer id) {
		Grade grade = gradeService.selectById(id);
		List<String> answerStr = Arrays.asList(grade.getAnswerJson().split("~_~"));
		Examination examination = examService.queryByExamId(grade.getExamId());//获取目标试卷+题集+答案
		long examTime = (examination.getEndTime().getTime()-examination.getStartTime().getTime())/(1000*60);
		examination.setExamTime(examTime);
		List<Question> questions = examination.getQuestions();
		for(int i = 0; i < questions.size(); i++) {
			Question question = questions.get(i);
			question.setStuAnswer(answerStr.get(i));
		}
		User user = userService.selectByUserId(grade.getUserId());
		grade.setExamination(examination);
		grade.setUser(user);
		model.addAttribute("grade", grade);
		System.out.println(grade.getId());
		model.addAttribute("gradeJson", JSON.toJSONString(grade));
		return "grade/mark";
	}
	
	@PostMapping("/mark")
	@ResponseBody
	public ResponseVo mark(@RequestBody Grade grade) {//id + manulResult
		try {
			System.err.println(grade.getId());
			System.err.println(grade.getManulResult());
			Grade obj = gradeService.selectById(grade.getId());
			grade.setResult(obj.getAutoResult()+grade.getManulResult());//自动阅卷+手工阅卷
			if(grade.getResult() == 0) {
				grade.setStatus(CoreConst.EXAM_END);
			}
			int userScore = grade.getResult();
			int examScore = obj.getExamination().getTotalScore();
			float score = (float)userScore/examScore;
			if(score < 0.6) {
				grade.setStatus(CoreConst.EXAM_END);
			}else if(score >= 0.9) {
				grade.setStatus(CoreConst.EXAM_FINE);
			}else if(score >= 0.8) {
				grade.setStatus(CoreConst.EXAM_GOOD);
			}else if(score >= 0.6) {
				grade.setStatus(CoreConst.EXAM_STANDARD);
			}
			gradeService.updateNotNull(grade);
			return ResultUtil.success("批阅成功");
		} catch (Exception e) {
			System.err.println(e);
			return ResultUtil.success("批阅失败");
		}
	}
	
	/**
	 * 查看成绩详情
	 * @param model
	 * @param id
	 * @return
	 */
	@GetMapping("/detail")
	public String detail(Model model, Integer id) {
		Grade grade = gradeService.selectById(id);
		List<String> answerStr = Arrays.asList(grade.getAnswerJson().split("~_~"));
		Examination examination = examService.queryByExamId(grade.getExamId());
		long examTime = (examination.getEndTime().getTime()-examination.getStartTime().getTime())/(1000*60);
		examination.setExamTime(examTime);
		List<Question> questions = examination.getQuestions();
		for(int i = 0; i < questions.size(); i++) {
			Question question = questions.get(i);
			question.setStuAnswer(answerStr.get(i));
		}
		User user = userService.selectByUserId(grade.getUserId());
		grade.setExamination(examination);
		grade.setUser(user);
		model.addAttribute("grade", grade);
		return "grade/detail";
	}
	
	
	/**
	 * 单个删除成绩
	 * @param id
	 * @return
	 */
	@PostMapping("/delete")
	@ResponseBody
	public ResponseVo delete(Integer id) {
		int i = gradeService.deleteBatch(new Integer[] {id});
		if(i > 0) {
			return ResultUtil.success("删除成绩成功");
		}else {
			return ResultUtil.error("删除成绩失败");
		}
	}
	
	/**
	 * 批量删除成绩
	 * @param ids
	 * @return
	 */
	@PostMapping("/batch/delete")
	@ResponseBody
	public ResponseVo deleteBatch(@RequestParam("ids[]") Integer[] ids) {
		int i = gradeService.deleteBatch(ids);
		if(i > 0) {
			return ResultUtil.success("批量删除成绩成功");
		}else {
			return ResultUtil.error("批量删除成绩失败");
		}
	}
	
}
