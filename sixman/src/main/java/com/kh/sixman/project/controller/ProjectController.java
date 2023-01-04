package com.kh.sixman.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.sixman.admin.service.AdminMemberService;
import com.kh.sixman.common.AuthorizeVo;
import com.kh.sixman.dept.service.DeptService;
import com.kh.sixman.dept.vo.DeptVo;
import com.kh.sixman.member.service.MemberService;
import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.position.service.PositionService;
import com.kh.sixman.position.vo.PositionVo;
import com.kh.sixman.project.service.ProjectService;
import com.kh.sixman.project.vo.ProjectVo;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("project")
@Controller
@Slf4j
public class ProjectController {

	@Autowired
	private ProjectService ps;
	
	@Autowired
	private PositionService positionService;
	
	@Autowired 
	private DeptService deptService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	//프로젝트(화면)
	@GetMapping("allprj")
	public String allprj(HttpSession session) {
		
		//로그인 멤버 정보 꺼내기
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");

		List<ProjectVo> prjList = ps.selectList(Integer.parseInt(loginMember.getNo()));
		session.setAttribute("List", prjList);
	
		return "project/allprj";
	}
	
	//프로젝트 생성(화면)
	@GetMapping("create")
	public String create(HttpSession session, Model model){
		
		//로그인 멤버 정보 꺼내기
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		List<PositionVo> positionList = positionService.positionList();
		List<DeptVo> deptList = deptService.daptList();
		List<AuthorizeVo> authorizeList = adminMemberService.authorizeList();
		List<MemberVo> memberList = ps.selectMemberList();
		//List<MemberVo> memberListAll = memberService.selectMemberListAll();
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("positionList", positionList);
		model.addAttribute("memberList", memberList);
		model.addAttribute("authorizeList", authorizeList);
		
		log.info("==============");
		String json = new Gson().toJson(memberList);
		log.info("json : " +json);
		log.info("==============");
		
		return "project/create";
	}
	
	//프로젝트 생성(찐)
	@PostMapping("create")
	public String create(ProjectVo vo, HttpSession session) {
		
		int result = ps.insertPrjOne(vo);
		if(result != 1) {
			return "errorPage";
		}
		
		return "redirect:/project/allprj";
	}

	
	//프로젝트 상세보기(화면)
	@GetMapping("detail")
	public String detail(ProjectVo vo, HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
//		ProjectVo prj = ps.selectOne(vo);
//		session.setAttribute("prj", prj);
		
		return "project/detail";
	}
	

	

}
