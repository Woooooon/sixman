package com.kh.sixman.company.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.common.FileUnit;
import com.kh.sixman.company.service.CompanyService;
import com.kh.sixman.company.vo.CompanyVo;
import com.kh.sixman.dept.service.DeptService;
import com.kh.sixman.dept.vo.DeptVo;
import com.kh.sixman.position.service.PositionService;
import com.kh.sixman.position.vo.PositionVo;

@Controller
public class AdminCompanyController {
	@Autowired
	private PositionService positionService;
	
	@Autowired
	private DeptService deptService;
	
	@Autowired
	private CompanyService companyService;
	
	@GetMapping("admin/company/edit")
	public String edit(Model model) {
		List<PositionVo> positionList = positionService.positionList();
		List<DeptVo> deptList = deptService.daptList();
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("positionList", positionList);
		
		return "admin/company/edit";
	}
	
	@PostMapping("admin/company/edit")
	public String edit(CompanyVo vo, HttpSession session,Model model) {
		
		vo.setNo("1");
		
		String rootPath = session.getServletContext().getRealPath("/");
		
		AttachmentVo logoFile = FileUnit.uploadFileOne(vo.getCompanyLogo(), rootPath, "sixman/src/main/webapp/resources/img/logo");
		
		vo.setLogoFile(logoFile);
		
		int result = companyService.updateCompanyInfo(vo);
		
		if(result != 1) {
			String errorMsg = "Failed to save corporate information.";
			String title = "죄송합니다. 기업 정보를 저장하지 못하였습니다.";
			String msg = "로고 파일저장에 실패 하셨거나,<br>요청하신 정보 저장을 실패하어 페이지를 불러올 수 없습니다.";
			
			model.addAttribute("errorMsg", errorMsg);
			model.addAttribute("title", title);
			model.addAttribute("msg", msg);
			return "common/error";
		}
		
		CompanyVo company = companyService.getCompany(vo);
		model.addAttribute("msg", "기업 정보 변경/등록 요청 완료 되었습니다.");
		session.setAttribute("company", company);
		
		return "redirect:/admin/company/edit";
	}

}
