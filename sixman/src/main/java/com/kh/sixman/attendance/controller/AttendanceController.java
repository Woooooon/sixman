package com.kh.sixman.attendance.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.sixman.attendance.service.AttendanceService;
import com.kh.sixman.attendance.vo.AttendanceVo;

@RequestMapping("attendance")
@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService service;
	
	@GetMapping("board")
	public String board(Model model){
		
		Date date = new Date();
		SimpleDateFormat day = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat time = new SimpleDateFormat("HH:mm");
		
		model.addAttribute("day", day.format(date) );
		model.addAttribute("time", time.format(date) );
		
		List<AttendanceVo> voList = service.selectList();
		model.addAttribute("voList",voList);
		
		return "attendance/attendanceBoard";
	}
	
	@GetMapping("admin")
	public String admin(){
		return "attendance/attendanceAdmin";
	}
	
	@GetMapping("calendar")
	public String calendar(){
		return "attendance/attendanceCalendar";
	}
	

}
