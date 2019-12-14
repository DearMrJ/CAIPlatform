package org.exam.controller;

import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.exam.entity.Attendance;
import org.exam.entity.AttendanceSheet;
import org.exam.entity.Subject;
import org.exam.entity.User;
import org.exam.service.AttendanceService;
import org.exam.service.AttendanceSheetService;
import org.exam.service.SubjectService;
import org.exam.service.UserService;
import org.exam.util.PageUtil;
import org.exam.util.ResultUtil;
import org.exam.util.SemesterUtil;
import org.exam.vo.AttendanceConditionVo;
import org.exam.vo.base.PageResultVo;
import org.exam.vo.base.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
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
	
	
	
	@GetMapping("barChart")
	public String toBarChart() {
		return "attendance/barChart";
	}
	
	@GetMapping("attendance")
	public String toAttendance() {
		if (SecurityUtils.getSubject().isAuthenticated()) {
			return "index/attendance";
		}else {
			return "redirect:/login";
		}
	}
	
	
	@GetMapping("check")
	public String toCheck(Model model, Integer id) {
		Subject subject = subjectService.selectById(id);
		Attendance attendance = new Attendance();
		attendance.setSubjectId(id);;
		int count = attendanceService.countByCondition(attendance);
		model.addAttribute("count",count);
		model.addAttribute("subject", subject);
		return "attendance/check";
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
		if (!roleList.contains("administrator")) {//炒鸡管理员不可以是teacher
			if (roleList.contains("teacher")) {
				vo.setTeacherUserId(user.getUserId());
				attendanceList = attendanceService.findByCondition(vo);
				System.err.println(attendanceList);
			}else {
				vo.setStudentUserId(user.getUserId());
				vo.setType(1);//仅回显全体签到
				attendanceList = attendanceService.listOngoingAttendances(vo);
			}
		}
		//管理是否可看到所有考勤？
		attendanceList = attendanceService.findByCondition(vo);
		PageInfo<Attendance> pages = new PageInfo<>(attendanceList);
		return ResultUtil.table(attendanceList, pages.getTotal(), pages);
	}
	
	@GetMapping("list")
	public String add(Model model) {
		//
		//
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		Subject subject = new Subject();
		subject.setUserId(user.getUserId());
//		subject.setAuthor(user.getNickname());
		//只返回个人所带课程信息
		List<Subject> subjects = subjectService.selectSubjects(subject);
		model.addAttribute("subjects",subjects);
		return "attendance/list";
	}
	
	/**
	 * 作跳转数据中转(id)
	 * @param model
	 * @param id
	 * @return
	 */
	@GetMapping("publish")
	public String showDetail(Model model, Integer id) {
		//subject、status、class、username、nickname
		model.addAttribute("id", id);//此处可以前端页面间传值替代
		return "attendance/publish";
	}
	
	/**
	 * 查看考勤明细
	 * @param id
	 * @param limit
	 * @param offset
	 * @return
	 */
	@PostMapping("publish")
	@ResponseBody
	public PageResultVo showDetail(AttendanceConditionVo vo, Integer limit, Integer offset) {
		//subject、status、class、username、nickname
		PageHelper.offsetPage(PageUtil.getPageNo(limit, offset), limit);
		List<AttendanceSheet> recordList = attendanceSheetService.currentCheckInRecords(vo);
		PageInfo<AttendanceSheet> pages = new PageInfo<>(recordList);
		return ResultUtil.table(recordList, pages.getTotal(), pages);
	}
	
	
	@GetMapping("add")
	public String addCondition(Model model) {
		//
		//
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		Subject subject = new Subject();
		subject.setUserId(user.getUserId());
//		subject.setAuthor(user.getNickname());
		//只返回个人所带课程信息
		List<Subject> subjects = subjectService.selectSubjects(subject);
		model.addAttribute("subjects",subjects);
		return "attendance/add";
	}
	
	
	
	@PostMapping("/add")
	@ResponseBody
	public ResponseVo add(Attendance attendance) {
		try {
			User user = (User) SecurityUtils.getSubject().getPrincipal();
			attendance.setUserId(user.getUserId());
			attendance.setAuthor(user.getNickname());
			String year = SemesterUtil.getYear();
			int term = SemesterUtil.getTerm();
			attendance.setYear(year);
			attendance.setTerm(term);
			Date date = new Date();
			attendance.setCreateTime(date);
			attendance.setUpdateTime(date);
			if (null == attendance.getStartTime() && null == attendance.getEndTime()) {
				attendance.setStartTime(date);
				attendance.setEndTime(new Date(date.getTime()+600000));//10分钟
			}
			if (null==attendance.getType()) {
				attendance.setType(1);
			}
			if (attendance.getStartTime().compareTo(date)>0) {
				attendance.setStatus(0);
			}else if (attendance.getStartTime().compareTo(date)<=0 && attendance.getEndTime().compareTo(date)>0) {
				attendance.setStatus(1);
			}else {
				attendance.setStatus(2);
			}
			System.err.println(attendance);
			//
			int count = attendanceService.insertAndReturnId(attendance);
			System.err.println(attendance.getId());
			List<AttendanceSheet> list = attendanceService.queryRecordForRandom(attendance.getId());
			return ResultUtil.success("发布考勤成功",list);
		} catch (Exception e) {
			System.err.println(e);
			return ResultUtil.error("发布考勤失败");
		}
	}
	
	@PostMapping("delete")
	@ResponseBody
	public ResponseVo removeAttendance(Integer id) {
		try {
			int count = attendanceService.delete(id);
			if (count>0) {
				return ResultUtil.success("删除成功~");
			}
			return ResultUtil.success("找不到记录，删除失败了QAQ");
		} catch (Exception e) {
			return ResultUtil.error("服务器大姨妈来了，删除失败了QAQ");
		}
	}
	
	@PostMapping("/batch/delete")
	@ResponseBody
	public ResponseVo batchRemoveAttendance(String idStr) {
		try {
			String[] attendanceIds = idStr.split(",");
			List<String> attendanceIdsList = Arrays.asList(attendanceIds);
			int count = attendanceService.deleteBatch(attendanceIdsList);
			if (count>0) {
				return ResultUtil.success("批量删除成功~");
			}else {
				return ResultUtil.success("木有找到记录，删除失败了~");
			}
		} catch (Exception e) {
			return ResultUtil.error("服务器它大姨妈来了，删除失败了QAQ");
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
	public PageResultVo checkInRecords(AttendanceConditionVo vo, Integer limit, Integer offset) {
		PageHelper.startPage(PageUtil.getPageNo(limit, offset), limit);
		List<AttendanceSheet> asList = attendanceSheetService.currentCheckInRecords(vo);
		System.out.println(asList);
		PageInfo<AttendanceSheet> pages = new PageInfo<>(asList);
		return ResultUtil.table(asList, pages.getTotal(), pages);
	}
	
	@GetMapping("/random")
	public String toRandom(Model model,Integer id) {
		model.addAttribute("id",id);
		return "attendance/random";
	}
	
	@PostMapping("/random")
	@ResponseBody
	public ResponseVo recordForRandom(Integer id) {
		List<AttendanceSheet> resultList = attendanceService.queryRecordForRandom(id);
		if (CollectionUtils.isEmpty(resultList)) {
			return ResultUtil.error("没有数据");
		}
		return ResultUtil.success("来了来了~", resultList);
	}
	
	@PostMapping("/checkIn")
	@ResponseBody
	public ResponseVo checkIn(Integer id, String userId) {
		try {
			/*********签到活动关闭校验**********/
			Attendance attendance = attendanceService.validateEnd(id);
			if (attendance==null) {
				return ResultUtil.error("签到活动已经关闭！");
			}
			/******************************/
			AttendanceSheet attendanceSheet = new AttendanceSheet();
			attendanceSheet.setAttendanceId(id);
			attendanceSheet.setUserId(userId);
			int count = attendanceSheetService.checkIn(attendanceSheet);
			if (count > 0) {
				return ResultUtil.success("签到成功，再接再厉呀臭弟弟~");
			}else {
				return ResultUtil.error("签到失败了QAQ");
			}
		} catch (Exception e) {
			return ResultUtil.error("后台出了点问题,签到失败了QAQ,请咨询代课教师！");
		}
	}
	
	/**
	 * teacher补签
	 * @param id
	 * @return
	 */
	@PostMapping("/checkInByTeacher")
	@ResponseBody
	public ResponseVo checkIn(Integer id) {
		try {
			int count = attendanceSheetService.checkInByTeacher(id);
			if (count > 0) {
				return ResultUtil.success("补签成功");
			}else {
				return ResultUtil.error("补签失败了QAQ");
			}
		} catch (Exception e) {
			
			return ResultUtil.error("后台出了点问题,补签失败了QAQ");
		}
	}
	/**
	 * 请假
	 * @param id
	 * @return
	 */
	@PostMapping("/onLeave")
	@ResponseBody
	public ResponseVo onLeave(Integer id) {
		try {
			AttendanceSheet attendanceSheet = new AttendanceSheet();
			attendanceSheet.setId(id);
			int checkIn = attendanceSheetService.onLeave(attendanceSheet);
			if (checkIn > 0) {
				return ResultUtil.success("操作成功");
			}else {
				return ResultUtil.error("操作失败了QAQ");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ResultUtil.error("后台出了点问题,操作失败了QAQ");
		}
	}
	/**
	 * teacher签退
	 * @param id
	 * @return
	 */
	@PostMapping("/checkOut")
	@ResponseBody
	public ResponseVo checkOut(Integer id) {
		try {
			AttendanceSheet attendanceSheet = new AttendanceSheet();
			attendanceSheet.setId(id);
			int checkIn = attendanceSheetService.checkOut(attendanceSheet);
			if (checkIn > 0) {
				return ResultUtil.success("签退成功");
			}else {
				return ResultUtil.error("签退失败了QAQ");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ResultUtil.error("后台出了点问题,签退失败了QAQ");
		}
	}
	

}
