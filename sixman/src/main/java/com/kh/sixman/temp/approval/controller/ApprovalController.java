package com.kh.sixman.temp.approval.controller;

import java.util.ArrayList;
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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.sixman.common.PageVo;
import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.notice.vo.NoticeVo;
import com.kh.sixman.temp.approval.service.ApprovalService;
import com.kh.sixman.temp.approval.vo.ApprovalDocumentVo;
import com.kh.sixman.temp.approval.vo.ApprovalVo;

@RequestMapping("approval")
@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService approvalService;
	
	private MemberVo getLoginMember(HttpSession session) {
		return (MemberVo) session.getAttribute("loginMember");
	}

	@GetMapping("list")
	public String approvalList(HttpSession session, String p, Model model) {
		MemberVo loginMember = getLoginMember(session);
		
		int pageLimit = 5;
		int boardLimit = 12;
		int listCount = approvalService.selectCount(loginMember.getNo());
		
		if(p==null) {
			p = "1";
		}
		
		int page = Integer.parseInt(p);
		
	    int offset = (page-1) * boardLimit;
	    RowBounds rb = new RowBounds(offset , boardLimit);
	    
	    PageVo pv = new PageVo(listCount,page,pageLimit,boardLimit);
	    List<ApprovalDocumentVo> list = approvalService.selectList(loginMember.getNo(), rb);
		
	    model.addAttribute("list", list);
	    model.addAttribute("pv", pv);
	    
		return "approval/list";
	}
	
	@GetMapping("write")
	public String approvalWrite() {
		return "approval/write";
	}
	
	@PostMapping("write")
	public String approvalWrite(ApprovalDocumentVo vo, HttpSession session) {
		MemberVo loginMember = getLoginMember(session);
		vo.setSendPay(loginMember.getNo());
		System.out.println(vo.getDocSaveNo());
		int result = approvalService.write(vo);
		if(result<0) {
			return "common/error";
		}
		return "redirect:/approval/list";			
	}
	
	@GetMapping("lineList")
	public String approvalLineList(HttpSession session, Model model) {
		MemberVo loginMember = getLoginMember(session);
		Map<String, List<ApprovalVo>> map = approvalService.getLineList(loginMember.getNo());
		if(map!=null) {
			model.addAttribute("map", map);
		}
		return "approval/lineList";
	}
	
	@GetMapping("lineAdd")
	public String approvalLineAdd() {
		return "approval/lineAdd";
	}
	
	@PostMapping("lineAdd")
	public void approvalLineAdd(@RequestParam String json, HttpSession session) {
		MemberVo loginMember = getLoginMember(session);
		Gson gson = new GsonBuilder().create();
		
		List<ApprovalVo> list = new ArrayList<>();
		List<ApprovalVo> jsonList = gson.fromJson(json, list.getClass());
		
		Map<String, Object> map = new HashMap<>();
		map.put("loginNo", loginMember.getNo());
		map.put("dataList", jsonList);
		
		int result = approvalService.createLine(map);
	}
	
	@GetMapping("detail")
	public String approvalDetail(String no, Model model) {
		
		ApprovalDocumentVo vo = approvalService.getDocument(no);
		
		if(vo!=null) {
		    model.addAttribute("vo", vo);
		}
		
		return "approval/detail";
	}
	
	@GetMapping("check")
	public void approvalCheck(String no, HttpSession session) {
		MemberVo loginMember = getLoginMember(session);
		Map<String, String> map = new HashMap<>();
		map.put("loginNo", loginMember.getNo());
		map.put("no", no);
		int result = approvalService.check(map);
		
	}
	
}
