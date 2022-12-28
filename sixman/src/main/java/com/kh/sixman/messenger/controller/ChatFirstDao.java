package com.kh.sixman.messenger.controller;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.sixman.messenger.vo.ChatCreateRoomMemberVo;

public class ChatFirstDao {

	public int write(SqlSessionTemplate sst, ChatCreateRoomMemberVo vo) {
		return sst.insert("messengerMapper.selectChatFriendList", vo);
	}

}
