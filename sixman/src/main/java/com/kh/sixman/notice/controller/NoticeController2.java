package com.kh.sixman.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.sixman.common.PageVo;
import com.kh.sixman.notice.service.NoticeService2;
import com.kh.sixman.notice.vo.NoticeVo;
import com.kh.sixman.notice.vo.SearchVo;

@Controller
public class NoticeController2 {
			
	@Autowired
	private NoticeService2 ns;

	@GetMapping("notice/list")
	public String list() {
		return "notice/list";
	}
	
	@GetMapping("notice/write")
	public String write() {
		return "notice/write";
	}
	
	@GetMapping("notice/detail")
	public String detail() {
		return "notice/detail";
	}
	
	@PostMapping("notice/list")
	@ResponseBody
	public String list(SearchVo sv, HttpSession session) {
		
		int pageLimit = 5;
		int boardLimit = 15;
	
	    int offset = (sv.getPage()-1) * boardLimit;
	    RowBounds rb = new RowBounds(offset , boardLimit);
	    
	    List<NoticeVo> list = null;
	    	    
	    int listCount = 0;
		switch(sv.getListType()) {
		case "보낸메일함": 
			listCount = ns.countSendList(sv); 
			list = ns.selectSendList(rb, sv);
			break;
		case "임시보관함": 
			listCount = ns.countTempList(sv); 
			list = ns.selectTempList(rb, sv);
			break;
		case "휴지통": 
			listCount = ns.countDeleteList(sv); 
			list = ns.selectDeleteList(rb, sv);
			break;
		default: 
			listCount = ns.countList(sv); 
			list = ns.selectList(rb, sv);
			break;
		}

		PageVo pv = new PageVo(listCount,sv.getPage(),pageLimit,boardLimit);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("pv", pv);
		map.put("list", list);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);
		return json;
	}
}
