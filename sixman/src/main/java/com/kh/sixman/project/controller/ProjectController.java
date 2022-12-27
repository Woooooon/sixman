package com.kh.sixman.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.common.FileUnit;
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
		
		List<ProjectVo> pList = ps.selectList(vo);
		session.setAttribute("list", pList);
		
		log.info("list<- : " + pList);
		
		return "project/allprj";
	}
	
	//프로젝트 생성(화면)
	@GetMapping("create")
	public String create(HttpSession session){
		
		//로그인 멤버 정보 꺼내기
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		return "project/create";
	}
	
	//프로젝트 생성(찐)
	@PostMapping("create")
	public String create(ProjectVo vo, HttpSession session) {
		
		log.info("화면에서 받은 정보 : " + vo);
		String rootPath = session.getServletContext().getRealPath("/");
		List<AttachmentVo> fileList = FileUnit.uploadFile(vo.getPrjfile(), rootPath, "upload/project");
		vo.setPrjfileList(fileList);
		
		int result = ps.insertPrjOne(vo);
		
		if(result != 1) {
			return "errorPage";
		}
		
		return "project/allprj";
	}

	
	//프로젝트 상세보기(화면)
	@GetMapping("detail")
	public String detail(ProjectVo pvo, AttachmentVo avo) {
		
		//ProjectVo provo = ps.selectOne(pvo);
		
		
		return "project/detail";
	}
	

}
