package com.kh.sixman.chat.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.chat.vo.ChatRoomVo;
import com.kh.sixman.chat.vo.ChatVo;
import com.kh.sixman.member.vo.MemberVo;

@Repository
public class ChatDao {

	public List<MemberVo> getBookMark(SqlSessionTemplate sst, String no) {
		return sst.selectList("chatMapper.getBookMark", no);
	}

	public List<MemberVo> getTeamMember(SqlSessionTemplate sst, String no) {
		return sst.selectList("chatMapper.getTeamMember", no);
	}

	public List<MemberVo> getMemberAll(SqlSessionTemplate sst, String no) {
		return sst.selectList("chatMapper.getMemberAll", no);
	}

	public List<MemberVo> getMemberInChat(SqlSessionTemplate sst, String chatRoomNo) {
		return sst.selectList("chatMapper.getMemberInChat", chatRoomNo);
	}

	public List<ChatRoomVo> getChatList(SqlSessionTemplate sst, String no) {
		return sst.selectList("chatMapper.getChatList", no);
	}

	public ChatRoomVo getChatLastMsg(SqlSessionTemplate sst, ChatRoomVo vo) {
		return sst.selectOne("chatMapper.getChatLastMsg", vo);
	}

	public ChatRoomVo getChat(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectOne("chatMapper.getChat", map);
	}

	public List<ChatVo> getChats(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectList("chatMapper.getChats", map);
	}

	public ChatVo getFile(SqlSessionTemplate sst, ChatVo cv) {
		return sst.selectOne("chatMapper.getFile", cv);
	}

	public String getNonCount(SqlSessionTemplate sst, ChatVo cv) {
		return sst.selectOne("chatMapper.getNonCount", cv);
	}

}
