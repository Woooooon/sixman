package com.kh.sixman.document.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.sixman.document.service.DocumentService;
import com.kh.sixman.document.vo.DocumentVo;

@RequestMapping("document")
@Controller
public class DocumentController {

	
	@Autowired
	private DocumentService ds;
	
	
	//기안문서함(화면)
	@GetMapping("first")
	public String First() {
		return "document/first";
	}
	//기안문서함 (찐)
	@PostMapping("first")
	public String Frist(DocumentVo dvo) {
		
		
		return "";
	}
	
	
	//결재상신(화면)
	@GetMapping("approve")
	public String Approve() {
		return "document/approve";
	}
	//결재상신 (찐)
	@PostMapping("approve")
	public String Approve(DocumentVo dvo) {
		return "";
	}
	
	
	
	
	//결재상신(mypage)(화면)
	@GetMapping("approvemy")
	public String ApproveMyPage() {
		return "document/approvemy";
	}
	//결재상신(mypage) (찐)
	@PostMapping("approvemy")
	public String ApproveMyPage(DocumentVo dvo) {
		return "";
	}
	
	//결재문서함(화면)
	@GetMapping("payment")
	public String mainDocu() {
		return "document/payment";
	}
	//결재문서함 (찐)
	@PostMapping("payment")
	public String mainDocu(DocumentVo dvo) {
		return "";
	}
	
	//참조문서함(화면)
	@GetMapping("reference")
	public String Reference() {
		return "document/reference";
	}
	//참조문서함 (찐)
	@PostMapping("reference")
	public String Reference(DocumentVo dvo) {
		return "";
	}
	
	
	//임시보관함(화면)
	@GetMapping("keep")
	public String Keep() {
		return "document/keep";
	}
	//임시보관함 (찐)
	@PostMapping("keep")
	public String Keep(DocumentVo dvo) {
		return "";
	}
	

	//결재선 작성(화면)
	@GetMapping("write")
	public String Write(){
		return "document/write";
	}
	//결재선 작성 (찐)
	@PostMapping("write")
	public String Write(DocumentVo dvo) {
		
		int result = ds.write(dvo);
		
		if(result ==1) {
			return "document/first";
		}else {
			return "에러페이지 작성해야함";
		}
		
		
	}
	
	
	/////////////////////////////////////////////////////////
	
	
	

	
}
