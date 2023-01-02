package com.kh.sixman.chat.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ChatVo {
	
	private String chatNum;
	private String memberNo;
	private String memberName;
	private String memberImg;
	private String chatRoomNo;
	private String content;
	private String writeTime;
	private String deleteYn;
	private String nonCount;
	private String isMe;
	
	private MultipartFile file;
	private String filePath;
	private String fileName;
}
