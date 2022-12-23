package com.kh.sixman.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.project.service.ProjectService;
import com.kh.sixman.project.vo.ProjectVo;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.GetCreator;

@RequestMapping("project")
@Controller
@Slf4j
public class ProjectController {

	@Autowired
	private ProjectService ps;
	
	//프로젝트 전체(화면)
	@GetMapping("allprj")
	public String allprj(ProjectVo vo, HttpSession session) {
		
		//로그인 멤버 정보 꺼내기
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		List<ProjectVo> pList = ps.selectList(vo);
		
		if(loginMember == null) {
			return "project/allprj";
		} else {
			return "errorPage";
		}
		
		
	}
	
	//프로젝트 생성(화면)
	@GetMapping("create")
	public String create(HttpSession session){
		
		//로그인 멤버 정보 꺼내기
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		log.info("loginmember : " + loginMember);
		
		return "project/create";
	}
	
	//프로젝트 생성한 정보 보내기
	@PostMapping("create")
	public String create(ProjectVo vo) {
		
		int result = ps.insertPrjOne(vo);
		
		if(result == 1) {
			//성공
			return "project/allprj";
		}else {
			//실패
			return "errorPage";
		}
		
	}

	
	//프로젝트 상세보기(화면)
	@GetMapping("detail")
	public String detail() {
		return "project/detail";
	}
	

}
