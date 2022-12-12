package com.kh.sixman.mail.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.sixman.common.AttachmentVo;

import lombok.Data;

@Data
public class MailVo {
	
	private String no;
	private String sendUser;
	private String deleteYn;
	private String title;
	private String content;
	private String saveYn;
	private String sendTime;
	private String modifyTime;
	private List<MultipartFile> file;
	private List<AttachmentVo> fileList;
	private List<String> sender;
	private List<SenderVo> senders;
	private String category;

}
