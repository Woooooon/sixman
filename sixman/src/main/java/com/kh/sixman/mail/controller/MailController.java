package com.kh.sixman.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("mail")
@Controller
public class MailController {
	
	@GetMapping("list")
	public String list() {
		return "mail/list";
	}
	
	@GetMapping("write")
	public String write() {
		return "mail/write";
	}
	
	@GetMapping("detail")
	public String detail() {
		return "mail/detail";
	}

}
