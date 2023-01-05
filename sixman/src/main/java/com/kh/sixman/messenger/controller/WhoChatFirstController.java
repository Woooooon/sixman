package com.kh.sixman.messenger.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.messenger.service.ChatWantFirstService;
import com.kh.sixman.messenger.vo.ChatCreateRoomMemberVo;

//@RequestMapping("chat")
@Controller
public class WhoChatFirstController {
	
	@Autowired
	private ChatWantFirstService chatWfs;
	
	
	@ResponseBody
	@GetMapping("chatwantfirst")
//	public String method(HttpServletResponse resp) throws Exception {
	public List<ChatCreateRoomMemberVo> method(HttpSession session){
		//DB

		 	MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");

			ChatCreateRoomMemberVo whoChatfirst = new ChatCreateRoomMemberVo();
			
//			과거 코드 대표
//			String id = loginMember.getId();
//			String name = "심영";
//			whoChatfirst.setName(name);
			
			List<ChatCreateRoomMemberVo> whoChatFirst = chatWfs.chatfirst(whoChatfirst);
			System.out.println(whoChatFirst);
			session.setAttribute("whoChatfirst", whoChatFirst);
			
			return whoChatFirst;
	}
	
	@ResponseBody
	@GetMapping("chatwantfirst2")
	public String method2(HttpSession session) {
		return null;
		
	}

}
