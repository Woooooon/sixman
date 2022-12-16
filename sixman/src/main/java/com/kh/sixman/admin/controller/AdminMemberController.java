package com.kh.sixman.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.sixman.admin.service.AdminMemberService;
import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.common.FileUnit;
import com.kh.sixman.member.vo.AuthorizeVo;
import com.kh.sixman.member.vo.BankVo;
import com.kh.sixman.member.vo.MemberVo;
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
	
	@PostMapping("join")
	public String join(MemberVo vo, HttpSession session) {
		
		String rootPath = session.getServletContext().getRealPath("/");
		List<AttachmentVo> picFileInfo = FileUnit.uploadFile(vo.getPicFile(), rootPath, "upload/profile");
		List<AttachmentVo> resumeFileInfo = FileUnit.uploadFile(vo.getResumeFile(), rootPath, "upload/resume");
		List<AttachmentVo> accountFileInfo = FileUnit.uploadFile(vo.getAccountFile(), rootPath, "upload/account");
		List<AttachmentVo> evidenceFileList = FileUnit.uploadFile(vo.getEvidenceFile(), rootPath, "upload/evidence");
		
		vo.setPicFileInfo(picFileInfo);
		vo.setResumeFileInfo(resumeFileInfo);
		vo.setAccountFileInfo(accountFileInfo);
		vo.setEvidenceFileList(evidenceFileList);
		
		int result = adminMemberService.join(vo);
		return "";
	}
}
