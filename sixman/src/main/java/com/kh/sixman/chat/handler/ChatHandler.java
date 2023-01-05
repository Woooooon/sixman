package com.kh.sixman.chat.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.sixman.chat.vo.ChatRoomVo;
import com.kh.sixman.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChatHandler extends TextWebSocketHandler{
	
	// 1:1로 할 경우
	private Map<String, Map<String, Object>> userSessionsMap = new HashMap<String, Map<String, Object>>();
	
	private Map<String, Object> getHTTPSession(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		return httpSession;
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> httpSession = getHTTPSession(session);
		ChatRoomVo curRoom = (ChatRoomVo) httpSession.get("room");
		MemberVo curMember = (MemberVo)httpSession.get("loginMember");
		
		log.info("Chat Socket 연결");
		log.info("id : " + session.getId());

		if(httpSession.get("loginMember")!=null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("httpSession", httpSession);
			map.put("session", session);
			userSessionsMap.put(curMember.getNo(), map);			
		}
		
		Set<String> keySet = userSessionsMap.keySet();
		
		for(String key : keySet) {
			if(key.equals(curMember.getNo())) {continue;}
			
			Map<String, Object> map = userSessionsMap.get(key);
			
			Map<String, Object> hs =  (Map<String, Object>) map.get("httpSession");
			ChatRoomVo roomVo = (ChatRoomVo) hs.get("room");
			String room = roomVo.getChatRoomNo();
			WebSocketSession ss = (WebSocketSession) map.get("session");
			
			if(room.equals(curRoom.getChatRoomNo())) {
				System.out.println("보냄");
				ss.sendMessage(new TextMessage("#####"));
			}
		}
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map<String, Object> httpSession = getHTTPSession(session);
		MemberVo curMember = (MemberVo)httpSession.get("loginMember");
		
		log.info("Chat Socket 종료");
		log.info("id : " + session.getId());//현재 접속한 사람
		
		if(curMember!=null) {
			userSessionsMap.remove(curMember.getNo());			
		}
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("{}로부터 받은 메세지 {}", session.getId(), message.getPayload());
		Map<String, Object> httpSession = getHTTPSession(session);
		ChatRoomVo curRoom = (ChatRoomVo)httpSession.get("room");
		List<MemberVo> members = curRoom.getMembers();
		
		String msg = message.getPayload();
		String msgs[] = msg.split("#");
		
		String roomNo = msgs[2];	
		
		
		int inMemberCount = -1;
		Set<String> keySet = userSessionsMap.keySet();
		
		List<WebSocketSession> sessions = new ArrayList<>();
		
		for(String key : keySet) {
			Map<String, Object> map = userSessionsMap.get(key);
			
			Map<String, Object> hs =  (Map<String, Object>) map.get("httpSession");
			ChatRoomVo roomVo = (ChatRoomVo) hs.get("room");
			String room = roomVo.getChatRoomNo();
			WebSocketSession ss = (WebSocketSession) map.get("session");
			
			if(room.equals(roomNo)) {
				inMemberCount++;
				sessions.add(ss);
			}
		}
		
		TextMessage text = new TextMessage(msg+"#"+(members.size()-inMemberCount));
		
		for(WebSocketSession ss : sessions) {
			ss.sendMessage(text);			
		}
	}

}
