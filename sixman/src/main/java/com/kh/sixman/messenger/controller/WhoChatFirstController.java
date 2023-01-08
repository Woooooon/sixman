package com.kh.sixman.messenger.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.messenger.service.ChatWantFirstService;
import com.kh.sixman.messenger.service.MakeRoomFirstService;
import com.kh.sixman.messenger.vo.ChatCreateRoomMemberVo;
import com.kh.sixman.messenger.vo.ChatRoomDataVo;
import com.kh.sixman.messenger.vo.DefineChatNameVo;
import com.kh.sixman.messenger.vo.ReadChatRoomListVo;

//@RequestMapping("chat")
@Controller
public class WhoChatFirstController {
//	
//	@Autowired
//	public ReadChatRoomListVo readchatroomlistvo;
	
	@Autowired
	private ChatWantFirstService chatWfs;
	
	@Autowired
	private MakeRoomFirstService makeroom;
	
//	@Autowired
//	private DefineChatNameVo dchatnvo;
	
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
	@PostMapping("chatwantfirst2")
	public void method2(HttpSession session, DefineChatNameVo dchatnvo) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
	 	dchatnvo.setAdminNo(Integer.parseInt(loginMember.getNo()));
		System.out.println(dchatnvo);

//		
		makeroom.makechatroom(session, dchatnvo);
////		
//		return result;
		
	}
	
	@ResponseBody
	@GetMapping("getchatroomList")
//	public List<ReadChatRoomListVo> chatroomList() {
	public List<ReadChatRoomListVo> chatroomList(HttpSession session) {
		
		ReadChatRoomListVo readchatroomlistdata = new ReadChatRoomListVo();
		
		List<ReadChatRoomListVo> showchatroomlistReady = chatWfs.readchatroomlist(readchatroomlistdata);
		System.out.println(showchatroomlistReady);
		session.setAttribute("showchatroomlistReady", showchatroomlistReady);
		return showchatroomlistReady;
		
	}
	
	@ResponseBody
	@GetMapping("chatroom")
	public List<ChatRoomDataVo> chatroom(HttpSession session, ChatRoomDataVo vo){
		System.out.println("채팅룸 인덱스 : " + vo.getChatRoomIndex());
//		ChatRoomDataVo chatroomdata = new ChatRoomDataVo();
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		vo.setLoginMemberNo(loginMember.getNo());
		List<ChatRoomDataVo> chatRoomDataReady =  chatWfs.readchatroomdata(vo);
		System.out.println(chatRoomDataReady);
		session.setAttribute("chatRoomDataReady", chatRoomDataReady);
		return chatRoomDataReady;
		
	}

}
