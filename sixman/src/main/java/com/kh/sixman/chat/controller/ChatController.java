package com.kh.sixman.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.sixman.chat.service.ChatService;
import com.kh.sixman.chat.vo.ChatRoomVo;
import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.common.FileUnit;
import com.kh.sixman.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@ResponseBody
@Slf4j
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
	
	@PostMapping(value = "chat", produces = "application/json; charset=utf8")
	public String chat(String room, String msg, MultipartFile file, HttpSession session) {
		String no = getLoginMember(session).getNo();
		Map<String, Object> map = new HashMap<>();
		
		AttachmentVo vo = null;
		if(file!=null) {
			String rootPath = session.getServletContext().getRealPath("/");
			vo = FileUnit.uploadFileOne(file, rootPath, "sixman/src/main/webapp/resources/chat");
			map.put("file", vo);
		}
		
		map.put("room", room);
		map.put("msg", msg);
		map.put("no", no);
		String result = chatService.chat(map);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(vo!=null) {
			if(result!=null) {
				resultMap.put("fileNo", result);
			}
			resultMap.put("changeName", vo.getChangeName());
			resultMap.put("originName", vo.getOriginName());
		}
		
		return getJson(resultMap);
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
		
		int result = chatService.join(map);
		ChatRoomVo vo = null;			
		if(result==1) {
			vo = chatService.getChat(map);
			session.setAttribute("room", vo);
		}
		
		return getJson(vo);		
	}
	
	@PostMapping(value = "closeChat", produces = "application/json; charset=utf8")
	public void closeChat(HttpSession session) {
		String loginNo = getLoginMember(session).getNo();
		ChatRoomVo vo = (ChatRoomVo) session.getAttribute("room");
		
		session.removeAttribute("room");			
		if(vo==null)return;
		
		String no = vo.getChatRoomNo();
		
		Map<String, String> map = new HashMap<>();
		map.put("loginNo", loginNo);
		map.put("no", no);
		
		chatService.join(map);
	}
	
	@PostMapping(value = "createChat")
	public void createChat(@RequestParam Set<String> no, HttpSession session) {
		MemberVo loginMember = getLoginMember(session);
		int result = chatService.createChat(loginMember, no);
		if(result!=1) {
			log.error("createChat 등록 실패");
		}
	}
	
	@PostMapping(value = "bookMark")
	public void bookMark(String no, String bookMark, HttpSession session) {
		String loginNo = getLoginMember(session).getNo();
		Map<String, String> map = new HashMap<>();
		map.put("loginNo", loginNo);
		map.put("bookMark", bookMark);
		map.put("no", no);
		int result = chatService.bookMark(map);
		if(result!=1) {
			log.error("bookMark 등록 실패");
		}
	}
	
	@PostMapping(value = "outChat")
	public void chatOut(String no, HttpSession session) {
		String loginNo = getLoginMember(session).getNo();
		Map<String, String> map = new HashMap<>();
		map.put("loginNo", loginNo);
		map.put("no", no);
		int result = chatService.chatOut(loginNo, map);
	}
	
	@PostMapping(value = "changeName")
	public void changeName(String no, String value,  HttpSession session) {
		String loginNo = getLoginMember(session).getNo();
		Map<String, String> map = new HashMap<>();
		map.put("loginNo", loginNo);
		map.put("value", value);
		map.put("no", no);
		int result = chatService.changeName(map);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
		if(result!=1) {
			log.error("changeName 실패");
		}
	}
	
	@PostMapping(value = "setFix")
	public void setFix(String no, String fix, HttpSession session) {
		String loginNo = getLoginMember(session).getNo();
		Map<String, String> map = new HashMap<>();
		map.put("loginNo", loginNo);
		map.put("fix", fix);
		map.put("no", no);
		int result = chatService.setFix(map);
		if(result!=1) {
			log.error("setFix 실패");
		}
	}
	
	@PostMapping(value = "setAlarm")
	public void setAlarm(String no, String alarm, HttpSession session) {
		String loginNo = getLoginMember(session).getNo();
		Map<String, String> map = new HashMap<>();
		map.put("loginNo", loginNo);
		map.put("alarm", alarm);
		map.put("no", no);
		int result = chatService.setAlarm(map);
		if(result!=1) {
			log.error("setAlarm 실패");
		}
	}
	
	@PostMapping(value = "profile", produces = "application/json; charset=utf8")
	public String profile(String no, HttpSession session) {
		String loginNo = getLoginMember(session).getNo();
		Map<String, String> map = new HashMap<>();
		map.put("loginNo", loginNo);
		map.put("no", no);
		MemberVo vo = chatService.profile(map);
		if(vo==null) {
			log.error("profile 실패");
			return null;
		}
		return getJson(vo);
	}

}
