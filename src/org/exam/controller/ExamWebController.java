package org.exam.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.exam.entity.Classes;
import org.exam.entity.Comment;
import org.exam.entity.Examination;
import org.exam.entity.Grade;
import org.exam.entity.Question;
import org.exam.entity.Subject;
import org.exam.entity.User;
import org.exam.service.ClassesService;
import org.exam.service.CommentService;
import org.exam.service.ExaminationService;
import org.exam.service.GradeService;
import org.exam.service.QuestionService;
import org.exam.service.SubjectService;
import org.exam.service.UserService;
import org.exam.shiro.ShiroRealm;
import org.exam.util.CopyUtil;
import org.exam.util.CoreConst;
import org.exam.util.IpUtil;
import org.exam.util.PasswordHelper;
import org.exam.util.ResultUtil;
import org.exam.util.XssKillerUtil;
import org.exam.vo.ChangePasswordVo;
import org.exam.vo.CommentConditionVo;
import org.exam.vo.GradeConditionVo;
import org.exam.vo.UserConditionVo;
import org.exam.vo.base.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class ExamWebController {
	
	@Autowired
	private ExaminationService examService;
	@Autowired
	private GradeService gradeService;
	@Autowired
	private QuestionService questionService;
	@Autowired
	private SubjectService subjectService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private UserService userService;
	@Autowired
    private ClassesService classesService;
	@Autowired
    private ShiroRealm shiroRealm;

	/**
	 * 考试界面
	 * @param model
	 * @param examConditionVo
	 * @return
	 */
	@GetMapping("/exam/examination")
	public String toExam() {
		if(SecurityUtils.getSubject().isAuthenticated()) {
			return "index/examination";
		}else {
			return "redirect:/login";
		}
	}
	
	/**
	 * 前端题库中心
	 * @param model
	 * @return
	 */
	
	@GetMapping("/exam/questions")
	public String toQuestion(Model model) {
		if(SecurityUtils.getSubject().isAuthenticated()) {
			Subject subject = new Subject();
			List<Subject> subjects = subjectService.select(subject);
			for(Subject s : subjects) {
				int num = questionService.countBySubjectId(s.getId());
				s.setNums(num);
			}
			model.addAttribute("subjects", subjects);
			return "index/question";
		}else {
			return "redirect:/login";
		}
	}
	
	/**
	 * 成绩查询
	 * @return
	 */
	@GetMapping("/exam/queryScore")
	public String queryScore(Model model) {
		if(SecurityUtils.getSubject().isAuthenticated()) {
			List<Examination> examList = examService.selectAllByStatus(CoreConst.EXAM_END);
			model.addAttribute("exams", examList);
			return "index/queryScore";
		}else {
			return "redirect:/login";
		}
	}
	
	@PostMapping("/exam/queryScore")
	@ResponseBody
	public ResponseVo queryScore(GradeConditionVo vo) {
		if(vo.getExamId() == null) {
			return ResultUtil.error("请选择要查询的考试科目");
		}
		if(vo.getStuId() == "") {
			return ResultUtil.error("请输入学号");
		}
		if(vo.getName() == "") {
			return ResultUtil.error("请输入姓名");
		}
		UserConditionVo userConditionVo = new UserConditionVo();
		userConditionVo.setUsername(vo.getStuId());
		userConditionVo.setNickname(vo.getName());
		List<User> users = userService.findByCondition(userConditionVo);
		if(users.isEmpty()) {
			return ResultUtil.error("学号或姓名不正确，请重新输入");
		}
		vo.setStatus(CoreConst.STATUS_VALID);
		List<Grade> grades = gradeService.findByCondition(vo);
		if(grades != null && !grades.isEmpty()) {
			return ResultUtil.success("查询成功", grades);
		}else {
			return ResultUtil.error("系统没有该同学的成绩记录，请确认学号和姓名");
		}
		
	}
	
	/**
	 * 留言板
	 * @return
	 */
	@GetMapping("/exam/comment")
	public String toComment() {
		if(SecurityUtils.getSubject().isAuthenticated()) {
			return "index/comment";
		}else {
			return "redirect:/login";
		}
		
	}
	@PostMapping("/exam/comment")
	@ResponseBody
	public PageInfo<Comment> getComments(CommentConditionVo vo){
		PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
		List<Comment> comments = commentService.selectComments(vo);
		PageInfo<Comment> pages = new PageInfo<>(comments);
		return pages;
	}
	
	@PostMapping("/exam/comment/save")
	@ResponseBody
	public ResponseVo saveComment(HttpServletRequest request, Comment comment) throws UnsupportedEncodingException{
		String content = comment.getContent();
		if(!XssKillerUtil.isValid(content)) {
			return ResultUtil.error("内容不合法");
		}
		content = XssKillerUtil.clean(content.trim()).replaceAll("(<p><br></P>)|(<p></p>)", "");
		Date date = new Date();
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		comment.setUserId(user.getUserId());
		comment.setUsername(user.getUsername());
		comment.setNickname(user.getNickname());
		comment.setAvatar(user.getImg());
		comment.setEmail(user.getEmail());
		comment.setContent(content);
		comment.setIp(IpUtil.getIpAddr(request));
		comment.setCreateTime(date);
		comment.setUpdateTime(date);
		int i = commentService.insertSelective(comment);
		if(i > 0) {
			return ResultUtil.success("留言已提交成功，系统正在审核");
		}else {
			return ResultUtil.error("留言提交失败");
		}
	}
	
	/**
	 * 点赞
	 * @param request
	 * @param vo
	 * @param supId
	 * @param loveType
	 * @return
	 */
//	@PostMapping("/exam/love")
//	@ResponseBody
//    public ResponseVo love(HttpServletRequest request, LoveConditionVo vo, Integer supId,Integer loveType) {
//    	Date date = new Date();
//    	String ip = IpUtil.getIpAddr(request);
//    	User user = (User)SecurityUtils.getSubject().getPrincipal();
//    	vo.setSupId(supId);
//    	vo.setLoveType(loveType);
//    	vo.setUserId(user.getUserId());
//    	vo.setUserIp(ip);
//    	Love loves = loveService.findByCondition(vo);
//    	if(loves == null) {
//    		Love love = new Love();
//    		love.setSupId(supId);
//    		love.setLoveType(loveType);
//    		love.setUserId(user.getUserId());
//    		love.setUserIp(ip);
//    		love.setCreateTime(date);
//    		love.setUpdateTime(date);
//    		loveService.insert(love);
//    		return ResultUtil.success("点赞成功");
//    	}else {
//    		return ResultUtil.error("您已经点过赞了");
//		}
//    }
	
	/**
	 * 个人主页
	 * @param model
	 * @param userId
	 * @return
	 */
	@GetMapping("/exam/personInfo")
	public String personal(Model model) {
		if(SecurityUtils.getSubject().isAuthenticated()) {
			User user = (User)SecurityUtils.getSubject().getPrincipal();
			List<Classes> classes = classesService.selectAll();
			User userInfo = userService.selectByUserId(user.getUserId());
			model.addAttribute("classes", classes);
			model.addAttribute("user", userInfo);
			return "index/personInfo";
		}else {
			return "redirect:/login";
		}
	}
	
	/**编辑用户资料*/
    @PostMapping("/exam/updatePersonal")
    @ResponseBody
    public ResponseVo updatePersonal(User user){
        int a = userService.updateByUserId(user);
        if(a > 0) {
        	return ResultUtil.success("保存个人信息成功");
        }else {
        	return ResultUtil.error("修改个人信息失败");
        }
    }
    
    /**
     * 修改密码
     * @param changePasswordVo
     * @return
     */
    @PostMapping("/exam/changePassword")
    @ResponseBody
    public ResponseVo changePassword(ChangePasswordVo changePasswordVo) {
    	if(!changePasswordVo.getNewPassword().equals(changePasswordVo.getConfirmNewPassword())) {
    		return ResultUtil.error("两次密码输入不一致");
    	}
    	User loginUser = userService.selectByUserId(((User) SecurityUtils.getSubject().getPrincipal()).getUserId());
    	User newUser = CopyUtil.getCopy(loginUser, User.class);
    	String sysOldPassword = loginUser.getPassword();
    	newUser.setPassword(changePasswordVo.getOldPassword());
    	String entryOldPassword = PasswordHelper.getPassword(newUser);
    	if(sysOldPassword.equals(entryOldPassword)) {
    		newUser.setPassword(changePasswordVo.getNewPassword());
    		PasswordHelper.encryptPassword(newUser);
    		userService.updateUserByPrimaryKey(newUser);
    		//*清除登录缓存*//
    		List<String> userIds = new ArrayList<>();
    		userIds.add(loginUser.getUserId());
    		shiroRealm.removeCachedAuthenticationInfo(userIds);
    	}else {
    		return ResultUtil.error("您输入的旧密码有误");
    	}
    	return ResultUtil.success("修改密码成功,请退出重新登录");
    }
	/**
	 * 开始考试
	 * @param model
	 * @param id
	 * @return
	 */
	@GetMapping("/exam/startexam")
	public String startToExam(Model model, Integer id) {
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		Examination examination = examService.queryByExamId(id);
		Map<String, Object> data = new HashMap<>();
		data.put("exam", examination);
		data.put("examJson", JSON.toJSONString(examination));
		model.addAttribute("data", data);
		model.addAttribute("user", user);
		String jsonString = JSON.toJSONString(examination);
		System.out.println(jsonString);
		return "index/detail";
	}
//	@GetMapping("/exam/startexam")
//	@ResponseBody
//	public Examination startToExam(Model model, Integer id) {
//		User user = (User)SecurityUtils.getSubject().getPrincipal();
//		Examination examination = examService.queryByExamId(id);
//		return examination;
//	}
	
	/**
	 * 验证该用户是否已经参加过考试
	 * @param id
	 * @return
	 */
	@PostMapping("/exam/validate")
	@ResponseBody
	public ResponseVo validate(Integer id) {
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		Grade grade  = gradeService.validateExam(id,user.getUserId());
		if(grade != null) {
			return ResultUtil.error("你已经参加过该场次考试,不能再参加这场考试了，如有疑问请咨询代课教师！");
		}else {
			return ResultUtil.success("你已进入考试，请规范答题，不得离开考试界面，否则成绩不计入考试结果");
		}
	}
	
	/**
	 * 提交考试
	 * @param grade
	 * @return
	 */
	@PostMapping("/exam/submitExam")
	@ResponseBody
	public ResponseVo submitExam(@RequestBody Grade grade) {
		try {
			User user = (User)SecurityUtils.getSubject().getPrincipal();
			List<String> answerStr = Arrays.asList(grade.getAnswerJson().split("~_~"));
			int autoResult = 0;
			StringBuffer autoStr = new StringBuffer();
			StringBuffer manulStr = new StringBuffer();
			Examination examination = examService.queryByExamId(grade.getExamId());
			List<Question> questions = examination.getQuestions();
			for(int i = 0; i < questions.size(); i++) {
				Question question = questions.get(i);
				//分别拼接 客观题 和 主观题 的答案
				if(question.getType() <= 1) {
					autoStr.append(answerStr.get(i)+"~_~");
				}else {
					manulStr.append(answerStr.get(i)+"~_~");
				}
				//(选择题) 客观题评分
				if(question.getType() <= 1 && question.getAnswer().equals(answerStr.get(i))) {
					autoResult += question.getScore();
				}
			}
			String autoJson = new String(autoStr);
			String manulJson = new String(manulStr);
			grade.setUserId(user.getUserId());
			grade.setAutoResult(autoResult);
			grade.setResult(autoResult);//初始总分为客观题得分
			grade.setAutoJson(autoJson);//学生客观题答案
			grade.setManulJson(manulJson);//学生主观题答案
			grade.setManulResult(0);
			grade.setStatus(CoreConst.STATUS_INVALID);
			Date date = new Date();
			grade.setCreateTime(date);
			grade.setUpdateTime(date);
			gradeService.insertSelective(grade);
			return ResultUtil.success("提交考试成功！");
		} catch (Exception e) {
			return ResultUtil.error("提交考试失败！请联系管理员处理");
		}
	}
}
