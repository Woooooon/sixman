package com.kh.sixman.attendance.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.sixman.attendance.service.AttendanceService;
import com.kh.sixman.attendance.vo.AttendanceVo;

@RequestMapping("attendance")
@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService service;
	
	@GetMapping("board")
	public String board(Model model){
		
		//실시간시간출력
		Date date = new Date();
		SimpleDateFormat day = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat time = new SimpleDateFormat("HH:mm");
		
		model.addAttribute("day", day.format(date) );
		model.addAttribute("time", time.format(date) );
		
		
		List<AttendanceVo> voList = service.selectList();
		System.out.println(voList);
		model.addAttribute("voList",voList);
		
		return "attendance/attendanceBoard";
	}
	
	//출근버튼
	@PostMapping("board")
	public String board2(Model model, HttpSession session) {
		
		//실시간시간출력
		Date date = new Date();
		SimpleDateFormat day = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat time = new SimpleDateFormat("HH:mm");
		
		model.addAttribute("day", day.format(date) );
		model.addAttribute("time", time.format(date) );
		
		System.out.println(date);
		System.out.println(time);
		System.out.println(day);
		
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
		
		System.out.println(date);
		System.out.println(time);
		System.out.println(day);
	
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
