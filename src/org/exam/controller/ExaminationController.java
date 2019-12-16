package org.exam.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.exam.entity.Classes;
import org.exam.entity.ExamQuestion;
import org.exam.entity.Examination;
import org.exam.entity.Subject;
import org.exam.entity.User;
import org.exam.service.ClassesService;
import org.exam.service.ExamQuestionService;
import org.exam.service.ExaminationService;
import org.exam.service.SubjectService;
import org.exam.service.UserService;
import org.exam.util.CoreConst;
import org.exam.util.PageUtil;
import org.exam.util.ResultUtil;
import org.exam.vo.ExaminationConditionVo;
import org.exam.vo.base.PageResultVo;
import org.exam.vo.base.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("exam")
public class ExaminationController {
	
	@Autowired
	private ExaminationService examService;
	
	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ExamQuestionService examQuestionService;
	
	@Autowired
	private ClassesService classesService;

	
	@GetMapping("list")
	public String loadExamList() {
		return "exam/list";
	}
	
	
	@PostMapping("list")
	@ResponseBody
	public PageResultVo loadExam(ExaminationConditionVo vo,Integer limit, Integer offset) {
		examService.updateExamToStart();
		examService.updateExamToEnd();
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		List<String> roleList = userService.selectRoleByUserId(user.getUserId());
		if(!roleList.contains("administrator")) {//当前非管理员，管理员返回所有
			if(roleList.contains("teacher")) {//当前是teacher，会根据昵称返回
				vo.setAuthor(user.getNickname());
			}else {
				vo.setClassId(user.getClassId());//如果是其他，根据班级返回
			}
		}
		PageHelper.startPage(PageUtil.getPageNo(limit, offset), limit);
		List<Examination> examList = examService.findByCondition(vo);
		PageInfo<Examination> pages = new PageInfo<>(examList);
		return ResultUtil.table(examList, pages.getTotal(), pages);
	}
	
	@PostMapping("record")
	@ResponseBody
	public PageResultVo loadRecord(ExaminationConditionVo vo,Integer limit, Integer offset) {
		examService.updateExamToStart();
		examService.updateExamToEnd();
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		List<String> roleList = userService.selectRoleByUserId(user.getUserId());
		if(!roleList.contains("administrator")) {//当前非管理员，管理员返回所有
			if(roleList.contains("teacher")) {//当前是teacher，会根据昵称返回
				vo.setAuthor(user.getNickname());
				System.err.println(1111);
			}else {
				vo.setClassId(user.getClassId());//如果是其他，根据班级返回
			}
		}
		PageHelper.startPage(PageUtil.getPageNo(limit, offset), limit);
		List<Examination> examList = examService.findByConditionOnly(vo);
		PageInfo<Examination> pages = new PageInfo<>(examList);
		return ResultUtil.table(examList, pages.getTotal(), pages);
	}
	
	
	@GetMapping("/add")
	public String addExam(Model model) {
		Subject subject = new Subject();
		subject.setStatus(CoreConst.STATUS_VALID);
		List<Subject> subjects = subjectService.selectSubjects(subject);
		List<String> grades = userService.selectGradeList();
		List<Classes> classes = classesService.selectAll();
		grades.removeAll(Collections.singleton(""));//剔除老师grade为''的影响，返回值boolean
		model.addAttribute("subjects", subjects);
		model.addAttribute("classes", classes);
		model.addAttribute("grades", grades);
		return "exam/publish";
	}
	
	
	@PostMapping("add")
	@ResponseBody
	public ResponseVo add(Examination examination , Integer[] question) {//指定测试/考试 类型
		try {
			System.err.println(Arrays.toString(question));
			if(null == question) {
				return ResultUtil.error("试题集控，发布考试失败");
			}
			User user = (User)SecurityUtils.getSubject().getPrincipal();
			examination.setUserId(user.getUserId());
			examination.setAuthor(user.getNickname());
			Examination exam = examService.insertExam(examination);
			examQuestionService.insertList(exam.getId(),question);
			return ResultUtil.success("发布考试成功");
		} catch (Exception e) {
			e.printStackTrace();
			return ResultUtil.error("发布考试失败");
		}
	}
	
	@GetMapping("/edit")
	public String edit(Model model, Integer id) {
		Examination examination = examService.selectById(id);
		model.addAttribute("examination", examination);
		Subject subject = new Subject();
		subject.setStatus(CoreConst.STATUS_INVALID);
		List<Subject> subjects = subjectService.selectSubjects(subject);
		List<String> grades = userService.selectGradeList();
		List<Classes> classes = classesService.selectAll();
		model.addAttribute("subjects", subjects);
		model.addAttribute("classes", classes);
		model.addAttribute("grades", grades);
		List<ExamQuestion> examQuestions = examQuestionService.selectByExamId(id);
		List<Integer> questionIds = new ArrayList<>();
		for(ExamQuestion examQuestion : examQuestions) {
			questionIds.add(examQuestion.getQuestionId());
		}
		model.addAttribute("questionIds", questionIds);
		return "exam/detail";
	}
	
	@PostMapping("/edit")
	@ResponseBody
	public ResponseVo edit(Examination examination, Integer[]question) {
		examination.setStatus(0);
		examService.updateNotNull(examination);
		examQuestionService.removeByExamId(examination.getId());
		examQuestionService.insertList(examination.getId(),question);
		return ResultUtil.success("编辑考试成功");
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public ResponseVo delete(Integer id) {
		int i = examService.deleteBatch(new Integer[] {id});
		int j = examQuestionService.deleteBatch(new Integer[] {id});
		if(i > 0 && j > 0) {
			return ResultUtil.success("删除考试成功");
		}else {
			return ResultUtil.error("删除考试失败");
		}
	}
	
	@PostMapping("/batch/delete")
	@ResponseBody
	public ResponseVo deleteBatch(@RequestParam("ids[]") Integer[] ids) {
		int i = examService.deleteBatch(ids);
		int j = examQuestionService.deleteBatch(ids);
		if(i > 0 && j > 0) {
			return ResultUtil.success("批量删除成功");
		}else {
			return ResultUtil.error("批量删除失败");
		}
	}
	
}