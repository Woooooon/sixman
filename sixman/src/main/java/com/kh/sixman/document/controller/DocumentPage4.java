package com.kh.sixman.document.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("document")
@Controller
public class DocumentPage4 {

	@GetMapping("mainkeep")
	public String mainFirst() {
		return "document/mainkeep";
	}
	
	

	
}