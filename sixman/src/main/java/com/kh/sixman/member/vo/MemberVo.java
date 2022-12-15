package com.kh.sixman.member.vo;

import lombok.Data;

@Data
public class MemberVo {
	private String no;
	private String name;
	private String id;
	private String pwd;
	private String email;
	private String phone;
	private String birthday;
	private String bankNo;
	private String account;
	private String address;
	private String deptNo;
	private String positionNo;
	private String authorizeNo;
	private String joinDate;
	private String modifyDate;
	private String resignationYn;
	private String entrustNo;
	private String accountFile;
	private String resumeFile;
	private String picFile;
	private String[] evidenceFile;
}
