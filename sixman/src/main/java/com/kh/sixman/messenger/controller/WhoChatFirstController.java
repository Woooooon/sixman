package com.kh.sixman.messenger.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.messenger.vo.ChatCreateRoomMemberVo;

//@RequestMapping("chat")
@Controller
public class WhoChatFirstController {
	
	@Autowired
	private ChatWantFirstService chatWfs;
	
	@ResponseBody
	@GetMapping("chatwantfirst")
//	public String method(HttpServletResponse resp) throws Exception {
	public String method(){
		//DB
//
////		 	MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
//
//			ChatCreateRoomMemberVo whoChatfirst = new ChatCreateRoomMemberVo();
//			
//			
////			String id = loginMember.getId();
//			
//			String id = "chatfirst";
//			String teamName = "영업1팀";
//			String deptName = "영업부";
////			String profilePath = "no";
//			String position = "사원";
//			
//			whoChatfirst.setName(id);
//			whoChatfirst.setTeamName(teamName);
//			whoChatfirst.setDeptName(deptName);
////			whoChatfirst.setProfilePath(profilePath);
//			whoChatfirst.setPosition(position);
//			
//			
//			
			System.out.println("2");
//			return "3";
//			resp.getWriter().write("3");
			
			return "3";
//			return chat;
		
			
			
			
			
			
			
	}

}
