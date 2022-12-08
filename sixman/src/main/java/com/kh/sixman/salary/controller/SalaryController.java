package com.kh.sixman.salary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SalaryController {
	
	@GetMapping("salary/salary")
	public String salary() {
		return("salary/salary");
	}
	
	@GetMapping("salary/salaryList")
	public String salaryList() {
		return("salary/salaryList");
	}


}
