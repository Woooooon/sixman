package com.kh.sixman.attendance.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.sixman.attendance.service.AttendanceService;
import com.kh.sixman.attendance.vo.AttendanceVo;
import com.kh.sixman.common.PageVo;
import com.kh.sixman.mail.vo.MailVo;
import com.kh.sixman.member.vo.MemberVo;

@RequestMapping("attendance")
@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService service;
	
	@GetMapping("board")
	public String board(@RequestParam Map<String, String> map ,Model model, HttpSession session){
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		//실시간시간출력
		Date date = new Date();
		SimpleDateFormat day = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat time = new SimpleDateFormat("HH:mm");
		
		model.addAttribute("day", day.format(date) );
		model.addAttribute("time", time.format(date) );
		
		
		//보드페이지
		int pageLimit = 5;
		int boardLimit = 15;
		int listCount = service.countList();
		
		int page = Integer.parseInt(map.get("page"));
	    int offset = (page-1) * boardLimit;
	    RowBounds rb = new RowBounds(offset , boardLimit);
	    
	    PageVo pv = new PageVo(listCount,page,pageLimit,boardLimit);
		
		//리스트 보여주기
		List<AttendanceVo> voList = service.selectList(rb);
		model.addAttribute("voList", voList);
		model.addAttribute("pv", pv);
		
		System.out.println(pv);
		System.out.println(page);
		
		return "attendance/attendanceBoard";
	}
	
	//출근버튼
	@PostMapping("board")
	public String board(Model model , MemberVo vo) {
		
		//실시간시간출력
		Date date = new Date();
		SimpleDateFormat day = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat time = new SimpleDateFormat("HH:mm");
		
		model.addAttribute("day", day.format(date) );
		model.addAttribute("time", time.format(date) );
		
		int result = service.insertStart();
		
		System.out.println(result);
		
		if(result != 1) {
			return "errorPage";
		}
		 
		return "attendance/attendanceBoard";
	}
	
	//퇴근버튼
	@PostMapping("board2")
	public String board3(Model model, AttendanceVo vo) {
		
		//실시간시간출력
		Date date = new Date();
		SimpleDateFormat day = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat time = new SimpleDateFormat("HH:mm");
		
		model.addAttribute("day", day.format(date) );
		model.addAttribute("time", time.format(date) );
	
	
		return "attendance/attendanceBoard";
	}
	
	
	@GetMapping("admin")
	public String admin(){
		return "attendance/attendanceAdmin";
	}
	
	@GetMapping("calendar")
	public String calendar(){
		return "attendance/attendanceCalendar";
	}
	
	@GetMapping("test")
	public String test(){
		return "attendance/test";
	}
	
	

}
