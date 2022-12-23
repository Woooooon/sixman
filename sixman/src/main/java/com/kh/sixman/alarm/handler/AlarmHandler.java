package com.kh.sixman.alarm.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AlarmHandler extends TextWebSocketHandler{
	
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1:1로 할 경우
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("Socket 연결");
		sessions.add(session);
		log.info("id : " + session.getId() + ", name : " + session.getPrincipal().getName());//현재 접속한 사람
		log.info("---------------------------------------------");
		userSessionsMap.put(session.getId(), session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("Socket 종료");
		sessions.remove(session);
		log.info("id : " + session.getId() + ", name : " + session.getPrincipal().getName());//현재 접속한 사람
		log.info("---------------------------------------------");
		userSessionsMap.remove(session.getId());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("{}로부터 받은 메세지 {}", session.getId(), message.getPayload());
	}

}
