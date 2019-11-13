package org.exam.controller;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.exam.entity.Attendance;
import org.exam.entity.AttendanceSheet;
import org.exam.entity.Grade;
import org.exam.entity.Subject;
import org.exam.entity.User;
import org.exam.service.AttendanceService;
import org.exam.service.AttendanceSheetService;
import org.exam.service.SubjectService;
import org.exam.service.UserService;
import org.exam.util.PageUtil;
import org.exam.util.ResultUtil;
import org.exam.vo.AttendanceConditionVo;
import org.exam.vo.base.PageResultVo;
import org.exam.vo.base.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * @author Lynch
 *
 */
@Controller
@RequestMapping("attendance")
public class AttendanceController {
	
	@Autowired
	private AttendanceService attendanceService;
	@Autowired
	private AttendanceSheetService attendanceSheetService;
	@Autowired
	private UserService userService;
	@Autowired
	private SubjectService subjectService;
	
	
	@GetMapping("attendance")
	public String toAttendance() {
		if (SecurityUtils.getSubject().isAuthenticated()) {
			return "index/attendance";
		}else {
			return "redirect:/login";
		}
	}
	
//	@GetMapping("list")
//	public String loadAttendance(Model model) {
//		//放入可选条件数据
//		//
//		User user = (User)SecurityUtils.getSubject().getPrincipal();
//		Subject subject = new Subject();
//		subject.setUserId(user.getUserId());
////		subject.setAuthor(user.getNickname());//特殊情况下不唯一
//		//只返回个人所带课程信息
//		List<Subject> subjects = subjectService.selectSubjects(subject);
//		model.addAttribute("subjects",subjects);
//		return "attendance/list";
//	}
	
	@PostMapping("list")
	@ResponseBody
	public PageResultVo loadAttendance(AttendanceConditionVo vo, Integer limit, Integer offset) {
		List<Attendance> attendanceList = null;
		//更新考勤活动状态
		attendanceService.updateAttendanceToStart();
		attendanceService.updateAttendanceToEnd();
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		List<String> roleList = userService.selectRoleByUserId(user.getUserId());
		PageHelper.startPage(PageUtil.getPageNo(limit, offset), limit);//最近一次查询有效
		if (!roleList.contains("超级管理员")) {
			if (roleList.contains("老师")) {
				vo.setTeacherUserId(user.getUserId());
				attendanceList = attendanceService.findByCondition(vo);
			}else {
				vo.setStudentUserId(user.getUserId());
				vo.setType(1);//仅回显全体签到
				attendanceList = attendanceService.listOngoingAttendances(vo);
			}
		}
		PageInfo<Attendance> pages = new PageInfo<>(attendanceList);
		return ResultUtil.table(attendanceList, pages.getTotal(), pages);
	}
	
	@GetMapping("/add")
	public String add(Model model) {
		//
		//
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		Subject subject = new Subject();
		subject.setAuthor(user.getUserId());
//		subject.setAuthor(user.getNickname());
		//只返回个人所带课程信息
		List<Subject> subjects = subjectService.selectSubjects(subject);
		model.addAttribute("subjects",subjects);
		return "attendance/publish";
	}
	
	
	@PostMapping("/add")
	@ResponseBody
	public ResponseVo add(Attendance attendance) {
		try {
			User user = (User) SecurityUtils.getSubject().getPrincipal();
			attendance.setUserId(user.getUserId());
			attendance.setAuthor(user.getNickname());
			//
			attendanceService.insertSelective(attendance);
			return ResultUtil.success("发布考勤成功");
		} catch (Exception e) {
			return ResultUtil.error("发布考勤失败");
		}
	}
	
	@GetMapping("/edit")
	public String edit(Model model) {
		//model.addXxx
		
		return "attendance/detail";
	}
	
	
	@PostMapping("/edit")
	@ResponseBody
	public ResponseVo edit(Attendance attendance, Integer id) {
		try {
			//
			//
			return ResultUtil.success("修改成功");
		} catch (Exception e) {
			return ResultUtil.error("修改失败");
		}
	}
	
	
	//删除
	
	
	/**
	 * 验证该用户是否已经参加过此次考勤
	 * @param id
	 * @return
	 */
	@PostMapping("/validate")
	@ResponseBody
	public ResponseVo validate(Integer id) {
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		AttendanceSheet ash  = attendanceSheetService.validate(id,user.getUserId());
		if(ash != null) {
			return ResultUtil.error("你已经参加过该场次考勤,不能再参加这场考勤了，如有疑问请咨询代课教师！");
		}else {
			return ResultUtil.success("请稍后,不要走开哟~");
		}
	}
	
	@GetMapping("/startAttendance")
	public String startToCheck(Model model,Integer id) {
		try {
			Attendance attendance = attendanceService.selectByPrimaryKey(id);
			Subject subject = subjectService.subjectFromAttendance(id);
			attendance.setSubject(subject);
			User user = (User) SecurityUtils.getSubject().getPrincipal();
			model.addAttribute("attendance", attendance);
			model.addAttribute("user", user);
			return "index/check";
		} catch (NullPointerException e) {
			System.err.println("【异常定位】====>org.exam.controller.AttendanceController.startToCheck()");
			System.err.println("空指针异常，请清空表后重新进入此页！");
			return "index/check";
		} catch (Exception e) {
			System.err.println("【异常定位】====>org.exam.controller.AttendanceController.startToCheck()");
			return "index/check";
		}
	}
	
	@PostMapping("/startAttendance")
	@ResponseBody
	public PageResultVo checkInRecords(Integer id, Integer limit, Integer offset) {
		PageHelper.startPage(PageUtil.getPageNo(limit, offset), limit);
		List<AttendanceSheet> asList = attendanceSheetService.currentCheckInRecords(id);
		System.out.println(asList);
		PageInfo<AttendanceSheet> pages = new PageInfo<>(asList);
		return ResultUtil.table(asList, pages.getTotal(), pages);
	}
	
	@PostMapping("/checkIn")
	@ResponseBody
	public ResponseVo checkIn(Integer id, String userId) {
		try {
			AttendanceSheet attendanceSheet = new AttendanceSheet();
			attendanceSheet.setAttendanceId(id);
			attendanceSheet.setUserId(userId);
			int checkIn = attendanceSheetService.checkIn(attendanceSheet);
			if (checkIn > 0) {
				return ResultUtil.success("签到成功，再接再厉呀臭弟弟~");
			}else {
				return ResultUtil.error("签到失败了QAQ");
			}
		} catch (Exception e) {
			return ResultUtil.error("后台出了点问题,签到失败了QAQ,请咨询代课教师！");
		}
	}

}
