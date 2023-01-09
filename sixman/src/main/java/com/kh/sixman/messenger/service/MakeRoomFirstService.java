package com.kh.sixman.messenger.service;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.messenger.dao.MakeRoomDao;
import com.kh.sixman.messenger.vo.DefineChatNameVo;

@Service

public class MakeRoomFirstService {
	
	@Autowired
	private MakeRoomDao dao;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	
	public void makechatroom(HttpSession session, DefineChatNameVo dchatnvo) {
		
//	 	MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");

		// TODO Auto-generated method stub
		dao.makechatroom(sst, dchatnvo);
//		return dao.makechatroomsetting(sst, dchatnvo);
	}
//	
//	public int makechatroomsetting(SqlSessionTemplate sst, DefineChatNameVo dchatnvo) {
////		return dao.makechatroomsetting(sst, dchatnvo);
//	}

	
}
