package com.kh.sixman.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public String OrganizationChart(Model model, String page, String keyword, String category) {
		
		if(page == null) {
			page = "1";
		}
		
		log.info(keyword);
		log.info(category);
		
		Map<String, String> search = new HashMap<String, String>();
		search.put("keword", keyword);
		search.put("category", category);
		
		int pageLimit = 5;
		int boardLimit = 10;
		int listCount = memberService.countList(search);
		
		log.info("listCount : " + listCount);
		
	    int offset = (Integer.parseInt(page)-1) * boardLimit;
	    
	    PageVo pv = new PageVo(listCount,Integer.parseInt(page),pageLimit,boardLimit);
	    RowBounds rb = new RowBounds(offset , boardLimit);

		List<MemberVo> MemberList = memberService.selectMemberList(rb, search);
		
		log.info("memberList size : " + MemberList.size());
		
		List<MemberVo> newbieList = memberService.selectNewbieList();
		List<AuthorizeVo> authorizeList = adminMemberService.authorizeList();
		List<PositionVo> positionList = positionService.positionList();
		List<DeptVo> deptList = deptService.daptList();
		List<DeptVo> subDeptList = deptService.subList();
		List<MemberVo> memberListAll = memberService.selectMemberListAll();
		model.addAttribute("pv", pv);
		model.addAttribute("deptList", deptList);
		model.addAttribute("subDeptList", subDeptList);
		model.addAttribute("positionList", positionList);
		model.addAttribute("authorizeList", authorizeList);
		model.addAttribute("newbieList", newbieList);
		model.addAttribute("MemberList", MemberList);
		model.addAttribute("memberListAll", memberListAll);
		
		
		return "admin/organizationChart/list";
	}
	

}	
