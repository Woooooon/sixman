package com.kh.sixman.document.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("document")
@Controller
public class DocumentController {

	//기안문서함
	@GetMapping("first")
	public String First() {
		return "document/first";
	}
	
	//결재상신()
	@GetMapping("approve")
	public String Approve() {
		return "document/approve";
	}
	
	//결재상신()
	@GetMapping("approvemy")
	public String ApproveMyPage() {
		return "document/approvemy";
	}
	
	//결재문서함
	@GetMapping("payment")
	public String mainDocu() {
		return "document/payment";
	}
	
	//참조문서함
	@GetMapping("reference")
	public String Reference() {
		return "document/reference";
	}
	
	//임시보관함
	@GetMapping("keep")
	public String Keep() {
		return "document/keep";
	}

	//결재선 작성
	@GetMapping("write")
	public String Write(){
		return "document/write";
	}
	
	
	
	

	
}
