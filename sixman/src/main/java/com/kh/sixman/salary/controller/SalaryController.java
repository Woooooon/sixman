package com.kh.sixman.salary.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.salary.service.SalaryService;
import com.kh.sixman.salary.vo.SalaryVo;

@Controller
public class SalaryController {
	
	@Autowired
	private SalaryService service;
	
	@GetMapping("salary/salary")
	public String salary(@RequestParam Map<String, String> map ,Model model, SalaryVo vo, HttpSession session) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		String name= loginMember.getName();
		vo.setName(name);
		
		List<SalaryVo> voList = service.searchSelectList(vo);
		
		model.addAttribute("voList", voList);
		
		return("salary/salary");
	}
	
	@GetMapping("salary/salaryAdmin")
	public String salaryAdmin(@RequestParam Map<String, String> map ,Model model, SalaryVo vo, HttpSession session) {
		
		 //맴버선택
		List<MemberVo> memberList = service.ListMember();
		model.addAttribute("memberList", memberList);
		
		List<SalaryVo> voList = service.searchSelectList(vo);
		
		model.addAttribute("voList", voList);
		
		return("salary/salaryAdmin");
	}
	
	@PostMapping("salary/salaryAdmin")
	public String salaryAdmin2(@RequestParam Map<String, String> map ,Model model, SalaryVo vo, HttpSession session) {
		
		System.out.println(vo);
		
		int result = service.insertSalary(vo);
		
		 //맴버선택
		List<MemberVo> memberList = service.ListMember();
		model.addAttribute("memberList", memberList);
		
		List<SalaryVo> voList = service.searchSelectList(vo);
		
		model.addAttribute("voList", voList);
	
		return("salary/salaryAdmin");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("salary/salaryList")
	public String salaryList() {
		return("salary/salaryList");
	}


}
