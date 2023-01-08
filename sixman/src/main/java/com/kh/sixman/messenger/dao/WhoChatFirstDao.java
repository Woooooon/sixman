package com.kh.sixman.messenger.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.messenger.vo.ChatCreateRoomMemberVo;
import com.kh.sixman.messenger.vo.ChatRoomDataVo;
import com.kh.sixman.messenger.vo.ReadChatRoomListVo;

@Repository
public class WhoChatFirstDao {

	
	public List<ChatCreateRoomMemberVo> whochatfirst(SqlSessionTemplate sst, ChatCreateRoomMemberVo vo) {
		
		return sst.selectList("messengerMapper.selectChatFriendList", vo);
	}

	public List<ReadChatRoomListVo> readchatroomlist(SqlSessionTemplate sst, ReadChatRoomListVo vo) {
		// TODO Auto-generated method stub
		return sst.selectList("messengerMapper.ReadChatRoomList", vo);
	}

	public List<ChatRoomDataVo> readchatroomdata(SqlSessionTemplate sst, ChatRoomDataVo vo) {
		// TODO Auto-generated method stub
		System.out.println(vo);
		return sst.selectList("messengerMapper.ReadChatRoomData", vo);
	}

}
