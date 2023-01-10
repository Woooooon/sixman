package com.kh.sixman.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.project.service.ProjectService;
import com.kh.sixman.project.vo.TodoVo;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("project")
@Controller
@Slf4j
public class ProjectTodoController {

	@Autowired
	private ProjectService ps;

	@GetMapping("todoplus")
	@ResponseBody
	public String todoPlus(TodoVo vo, HttpSession session) {
		log.info("vo : "+vo);
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		//todo 추가 할 때, 필요한것 = 플젝 번호, 로그인한 사람 번호
		int result = ps.todoPlus(vo);
		
		return "todo 추가성공";
		
	}
	
}
