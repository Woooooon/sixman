package com.kh.sixman.messenger.vo;

import lombok.Data;

@Data
public class ReadChatRoomListVo {

	private String profilePath;
	private String chatroomName;
//	private String lastsender;
	private String lastsendTime;
	private String chatcontent;
}
