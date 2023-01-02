package com.kh.sixman.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.sixman.chat.service.ChatService;
import com.kh.sixman.chat.vo.ChatRoomVo;
import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.member.vo.MemberVo;

@Controller
@ResponseBody
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	private String getJson(Object obj) {
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(obj);
		return json;
	}
	
	private MemberVo getLoginMember(HttpSession session) {
		return (MemberVo) session.getAttribute("loginMember");
	}
	
	@PostMapping(value = "memberPage", produces = "application/json; charset=utf8")
	public String memberPage(HttpSession session) {
		String no = getLoginMember(session).getNo();
		
		Map<String, Object> map = chatService.getMember(no);

		return getJson(map);
	}
	
	@PostMapping(value = "chatPage", produces = "application/json; charset=utf8")
	public String chatPage(HttpSession session) {
		String no = getLoginMember(session).getNo();
		
		List<ChatRoomVo> list = chatService.getChatList(no);
		
		return getJson(list);		
	}
	
	@PostMapping(value = "chatRoom", produces = "application/json; charset=utf8")
	public String chatRoom(String no, HttpSession session) {
		String loginNo = getLoginMember(session).getNo();
		Map<String, String> map = new HashMap<>();
		map.put("loginNo", loginNo);
		map.put("no", no);
		ChatRoomVo vo = chatService.getChat(map);
		
		return getJson(vo);		
	}
	
	@PostMapping(value = "getImgList", produces = "application/json; charset=utf8")
	public String getImgList(String no) {
		
		List<AttachmentVo> list = chatService.getImgList(no);
		return getJson(list);		
	}
	
	@PostMapping(value = "getFileList", produces = "application/json; charset=utf8")
	public String getFileList(String no) {
		
		List<AttachmentVo> list = chatService.getFileList(no);
		return getJson(list);		
	}
	
	@PostMapping(value = "createChat")
	public void createChat(List<String> no, HttpSession session) {
		String loginNo = getLoginMember(session).getNo();
		int result = chatService.createChat(loginNo, no);
	}
	
	@PostMapping(value = "bookMark")
	public void bookMark(String no, HttpSession session) {
		String loginNo = getLoginMember(session).getNo();
		int result = chatService.bookMark(loginNo, no);
	}
	
	@PostMapping(value = "nonBookMark")
	public void nonBookMark(String no, HttpSession session) {
		String loginNo = getLoginMember(session).getNo();
		int result = chatService.nonBookMark(loginNo, no);
	}
	
	@PostMapping(value = "chatOut")
	public void chatOut(String no, HttpSession session) {
		String loginNo = getLoginMember(session).getNo();
		int result = chatService.chatOut(loginNo, no);
	}
	
	@PostMapping(value = "changeName")
	public void changeName(String no, HttpSession session) {
		String loginNo = getLoginMember(session).getNo();
		int result = chatService.changeName(loginNo, no);
	}
	
	@PostMapping(value = "setFix")
	public void setFix(String no, String fix, HttpSession session) {
		String loginNo = getLoginMember(session).getNo();
		int result = chatService.setFix(loginNo, no, fix);
	}
	
	@PostMapping(value = "setAlarm")
	public void setAlarm(String no, String alarm, HttpSession session) {
		String loginNo = getLoginMember(session).getNo();
		int result = chatService.setAlarm(loginNo, no, alarm);
	}

}
