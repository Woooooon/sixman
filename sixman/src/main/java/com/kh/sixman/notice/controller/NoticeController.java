package com.kh.sixman.notice.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.common.FileUnit;
import com.kh.sixman.common.PageVo;
import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.notice.service.NoticeService;
import com.kh.sixman.notice.vo.NoticeVo;

@Controller
public class NoticeController {
			
	@Autowired
	private NoticeService ns;

	@GetMapping("notice/write")
	public String write() {
		return "notice/write";
	}
	
	@PostMapping("notice/write")
	public String write(NoticeVo vo, HttpSession session) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
			
		String rootPath = session.getServletContext().getRealPath("/");
		List<AttachmentVo> fileList = FileUnit.uploadFile(vo.getFile(), rootPath, "upload/notice");
		
//		테스트
		loginMember = new MemberVo();
		loginMember.setName("홍길동");
		loginMember.setNo("1");
				
		vo.setUserNo(loginMember.getNo());
		vo.setName(loginMember.getName());
		vo.setFileList(fileList);
		
		int result = ns.write(vo);
		
		if(result==1) {
			return "redirect:/notice/list";
		}else {
			return "redirect:/notice/write";			
		}
	}
	
	@GetMapping("notice/detail")
	public String detail(String no, Model model) {
		NoticeVo vo = ns.selectOne(no);
		model.addAttribute("vo", vo);
		
		if(vo==null) {return "redirect:/notice/list";}
		return "notice/detail";
	}

	@GetMapping("notice/list")
	public String list() {
		return "notice/list";
	}
	
	@PostMapping(value = "notice/list", produces = "application/json; charset=utf8")
	@ResponseBody
	public String list(int page, String keyword) {
				
		int pageLimit = 5;
		int boardLimit = 15;
		int listCount = ns.countList(keyword);
		
	    int offset = (page-1) * boardLimit;
	    RowBounds rb = new RowBounds(offset , boardLimit);
	    
	    PageVo pv = new PageVo(listCount,page,pageLimit,boardLimit);
	    List<NoticeVo> list = ns.selectList(keyword, rb);

		Map<String, Object> map = new HashMap<>();
		
		map.put("pv", pv);
		map.put("list", list);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);
		return json;
	}
}
