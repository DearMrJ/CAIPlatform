package org.exam.controller;

import java.util.Date;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.exam.entity.Question;
import org.exam.entity.Subject;
import org.exam.entity.User;
import org.exam.service.SubjectService;
import org.exam.util.CoreConst;
import org.exam.util.PageUtil;
import org.exam.util.ResultUtil;
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
@RequestMapping("subject")
public class SubjectController {
	
	@Autowired
	private SubjectService subjectService;
	
	@GetMapping("list")
	public String list(){
		return "subject/list";
	}
	
	
	@GetMapping("totalView")
	public String totalView(Model model){
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		Subject subject = new Subject();
		subject.setUserId(user.getUserId());
		List<Subject> subjects = subjectService.selectSubjects(subject);
		model.addAttribute("subjects", subjects);
		return "subject/totalView";
	}
	
	@GetMapping("teacherView")
	public String teacherView(){
		return "subject/teacherView";
	}
	
	
	
	
	@PostMapping("list")
	@ResponseBody
	public PageResultVo loadSubject(Subject subject, Integer limit, Integer offset){
		PageHelper.startPage(PageUtil.getPageNo(limit, offset),limit);
		List<Subject> subjectList = subjectService.selectSubjects(subject);
		PageInfo<Subject> pages = new PageInfo<>(subjectList);
		return ResultUtil.table(subjectList, pages.getTotal(), pages);
	}
	
	/**
	 * 新增课程
	 * @param subject
	 * @return
	 */
	@PostMapping("/add")
	@ResponseBody
	public ResponseVo add(Subject subject) {
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		subject.setUserId(user.getUserId());	//创建者
		subject.setAuthor(user.getNickname());
		Date date = new Date();
		subject.setCreateTime(date);
		subject.setUpdateTime(date);
		subject.setStatus(CoreConst.STATUS_VALID);
		int i = subjectService.insert(subject);
		if(i > 0) {
			return ResultUtil.success("新增课目成功！");
		}else {
			return ResultUtil.error("新增课目失败！");
		}
	}
	
	/**
	 * 编辑课程信息
	 * @param model
	 * @param id
	 * @return
	 */
	@GetMapping("/edit")
	public String edit(Model model, Integer id) {
		Subject subject = subjectService.selectById(id);
		model.addAttribute("subject", subject);
		return "subject/detail";
	}
	
	@PostMapping("/edit")
	@ResponseBody
	public ResponseVo edit(Subject subject) {
		subject.setUpdateTime(new Date());
		int i = subjectService.update(subject);
		if( i > 0) {
			return ResultUtil.success("编辑课目成功！");
		}else {
			return ResultUtil.error("编辑课目失败！");
		}
	}
	
	/**
	 * 删除课目
	 * @param id
	 * @return
	 */
	@PostMapping("/delete")
	@ResponseBody
	public ResponseVo delete(Integer id) {
		//验证该课程是否存在题目
		Question question = subjectService.validateBySubjectIds(new Integer[] {id});
		if(question.getCounts() > 0) {
			return ResultUtil.error("无法删除，题库中存在该课程的题目！");
		}else {
			int i = subjectService.deleteBatch(new Integer[] {id});
			if(i > 0) {
				return ResultUtil.success("删除课目成功！");
			}else {
				return ResultUtil.error("删除课目失败！");
			}
		}
	}
	
	/**
	 * 批量删除课程
	 * @param ids
	 * @return
	 */
	@PostMapping("/batch/delete")
	@ResponseBody
	public ResponseVo deleteBatch(@RequestParam("ids[]") Integer[]ids) {
		//验证该课程是否存在题目
		Question question = subjectService.validateBySubjectIds(ids);
		if(question.getCounts() > 0) {
			return ResultUtil.error("无法删除，题库中存在该课程的题目！");
		}else {
			int i = subjectService.deleteBatch(ids);
			if(i > 0) {
				return ResultUtil.success("批量删除课程成功！");
			}else {
				return ResultUtil.error("批量删除课程失败！");
			}
		}
	}
}
