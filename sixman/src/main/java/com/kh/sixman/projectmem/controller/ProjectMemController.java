package com.kh.sixman.projectmem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.project.service.ProjectService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ProjectMemController {
	
	@Autowired
	private ProjectService ps;

	//프로젝트 생성 멤버 정보 ajax로 가져올때
	@PostMapping(value = "project/memberlist", produces = "application/json; charset=utf8")
	@ResponseBody
	public String memberList(String no) {
		
		List<MemberVo> memberList = ps.selectMemberList(no);
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(memberList);
		return json;
		
	}
	
}
