package com.kh.sixman.messenger.controller;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.messenger.vo.ChatCreateRoomMemberVo;
@Repository
public class ChatFirstDao {

	public int write(SqlSessionTemplate sst, ChatCreateRoomMemberVo vo) {
		return sst.insert("messengerMapper.selectChatFriendList", vo);
	}

}
