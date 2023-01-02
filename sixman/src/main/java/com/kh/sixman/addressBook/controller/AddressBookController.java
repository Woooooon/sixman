package com.kh.sixman.addressBook.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.sixman.addressBook.service.AddressService;
import com.kh.sixman.addressBook.vo.AddressVo;
import com.kh.sixman.addressBook.vo.SortationVo;
import com.kh.sixman.common.PageVo;
import com.kh.sixman.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("address")
@Controller
@Slf4j
public class AddressBookController {
	
	@Autowired
	private AddressService addressService;
	
	@GetMapping("")
	public String list(HttpSession session,Model model, String page, String keyword, String category) {
		//로그인한 유저의 세션 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");

		//로그인 유저의 seqNo 가져오기
		String no = loginMember.getNo();
		
		//page요청이 없으면 기본값으로 1설정
		if(page == null) {
			page = "1";
		}
		
		log.info(keyword);
		log.info(category);
		
		//로그인 유저마다 주소록이 별개이므로 검색 시 userNo 추가 WHERE문
		Map<String, String> search = new HashMap<String, String>();
		search.put("keyword", keyword);
		search.put("category", category);
		search.put("no", no);
		
		//페이징 셋
		int pageLimit = 5;
		int boardLimit = 8;
		
		//총 주소록 개수
		int listCount = addressService.countList(search);
		
		log.info("listCount : " + listCount);
		
	    int offset = (Integer.parseInt(page)-1) * boardLimit;
	    
	    PageVo pv = new PageVo(listCount,Integer.parseInt(page),pageLimit,boardLimit);
	    RowBounds rb = new RowBounds(offset , boardLimit);

	    //각페이지마다 리스트 8개씩 
		List<AddressVo> addressList = addressService.selectAddressList(rb, search);
		
//		log.info("memberList size : " + AddressList.size());
		
		//카테고리 구분 userNo 전달
		List<SortationVo> sortationList = addressService.sortationList(no);
		
		//카테고리 구분 마다 각 주소록 데이터 있어야 함 전체조회
		List<AddressVo> addressListAll = addressService.selectAddressListAll(no);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("category", category);
		model.addAttribute("pv", pv);
		
		model.addAttribute("addressList", addressList);
		model.addAttribute("sortationList", sortationList);
		model.addAttribute("addressListAll", addressListAll);
		
		return "addressBook/test";
	}
	
	
	@GetMapping("receive")
	public String receive() {
		return "addressBook/receive";
	}
	
	@GetMapping("add")
	public String add() {
		return "addressBook/add";
	}
	
	@GetMapping("detail")
	public String detail() {
		return "addressBook/add";
	}
}
