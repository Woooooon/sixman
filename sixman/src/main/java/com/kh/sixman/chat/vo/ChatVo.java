package com.kh.sixman.chat.vo;

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
	
	private String originName;
	private String fileName;
}
