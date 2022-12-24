package com.kh.sixman.dept.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.sixman.dept.service.DeptService;
import com.kh.sixman.dept.vo.DeptVo;
@Controller
public class DeptController {
	
	@Autowired
	private DeptService deptService;
	
	@PostMapping(value = "dept/sublist", produces = "application/json; charset=utf8")
	@ResponseBody
	public String subList(String no) {
		List<DeptVo> subDeptList = deptService.subList(no);  
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(subDeptList);
		return json;
	}
}
