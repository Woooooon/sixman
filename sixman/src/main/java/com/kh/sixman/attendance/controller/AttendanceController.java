package com.kh.sixman.attendance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("attendance")
@Controller
public class AttendanceController {
	
	@GetMapping("board")
	public String test(){
		return "attendance/attendanceBoard";
	}
	
	@GetMapping("admin")
	public String test2(){
		return "attendance/attendanceAdmin";
	}
	
	@GetMapping("calendar")
	public String test3(){
		return "attendance/attendanceCalendar";
	}
	

}
