package com.kh.sixman.messenger.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.messenger.vo.ChatCreateRoomMemberVo;

@Repository
public class WhoChatFirstDao {

	
	public List<ChatCreateRoomMemberVo> whochatfirst(SqlSessionTemplate sst, ChatCreateRoomMemberVo vo) {
		
		return sst.selectList("messengerMapper.selectChatFriendList", vo);
	}

}
