package com.kh.sixman.messenger.vo;

import lombok.Data;

@Data
public class DefineChatNameVo {
	
// 채팅방셋팅, 채팅방 두 테이블 데이터 동시 생성
	
//	private int chatRoomNo; 아래 charRoomNo;와 겹침
	private int memberNo;
	private String fixYn;
	private String alarmYn;
	private String name;
	private String lastJoinTime;

	private String chatRoomNo;
	private String admin;
	private String enrollDate;
	private String deleteYn;
	
	
}
