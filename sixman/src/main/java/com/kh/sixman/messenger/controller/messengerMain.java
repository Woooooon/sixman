package com.kh.sixman.messenger.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("messenger")
@Controller
public class messengerMain {

	//메신저 화면
	@GetMapping("/")
	public String main() {
		System.out.println("messenger > main ~~~");
		return "/messenger/messengerMain";
	}
//	
//	//채팅방 생성 화면1
//	@GetMapping("/whochat")
//	public String whochat() {
//		return "/messenger/whoChat";
//	}
//	
//	//채팅방 생성 화면2
//	@GetMapping("/whochat/name")
//	public String whochatname() {
//		return "/messenger/whoChatName";
//	}
//	
//	//채팅방 생성 화면2
//	@GetMapping("/chattingroom")
//	public String chattingroom() {
//		return "/messenger/chattingRoom";
//	}
//		
	//메신저 호출테스트1 화면
	@GetMapping("/yolo")
	public String yolocall() {
		System.out.println("messenger > yolo ~~~");
		return "/messenger/test";
	}
}
