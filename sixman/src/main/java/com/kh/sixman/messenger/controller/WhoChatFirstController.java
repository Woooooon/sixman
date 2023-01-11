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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.messenger.service.ChatWantFirstService;
import com.kh.sixman.messenger.service.MakeRoomFirstService;
import com.kh.sixman.messenger.vo.ChatContent;
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
	
	private final ChatWantFirstService chatWfs;
	
	private final MakeRoomFirstService makeroom;

	@Autowired
	public WhoChatFirstController(ChatWantFirstService chatWfs, MakeRoomFirstService makeroom) {
		super();
		System.out.println("컨트롤러 생성자 ::: " + chatWfs);
		this.chatWfs = chatWfs;
		this.makeroom = makeroom;
	}
	
	//gson 라이브러리
	Gson gson = new Gson();

//	@Autowired
//	private DefineChatNameVo dchatnvo;
	
	//채팅 누구랑 하고 싶은지 보여주기
	@ResponseBody
	@GetMapping(value = "chatwantfirst", produces="application/json; charset=utf8")
//	public String method(HttpServletResponse resp) throws Exception {
	public String method(HttpSession session){
		//DB

		 	MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");

			ChatCreateRoomMemberVo whoChatfirst = new ChatCreateRoomMemberVo();
			
//			과거 코드 대표
//			String id = loginMember.getId();
//			String name = "심영";
//			whoChatfirst.setName(name);
			
			String whoChatFirst = gson.toJson(chatWfs.chatfirst(whoChatfirst)) ;
			System.out.println(whoChatFirst);
			session.setAttribute("whoChatfirst", whoChatFirst);
			
			return whoChatFirst;
	}
	
	
	//채팅방이름?
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
	
	
	//대화 틀 보내기
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
	
	
	
// 리스트 카운트 및 보여주기(첫화면)
//	, method=RequestMethod.POST
	@ResponseBody
//	@GetMapping("getchatroomList")
	@GetMapping(value = "getchatroomList", produces="application/json; charset=utf8")
//	public List<ReadChatRoomListVo> chatroomList() {
	public String chatroomList(HttpSession session) {

		ReadChatRoomListVo readchatroomlistdata = new ReadChatRoomListVo();
		
		readchatroomlistdata.getChatcontent();
		System.out.println("chatWfs ::: " + chatWfs);
		String showchatroomlistReady = gson.toJson(chatWfs.readchatroomlist(readchatroomlistdata));
		
//		byte[] utf8Json = jsonstring
		System.out.println("json : " + showchatroomlistReady);
		session.setAttribute("showchatroomlistReady", showchatroomlistReady);
		
//		gson.fromJson(showchatroomlistReady, getClass());
		
		

		
		return showchatroomlistReady;
		
	}
	
	//메신저 보내기
	@GetMapping(value="chatroom/sendmessage", produces="application/json; charset=utf8")
	public String sendMessageText(HttpSession session) {
		ChatContent sendMessageData = new ChatContent();
		
//		//로그인멤버
//		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
//		
//		
//		
//		String sendMessageAction = gson.toJson(chatWfs.sendMessageContent(sendMessageData));
//		return sendMessageAction;
	
		return "test!!!";
	}

	
	
}
