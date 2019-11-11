/**
 * 
 */
package org.exam.controller;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.exam.entity.Attendance;
import org.exam.entity.Subject;
import org.exam.entity.User;
import org.exam.service.AttendanceService;
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
	private UserService userService;
	@Autowired
	private SubjectService subjectService;
	
	
	@GetMapping("list")
	public String loadAttendance(Model model) {
		//放入可选条件数据
		//
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		Subject subject = new Subject();
		subject.setAuthor(user.getUsername());
		//只返回个人所带课程信息
		List<Subject> subjects = subjectService.selectSubjects(subject);
		model.addAttribute(subjects);
		return "attendance/list";
	}
	
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
				vo.setTeacherUsername(user.getUsername());
				attendanceList = attendanceService.findByCondition(vo);
			}else {
				vo.setStudentUsername(user.getUsername());
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
		subject.setAuthor(user.getUsername());
		//只返回个人所带课程信息
		List<Subject> subjects = subjectService.selectSubjects(subject);
		model.addAttribute(subjects);
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

}
