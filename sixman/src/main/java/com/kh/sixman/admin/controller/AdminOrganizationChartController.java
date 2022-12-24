package com.kh.sixman.admin.controller;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.sixman.admin.service.AdminMemberService;
import com.kh.sixman.common.AuthorizeVo;
import com.kh.sixman.common.PageVo;
import com.kh.sixman.dept.service.DeptService;
import com.kh.sixman.dept.vo.DeptVo;
import com.kh.sixman.member.service.MemberService;
import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.position.service.PositionService;
import com.kh.sixman.position.vo.PositionVo;

import lombok.extern.slf4j.Slf4j;
@RequestMapping("admin/employee")
@Controller
@Slf4j
public class AdminOrganizationChartController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	@Autowired 
	private DeptService deptService;
	
	@Autowired
	private PositionService positionService;
	
	@GetMapping("list")
	public String OrganizationChart(Model model, int page) {
		
		int pageLimit = 5;
		int boardLimit = 10;
		int listCount = memberService.countList();
		
		log.info("listCount : " + listCount);
		
	    int offset = (page-1) * boardLimit;
	    
	    PageVo pv = new PageVo(listCount,page,pageLimit,boardLimit);
	    RowBounds rb = new RowBounds(offset , boardLimit);

		List<MemberVo> MemberList = memberService.selectMemberList(rb);
		
		log.info("memberList size : " + MemberList.size());
		
		List<MemberVo> newbieList = memberService.selectNewbieList();
		List<AuthorizeVo> authorizeList = adminMemberService.authorizeList();
		List<PositionVo> positionList = positionService.positionList();
		List<DeptVo> deptList = deptService.daptList();
		
		model.addAttribute("pv", pv);
		model.addAttribute("deptList", deptList);
		model.addAttribute("positionList", positionList);
		model.addAttribute("authorizeList", authorizeList);
		model.addAttribute("newbieList", newbieList);
		model.addAttribute("MemberList", MemberList);
		return "admin/organizationChart/list";
	}
	
}	
