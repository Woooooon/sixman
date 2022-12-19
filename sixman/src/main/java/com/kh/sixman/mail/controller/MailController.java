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

@RequestMapping("mail")
@Controller
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
	@PostMapping("list")
	public String list(@RequestParam Map<String, String> map, HttpSession session) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		MailVo vo = new MailVo();
		vo.setSendUser(loginMember.getNo());
		vo.setRMail(loginMember.getEmail());
//		vo.setSendUser("1");
//		vo.setRMail("a@naver.com");
		vo.setCategoryName(map.get("listTpye"));
		vo.setCategory(map.get("categoryNo"));
		vo.setSearch(map.get("search"));
		
		System.out.println(map.get("search")==null);
		System.out.println(vo);
		
//		category, keyword, page
		int pageLimit = 5;
		int boardLimit = 15;
		int listCount = ms.countList(vo);
		
		int page = Integer.parseInt(map.get("page"));
	    int offset = (page-1) * boardLimit;
	    RowBounds rb = new RowBounds(offset , boardLimit);
	    
	    PageVo pv = new PageVo(listCount,page,pageLimit,boardLimit);
	    List<MailVo> list = ms.selectList(vo, rb);
	    
	    List<Map<String, String>> cateogryList = ms.categoryList("1");

		Map<String, Object> resultMap = new HashMap<>();
		
		resultMap.put("pv", pv);
		resultMap.put("list", list);
		resultMap.put("cateogryList", cateogryList);
		
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
		
//		테스트
//		vo.setSendUser("1");
		
		String rootPath = session.getServletContext().getRealPath("/");
		List<AttachmentVo> fileList = FileUnit.uploadFile(vo.getFile(), rootPath, "upload/notice");
		vo.setFileList(fileList);
		int result = ms.write(vo);
		
		if(result > 0) {
			return "mail/list";
		}else {
			return "";
		}
	}
	
	@GetMapping("detail")
	public String detail(String no, Model model) {
		MailVo vo = ms.selectOne(no);
		model.addAttribute("vo", vo);
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
			
		}
	}
	
	@ResponseBody
	@PostMapping("updateRead")
	public void updateRead(List<String> no) {
		int result = ms.updateRead(no);	
	}
	
	@ResponseBody
	@PostMapping("changeCategory")
	public void changeCategory(List<String> no, String category) {
		int result = ms.changeCategory(no, category);
	}
	
	@ResponseBody
	@PostMapping("createCategory")
	public void createCategory(String category, HttpSession session) {
		MemberVo loginMeber = (MemberVo) session.getAttribute("loginMember");
		
		int result = ms.createCategory(category, loginMeber.getNo());
		
		if(result!=1) {
			
		}
	}
	
	@ResponseBody
	@PostMapping("categoryList")
	public String categoryList(HttpSession session) {
		MemberVo loginMeber = (MemberVo) session.getAttribute("loginMember");
		
		List<Map<String, String>> list = ms.categoryList(loginMeber.getNo());
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list);
		
		return json;
	}
	
	
	@ResponseBody
	@PostMapping("restore")
	public void restore(List<String> no) {
		int result = ms.restore(no);
	}
	
	@ResponseBody
	@PostMapping("realDelete")
	public void realDelete(List<String> no) {
		int result = ms.realDelete(no);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
