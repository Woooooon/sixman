package com.kh.sixman.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	
	//이 페이지는 admin 하나로 통합되면 지우겠습니다~
	
	@GetMapping("/admin/project/consent")
	public String consent() {
		return "/admin/project/consent";
	}
	
}
