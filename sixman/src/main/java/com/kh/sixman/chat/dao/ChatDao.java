package com.kh.sixman.chat.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.chat.vo.ChatRoomVo;
import com.kh.sixman.chat.vo.ChatVo;
import com.kh.sixman.common.AttachmentVo;
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

	public List<MemberVo> getMemberInChat(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectList("chatMapper.getMemberInChat", map);
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

	public String getNonCount(SqlSessionTemplate sst, Map<String, Object> tempMap) {
		return sst.selectOne("chatMapper.getNonCount", tempMap);
	}

	public int createChat(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.update("chatMapper.createChat", map);
	}

	public int chat(SqlSessionTemplate sst, ChatVo cvo) {
		return sst.insert("chatMapper.chat", cvo);
	}

	public int join(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.update("chatMapper.join", map);
	}

	public int changeName(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.update("chatMapper.changeName", map);
	}

	public int setFix(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.update("chatMapper.setFix", map);
	}

	public int setAlarm(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.update("chatMapper.setAlarm", map);
	}

	public int inBookMark(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.insert("chatMapper.inBookMark", map);
	}
	
	public int outBookMark(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.delete("chatMapper.outBookMark", map);
	}

	public MemberVo profile(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectOne("chatMapper.memberOne", map);
	}

	public int chatOut(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.delete("chatMapper.chatOut", map);
	}

	public int insertFile(SqlSessionTemplate sst, AttachmentVo vo) {
		return sst.insert("chatMapper.insertFile", vo);
	}

}
