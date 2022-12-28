package com.kh.sixman.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sixman.admin.service.AdminMemberService;
import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.common.AuthorizeVo;
import com.kh.sixman.common.BankVo;
import com.kh.sixman.common.FileUnit;
import com.kh.sixman.dept.service.DeptService;
import com.kh.sixman.dept.vo.DeptVo;
import com.kh.sixman.member.service.MemberService;
import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.position.service.PositionService;
import com.kh.sixman.position.vo.PositionVo;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("admin/member")
@Controller
@Slf4j
public class AdminMemberController {
	
	@Autowired 
	private AdminMemberService adminMemberService;
	
	@Autowired 
	private MemberService memberService;
	
	@Autowired 
	private DeptService deptService;
	
	@Autowired
	private PositionService positionService;
	
	
	
	@GetMapping("join")
	public String join(Model model) {
		
		List<BankVo> bankList = adminMemberService.bankList();
		List<AuthorizeVo> authorizeList = adminMemberService.authorizeList();
		List<PositionVo> positionList = positionService.positionList();
		List<DeptVo> deptList = deptService.daptList();
		List<MemberVo> memberListAll = memberService.selectMemberListAll();
		List<DeptVo> subDeptList = deptService.subList();
		
		model.addAttribute("subDeptList", subDeptList);
		model.addAttribute("deptList", deptList);
		model.addAttribute("positionList", positionList);
		model.addAttribute("bankList", bankList);
		model.addAttribute("authorizeList", authorizeList);
		model.addAttribute("memberListAll", memberListAll);
		return "admin/member/join";
	}
	
	@PostMapping("join")
	public String join(MemberVo vo, HttpSession session) {
		
		String rootPath = session.getServletContext().getRealPath("/");
		
		List<AttachmentVo> picFileInfo = FileUnit.uploadFile(vo.getPicFile(), rootPath, "sixman/src/main/webapp/resources/img/profile");
		List<AttachmentVo> resumeFileInfo = FileUnit.uploadFile(vo.getResumeFile(), rootPath, "upload/resume");
		List<AttachmentVo> accountFileInfo = FileUnit.uploadFile(vo.getAccountFile(), rootPath, "upload/account");
		List<AttachmentVo> evidenceFileList = FileUnit.uploadFile(vo.getEvidenceFile(), rootPath, "upload/evidence");
		
		vo.setPwd(vo.getId());
		vo.setPicFileInfo(picFileInfo);
		vo.setResumeFileInfo(resumeFileInfo);
		vo.setAccountFileInfo(accountFileInfo);
		vo.setEvidenceFileList(evidenceFileList);
		
		int result = adminMemberService.join(vo);
		
		if(result > 0) {
			return "redirect:/admin/employee/list"; 
		}
		
		return "redirect:/main/mainPage";
	}
	
	@GetMapping("detail")
	public String detail(String no, Model model) {
		
		MemberVo selectMember = adminMemberService.selectOne(no);
		List<BankVo> bankList = adminMemberService.bankList();
		List<AuthorizeVo> authorizeList = adminMemberService.authorizeList();
		List<PositionVo> positionList = positionService.positionList();
		List<DeptVo> deptList = deptService.daptList();
		List<DeptVo> subDeptList = deptService.subList();
		List<DeptVo> teamList = deptService.selectSubList(selectMember.getDeptNo());
		List<MemberVo> memberListAll = memberService.selectMemberListAll();
		
		model.addAttribute("selectMember", selectMember);
		model.addAttribute("deptList", deptList);
		model.addAttribute("subDeptList", subDeptList);
		model.addAttribute("teamList", teamList);
		model.addAttribute("positionList", positionList);
		model.addAttribute("bankList", bankList);
		model.addAttribute("authorizeList", authorizeList);
		model.addAttribute("memberListAll", memberListAll);
		return "admin/member/detail";
	}

	@PostMapping("detail")
	public String detail(String profileNo
						, String accountNo
						, String resumeNo
						, @RequestParam(required = false) List<String> evidenceNo
						, String no
						, MemberVo vo
						, Model model
						, HttpSession session) {
		
		String rootPath = session.getServletContext().getRealPath("/");
		
		List<AttachmentVo> picFileInfo = FileUnit.uploadFile(vo.getPicFile(), rootPath, "sixman/src/main/webapp/resources/img/profile");
		List<AttachmentVo> resumeFileInfo = FileUnit.uploadFile(vo.getResumeFile(), rootPath, "upload/resume");
		List<AttachmentVo> accountFileInfo = FileUnit.uploadFile(vo.getAccountFile(), rootPath, "upload/account");
		List<AttachmentVo> evidenceFileList = FileUnit.uploadFile(vo.getEvidenceFile(), rootPath, "upload/evidence");
		
		vo.setNo(no);
		vo.setPicFileInfo(picFileInfo);
		vo.setResumeFileInfo(resumeFileInfo);
		vo.setAccountFileInfo(accountFileInfo);
		vo.setEvidenceFileList(evidenceFileList);
		
		log.info("profileNo :" + profileNo);
		log.info("accountNo :" + accountNo);
		log.info("resumeNo :" + resumeNo);
		log.info("evdenceNo :" + evidenceNo);
		log.info("MemberSeq :" + no);
		log.info("MemberVo :" + vo);	

		int result = adminMemberService.updateMemberDetail(vo, profileNo, accountNo, resumeNo, evidenceNo);
		
		if(result > 0) {
			return "redirect:/admin/employee/list"; 
		}
		
		return "redirect:/main/mainPage";
	}
	
	
	@PostMapping(value = "update", produces = "application/json; charset=utf8")
	@ResponseBody
	public String update(String no
						, String positionNo
						, String deptNo
						, String teamNo
						, String authorizeNo) {
		
		MemberVo updateMember = new MemberVo();
		updateMember.setNo(no);
		updateMember.setPositionNo(positionNo);
		updateMember.setDeptNo(deptNo);
		updateMember.setTeamNo(teamNo);
		updateMember.setAuthorizeNo(authorizeNo);
		
		int result = adminMemberService.updateMember(updateMember);
		
		if(result != 1) {
			return null;
		}
		
		return "수정을 완료했습니다.";
	}
	
	@PostMapping(value = "delete", produces = "application/json; charset=utf8")
	@ResponseBody
	public String deleteAll(@RequestParam List<String> no) {
		
		int result = adminMemberService.deleteAll(no);
		
		if(result != 1) {
			return null;
		}
		
		return "퇴사 요철을 완료했습니다.";
	}
	
	
}
