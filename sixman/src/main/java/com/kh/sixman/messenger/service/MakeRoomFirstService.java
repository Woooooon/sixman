package com.kh.sixman.messenger.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sixman.messenger.dao.MakeRoomDao;
import com.kh.sixman.messenger.vo.DefineChatNameVo;

@Transactional
@Service
public class MakeRoomFirstService {
	
	@Autowired
	private MakeRoomDao dao;
	
	@Autowired
	private SqlSessionTemplate sst;

	public int makechatroom(SqlSessionTemplate sst, DefineChatNameVo dchatnvo) {
		// TODO Auto-generated method stub
		return dao.makechatroom(sst, dchatnvo);
	}
//	
//	public int makechatroomsetting(SqlSessionTemplate sst, DefineChatNameVo dchatnvo) {
////		return dao.makechatroomsetting(sst, dchatnvo);
//	}

	
}
