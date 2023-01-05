package com.kh.sixman.messenger.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.messenger.vo.DefineChatNameVo;

@Repository
public class MakeRoomDao {

	public int makechatroom(SqlSessionTemplate sst, DefineChatNameVo dchatnvo) {
		// TODO Auto-generated method stub
		return sst.insert("MessengerMapper.makechatroom", dchatnvo);
	}

}
