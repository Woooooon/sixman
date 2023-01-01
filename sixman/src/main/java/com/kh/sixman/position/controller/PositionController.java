package com.kh.sixman.position.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sixman.position.service.PositionService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PositionController {
	@Autowired
	private PositionService positionService;
	
	
	@PostMapping(value = "position/delete", produces = "application/json; charset=utf8")
	@ResponseBody
	public String deleteTeam(String no) {
		
		log.info("no : " + no);
		
		int deletePosition = positionService.deletePosition(no);
		
		log.info("deleteTeam : " + deletePosition);
		
		if(deletePosition > 0) {
			return "선택한 직급을 삭제하였습니다.";
		}
		
		return null; 
	}
}
