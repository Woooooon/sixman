package com.kh.sixman.mail.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.sixman.common.AttachmentVo;

import lombok.Data;

@Data
public class MailVo {
	
	private String no;
	private String sendUser;
	private String sendUserName;
	private String sendUserMail;
	private String deleteYn;
	private String title;
	private String content;
	private String saveYn;
	private String sendTime;
	private String modifyTime;
	
	private List<MultipartFile> file;
	private List<AttachmentVo> fileList;
	private List<String> sender;
	
	private String rNo;
	private String rMail;
	private String checkYn;
	private String alarmYn;
	private String rDeleteYn;

	private String category;
	private String categoryName;
	private String search;
}
