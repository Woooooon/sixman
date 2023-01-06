package com.kh.sixman.chat.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sixman.chat.dao.ChatDao;
import com.kh.sixman.chat.vo.ChatRoomVo;
import com.kh.sixman.chat.vo.ChatVo;
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
		
		return map;
	}

	public List<ChatRoomVo> getChatList(String no) {
		List<ChatRoomVo> list =  chatDao.getChatList(sst, no);
		for(ChatRoomVo vo : list) {
			Map<String, String> map = new HashMap<>();
			map.put("loginNo", no);
			map.put("no", vo.getChatRoomNo());
			List<MemberVo> members = chatDao.getMemberInChat(sst, map);
			
			ChatRoomVo roomVo = chatDao.getChatLastMsg(sst, vo);
			if(roomVo!= null) {
				String lastMsg = roomVo.getLastMsg();
				String lastMsgTime = roomVo.getLastMsgTime();
				String notReadCount = roomVo.getNotReadCount();
				vo.setLastMsg(lastMsg);
				vo.setLastMsgTime(lastMsgTime);
				vo.setNotReadCount(notReadCount);
			}
			vo.setMembers(members);

		}
		return list;
	}
	
	public ChatRoomVo getChatSetting(Map<String, String> map) {
		return chatDao.getChat(sst, map);
	}
	

	public ChatRoomVo getChat(Map<String, String> map) {
		
		ChatRoomVo vo = chatDao.getChat(sst, map);
		List<ChatVo> chats = chatDao.getChats(sst, map);
		List<MemberVo> members = chatDao.getMemberInChat(sst, map);
		
		String loginNo = map.get("loginNo");
		
		for(ChatVo cv : chats) {
			
			Map<String, Object> tempMap = new HashMap<>();
			tempMap.put("loginNo", loginNo);
			tempMap.put("cv", cv);
			
			String nonCount = chatDao.getNonCount(sst, tempMap);
			cv.setNonCount(nonCount);
			
			ChatVo temp = chatDao.getFile(sst, cv);
			
			if(temp!=null) {
				String fileNo = temp.getFileNo();
				String fileName = temp.getFileName();
				String filePath = temp.getOriginName();	
				cv.setFileNo(fileNo);
				cv.setFileName(fileName);
				cv.setOriginName(filePath);
			}
			
			if(cv.getMemberNo().equals(map.get("loginNo"))) {
				cv.setIsMe("Y");
			}
//			cv.setWriteTime(cv.getWriteTime().substring(2, 16));
			
		}
		
		vo.setChats(chats);
		vo.setMembers(members);
		
		return vo;
	}

	public int createChat(MemberVo loginMember, Set<String> no) {
		Map<String, Object> map = new HashMap<>();
		map.put("loginMember", loginMember);
		no.add(loginMember.getNo());
		map.put("no", no);
		return chatDao.createChat(sst, map);
	}

	public int chatOut(String loginNo, Map<String, String> map) {
		return chatDao.chatOut(sst, map);
	}

	public int setFix(Map<String, String> map) {
		return chatDao.setFix(sst, map);
	}

	public int setAlarm(Map<String, String> map) {
		return chatDao.setAlarm(sst, map);
	}

	public int changeName(Map<String, String> map) {
		return chatDao.changeName(sst, map);
	}

	public int bookMark(Map<String, String> map) {
		int result = 0;
		if("Y".equals(map.get("bookMark"))) {
			result = chatDao.inBookMark(sst, map);
		}else {
			result = chatDao.outBookMark(sst, map);
		}
		return result;
	}

	@Transactional
	public int chat(Map<String, Object> map) {
		return chatDao.chat(sst, map);
	}

	public int join(Map<String, String> map) {
		return chatDao.join(sst, map);
	}

	public MemberVo profile(Map<String, String> map) {
		return chatDao.profile(sst, map);
	}

}
