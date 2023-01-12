package com.kh.sixman.main.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.sixman.mail.service.MailService;
import com.kh.sixman.mail.vo.MailVo;
import com.kh.sixman.member.service.MemberService;
import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.notice.service.NoticeService;
import com.kh.sixman.notice.vo.NoticeVo;
import com.kh.sixman.project.service.ProjectService;
import com.kh.sixman.project.vo.ProjectVo;

@Controller
public class MainController {
	
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private MailService mailService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ProjectService ps;
	
	@GetMapping("tempMain")
	public String tempMain() {
		return "main/tempMain";
	}
	
	@GetMapping("main")
	public String main(HttpSession session, Model model) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		if(loginMember!=null) {
			MailVo vo = new MailVo();
			vo.setUserNo(loginMember.getNo());
			vo.setUserEmail(loginMember.getEmail());
			vo.setCategoryName("받은메일함");
			
		    RowBounds rb = new RowBounds(0 , 5);
		    
		    List<MailVo> list = mailService.selectList(vo, rb);
		    
			Map<String, Object> resultMap = new HashMap<>();
			
			vo.setCategoryName("");
			int listCount = mailService.countList(vo);
			
			vo.setFilter("안읽은메일");
			int nonListCount = mailService.countList(vo);
			
			resultMap.put("listCount", listCount);
			resultMap.put("nonListCount", nonListCount);
			resultMap.put("list", list);
			
			model.addAttribute("mailMap", resultMap);
			
		    RowBounds rb2 = new RowBounds(0 , 7);
		    List<NoticeVo> noticelist = noticeService.selectList("", rb2);
		    
		    //내 부서원 목록
		    Map<String, String> map = new HashMap<String, String>();
			map.put("loginDeptNo", loginMember.getDeptNo());
			map.put("loginTeamNo", loginMember.getTeamNo());
			map.put("loginNo", loginMember.getNo());
			
			List<MemberVo> deptMemberList = memberService.selectdeptMemberList(map);
		    
			
			//modelList
		    model.addAttribute("noticelist", noticelist);

		    model.addAttribute("deptMemberList", deptMemberList);

		    
			//실시간시간출력
			Date date = new Date();
			SimpleDateFormat day = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat time = new SimpleDateFormat("HH:mm");
			
			model.addAttribute("day", day.format(date) );
			model.addAttribute("time", time.format(date) );
		    
			//프로젝트
			List<ProjectVo> prjList = ps.selectList(Integer.parseInt(loginMember.getNo()));
			System.out.println("prjList : " + prjList);
			model.addAttribute("prjList", prjList);

		}
		return "main/mainPage";
	}
	
	@GetMapping("error")
	public String error(String code, Model model) {
		
		String errorMsg = "";
		String title = "";
		String msg = "";
		
		switch(code) {
		case "404": 
			errorMsg = "Page Not Found";
			title = "죄송합니다. 현재 찾을 수 없는 페이지를 요청 하셨습니다.";
			msg = "존재하지 않는 주소를 입력하셨거나,<br>요청하신 페이지의 주소가 변경, 삭제되어 찾을 수 없습니다.";
			break;
		case "405": 
			errorMsg = "Method Not Allowed";
			title = "The page you are looking for cannot be displayed";
			msg = "because an invalid method (HTTP verb)is used.";
			break;
		case "505": 
			errorMsg = "HTTP Version Not Supported";
			title = "Sorry, something went tecnically wrong";
			msg = "";
			break;
		}
		
		model.addAttribute("code", code);
		model.addAttribute("errorMsg", errorMsg);
		model.addAttribute("title", title);
		model.addAttribute("msg", msg);
		
		return "common/error";
	}
	
}
