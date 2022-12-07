package com.kh.sixman.attendance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("attendance")
@Controller
public class AttendanceController {
	
	@GetMapping("attendanceBoard")
	public String login(){
		return "attendance/attendanceBoard";
	}
	

}
