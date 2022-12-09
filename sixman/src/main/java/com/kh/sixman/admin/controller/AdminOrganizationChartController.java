package com.kh.sixman.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("admin/employee")
@Controller
public class AdminOrganizationChartController {
	
	@GetMapping("list")
	public String OrganizationChart() {
		return "admin/organizationChart/list";
	}
}
