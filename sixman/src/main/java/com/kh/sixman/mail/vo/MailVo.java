package com.kh.sixman.mail.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.sixman.common.AttachmentVo;

import lombok.Data;

@Data
public class MailVo {
	
	private String mailNo;
	private String userNo;
	private String userName;
	private String userEmail;
	private String deleteYn;
	private String title;
	private String content;
	private String sendTime;
	private String modifyTime;
	private String isSender;
	private String checkYn;
	private String saveYn;
	
	private List<MultipartFile> file;
	private List<AttachmentVo> fileList;
	private List<String> sender;

	private String category;
	private String categoryName;
	private String search;
	private String filter;
}
