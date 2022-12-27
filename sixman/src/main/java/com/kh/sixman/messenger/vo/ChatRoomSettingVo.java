package com.kh.sixman.messenger.vo;

import lombok.Data;

@Data
public class ChatRoomSettingVo {

	private int chatRoomNo;
	private int memberVo;
	private char fixYn;
	private char alarmYn;
	private String name;
}
