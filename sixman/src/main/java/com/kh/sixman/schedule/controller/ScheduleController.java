package com.kh.sixman.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("schedule")
@Controller
public class ScheduleController {

	//일정 (화면)
	@GetMapping("main")
	public String main() {
		return "schedule/main";
	}
	
}
