package com.kh.sixman.document.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.common.FileUnit;
import com.kh.sixman.common.PageVo;
import com.kh.sixman.document.service.DocumentService;
import com.kh.sixman.document.vo.DocumentVo;
import com.kh.sixman.mail.vo.MailVo;
import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.notice.vo.NoticeVo;

@RequestMapping("document")
@Controller
public class DocumentController {

   
   @Autowired
   private DocumentService ds;
   
   
   //기안문서함(화면)
   @GetMapping("first")
//   public String First(String listType,Model model) {
   public String First() {

//      if(listType !=null) {
//         model.addAttribute("listType" , listType);
//      }
      
      return "document/first";
   }
   //기안문서함 (찐)
   @ResponseBody
   @PostMapping(value="first", produces = "application/json; charset=utf8")
   public String First(int page ,String keyword){
	   
	   int pageLimit = 5;
		int boardLimit = 15;
		int listCount = ds.countList(keyword);
		
	    int offset = (page-1) * boardLimit;
	    RowBounds rb = new RowBounds(offset , boardLimit);
	    
	    
	    
	    PageVo pv = new PageVo(listCount,page,pageLimit,boardLimit);
	    List<NoticeVo> list = ds.selectList(keyword, rb);

		Map<String, Object> map = new HashMap<>();
		
		map.put("pv", pv);
		map.put("list", list);
		map.put("listCount", listCount);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);
		return json;
     
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
//   public String Write(String sendPay, Model model){
   public String write( Model model){
//      if(sendPay != null) {
//         model.addAttribute("sendPay",sendPay);
//      }
      return "document/write";
   }
   //결재선 작성 (찐)
   @PostMapping("write")
   public String write(DocumentVo dvo , HttpSession session) {
	   
	   MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");

     
      String rootPath = session.getServletContext().getRealPath("/");
      List<AttachmentVo> fileList = FileUnit.uploadFile(dvo.getFile(), rootPath, "upload/document");
      
     
      
      dvo.setSendPay(loginMember.getNo());
      dvo.setSendName(loginMember.getName());
      dvo.setFileList(fileList);
      
      

      
 
      
      
      
      int result = ds.write(dvo);
      
      if(result > 0) {
         return "document/first";
      }else {
         return "에러페이지";
      }
      
   }

   
   
   
   /////////////////////////////////////////////////////////
   
   
   

   
}