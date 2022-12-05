package com.kh.sixman.organizationChart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrganizationChartController {

	@GetMapping("employee/list")
	public String OrganizationChart() {
		return "organizationChart/list";
	}
}
