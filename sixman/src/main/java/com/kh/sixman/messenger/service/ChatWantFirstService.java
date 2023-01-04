package com.kh.sixman.messenger.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.messenger.dao.WhoChatFirstDao;
import com.kh.sixman.messenger.vo.ChatCreateRoomMemberVo;

@Service
public class ChatWantFirstService {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private WhoChatFirstDao dao;

	public List<ChatCreateRoomMemberVo> chatfirst(ChatCreateRoomMemberVo vo) {
		
		return dao.whochatfirst(sst, vo);
	}

}
