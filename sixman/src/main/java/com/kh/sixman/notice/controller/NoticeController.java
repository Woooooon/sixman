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

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class NoticeController {
			
	@Autowired
	private NoticeService ns;

	@GetMapping("admin/notice/write")
	public String write() {
		return "notice/write";
	}
	
	@PostMapping("admin/notice/write")
	public String write(NoticeVo vo, HttpSession session) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
			
		String rootPath = session.getServletContext().getRealPath("/");
		List<AttachmentVo> fileList = FileUnit.uploadFile(vo.getFile(), rootPath, "upload/notice");
						
		if(vo.getInportantYn()==null)vo.setInportantYn("N");
		
		vo.setUserNo(loginMember.getNo());
		vo.setName(loginMember.getName());
		vo.setFileList(fileList);
		
		int result = ns.write(vo);
		
		if(result==1) {
			return "redirect:/notice/list";
		}else {
			log.error("notice : 작성하기 실패");
			return "redirect:/admin/notice/write";			
		}
	}
	
	@GetMapping("notice/detail")
	public String detail(String no, Model model) {
		Map<String, NoticeVo> resultMap = ns.selectOne(no);
		model.addAttribute("resultMap", resultMap);
		
		if(resultMap==null) {
			log.error("notice : 디테일 조회 실패");
			return "redirect:/notice/list";
		}
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
		map.put("listCount", listCount);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);
		return json;
	}
	
	@GetMapping(value = "getNotice", produces = "application/json; charset=utf8")
	@ResponseBody
	public String getNotice() {
	    RowBounds rb2 = new RowBounds(0 , 7);
	    List<NoticeVo> noticelist = ns.selectList("", rb2);
	    
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(noticelist);
		return json;
	}
	
	@PostMapping("admin/notice/delete")
	public String delete(String no) {
		
		int result = ns.delete(no);
		
		if(result!=1) {
			log.error("notice : 삭제하기 실패");
		}
		
		return "redirect:/notice/list";
	}
	
	@GetMapping("admin/notice/update")
	public String update(String no, Model model) {
		
		Map<String, NoticeVo> resultMap = ns.selectOne(no);
		model.addAttribute("vo",resultMap.get("vo"));
				
		return "notice/update";
	}
	
	@PostMapping("admin/notice/update")
	public String update(NoticeVo vo, HttpSession session) {
		
		String rootPath = session.getServletContext().getRealPath("/");
		List<AttachmentVo> fileList = FileUnit.uploadFile(vo.getFile(), rootPath, "upload/notice");
		vo.setFileList(fileList);
		
		if(vo.getInportantYn()==null)vo.setInportantYn("N");
		
		int  result = ns.update(vo);
		
		if(result!=1) {
			log.error("notice : 수정하기 실패");
		}
		
		return "redirect:/notice/detail?no="+vo.getNo();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
