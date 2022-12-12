package com.kh.sixman.mail.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.sixman.mail.service.MailService;
import com.kh.sixman.mail.vo.MailVo;
import com.kh.sixman.member.vo.MemberVo;

@RequestMapping("mail")
@Controller
public class MailController {
	
	@Autowired
	private MailService ms;
	
	@GetMapping("list")
	public String list() {
		return "mail/list";
	}
	
	@GetMapping("write")
	public String write() {
		return "mail/write";
	}
	
	@PostMapping("write")
	public String  write(MailVo vo, HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		vo.setSendUser(loginMember.getNo());
		
		int result = ms.write(vo);
		return "";
	}
	
	@GetMapping("detail")
	public String detail() {
		return "mail/detail";
	}

}
