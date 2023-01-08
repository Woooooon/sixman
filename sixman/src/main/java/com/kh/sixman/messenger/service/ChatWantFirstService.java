package com.kh.sixman.messenger.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.messenger.dao.WhoChatFirstDao;
import com.kh.sixman.messenger.vo.ChatCreateRoomMemberVo;
import com.kh.sixman.messenger.vo.ChatRoomDataVo;
import com.kh.sixman.messenger.vo.DefineChatNameVo;
import com.kh.sixman.messenger.vo.ReadChatRoomListVo;

@Service
public class ChatWantFirstService {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private WhoChatFirstDao dao;

	public List<ChatCreateRoomMemberVo> chatfirst(ChatCreateRoomMemberVo vo) {
		
		return dao.whochatfirst(sst, vo);
	}

	public List<ReadChatRoomListVo> readchatroomlist(ReadChatRoomListVo vo) {
		// TODO Auto-generated method stub
		return dao.readchatroomlist(sst, vo);
	}

	public List<ChatRoomDataVo> readchatroomdata(ChatRoomDataVo vo) {
		// TODO Auto-generated method stub
		return dao.readchatroomdata(sst, vo);
	}



}
