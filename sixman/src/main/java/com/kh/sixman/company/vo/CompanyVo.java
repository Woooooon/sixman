package com.kh.sixman.company.vo;

import org.springframework.web.multipart.MultipartFile;

import com.kh.sixman.common.AttachmentVo;

import lombok.Data;

@Data
public class CompanyVo {
	private String no;
	private String name;
	private String license;
	private String address;
	private String phone;
	private String logoNo;
	private String logoName;

	
	private MultipartFile companyLogo;
	private AttachmentVo logoFile;
}
