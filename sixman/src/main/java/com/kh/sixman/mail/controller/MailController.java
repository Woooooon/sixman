package com.kh.sixman.mail.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.common.FileUnit;
import com.kh.sixman.common.PageVo;
import com.kh.sixman.mail.service.MailService;
import com.kh.sixman.mail.vo.MailVo;
import com.kh.sixman.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("mail")
@Controller
@Slf4j
public class MailController {
	
	@Autowired
	private MailService ms;
	
	@GetMapping("list")
	public String list(String listType, Model model) {
		
		if(listType!=null) {
			model.addAttribute("listType", listType);
		}
		return "mail/list";
	}
		
	@ResponseBody
	@PostMapping(value = "list", produces = "application/json; charset=utf8")
	public String list(@RequestParam Map<String, String> map, HttpSession session) {
		log.info("mailList ajax 호출");
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		MailVo vo = new MailVo();
		vo.setUserNo(loginMember.getNo());
		vo.setUserEmail(loginMember.getEmail());
		vo.setCategoryName(map.get("listTpye"));
		vo.setCategory(map.get("categoryNo"));
		vo.setSearch(map.get("search"));
		vo.setFilter(map.get("filter"));
		
//		category, keyword, page
		int pageLimit = 5;
		int boardLimit = 15;
		int listCount = ms.countList(vo);
		
		int page = Integer.parseInt(map.get("page"));
	    int offset = (page-1) * boardLimit;
	    RowBounds rb = new RowBounds(offset , boardLimit);
	    
	    PageVo pv = new PageVo(listCount,page,pageLimit,boardLimit);
	    List<MailVo> list = ms.selectList(vo, rb);
	    
	    List<Map<String, String>> categoryList = ms.categoryList(loginMember.getNo());
	    
		Map<String, Object> resultMap = new HashMap<>();
		
		if(vo.getCategoryName() == null || vo.getCategoryName().equals("null")) {
			vo.setFilter("안읽은메일");
			int nonListCount = ms.countList(vo);
			resultMap.put("nonListCount", nonListCount);
		}
		
		resultMap.put("pv", pv);
		resultMap.put("list", list);
		resultMap.put("categoryList", categoryList);
		resultMap.put("listCount", listCount);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(resultMap);
		return json;
	}
	
	@GetMapping("write")
	public String write(String email, Model model) {
		if(email!=null) {
			model.addAttribute("email", email);
		}
		return "mail/write";
	}
	
	@GetMapping("reWrite")
	public String update(String no , String save, Model model) {
		if(no!=null) {
			MailVo vo = ms.selectOne(no);
			model.addAttribute("vo", vo);
		}
		if(save!=null) {
			model.addAttribute("save", save);
		}
		return "mail/write";
	}
	
	@PostMapping("write")
	public String  write(MailVo vo, HttpSession session, Model model) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		vo.setUserNo(loginMember.getNo());
		
		if(vo.getSender()==null || vo.getSender().size()==0) {
			model.addAttribute("msg", "보낼사람을 입력해 주세요");
			return "mail/wirte";
		}
		
		String rootPath = session.getServletContext().getRealPath("/");
		List<AttachmentVo> fileList = FileUnit.uploadFile(vo.getFile(), rootPath, "upload/notice");
		vo.setFileList(fileList);
		
		int result = 0;
		if(vo.getMailNo()==null) {
			result = ms.write(vo);			
		}else {
			result = ms.update(vo);
		}
		
		
		if(result != 0) {
			return "redirect:/mail/list";
		}else {
			return "";
		}
	}
	
	@GetMapping("detail")
	public String detail(String no, String save, Model model, HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		Map<String, Object> map = new HashMap<>();
		map.put("loginMember", loginMember);
		
		List<String> noList = new ArrayList<String>();
		noList.add(no);
		
		map.put("no", noList);
		
		int result = ms.updateRead(map);
		if(result!= 1) {log.error("mail-controller : 읽음처리 실패");}
		
		List<Map<String, String>> categoryList = ms.categoryList(loginMember.getNo());
		
		MailVo vo = ms.selectOne(no);
		model.addAttribute("vo", vo);
		model.addAttribute("categoryList", categoryList);
		
		if(save!=null) {
			model.addAttribute("save", save);
		}
		
		if(vo==null) {return 	"redirect:/mail/list";}
		return "mail/detail";
	}
	
	@ResponseBody
	@PostMapping("delete")
	public void delete(@RequestParam List<String> no, HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		Map<String, Object> map = new HashMap<>();
		map.put("loginMember", loginMember);
		map.put("no", no);
		int result = ms.delete(map);
		
		if(result!=1) {
			log.error("delete 실패");
		}
	}
	
	@ResponseBody
	@PostMapping("updateRead")
	public void updateRead(@RequestParam List<String> no, HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		Map<String, Object> map = new HashMap<>();
		map.put("loginMember", loginMember);
		map.put("no", no);
		int result = ms.updateRead(map);	
		
		if(result!=1) {
			log.error("updateRead 실패");
		}
	}
	
	@ResponseBody
	@PostMapping("changeCategory")
	public void changeCategory(@RequestParam List<String> no, @RequestParam String category, HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		Map<String, Object> map = new HashMap<>();
		map.put("loginMember", loginMember);
		map.put("no", no);
		map.put("category", category);
		
		int result = ms.changeCategory(map);
		
		if(result!=1) {
			log.error("updateRead 실패");
		}
	}
	
	@ResponseBody
	@PostMapping("createCategory")
	public void createCategory(String category, HttpSession session) {
		MemberVo loginMeber = (MemberVo) session.getAttribute("loginMember");
		int result = ms.createCategory(category, loginMeber.getNo());
		
		if(result!=1) {
			log.error("createCategory 실패");
		}
	}	
	
	@ResponseBody
	@PostMapping("restore")
	public void restore(@RequestParam List<String> no, HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		Map<String, Object> map = new HashMap<>();
		map.put("loginMember", loginMember);
		map.put("no", no);
		int result = ms.restore(map);
		
		if(result!=1) {
			log.error("restore 실패");
		}
	}
	
	@ResponseBody
	@PostMapping("realDelete")
	public void realDelete(@RequestParam List<String> no, HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		Map<String, Object> map = new HashMap<>();
		map.put("loginMember", loginMember);
		map.put("no", no);
		int result = ms.realDelete(map);
		
		if(result!=1) {
			log.error("realDelete 실패");
		}
	}
	
	@ResponseBody
	@PostMapping(value = "getCategoryList", produces = "application/json; charset=utf8")
	public String getCategoryList(HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");

		List<Map<String, String>> result = ms.categoryList(loginMember.getNo());
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(result);
		return json;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
