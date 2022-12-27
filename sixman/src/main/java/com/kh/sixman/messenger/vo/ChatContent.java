package com.kh.sixman.messenger.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ChatContent {

	private int chatNum;
	private String content;
	private Date writeTime;
	private char deleteYn;
	private int memberNo;
	private int chatRoomNo;
}
