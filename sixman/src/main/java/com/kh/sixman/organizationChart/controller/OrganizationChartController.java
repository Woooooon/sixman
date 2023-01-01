package com.kh.sixman.organizationChart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.sixman.common.PageVo;
import com.kh.sixman.dept.service.DeptService;
import com.kh.sixman.dept.vo.DeptVo;
import com.kh.sixman.member.service.MemberService;
import com.kh.sixman.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class OrganizationChartController {

	@Autowired
	private MemberService memberService;
	
	@Autowired 
	private DeptService deptService;
	
	@GetMapping("employee/list")
	public String OrganizationChart(Model model, String page, String keyword, String category, HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("loginDeptNo", loginMember.getDeptNo());
		map.put("loginTeamNo", loginMember.getTeamNo());
		map.put("loginNo", loginMember.getNo());
		
		if(page == null) {
			page = "1";
		}
		
		log.info(keyword);
		log.info(category);
		
		Map<String, String> search = new HashMap<String, String>();
		search.put("keyword", keyword);
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
		
		
		List<DeptVo> deptList = deptService.daptList();
		List<DeptVo> subDeptList = deptService.subList();
		List<MemberVo> memberListAll = memberService.selectMemberListAll();
		List<MemberVo> deptMemberList = memberService.selectdeptMemberList(map);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("category", category);
		model.addAttribute("pv", pv);
		model.addAttribute("deptList", deptList);
		model.addAttribute("subDeptList", subDeptList);
		model.addAttribute("MemberList", MemberList);
		model.addAttribute("memberListAll", memberListAll);
		model.addAttribute("deptMemberList", deptMemberList);
		
		return "organizationChart/list";
	}
}
