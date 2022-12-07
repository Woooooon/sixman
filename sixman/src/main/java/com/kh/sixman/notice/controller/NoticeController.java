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
import com.kh.sixman.notice.service.NoticeService;
import com.kh.sixman.notice.vo.NoticeVo;
import com.kh.sixman.notice.vo.SearchVo;

@Controller
public class NoticeController {
			
	@Autowired
	private NoticeService ns;

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
