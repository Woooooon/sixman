package com.kh.sixman.messenger.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.messenger.vo.DefineChatNameVo;

@Repository
public class MakeRoomDao {

	@Transactional
	public void makechatroom(SqlSessionTemplate sst, DefineChatNameVo dchatnvo) {
		// TODO Auto-generated method stub
		
		sst.insert("messengerMapper.makechatroom_joo", dchatnvo);
		sst.insert("messengerMapper.makechatroomsetting", dchatnvo);
		sst.insert("messengerMapper.makechatroomstart", dchatnvo);
	}

//	public int makechatroomsetting(SqlSessionTemplate sst, DefineChatNameVo dchatnvo) {
//		// TODO Auto-generated method stub
//		return sst.insert("MessengerMapper.makechatroomsetting", dchatnvo);
//	}

}
