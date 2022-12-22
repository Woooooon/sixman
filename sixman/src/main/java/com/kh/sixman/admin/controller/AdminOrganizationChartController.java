package com.kh.sixman.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.sixman.admin.service.AdminMemberService;
import com.kh.sixman.admin.vo.DeptVo;
import com.kh.sixman.admin.vo.PositionVo;
import com.kh.sixman.member.service.MemberService;
import com.kh.sixman.member.vo.AuthorizeVo;
import com.kh.sixman.member.vo.MemberVo;
@RequestMapping("admin/employee")
@Controller
public class AdminOrganizationChartController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	@GetMapping("list")
	public String OrganizationChart(Model model) {
		List<MemberVo> MemberList = memberService.selectMemberList();
		List<MemberVo> newbieList = memberService.selectNewbieList();
		List<AuthorizeVo> authorizeList = adminMemberService.authorizeList();
		List<PositionVo> positionList = adminMemberService.positionList();
		List<DeptVo> deptList = adminMemberService.daptList();
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("positionList", positionList);
		model.addAttribute("authorizeList", authorizeList);
		model.addAttribute("newbieList", newbieList);
		model.addAttribute("MemberList", MemberList);
		return "admin/organizationChart/list";
	}
	
}	
