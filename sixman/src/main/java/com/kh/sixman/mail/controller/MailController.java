package com.kh.sixman.mail.controller;

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
import com.kh.sixman.mail.service.MailService;
import com.kh.sixman.mail.vo.MailVo;
import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.notice.vo.NoticeVo;

@RequestMapping("mail")
@Controller
public class MailController {
	
	@Autowired
	private MailService ms;
	
	@GetMapping("list")
	public String list() {
		return "mail/list";
	}
	
	@ResponseBody
	@PostMapping("list")
	public String list(@RequestParam Map<String, String> map) {
//		category, keyword, page
		int pageLimit = 5;
		int boardLimit = 15;
		int listCount = ms.countList(map);
		
		int page = Integer.parseInt(map.get("page"));
	    int offset = (page-1) * boardLimit;
	    RowBounds rb = new RowBounds(offset , boardLimit);
	    
	    PageVo pv = new PageVo(listCount,page,pageLimit,boardLimit);
	    List<NoticeVo> list = ms.selectList(map, rb);

		Map<String, Object> resultMap = new HashMap<>();
		
		resultMap.put("pv", pv);
		resultMap.put("list", list);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(resultMap);
		return json;
	}
	
	@GetMapping("write")
	public String write() {
		return "mail/write";
	}
	
	@PostMapping("write")
	public String  write(MailVo vo, HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		vo.setSendUser(loginMember.getNo());
		
		String rootPath = session.getServletContext().getRealPath("/");
		List<AttachmentVo> fileList = FileUnit.uploadFile(vo.getFile(), rootPath, "upload/notice");
		vo.setFileList(fileList);
		
		int result = ms.write(vo);
		return "";
	}
	
	@GetMapping("detail")
	public String detail(String no, Model model) {
		MailVo vo = ms.selectOne(no);
		model.addAttribute("vo", vo);
		
		if(vo==null) {return "redirect:/mail/list";}
		return "mail/detail";
	}
	
	@ResponseBody
	@PostMapping("delete")
	public void delete(List<String> no) {
		
	}
	
	@ResponseBody
	@PostMapping("updateRead")
	public void updateRead(List<String> no) {
		
	}
	
	@ResponseBody
	@PostMapping("changeCategory")
	public void changeCategory(List<String> no, String category) {
		
	}
	
	@ResponseBody
	@PostMapping("createCategory")
	public void createCategory(List<String> no, String category) {
		
	}
	
	
	@ResponseBody
	@PostMapping("restore")
	public void restore(List<String> no) {
		
	}
	
	@ResponseBody
	@PostMapping("realDelete")
	public void realDelete(List<String> no) {
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
