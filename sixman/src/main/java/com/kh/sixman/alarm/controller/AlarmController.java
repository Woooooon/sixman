package com.kh.sixman.alarm.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.sixman.alarm.service.AlarmService;
import com.kh.sixman.alarm.vo.AlarmVo;
import com.kh.sixman.member.vo.MemberVo;

@Controller
public class AlarmController {
	
	@Autowired
	private AlarmService as;

	@ResponseBody
	@PostMapping(value = "alarm")
	public String alarm(HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		List<AlarmVo> list = as.selectList(no);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list);
		return json;
	}
	
	@ResponseBody
	@PostMapping("alarm/check")
	public void check(Map<String,String> map) {
		int result = as.check(map);
	}
	
	
}
