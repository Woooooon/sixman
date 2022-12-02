package com.kh.sixman.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public final class MemberController {

	@GetMapping("")
	public String login(){
		return "member/login";
	}
	
}
