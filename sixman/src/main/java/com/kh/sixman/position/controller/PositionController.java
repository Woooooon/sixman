package com.kh.sixman.position.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.sixman.position.service.PositionService;
import com.kh.sixman.position.vo.PositionVo;

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
	
	@PostMapping(value = "position/insert", produces = "application/json; charset=utf8")
	@ResponseBody
	public String insertPosition(String name) {
		
		log.info("name : " + name);
		
		int insertPosition = positionService.insertPosition(name);
		
		log.info("직급 추가 결과 : " + insertPosition);
		
		if(insertPosition != 1)return null;
		
		PositionVo selectNewPosition = positionService.selectPosition(name);
		
		log.info("추가 된 직급 불러 오기 : " + selectNewPosition);
		
		Gson gson = new GsonBuilder().create();
		
		String json = gson.toJson(selectNewPosition);
		
		return json;
	}
}
