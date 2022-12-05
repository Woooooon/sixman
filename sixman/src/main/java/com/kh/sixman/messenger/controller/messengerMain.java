package com.kh.sixman.messenger.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("messenger")
@Controller
public class messengerMain {

	//메신저 화면
	@GetMapping("/")
	public String messengerMain() {
		return "messengerMain";
	}
}
