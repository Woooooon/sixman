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
	
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	@Autowired
	private ChatService chatService;
	
	private Map<String, Object> getHTTPSession(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		return httpSession;
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> httpSession = getHTTPSession(session);
		MemberVo curMember = (MemberVo)httpSession.get("loginMember");
		
		log.info("Socket 연결");
		log.info("id : " + session.getId());

		if(curMember!=null) {
			userSessionsMap.put(curMember.getNo(), session);			
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map<String, Object> httpSession = getHTTPSession(session);
		MemberVo curMember = (MemberVo)httpSession.get("loginMember");
		
		log.info("Socket 종료");
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
		
		TextMessage text = new TextMessage(type+"#"+sendMsg);
		//메일일때
		if("MAIL".equals(type)) {
			
			Set<String> keySet = userSessionsMap.keySet();
			for(String key : keySet) {
				WebSocketSession memberWS = userSessionsMap.get(key);
				Map<String, Object> memberHS = getHTTPSession(memberWS);
				MemberVo vo =  (MemberVo) memberHS.get("loginMember");
				
				if(sender.equals(vo.getEmail())) {
					memberWS.sendMessage(text);
				}
			}
		}
		
		if("CHAT".equals(type)) {			
			ChatRoomVo curRoom = (ChatRoomVo) httpSession.get("room");
			List<MemberVo> members = curRoom.getMembers();

			for(MemberVo vo : members) {
				WebSocketSession memberWs = userSessionsMap.get(vo.getNo());
				if(memberWs==null) continue;
				
				Map<String, Object> memberHS = getHTTPSession(memberWs);
				ChatRoomVo memberRoom = (ChatRoomVo) memberHS.get("room");
				if(memberRoom==null || memberRoom.getChatRoomNo()!=sender) continue;
				
				Map<String,String> temp = new HashMap<>();
				temp.put("loginNo", vo.getNo());
				temp.put("no", sender);
				ChatRoomVo crv = chatService.getChatSetting(temp);
				if("N".equals(crv.getAlarmYn())) continue;
				
				memberWs.sendMessage(text);
			}
		}
		

	}

}
