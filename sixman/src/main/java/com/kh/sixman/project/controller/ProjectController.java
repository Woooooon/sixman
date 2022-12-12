package com.kh.sixman.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import oracle.jdbc.proxy.annotation.GetCreator;

@RequestMapping("project")
@Controller
public class ProjectController {

	//프로젝트 전체보기(화면)
	@GetMapping("main")
	public String main() {
		return "project/main";
	}

	//프로젝트 생성(화면)
	@GetMapping("create")
	public String create(){
		return "project/create";
	}
	
	//프로젝트 상세보기(화면)
	@GetMapping("detail")
	public String detail() {
		return "project/detail";
	}

}
