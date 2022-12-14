package com.kh.sixman.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("schedule")
@Controller
public class ScheduleController {

	//일정 (화면)
	@GetMapping("calendar")
	public String main() {
		return "schedule/calendar";
	}
	
	//주간일정(화면)
	@GetMapping("weeks")
	public String weeks() {
		return "schedule/weeks";
	}
	
	@GetMapping("newcalendar")
	public String calendar() {
		return "schedule/newcalendar";
	}
	
}
