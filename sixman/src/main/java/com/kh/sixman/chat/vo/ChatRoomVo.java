package com.kh.sixman.chat.vo;

import java.util.List;

import com.kh.sixman.member.vo.MemberVo;

import lombok.Data;

@Data
public class ChatRoomVo {

	private String chatRoomNo;
	private String admin;
	private String enrollDate;
	private String DeleteYn;
	private String memberNo;
	
	private String name;
	private String fixYn;
	private String alarmYn;
	private String lastJoinTime;
	private String beforeJoin;
	private String lastMsg;
	private String lastMsgTime;
	private String notReadCount;
	
	private List<MemberVo> members;
	
	private List<ChatVo> chats;
}
