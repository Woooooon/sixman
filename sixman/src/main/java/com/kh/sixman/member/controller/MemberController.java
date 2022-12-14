package com.kh.sixman.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.sixman.company.service.CompanyService;
import com.kh.sixman.company.vo.CompanyVo;
import com.kh.sixman.member.service.MemberService;
import com.kh.sixman.member.vo.MemberVo;

@Controller
public final class MemberController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CompanyService companyService;
	
	@GetMapping("") 
	public String login(HttpSession session){
		CompanyVo company = new CompanyVo();
		
		String no = "1";
		company.setNo(no);
		
		company = companyService.getCompany(company); 
		session.setAttribute("company", company);
		
		return "member/login";
	}
	
   //로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
	return "redirect:/";
	}
	
	@PostMapping("")
	public String login(MemberVo vo, HttpSession session, Model model) {
		
		MemberVo loginMember = memberService.login(vo);
		
		if(loginMember == null) {
			model.addAttribute("alert", "아이디, 비밀번호가 일치 하지 않거나 존재하지 않는 회원입니다.");
			return "member/login";
		}
		
		session.setAttribute("loginMember", loginMember);
		
		if(loginMember.getAuthorizeNo().equals("3")) {
			return "redirect:/admin/employee/list";
		}
		
		//아이디 비번 일치했을 시 비번 최신화 
		if(vo.getId().equals(vo.getPwd())) {
			return "redirect:/member/switch";
		}
		
		return "redirect:/main";
	}
	
	@GetMapping("member/switch")
	public String switchPwd (Model model, String mypage) {
		
		
		model.addAttribute("mypage", mypage);
		return "member/switch";
	}
	
	@PostMapping("member/switch")
	public String switchPwd (String pwd, HttpSession session, Model model) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		int updatePwd = memberService.updatePwd(loginMember.getNo(), pwd);
		
		if(updatePwd != 1) {
			model.addAttribute("alert", "비밀번호 변경에 실패 하였습니다.");
			return "redirect:/member/switch";
		}
		
		return "redirect:/";
	}
	
}
