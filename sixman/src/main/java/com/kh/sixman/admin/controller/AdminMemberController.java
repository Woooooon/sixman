package com.kh.sixman.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("admin/member")
@Controller
public class AdminMemberController {
	
	@GetMapping("join")
	public String join() {
		return "admin/member/join";
	}
}
