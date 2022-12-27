package com.kh.sixman.schedule.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.schedule.service.ScheduleService;
import com.kh.sixman.schedule.vo.ScheduleVo;


@RequestMapping("schedule")
@Controller
public class ScheduleController {

	@Autowired
	private ScheduleService ss;
	
	//일정 (화면)
	@GetMapping("calendar")
	public String calendar(ScheduleVo vo, HttpSession session) {
		
		//로그인 멤버 정보 꺼내기
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		ScheduleVo svo = new ScheduleVo();
		svo.setWriter(loginMember.getNo());
		
		List<ScheduleVo> voList = ss.selectList(vo);
		
		return "schedule/calendar";
	}
	
	
	//주간일정(화면)
	@GetMapping("weeks")
	public String weeks() {
		return "schedule/weeks";
	}
	
	
}
