package com.kh.sixman.alarm.handler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.sixman.chat.service.ChatService;
import com.kh.sixman.chat.vo.ChatRoomVo;
import com.kh.sixman.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AlarmHandler extends TextWebSocketHandler{
	
	private Map<String, Map<String, Object>> userSessionsMap = new HashMap<String, Map<String, Object>>();
	
	@Autowired
	private ChatService chatService;
	
	private Map<String, Object> getHTTPSession(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		return httpSession;
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> httpSession = getHTTPSession(session);
		
		log.info("Chat Socket 연결");
		log.info("id : " + session.getId());

		if(httpSession.get("loginMember")!=null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("httpSession", httpSession);
			map.put("session", session);
			MemberVo curMember = (MemberVo)httpSession.get("loginMember");
			userSessionsMap.put(curMember.getNo(), map);			
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
		
		String msg = message.getPayload();
		String msgs[] = msg.split("#");
		
		String type = msgs[1];
		String sendMsg = msgs[2];
		String sender = msgs[3];
		
		//메일일때
		if("MAIL".equals(type)) {
			Set<String> keySet = userSessionsMap.keySet();
			TextMessage text = new TextMessage(type+"#"+sendMsg);
			for(String key : keySet) {
				Map<String, Object> map = userSessionsMap.get(key);
				
				Map<String, Object> hs =  (Map<String, Object>) map.get("httpSession");
				MemberVo vo =  (MemberVo) hs.get("loginMember");
				WebSocketSession ss = (WebSocketSession) map.get("session");
				
				if(vo.getEmail().equals(sender)) {
					ss.sendMessage(text);
				}
			}
		}
		
		if("CHAT".equals(type)) {			
			ChatRoomVo curRoom = (ChatRoomVo)httpSession.get("room");
			List<MemberVo> members = curRoom.getMembers();
			
			MemberVo curMember = (MemberVo)httpSession.get("loginMember");
			
			TextMessage text = new TextMessage(type+"#"+sendMsg);
			
			for(MemberVo vo : members) {
				Map<String, Object> map = userSessionsMap.get(vo.getNo());
				
				if(map==null) {continue;}
				
				Map<String, Object> hs =  (Map<String, Object>) map.get("httpSession");
				ChatRoomVo roomVo = (ChatRoomVo) hs.get("room");
				if(roomVo==null) {continue;}
				String room = roomVo.getChatRoomNo();
								
				WebSocketSession ss = (WebSocketSession) map.get("session");
				
				if(sender.equals(room)) {
					continue;
				}
				
				Map<String,String> temp = new HashMap<>();
				temp.put("loginNo", curMember.getNo());
				temp.put("no", roomVo.getChatRoomNo());
				ChatRoomVo crv = chatService.getChatSetting(temp);
				
				if("N".equals(crv.getAlarmYn())) {
					continue;
				}
				
				ss.sendMessage(text);
			}
		}
		

	}

}
