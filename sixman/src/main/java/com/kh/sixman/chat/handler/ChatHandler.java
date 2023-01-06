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
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	private Map<String, Object> getHTTPSession(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		return httpSession;
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> httpSession = getHTTPSession(session);
		MemberVo curMember = (MemberVo)httpSession.get("loginMember");
		if(curMember==null) return; 
		
		ChatRoomVo curRoom = (ChatRoomVo) httpSession.get("room");
		
		log.info("Chat Socket 연결");
		log.info("id : " + session.getId());

		userSessionsMap.put(curMember.getNo(), session);			
		
		Set<String> keySet = userSessionsMap.keySet();
		for(String key : keySet) {
			
			if(key.equals(curMember.getNo())) continue;
			
			WebSocketSession memberWS = userSessionsMap.get(key);
			Map<String, Object> memberHS = getHTTPSession(memberWS);
			
			ChatRoomVo roomVo = (ChatRoomVo) memberHS.get("room");
			if(roomVo==null) continue;
			
			String room = roomVo.getChatRoomNo();
			
			if(room.equals(curRoom.getChatRoomNo())) {
				memberWS.sendMessage(new TextMessage("#####"+curRoom.getBeforeJoin()));
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
		log.info("chat {}로부터 받은 메세지 {}", session.getId(), message.getPayload());
		
		Map<String, Object> httpSession = getHTTPSession(session);
		ChatRoomVo curRoom = (ChatRoomVo)httpSession.get("room"); //보낸사람 채팅방정보
		List<MemberVo> members = curRoom.getMembers(); //보낸사람 채팅방의 맴버들
		
		String msg = message.getPayload();
		String msgs[] = msg.split("#");
		
		String roomNo = msgs[2];	
		
		int inMemberCount = -1;
		
		List<WebSocketSession> sessions = new ArrayList<>();
		
		Set<String> keySet = userSessionsMap.keySet();
		for(String key : keySet) {
			WebSocketSession memberWS = userSessionsMap.get(key);
			Map<String, Object> memberHS = getHTTPSession(memberWS);
			
			ChatRoomVo roomVo = (ChatRoomVo) memberHS.get("room");//다른사람 접속한 룸 정보
			String room = roomVo.getChatRoomNo();
			
			if(room.equals(roomNo)) {
				inMemberCount++;
				sessions.add(memberWS);
			}
		}
		
		TextMessage text = new TextMessage(msg+"#"+(members.size()-inMemberCount));
		
		for(WebSocketSession ss : sessions) {
			ss.sendMessage(text);			
		}
	}

}
