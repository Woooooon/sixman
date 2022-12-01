package com.kh.sixman.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {

	@GetMapping("notice/list")
	public String list() {
		return "notice/list";
	}
	
	@GetMapping("notice/write")
	public String write() {
		return "notice/write";
	}
	
	@GetMapping("notice/detail")
	public String detail() {
		return "notice/detail";
	}
	
}
