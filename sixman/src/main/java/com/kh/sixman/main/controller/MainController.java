package com.kh.sixman.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
//	@Autowired
//	JavaMailSender mailSender;

	@GetMapping("main")
	public String main() {
		
//		try {
//			MailHandler mailHandler = new MailHandler(mailSender);
//			mailHandler.setFrom("sixman@six.kh", "김부장");
//			mailHandler.setSubject("테스트용 메일");
//			mailHandler.setText("<h1>M</h1>");
//			mailHandler.setTo("wjdgks4752@gmail.com");
//			mailHandler.send();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		return "main/mainPage";
	}
	
}
