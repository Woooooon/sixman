package com.kh.sixman.document.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("document")
@Controller
public class DocumentPage3 {

	@GetMapping("mainreference")
	public String mainFirst() {
		return "document/mainreference";
	}
	
	

	
}
