package com.kh.sixman.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.sixman.admin.service.AdminMemberService;
import com.kh.sixman.member.vo.AuthorizeVo;
import com.kh.sixman.member.vo.BankVo;
@RequestMapping("admin/member")
@Controller
public class AdminMemberController {
	
	@Autowired 
	private AdminMemberService adminMemberService;
	
	@GetMapping("join")
	public String join(Model model) {
		
		List<BankVo> bankList = adminMemberService.bankList();
		List<AuthorizeVo> authorizeList = adminMemberService.authorizeList();
		
		model.addAttribute("bankList", bankList);
		model.addAttribute("authorizeList", authorizeList);
		return "admin/member/join";
	}
}
