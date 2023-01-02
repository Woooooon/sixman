package com.kh.sixman.chat.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.chat.dao.ChatDao;
import com.kh.sixman.chat.vo.ChatRoomVo;
import com.kh.sixman.chat.vo.ChatVo;
import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.member.vo.MemberVo;

@Service
public class ChatService {
	
	@Autowired
	private ChatDao chatDao;
	@Autowired
	private SqlSessionTemplate sst;

	public Map<String, Object> getMember(String no) {
		
		List<MemberVo> bookMarkMember = chatDao.getBookMark(sst, no);
		List<MemberVo> teamMember = chatDao.getTeamMember(sst, no);
		List<MemberVo> memberAll = chatDao.getMemberAll(sst, no);
		
		Map<String, Object> map = new HashMap<>();
		map.put("bookMarkMember", bookMarkMember);
		map.put("teamMember", teamMember);
		map.put("memberAll", memberAll);
		
		return null;
	}

	public List<ChatRoomVo> getChatList(String no) {
		List<ChatRoomVo> list =  chatDao.getChatList(sst, no);
		for(ChatRoomVo vo : list) {
			List<MemberVo> members = chatDao.getMemberInChat(sst, vo.getChatRoomNo());
			
			ChatRoomVo roomVo = chatDao.getChatLastMsg(sst, vo);
			
			String lastMsg = roomVo.getLastMsg();
			String lastMsgTime = roomVo.getLastMsgTime();
			String notReadCount = roomVo.getNotReadCount();
			
			vo.setMembers(members);
			vo.setLastMsg(lastMsg);
			vo.setLastMsgTime(lastMsgTime);
			vo.setNotReadCount(notReadCount);
		}
		return list;
	}

	public ChatRoomVo getChat(Map<String, String> map) {
		
		ChatRoomVo vo = chatDao.getChat(sst, map);
		List<ChatVo> chats = chatDao.getChats(sst, map);
		List<MemberVo> members = chatDao.getMemberInChat(sst, vo.getChatRoomNo());
		
		for(ChatVo cv : chats) {
			
			String nonCount = chatDao.getNonCount(sst, cv);
			cv.setNonCount(nonCount);
			
			ChatVo temp = chatDao.getFile(sst, cv);
			if(temp!=null) {
				String fileName = temp.getFileName();
				String filePath = temp.getFilePath();	
				cv.setFileName(fileName);
				cv.setFilePath(filePath);
			}
			
			if(cv.getMemberNo().equals(map.get("loginNo"))) {
				cv.setIsMe("Y");
			}
			
			cv.setWriteTime(cv.getWriteTime().substring(2, 16));
			
		}
		
		vo.setChats(chats);
		vo.setMembers(members);
		
		return vo;
	}

	public int createChat(String loginNo, List<String> no) {
		return 0;
	}

	public int chatOut(String loginNo, String no) {
		return 0;
	}

	public int setFix(String loginNo, String no, String fix) {
		return 0;
	}

	public int setAlarm(String loginNo, String no, String alarm) {
		return 0;
	}

	public List<AttachmentVo> getFileList(String no) {
		return null;
	}

	public List<AttachmentVo> getImgList(String no) {
		return null;
	}

	public int changeName(String loginNo, String no) {
		return 0;
	}

	public int bookMark(String loginNo, String no) {
		return 0;
	}

	public int nonBookMark(String loginNo, String no) {
		return 0;
	}

}
