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
import com.kh.sixman.attendance.vo.WorkTimeVo;
import com.kh.sixman.common.PageVo;
import com.kh.sixman.mail.vo.MailVo;
import com.kh.sixman.member.vo.MemberVo;

@RequestMapping("attendance")
@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService service;
	Date date = new Date();
	SimpleDateFormat day = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat time = new SimpleDateFormat("HH:mm");
	
	String today = (day.format(date)).replace("-", "/").substring(2);
	
	@GetMapping("board")
	public String board(@RequestParam Map<String, String> map ,Model model, HttpSession session){
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		
		
		//실시간시간출력
		Date date = new Date();
		SimpleDateFormat day = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat time = new SimpleDateFormat("HH:mm");
		
		model.addAttribute("day", day.format(date) );
		model.addAttribute("time", time.format(date) );
		
		WorkTimeVo workVo = new WorkTimeVo();
		workVo.setWorkDay(today);
		workVo.setMemberNo(loginMember.getNo());
		
		WorkTimeVo todayWork = service.todayWork(workVo);
		
		//보드페이지
		int pageLimit = 5;
		int boardLimit = 14;
		int listCount = service.countList(loginMember);
		
		int page = Integer.parseInt(map.get("page"));
	    int offset = (page-1) * boardLimit;
	    RowBounds rb = new RowBounds(offset , boardLimit);
	    
	    PageVo pv = new PageVo(listCount,page,pageLimit,boardLimit);
		
		//리스트 보여주기
		List<AttendanceVo> voList = service.selectList(loginMember,rb);
		
		model.addAttribute("voList", voList);
		model.addAttribute("pv", pv);
		model.addAttribute("todayWork", todayWork);
		
		return "attendance/attendanceBoard";
	}
	
	//출근버튼
	@PostMapping("board")
	public String boardinsert(@RequestParam Map<String, String> map,Model model, HttpSession session) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		int result = service.insertStart(loginMember);
		
		if(result != 1) {
			return "errorPage";
		}
		 
		return "redirect:/attendance/board?page=1";
	}
	
	//퇴근버튼
	@PostMapping("board2")
	public String board2(Model model, AttendanceVo vo) {
		
		//오늘 날짜
		String today = (day.format(date)).replace("-", "/").substring(2);
		
		vo.setEnd(today);
	
		int result = service.updateEnd(vo);
		
//		if(result != 1) {
//			return "errorPage";
//		}

		return "redirect:/attendance/board?page=1";
	}
	
	@PostMapping("board3")
	public String board3(Model model, AttendanceVo vo, HttpSession session) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		String name = loginMember.getName();
		vo.setName(name);
		
		//리스트  검색해서 보여주기
		List<AttendanceVo> voList = service.searchList(vo);
		
		model.addAttribute("voList", voList);
		
		return "redirect:/attendance/board?page=1";
//		return "attendance/attendanceBoard";
	}
	
	
	@GetMapping("admin")
	public String admin(@RequestParam Map<String, String> map, Model model, AttendanceVo vo) {
		//실시간시간출력
		Date date = new Date();
		SimpleDateFormat day = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat time = new SimpleDateFormat("HH:mm");
		
		model.addAttribute("day", day.format(date) );
		model.addAttribute("time", time.format(date) );
		
		 //맴버선택
		List<MemberVo> memberList = service.ListMember();
		model.addAttribute("memberList", memberList);
		
		//보드페이지
		int pageLimit = 5;
		int boardLimit = 14;
		int listCount = service.adminCountList(vo);
		int page = Integer.parseInt(map.get("page"));
	    int offset = (page-1) * boardLimit;
	    RowBounds rb = new RowBounds(offset , boardLimit);
	    
	    PageVo pv = new PageVo(listCount,page,pageLimit,boardLimit);
		
	    
	    
		List<AttendanceVo> selectMemberList = service.selectMemberList(vo,rb);
		
		model.addAttribute("selectMemberList", selectMemberList);

		//출퇴근시간
		WorkTimeVo workVo = new WorkTimeVo();
		workVo.setWorkDay(today);
		workVo.setName(vo.getName());
		WorkTimeVo todayWork = service.AdminTodayWork(workVo);
		model.addAttribute("todayWork", todayWork);
		model.addAttribute("pv", pv);
		
		return "attendance/attendanceAdmin";
	}
	
	@PostMapping("admin")
	
	
	
	
	@GetMapping("calendar")
	public String calendar(@RequestParam Map<String, String> map, Model model, AttendanceVo vo){
		
		String selectMemberList = "qweasd";
		
		model.addAttribute("selectMemberList", selectMemberList);
		
		return "attendance/attendanceCalendar";
	}
	
	@GetMapping("test")
	public String test(){
		
		return "attendance/test";
	}
	
	

}
