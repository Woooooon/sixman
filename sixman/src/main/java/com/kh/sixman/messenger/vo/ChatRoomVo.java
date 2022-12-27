package com.kh.sixman.messenger.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ChatRoomVo {

	private int chatRoomNo;
	private int admin;
	private Date enrollDate;
	private int deleteYn;
}
