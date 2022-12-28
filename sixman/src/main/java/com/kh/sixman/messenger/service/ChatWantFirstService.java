package com.kh.sixman.messenger.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.messenger.controller.ChatFirstDao;
import com.kh.sixman.messenger.vo.ChatCreateRoomMemberVo;

@Service
public class ChatWantFirstService {
	
	@Autowired
	private ChatFirstDao chatfd;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public int chatfirst(ChatCreateRoomMemberVo vo) {
		return chatfd.write(sst, vo);
	}
	
}
