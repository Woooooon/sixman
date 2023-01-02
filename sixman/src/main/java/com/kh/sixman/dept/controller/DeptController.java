package com.kh.sixman.dept.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.sixman.dept.service.DeptService;
import com.kh.sixman.dept.vo.DeptVo;

import lombok.extern.slf4j.Slf4j;
@Controller
@Slf4j
public class DeptController {
	
	@Autowired
	private DeptService deptService;
	
	@PostMapping(value = "dept/sublist", produces = "application/json; charset=utf8")
	@ResponseBody
	public String subList(String no) {
		List<DeptVo> subDeptList = deptService.selectSubList(no);  
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(subDeptList);
		return json;
	}
	
	@PostMapping(value = "dept/delete", produces = "application/json; charset=utf8")
	@ResponseBody
	public String deleteDept(String no) {
		
		log.info("no : " + no);
		
		int deleteDept = deptService.deleteDept(no);
		
		log.info("deleteDept : " + deleteDept);
		
		if(deleteDept > 0) {
			return "부서 및 하위 조직을 삭제하였습니다.";
		}
		
		return null; 
	}
	
	@PostMapping(value = "team/delete", produces = "application/json; charset=utf8")
	@ResponseBody
	public String deleteTeam(String no) {
		
		log.info("no : " + no);
		
		int deleteTeam = deptService.deleteTeam(no);
		
		log.info("deleteTeam : " + deleteTeam);
		
		if(deleteTeam > 0) {
			return "선택한 팀을 삭제하였습니다.";
		}
		
		return null; 
	}
	
	@PostMapping(value = "dept/insert", produces = "application/json; charset=utf8")
	@ResponseBody
	public String insertDept(String name) {

		int insertDept = deptService.insertDept(name);
		
		log.info("부서 추가 결과 : " + insertDept);
		
		if(insertDept != 1)return null;
		
		DeptVo selectNewDept = deptService.selectDept(name);
		
		log.info("추가 된 부서 불러 오기 : " + selectNewDept);
		
		Gson gson = new GsonBuilder().create();
		
		String json = gson.toJson(selectNewDept);
		
		return json;
	}
	
	@PostMapping(value = "team/insert", produces = "application/json; charset=utf8")
	@ResponseBody
	public String insertTeam(String name, String deptNo) {
		
		DeptVo vo = new DeptVo();
		vo.setTeamName(name);
		vo.setDeptNo(deptNo);
		
		log.info("DeptVo : " + vo);
		
		int insertTeam = deptService.insertTeam(vo);
		
		log.info("팀 추가 결과 : " + insertTeam);
		
		if(insertTeam != 1)return null;
		
		DeptVo selectNewTeam = deptService.selectTeam(vo);
		
		log.info("추가 된 팀 불러 오기 : " + selectNewTeam);
		
		Gson gson = new GsonBuilder().create();
		
		String json = gson.toJson(selectNewTeam);
		
		return json;
	}

}
