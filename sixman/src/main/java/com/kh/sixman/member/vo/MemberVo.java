package com.kh.sixman.member.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.project.vo.TodoVo;

import lombok.Data;

@Data
public class MemberVo {
	private String no;
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String phone;
	private String birthday;
	private String bankNo;
	private String bankName;
	private String account;
	private String address;
	private String deptNo;
	private String deptName;
	private String teamNo;
	private String teamName;
	private String positionNo;
	private String positionName;
	private String authorizeNo;
	private String authorizeName;
	private String joinDate;
	private String modifyDate;
	private String resignationYn;
	private String entrustNo;
	private MemberVo entrustInfo;
	private String fileNo;
	private String fileName;
	private String fileOriginName;
	private String bookmark;
	
	private List<MultipartFile> accountFile;
	private List<AttachmentVo> accountFileInfo;
	
	private List<MultipartFile> resumeFile;
	private List<AttachmentVo> resumeFileInfo;
	
	private List<MultipartFile> picFile;
	private List<AttachmentVo> picFileInfo;
	
	private List<MultipartFile> evidenceFile;
	private List<AttachmentVo> evidenceFileList;
	
	private List<TodoVo> todoList;
}
