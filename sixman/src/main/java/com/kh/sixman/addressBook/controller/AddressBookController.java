package com.kh.sixman.addressBook.controller;

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
import com.kh.sixman.addressBook.service.AddressService;
import com.kh.sixman.addressBook.vo.AddressVo;
import com.kh.sixman.addressBook.vo.ReciverVo;
import com.kh.sixman.addressBook.vo.SortationVo;
import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.common.FileUnit;
import com.kh.sixman.common.PageVo;
import com.kh.sixman.company.vo.CompanyVo;
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
		
		log.info("memberList size : " + addressList.size());
		
		//카테고리 구분 userNo 전달
		List<SortationVo> sortationList = addressService.sortationList(no);
		SortationVo defaultSortation = addressService.defaultSortation();
		
		//카테고리 구분 마다 각 주소록 데이터 있어야 함 전체조회
		List<AddressVo> addressListAll = addressService.selectAddressListAll(no);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("category", category);
		model.addAttribute("pv", pv);
		
		model.addAttribute("addressList", addressList);
		model.addAttribute("defaultSortation", defaultSortation);
		model.addAttribute("addressListAll", addressListAll);
		model.addAttribute("sortationList", sortationList);
		
		return "addressBook/list";
	}
	
	

	@GetMapping("add")
	public String add(HttpSession session, Model model, String emailToAddress, AddressVo vo) {

		if(vo != null) {
			CompanyVo company = (CompanyVo)session.getAttribute("company");
			vo.setCompany(company.getName());
		}
		
		//로그인한 유저의 세션 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");

		//로그인 유저의 seqNo 가져오기
		String no = loginMember.getNo();
		
		List<SortationVo> sortationList = addressService.sortationList(no);
		
		//카테고리 구분 마다 각 주소록 데이터 있어야 함 전체조회
		List<AddressVo> addressListAll = addressService.selectAddressListAll(no);
		SortationVo defaultSortation = addressService.defaultSortation();
		
		model.addAttribute("defaultSortation", defaultSortation);
		model.addAttribute("sortationList", sortationList);
		model.addAttribute("addressListAll", addressListAll);
		model.addAttribute("email", emailToAddress);
		model.addAttribute("reciveInfo", vo);
		
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
		SortationVo defaultSortation = addressService.defaultSortation();
		
		model.addAttribute("defaultSortation", defaultSortation);
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
		int boardLimit = 12;
		
		//총 주소록 개수
		int listCount = addressService.deleteCountList(search);
		
		log.info("listCount : " + listCount);
		
	    int offset = (Integer.parseInt(page)-1) * boardLimit;
	    
	    PageVo pv = new PageVo(listCount,Integer.parseInt(page),pageLimit,boardLimit);
	    RowBounds rb = new RowBounds(offset , boardLimit);

	    //각페이지마다 리스트 13개씩 
		List<AddressVo> dlelteAddressList = addressService.selectDlelteAddressList(rb, search);

		
		//카테고리 구분 userNo 전달
		List<SortationVo> sortationList = addressService.sortationList(no);
		SortationVo defaultSortation = addressService.defaultSortation();
		
		
		//카테고리 구분 마다 각 주소록 데이터 있어야 함 전체조회
		List<AddressVo> dlelteAddressListAll = addressService.selectDeleteAddressListAll(no);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("category", category);
		model.addAttribute("pv", pv);
		
		model.addAttribute("dlelteAddressList", dlelteAddressList);
		model.addAttribute("dlelteAddressListAll", dlelteAddressListAll);
		model.addAttribute("defaultSortation", defaultSortation);
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
	
	@PostMapping("send")
	public String sendAddress(HttpSession session,Model model, String reciver, String[] addressNo) {
		//로그인한 유저의 세션 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");

		//로그인 유저의 seqNo 가져오기
		String no = loginMember.getNo();
		
		//받는사람 배열 주소록은 문자열 형태로 변환
		String[] reciverNo = reciver.split(",");
		
		String sendAddress = String.join(",", addressNo);
		
		log.info("받는 사람 번호 :" + reciverNo[0]);
		log.info("전달 할 Address :" + sendAddress);
		
		//받은 data로 list로 전환
		List<ReciverVo> voList = new ArrayList<ReciverVo>();
		
		for(String reciverToVo : reciverNo) {
			ReciverVo vo = new ReciverVo();
			vo.setSenderNo(no);
			vo.setSendAddress(sendAddress);
			vo.setReciverNo(reciverToVo);
			
			voList.add(vo);
		}
		
		int sendAddressResult = addressService.sendAddress(voList);
		
		if(sendAddressResult < 1) {
			String errorMsg = "Failed to sand address information.";
			String title = "죄송합니다. 주소록 전송하지 못하였습니다.";
			String msg = "주소록 정보를 읽어오지 못 하거나,<br>받는 사람 정보룰 받아오지 못하여 요청을 처리 할 수 없습니다.";
			
			model.addAttribute("errorMsg", errorMsg);
			model.addAttribute("title", title);
			model.addAttribute("msg", msg);
			return "common/error";
		}

		return "redirect:/address";
	}

	@GetMapping("recive")
	public String recive(HttpSession session, Model model, String page, String category, String keyword) {
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
		int boardLimit = 10;
		
		//총 주소록 개수
		int listCount = addressService.countReciveList(search);
		
		log.info("listCount : " + listCount);
		
	    int offset = (Integer.parseInt(page)-1) * boardLimit;
	    
	    PageVo pv = new PageVo(listCount,Integer.parseInt(page),pageLimit,boardLimit);
	    RowBounds rb = new RowBounds(offset , boardLimit);

	    //각페이지마다 리스트 10개씩 
		List<ReciverVo> reciveList = addressService.selectReciveList(rb, search);
		
		//조회한 리스트의 주소록 상세정보들 담아오기 List<AddressVo> addressList;
		
		for(ReciverVo vo : reciveList) {
			String addressNo = vo.getSendAddress();
			String userNo = vo.getSenderNo();
		
			Map<String, String> map = new HashMap<String, String>();
			map.put("no", addressNo);
			map.put("userNo", userNo);
			
			List<AddressVo> addressVo = addressService.getAddressAll(map);
			
			vo.setAddressList(addressVo);
			
			log.info("recive에 담긴 AddressVoList :" + addressVo);
		}
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("category", category);
		model.addAttribute("pv", pv);
		model.addAttribute("reciveList", reciveList);
		
		return "addressBook/recive";
	}
	
	@PostMapping(value = "recive/delete", produces = "application/json; charset=utf8")
	@ResponseBody
	public String deleteReciveAddress(@RequestParam List<String> no) {
		
		log.info("no"+ no.get(0));
		
		int result = addressService.deleteReciveAddressAll(no);
		
		if(result != 1) return null;
				
		return "삭제 요청을 완료했습니다.";
	}
	
	@PostMapping(value = "recive/all", produces = "application/json; charset=utf8")
	@ResponseBody
	public String insertReciveAddress(@RequestParam String target,HttpSession session) {
		//로그인한 유저의 세션 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");

		//로그인 유저의 seqNo 가져오기
		String no = loginMember.getNo();
		
		log.info("target : "+ target);
		
		Gson gson = new GsonBuilder().create();
		
		List<Map<String,String>> list = new ArrayList<>();
		
		List<Map<String,String>> reciveDatalist =  (List<Map<String,String>>)gson.fromJson(target, list.getClass());
		
		log.info("JSON : "+ reciveDatalist);
		
		int result = addressService.insertReciveAddress(reciveDatalist, no);
		
		if(result < 1) return null;
		
		return "내 주소록에 새로운 주소가 추가 되었습니다.";
	}
			
	@GetMapping("recive/detail")
	public String reciveDetail(HttpSession session, Model model, String reciveNo) {
		//로그인한 유저의 세션 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");

		//로그인 유저의 seqNo 가져오기
		String no = loginMember.getNo();
		
		//로그인 유저마다 주소록이 별개이므로 검색 시 reciveNo 추가 WHERE문
		Map<String, String> map = new HashMap<String, String>();
		map.put("no", no);
		map.put("reciveNo", reciveNo);
		
		log.info("map : " + map );
		
		ReciverVo reciveInfo = addressService.selectReciveInfo(map);
		log.info("reciveInfo : " + reciveInfo );
		
		String addressNo = reciveInfo.getSendAddress();
		log.info("addressNo : " + addressNo );
		
		List<AddressVo> reciveAddressList = addressService.reciveDetailList(addressNo);
	    
		log.info("reciveAddressList : " + reciveAddressList );
		
		model.addAttribute("reciveInfo", reciveInfo);
		model.addAttribute("reciveAddressList", reciveAddressList);
		
		return "addressBook/reciveAddress";
	}
	

	@PostMapping(value = "recive/detail/delete", produces = "application/json; charset=utf8")
	@ResponseBody
	public String deleteReciveDetailAddress(HttpSession session, String no, String modifySendAddress) {
		//로그인한 유저의 세션 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");

		//로그인 유저의 seqNo 가져오기
		String userNo = loginMember.getNo();
				
		ReciverVo vo = new ReciverVo();
		vo.setNo(no);
		vo.setSendAddress(modifySendAddress);
		vo.setReciverNo(userNo);
		
		int result = addressService.updateReciveAddress(vo);
		
		if(result < 1) return null;
				
		return "삭제 요청을 완료했습니다.";
	}
	
	@PostMapping(value = "recive/detail/insert", produces = "application/json; charset=utf8")
	@ResponseBody
	public String insertReciveDetailAddress(HttpSession session, String no, String modifySendAddress,String insertNum) {
		//로그인한 유저의 세션 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");

		//로그인 유저의 seqNo 가져오기
		String userNo = loginMember.getNo();
		
		ReciverVo vo = new ReciverVo();
		vo.setNo(no);
		vo.setSendAddress(modifySendAddress);
		vo.setReciverNo(userNo);
		
		int result = addressService.insertReciveDetailAddress(vo, insertNum);
		
		if(result < 1) return null;
				
		return "내 주소록에 추가 되었습니다.";
	}
	
	@GetMapping("popup")
	public String popup(HttpSession session, Model model, String emailToAddress, AddressVo vo) {
		
		//로그인한 유저의 세션 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");

		//로그인 유저의 seqNo 가져오기
		String no = loginMember.getNo();
		
		List<SortationVo> sortationList = addressService.sortationList(no);
		model.addAttribute("sortationList", sortationList);

		
		return "addressBook/popup";
	}
	
	@PostMapping(value = "category", produces = "application/json; charset=utf8")
	@ResponseBody
	public String popupResult(HttpSession session, Model model, String deleteNo, String[] createNo) {
		
		//로그인한 유저의 세션 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");

		//로그인 유저의 seqNo 가져오기
		String userNo = loginMember.getNo();
		
		log.info("deleteNo : " + deleteNo );
		log.info("createNo : " + createNo );

		int result = addressService.updateCategory(deleteNo, createNo, userNo);
		
		if(result < 1)return null;
		
		return "카테고리 수정을 완료하였습니다.";
	}
}
