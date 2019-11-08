/**
 * 
 */
package org.exam.controller;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.exam.entity.Attendance;
import org.exam.entity.User;
import org.exam.service.AttendanceService;
import org.exam.util.PageUtil;
import org.exam.util.ResultUtil;
import org.exam.vo.AttendanceConditionVo;
import org.exam.vo.base.PageResultVo;
import org.exam.vo.base.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * @author Lynch
 *
 */
//@Controller("attendance")
public class AttendanceController {
	
	@Autowired
	private AttendanceService attendanceService;
	
	@GetMapping("list")
	public String loadAttendance(Model model) {
		//放入可选条件数据
		//
		return "attendance/list";
	}
	
	@PostMapping("list")
	@ResponseBody
	public PageResultVo loadAttendance(AttendanceConditionVo vo, Integer limit, Integer offset) {
		//更新考勤活动状态
		//
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		vo.setTeacherUsername(user.getUsername());
		List<Attendance> attendanceList = attendanceService.findByCondition(vo);
		PageHelper.startPage(PageUtil.getPageNo(limit, offset), limit);
		PageInfo<Attendance> pages = new PageInfo<>(attendanceList);
		return ResultUtil.table(attendanceList, pages.getTotal(), pages);
	}
	
	@GetMapping("/add")
	public String add(Model model) {
		//
		//
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
