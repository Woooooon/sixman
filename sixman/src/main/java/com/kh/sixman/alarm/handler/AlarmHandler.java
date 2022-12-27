package com.kh.sixman.alarm.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.sixman.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AlarmHandler extends TextWebSocketHandler{
	
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1:1로 할 경우
	private Map<String, Map<String, Object>> userSessionsMap = new HashMap<String, Map<String, Object>>();
	
	private MemberVo getLoginMember(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		MemberVo loginMember = (MemberVo)httpSession.get("loginMember");
		
		return loginMember;
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		MemberVo curMember = getLoginMember(session);
		log.info("Socket 연결");
		log.info("id : " + session.getId());
		log.info("loginMember : " + curMember);//현재 접속한 사람
		log.info("---------------------------------------------");
				
		sessions.add(session);
		if(curMember!=null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("MemberVo", curMember);
			map.put("session", session);
			userSessionsMap.put(curMember.getNo(), map);			
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		MemberVo curMember = getLoginMember(session);
		log.info("Socket 종료");
		log.info("id : " + session.getId());//현재 접속한 사람
		log.info("---------------------------------------------");
		
		sessions.remove(session);
		if(curMember!=null) {
			userSessionsMap.remove(curMember.getNo());			
		}
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("{}로부터 받은 메세지 {}", session.getId(), message.getPayload());
		
		String msg = message.getPayload();
		String msgs[] = msg.split("#");
		
		String userNo = msgs[0];
		String type = msgs[1];
		String sendMsg = msgs[2];
		String sender = msgs[3];
		
		//메일일때
		Set<String> keySet = userSessionsMap.keySet();
		for(String key : keySet) {
			Map<String, Object> map = userSessionsMap.get(key);
			
			MemberVo vo =  (MemberVo) map.get("MemberVo");
			WebSocketSession ss = (WebSocketSession) map.get("session");
			
			if(vo.getEmail().equals(sender)) {
				ss.sendMessage(new TextMessage(type+"#"+sendMsg));
			}
		}
	}

}
