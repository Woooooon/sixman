package com.kh.sixman.addressBook.controller;

import java.util.Arrays;
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

import com.kh.sixman.addressBook.service.AddressService;
import com.kh.sixman.addressBook.vo.AddressVo;
import com.kh.sixman.addressBook.vo.SortationVo;
import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.common.FileUnit;
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
		model.addAttribute("addressListAll", addressListAll);
		model.addAttribute("sortationList", sortationList);
		
		return "addressBook/list";
	}
	
	@PostMapping("send")
	public String list(HttpSession session, String reciver, String[] addressNo) {
		//로그인한 유저의 세션 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");

		//로그인 유저의 seqNo 가져오기
		String no = loginMember.getNo();
		
		log.info("받는 사람 번호" + reciver);
		log.info("전달 할 Address" + Arrays.toString(addressNo));

		return "redirect:/addressBook/list";
	}
	
	@GetMapping("receive")
	public String receive() {
		return "addressBook/receive";
	}
	
	@GetMapping("add")
	public String add(HttpSession session, Model model) {
		//로그인한 유저의 세션 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");

		//로그인 유저의 seqNo 가져오기
		String no = loginMember.getNo();
		
		List<SortationVo> sortationList = addressService.sortationList(no);
		
		//카테고리 구분 마다 각 주소록 데이터 있어야 함 전체조회
		List<AddressVo> addressListAll = addressService.selectAddressListAll(no);
		
		model.addAttribute("sortationList", sortationList);
		model.addAttribute("addressListAll", addressListAll);
		
		return "addressBook/add";
	}
	
	
	@PostMapping("add")
	public String insertAddress(HttpSession session, Model model, AddressVo vo) {
		//로그인한 유저의 세션 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");

		//로그인 유저의 seqNo 가져오기
		String no = loginMember.getNo();
		
		vo.setUserNo(no);
		
		log.info("vo : " + vo);

		String rootPath = session.getServletContext().getRealPath("/");
		
		if(vo.getCardFile().getSize() > 0) {
			AttachmentVo cardFile = FileUnit.uploadFileOne(vo.getCardFile(), rootPath, "sixman/src/main/webapp/resources/img/address");
			vo.setCardFileInfo(cardFile);
		}
		
		int insertAddress = addressService.insertAddress(vo);
		
		if(insertAddress != 1) {
			String errorMsg = "Failed to save address information.";
			String title = "죄송합니다. 주소록 정보를 저장하지 못하였습니다.";
			String msg = "명함 파일저장에 실패 하셨거나,<br>요청하신 정보 저장을 실패하어 페이지를 불러올 수 없습니다.";
			
			model.addAttribute("errorMsg", errorMsg);
			model.addAttribute("title", title);
			model.addAttribute("msg", msg);
			return "common/error";
		}
		
		return "redirect:/address";
	}
	
	@GetMapping("detail")
	public String detail(HttpSession session, Model model, String no) {
		//로그인한 유저의 세션 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");

		//로그인 유저의 seqNo 가져오기
		String userNo = loginMember.getNo();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("no", no);
		map.put("userNo", userNo);
		
		List<SortationVo> sortationList = addressService.sortationList(userNo);
		
		//카테고리 구분 마다 각 주소록 데이터 있어야 함 전체조회
		List<AddressVo> addressListAll = addressService.selectAddressListAll(userNo);
		
		AddressVo selectAddress = addressService.getAddress(map);
		
		if(selectAddress == null){
			String errorMsg = "Deleted or request failed.";
			String title = "죄송합니다. 주소록 정보를 찾지 못하였습니다.";
			String msg = "주소록이 삭제되었거나 또는,<br>정보 를 받아오는데 실패하어 페이지를 불러올 수 없습니다.";
			
			model.addAttribute("errorMsg", errorMsg);
			model.addAttribute("title", title);
			model.addAttribute("msg", msg);
			return "common/error";
		}
		
		model.addAttribute("selectAddress", selectAddress);
		model.addAttribute("sortationList", sortationList);
		model.addAttribute("addressListAll", addressListAll);
		
		return "addressBook/detail";
	}
	
	
	@PostMapping("detail")
	public String updateAddress(HttpSession session, Model model, AddressVo vo) {
		//로그인한 유저의 세션 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");

		//로그인 유저의 seqNo 가져오기
		String userNo = loginMember.getNo();
		
		vo.setUserNo(userNo);
		
		log.info("vo : " + vo);

		String rootPath = session.getServletContext().getRealPath("/");
		
		if(vo.getCardFile().getSize() > 0) {
			AttachmentVo cardFile = FileUnit.uploadFileOne(vo.getCardFile(), rootPath, "sixman/src/main/webapp/resources/img/address");
			vo.setCardFileInfo(cardFile);
		}
		
		int insertAddress = addressService.updateAddress(vo);
		
		if(insertAddress < 1) {
			String errorMsg = "Failed to modify address information.";
			String title = "죄송합니다. 주소록 정보를 수정하지 못하였습니다.";
			String msg = "명함 파일저장에 실패 하셨거나,<br>요청하신 정보 저장을 실패하어 페이지를 불러올 수 없습니다.";
			
			model.addAttribute("errorMsg", errorMsg);
			model.addAttribute("title", title);
			model.addAttribute("msg", msg);
			return "common/error";
		}
		
		model.addAttribute("msg", vo.getCompany()+"의 "+vo.getName()+"주소록 정보 수정을 완료 하였습니다.");
		return "redirect:/address";
	}
	
	
	@PostMapping(value = "delete", produces = "application/json; charset=utf8")
	@ResponseBody
	public String updateDeleteAddress(@RequestParam List<String> no) {
		
		log.info("no"+ no.get(0));
		
		int result = addressService.updateDeleteAddress(no);
		
		if(result != 1) {
			return null;
		}
		
		return "삭제 요청을 완료했습니다.";
	}
	
	
	@GetMapping("bin")
	public String bin(HttpSession session,Model model, String page, String keyword, String category) {
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
		List<AddressVo> dlelteAddressList = addressService.selectDlelteAddressList(rb, search);
		
//		log.info("memberList size : " + AddressList.size());
		
		//카테고리 구분 userNo 전달
		List<SortationVo> sortationList = addressService.sortationList(no);
		
		//카테고리 구분 마다 각 주소록 데이터 있어야 함 전체조회
		List<AddressVo> dlelteAddressListAll = addressService.selectDeleteAddressListAll(no);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("category", category);
		model.addAttribute("pv", pv);
		
		model.addAttribute("dlelteAddressList", dlelteAddressList);
		model.addAttribute("dlelteAddressListAll", dlelteAddressListAll);
		model.addAttribute("sortationList", sortationList);
		
		return "addressBook/bin";
	}
	
	@PostMapping(value = "bin/delete", produces = "application/json; charset=utf8")
	@ResponseBody
	public String deleteAddress(@RequestParam List<String> no) {
		
		log.info("no"+ no.get(0));
		
		int result = addressService.deleteAddress(no);
		
		if(result != 1) {
			return null;
		}
		
		return "삭제 요청을 완료했습니다.";
	}
	
	@PostMapping(value = "bin/restore", produces = "application/json; charset=utf8")
	@ResponseBody
	public String restore(@RequestParam List<String> no) {
		
		log.info("no"+ no.get(0));
		
		int result = addressService.restore(no);
		
		if(result != 1) {
			return null;
		}
		
		return "복원 요청을 완료했습니다.";
	}
	
	
}
