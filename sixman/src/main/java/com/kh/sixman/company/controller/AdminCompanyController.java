package com.kh.sixman.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminCompanyController {

	@GetMapping("admin/company/edit")
	public String edit() {
		return "admin/company/edit";
	}
	
	@GetMapping("admin/company/test")
	public String test() {
		return "admin/company/test";
	}

}
