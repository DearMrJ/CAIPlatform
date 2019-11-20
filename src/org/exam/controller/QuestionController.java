package org.exam.controller;

import java.util.List;

import org.exam.entity.Question;
import org.exam.entity.Subject;
import org.exam.service.QuestionService;
import org.exam.service.SubjectService;
import org.exam.util.CoreConst;
import org.exam.util.PageUtil;
import org.exam.util.ResultUtil;
import org.exam.vo.QuestionConditionVo;
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

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("question")
public class QuestionController {
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private SubjectService subjectService;
	
	@PostMapping("list")
	@ResponseBody
	public PageResultVo loadQuestion(QuestionConditionVo questionConditionVo, Integer limit, Integer offset) {
		PageHelper.startPage(PageUtil.getPageNo(limit, offset),limit);
		List<Question> questionList = questionService.findByCondition(questionConditionVo);
		PageInfo<Question> pages = new PageInfo<>(questionList);
		return ResultUtil.table(questionList, pages.getTotal(),pages);
	}
	
	//添加题目
	@GetMapping("/add")
	public String addQuestion(Model model) {
		Subject subject = new Subject();
		subject.setStatus(CoreConst.STATUS_INVALID);
		List<Subject> subjects = subjectService.selectSubjects(subject);
		model.addAttribute("subjects", JSON.toJSONString(subjects));
		return "question/add";
	}
	
    @PostMapping("/add")
    @ResponseBody
    public ResponseVo add(Question question) {
    	try {
    		question.setStatus(CoreConst.STATUS_INVALID);
			Question questions = questionService.insertQuestion(question);
			return ResultUtil.success("新增题目成功！");
		} catch (Exception e) {
			return ResultUtil.error("新增题目失败！");
		}
    }
    
    @GetMapping("/edit")
    public String edit(Model model, Integer id) {
    	Question question = questionService.selectById(id);
    	model.addAttribute("question", question);
    	Subject subject = new Subject();
    	subject.setStatus(CoreConst.STATUS_INVALID);
    	List<Subject> subjects = subjectService.selectSubjects(subject);
    	model.addAttribute("subjects", JSON.toJSONString(subjects));
    	return "question/detail";
    }
    
    @PostMapping("/edit")
    @ResponseBody
    public ResponseVo edit(Question question) {
    	question.setStatus(CoreConst.STATUS_INVALID);
    	questionService.updateNotNull(question);
    	return ResultUtil.success("编辑题目成功");
    }
    
    /**
     * 删除
     * @param id
     * @return
     */
    @PostMapping("/delete")
    @ResponseBody
    public ResponseVo delete(Integer id) {
    	int i = questionService.deleteBatch(new Integer[]{id});
    	if(i > 0) {
    		return ResultUtil.success("删除题目成功");
    	}else {
    		return ResultUtil.error("删除题目失败");
    	}
    }
    /**
     * 批量删除
     * @param ids
     * @return
     */
    @PostMapping("/batch/delete")
    @ResponseBody
    public ResponseVo deleteBatch(@RequestParam("ids[]") Integer[]ids) {
    	int i = questionService.deleteBatch(ids);
    	if(i > 0) {
    		return ResultUtil.success("批量删除题目成功");
    	}else {
    		return ResultUtil.error("批量删除题目失败");
    	}
    }
    
}
