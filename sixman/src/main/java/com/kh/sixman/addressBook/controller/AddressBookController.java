package com.kh.sixman.addressBook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("address")
@Controller
public class AddressBookController {
	
	@GetMapping("")
	public String list() {
		return "addressBook/list";
	}
	
	@GetMapping("receive")
	public String receive() {
		return "addressBook/receive";
	}
}
