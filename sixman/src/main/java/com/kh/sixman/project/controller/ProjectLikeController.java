package com.kh.sixman.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sixman.project.service.ProjectService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("project")
@Controller
@Slf4j
public class ProjectLikeController {

	@Autowired
	private ProjectService ps;
	
	//화면에서 별표시 클릭하면 Favorites Y 로 변경하게 하기
	@PostMapping("insertfavorite")
	@ResponseBody
	public String insertfavorite(String no) {
		
		log.info("insertNo : " + no);
		
		int result = ps.insertFavorite(no);
		
		if(result != 1) {return null;}
		
		return "추가 성공!";
		
	}
	
	@PostMapping("deletefavorite")
	@ResponseBody
	public String deletefavorite(String no) {
		
		log.info("deleteNo : " + no);
		
		int result = ps.deleteFavorite(no);
		
		if(result != 1) {return null;}
		
		return "제거 성공!!";
	}
	
}
