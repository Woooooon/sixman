package com.kh.sixman.temp.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("approval")
@Controller
public class ApprovalController {

	@GetMapping("list")
	public String approvalList() {
		return "approval/list";
	}
	
	@GetMapping("write")
	public String approvalWrite() {
		return "approval/write";
	}
	
	@GetMapping("lineList")
	public String approvalLineList() {
		return "approval/lineList";
	}
	
	@GetMapping("lineAdd")
	public String approvalLineAdd() {
		return "approval/lineAdd";
	}
	
//	@PostMapping("lineAdd")
//	public String approvalLineAdd() {
//		return "approval/lineAdd";
//	}
	
	@GetMapping("detail")
	public String approvalDetail() {
		return "approval/detail";
	}
	
}
