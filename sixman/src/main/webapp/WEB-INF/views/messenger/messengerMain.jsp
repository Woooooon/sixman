<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
	<%@ page import = "com.kh.sixman.messenger.vo.ReadChatRoomListVo" %>
	<%@ page import = "com.google.gson.Gson" %>
	<%@ page import = "com.kh.sixman.messenger.controller.WhoChatFirstController" %>


		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<link rel="stylesheet" href="<c:url value='/resources/css/messenger.css'/>">
			<link rel="stylesheet"
				href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		</head>

		<body>
			<%@include file="/WEB-INF/views/common/menuBar.jsp" %>
				<main class="messenger-whole" id='messenger-whole'>
				
				<!-- 맨 먼저 나타나는 페이지 -->
					<div class="chatroomlist-first-page" id="chatroomlist-first-page" style="display:none">
						<div class="title-box">
							<div class="title-text01">사내 대화방</div>
							<button onclick="qwe_chat_onclick();" class="material-symbols-outlined" id="qwe" >add_circle</button>
						</div>

						<div class='bottom-area' id='ba'></div>

						<div class='button' id='main-add-button'></div>
						<div id="none-text" style="display:none">
							<div id='main-center-text1'>현재 대화 목록이 없습니다.</div>
							<div id='main-center-text2'>대화하고 싶으신 분과 대화방을 열여보세요~</div>
						</div>
						


						<div class="chatroom-list-space">
							<!-- <div class="chatroom-introduce">대화방 목록</div> -->
							<!-- <div class="textbox-messenger-area1"> -->

							<div class="messenger-category01">
								<select>
									<option>직책</option>
									<option>이름</option>
									<option>팀명</option>
								</select>
							</div>
							<input type="text" name="wantchatdata" id="wantchatdata">
							<input type="submit" class="btn" value="검색">
						</div>
							<div class="chatlist-big" id="chatlist-big">
							
									<%
			// 							ReadChatRoomListVo chatrlist = Gson.fromJson(showchatroomlistReady, ReadChatRoomListVo.class);
			// 							System.out.println("최종본 : "+ chatrlist);
			
									%>
									
			
										<div class="chatroom-list-box">
											
											
											<div class="with-chat-data02" id="with-chat-data01">
												<div class="square-first" style=""></div>
												<div class="chatroom-list-two-to-two" id="chatroom-list-two-to-two">
													<div class="with-chat-subroomname2">야 지금 뭐해?</div>
													<div class="chat-others-profile01">
														<div class="with-chat-name01"></div>
														<div class="with-chat-grade01"></div>
<!-- 														구기석 부장 -->
													</div>
													<div class="chatroom-alarm-content">님께서 첨부파일을 보내셨습니다.</div>
													<br>
													<div class="chatroom-alarm-time">오후 2:12</div>
												</div>
												<div class="chatroom-exit-button">
													<span class="material-symbols-outlined" id="chatroom-exit-icon">exit_to_app</span>
												</div>
												
											</div>
											<div class="with-chat-data02-1" id="with-chat-data01-1" style="display:none" >
													<div class="width-chat-subroomname2-1">해당 대화창을 삭제하시겠습니까?</div>
													<div class="button-list-chatroom-delete">
														<button type="button" class="btn" id="deletechatroom-ok">예</button>
														<button type="button" class="btn" id="deletechatroom-no">아니오</button>
													</div>
													
											</div>
											
										</div>
										
										<div class='bottom-area-chatlist' id='ba'></div>
								</div>
						

					</div>

					










					<!-- 대화방 생성 첫번째 화면 -->

					<!-- 누구와 대화하시겠습니까? -->
						<div class="whochat-page-first" style="display:none">
						
							<div class="title-box">
								<div class="title-text01">대화방 생성</div>
							</div>
	
							<div class='bottom-area' id='ba'></div>
	
							<div id='who-chat'>누구와 대화하시겠습니까?</div>
	
							<!-- 카탈로그, textarea, button -->
	
							<div class="chatroom-list-space">
								<!-- <div class="chatroom-introduce">대화방 목록</div> -->
								<!-- <div class="textbox-messenger-area1"> -->
	
								<div class="messenger-category01">
									<select>
										<option>직책</option>
										<option>이름</option>
										<option>팀명</option>
									</select>
								</div>
								<input type="text" name="wantchatdata-search" id="wantchatdata">
								<input type="submit" class="btn" value="검색">
							</div>
	
	
							<div class="text-messenger-settings">
								<div class="textbox-messenger-area2">
									<div class="showup" id="showup01">
										<span class="material-symbols-outlined" style="font-size:300%" id="chatsetting-slide01">expand_more</span>
										<div class="chatsetting-02-subtitle" id="subtitle1">전체 목록</div>
									</div>
									<div class="team-people-data">
		<!--  								<div class="team-whole-data"> -->
		<!-- 									<div class="team-area">영업부</div> -->
		<!-- 									<div class="team-name">영업 2팀</div> -->
		<!-- 								</div> -->
		
									<div class="bottom-area2"></div>	
									
<%-- 									<c:forEach items="${whoChatfirst}" var="mo"> --%>
										
										<div class="with-chat-data">
											<div class="square" style="">
												<img class="square-img" src="/sixman/resources/img/profile/" />
											</div>
											<div class="chat-deptname-area-version2" style="margin-left:6%;width:40%;position:absolute;"><div class="want_all_chat_deptName"></div></div>
	<%-- 										${whoChatfirst.deptName} --%>
											<div class="chat-teamname-area-version2"><div class="want_all_chat_teamName"></div></div>
	<%-- 										${whoChatfirst.teamName} --%>
											<div class="with-chat-name"><div class="want_all_chat_people_name"></div></div>
	<%-- 										${whoChatfirst.name} --%>
											<div class="with-chat-grade"><div class="want_all_chat_position"></div></div>
	<%-- 										${whoChatfirst.position} --%>
											<input type="radio" id="want_all_chat_profileNo" class="want_all_chat_profileNo" name="withfriend01" value="">
										</div>
										
										<div class="bottom-area2"></div>
										
<%-- 									</c:forEach>	 --%>
										
<!-- 									<div class="bottom-area2"></div> -->
										
									</div>
									
								</div>
<!-- 								<div class="textbox-messenger-area3"> -->
<!-- 									<div class="showup" id="showup02"> -->
<!-- 										<span class="material-symbols-outlined" style="font-size:50px" id="chatsetting-slide01">expand_more</span> -->
<!-- 										<div class="chatsetting-02-subtitle" id="subtitle1">친구 목록</div> -->
<!-- 									</div> -->
<!-- 									<div class="team-people-data"> -->
<!-- 										<div class="team-whole-data"> -->
<!-- 											<div class="team-area">영업부</div> -->
<!-- 											<div class="team-name">영업 2팀</div> -->
<!-- 										</div> -->
<!-- 										<div class='bottom-area2' id='ba'></div> -->
<!-- 										<div class="with-chat-data"> -->
<!-- 											<div class="square" style=""></div> -->
<!-- 											<div class="with-chat-name">구기석</div> -->
<!-- 											<div class="with-chat-grade">부장</div> -->
<!-- 											<input type="checkbox" class="checkbox-square-one" name="withfriend01"> -->
<!-- 										</div> -->
<!-- 										<div class="bottom-area2"></div> -->
<!-- 										<div class="with-chat-data"> -->
<!-- 											<div class="square" style=""></div> -->
<!-- 											<div class="with-chat-name">구기석</div> -->
<!-- 											<div class="with-chat-grade">부장</div> -->
<!-- 											<input type="checkbox" class="checkbox-square-one" name="withfriend01"> -->
<!-- 										</div> -->
<!-- 										<div class="bottom-area2"></div> -->
<!-- 										<div class="with-chat-data"> -->
<!-- 											<div class="square" style=""></div> -->
<!-- 											<div class="with-chat-name">구기석</div> -->
<!-- 											<div class="with-chat-grade">부장</div> -->
<!-- 											<input type="checkbox" class="checkbox-square-one" name="withfriend01"> -->
<!-- 	 									</div> -->
<!-- 										<div class="bottom-area2"></div> -->
<!-- 									</div> -->
<!-- 								</div> -->
								<div class="chatting-button-list01">
									<div class="chatbutton01">
										<input type="submit" class="btn" value="이전 화면" id="makingroom-first-leave">
									</div>
									<div class="chatbutton01">
										<input type="submit" class="btn" value="다음 화면" id="makingroom-first-next">
									</div>
								</div>
								<div class="white_display_01"></div>
							</div>
						</div>

					<!-- 채팅방 이름 생성 -->


					<div class="define-chatroomname" id="define-chatroomname" style="display:none">
						<div class="title-text01">대화방 생성</div>
	
						<div class='bottom-area' id='ba'></div>
	
						<div class='add-button' id='main-add-button'></div>
	
						<div class='who-chat-roomname'>채팅방 이름</div>
	
	
	
	
						<input type="text" name="wantcreatechatroomname" class="define-roomname">
						<div class="btn-height">
							<input type="submit" class="btn" value="이전 화면" id="makingchatroom-second-leave">
							<input type="submit" class="btn" value=" + 채팅방 생성" id="makingchatroom-second-go">
						</div>
						
					</div>
				
				
				
					<!-- chattingroom -->
					
					<!-- 사내대화방 프로필(연락처, 프로필 링크 선택)모달창 -->
					
						<div class="chatlist-modal">
							<div class="chatlist-modal-text01">어느것을 선택하시겠습니까?</div>	
							<div class="chatlist-modal-text02">
								<div class="chatlist-modal-text02-1">프로필 링크</div>
								<div class="chatlist-modal-text02-2">연락처 링크</div>
							</div>	
						</div>
					
						<div class="chatting-room" style="display:none">
						<c:forEach items="${chatRoomDataReady}" var="chatroomready">
							<div class="chatting-room-first">
								<div class="chatroom-one-to-one">
									<div class="chatroom-square"></div>
									<div class="chatroom-box1-1-profile-data">
<!-- 										<div class="chatroom1-1-1text">영업부 영업4팀</div> -->
										<div class="chatroom1-1-2text">
											<div class="chatroom1-1-2text-1-1">${chatroomready.chatroomName }</div>
<!-- 											<div>과장</div> -->
										</div>
									</div>
									<div class="material-symbols-outlined" id="chatroom-1-2-icon">chevron_right</div>
									<span class="material-symbols-outlined" id="chatroom-1-3-icon">settings</span>
								</div>
							</div>
						</c:forEach>
						
						<div class="chatroom-one-to-two">
							<div class="chatroom-one-to-three-2"  style="display:none">
								<div class="chatroom-4-1-box" style="margin-left:4%; margin-right:4%;">	
									<div class="material-symbols-outlined" id="chatroom-4-1-icon1">contacts</div>
									<div class="chatroom-menubar-text-green"">명함 보내기</div>
								</div>
								<div class="chatroom-4-1-box" style="margin-left:4%; margin-right:4%;">
									<div class="material-symbols-outlined" id="chatroom-4-1-icon2">upload</div>
									<div class="chatroom-menubar-text-green">첨부파일</div>
								</div>
								<div class="chatroom-4-1-box" style="margin-left:4%; margin-right:4%;">
									<div class="material-symbols-outlined" id="chatroom-4-1-icon3">exit_to_app</div>
									<div class="chatroom-menubar-text-green">취소하기</div>
								</div>
							</div>
							<div class="chatroom" id="chatroom-1">
								<div class="chatroom-1-2-white-area"></div>
								
								<div class="chatroom2-1text">
								<div class="chatroom-square2" id="chatroom-square02"></div>
										<div class="chatroom2-1-1-1text">정인제</div>
										<div class="chatroom2-1-1-2text">과장</div>
										
								</div>
								<div class="chatroom2-1-2textbox">
									<div class="chatroom2-1-2-text">안녕하세요~</div>
								</div>
								<div class="chatroom2-1-3textbox">오전 10:00 보냄</div>
								
								
							</div>
							<div class="chatroom" id="chatroom-2">
								<div class="chatroom-1-2-white-area"></div>
								
								
								<div class="chatroom2-2-2textbox">
									<div class="chatroom2-1-2-text">안녕하세요~</div>
								</div>
								<div class="chatroom2-2-3textbox">오전 10:00 보냄</div>
								
								
							</div>
							
							<div class="chatroom" id="chatroom-2">
								<div class="chatroom-1-2-white-area"></div>
								
								
								<div class="chatroom2-2-2textbox">
									<div class="chatroom2-1-2-text">첨부파일 송부합니다~</div>
									<div class="chatroom2-1-2-text">정인제 과장님께서 첨부파일을 보내셨습니다</div>
									<div class="chatroom-upload-box">
									<div class="material-symbols-outlined">upload_file</div>
									<div>dd.jpg</div>
								</div>
								</div>
								<div class="chatroom2-2-3textbox">오전 10:00 보냄</div>
								
								
							</div>
							
							<div class="chatroom" id="chatroom-1">
								<div class="chatroom-1-2-white-area"></div>
								
								<div class="chatroom2-1text">
								<div class="chatroom-square2" id="chatroom-square02"></div>
										<div class="chatroom2-1-1-1text">정인제</div>
										<div class="chatroom2-1-1-2text">과장</div>
										
								</div>
								<div class="chatroom2-1-2-1textbox">
									<div class="chatroom2-1-2-text">정인제 과장님께서 머머리 과장님의 명함을 보내셨습니다</div>
									<div class="chatroom-upload-box">
										<div class="material-symbols-outlined">contacts</div>
										<div>프로필 확인하기</div>
									</div>
								</div>
								
								<div class="chatroom2-1-2-1textbox">
									<div class="chatroom2-1-2-text">정인제 과장님께서 머머리 과장님의 명함을 보내셨습니다</div>
									<div class="chatroom-upload-box">
										<div class="material-symbols-outlined">contacts</div>
										<div>프로필 확인하기</div>
									</div>
								</div>
								
								<div class="chatroom2-1-3textbox">오전 10:00 보냄</div>
								<div class="chatroom2-1text">
								<div class="chatroom-square2" id="chatroom-square02"></div>
										<div class="chatroom2-1-1-1text">정인제</div>
										<div class="chatroom2-1-1-2text">과장</div>
										
								</div>
								<div class="chatroom2-1-2-1textbox">
									<div class="chatroom2-1-2-text">정인제 과장님께서 첨부파일을 보내셨습니다</div>
									<div class="chatroom-upload-box">
										<div class="material-symbols-outlined">upload_file</div>
										<div>dd.jpg</div>
									</div>
								</div>
								<div class="chatroom2-1-3textbox">오전 10:00 보냄</div>
								
								
								
							</div>
							
						</div>
						
						
						<div class="chatroom-one-to-three">
							<span class="material-symbols-outlined" id="chatroom-1-3-1">menu</span>
							<input type="text" id="chatroom1-3-text">
							<span class="material-symbols-outlined" id="chatroom-1-3-3">send</span>
						</div>
						
						
					</div>
					
					
					<div class="chatting-room" style="display:none">
							<div class="chatting-room-first">
								<div class="chatroom-one-to-one">
									<div class="chatroom-square"></div>
									<div class="chatroom-box1-1-profile-data">
										<div class="chatroom1-1-1text">영업부 영업4팀</div>
										<div class="chatroom1-1-2text">
											<div class="chatroom1-1-2text-1-1">구기석</div>
											<div>부장</div>
										</div>
									</div>
									<div class="material-symbols-outlined" id="chatroom-1-2-icon">chevron_right</div>
									<span class="material-symbols-outlined" id="chatroom-1-3-icon">settings</span>
								</div>
							
							
							</div>
						
						
						<div class="chatroom-one-to-two">
							<div class="chatroom-one-to-three-2"  style="display:none">
								<div class="chatroom-4-1-box" style="margin-left:4%; margin-right:4%;">	
									<div class="material-symbols-outlined" id="chatroom-4-1-icon1">contacts</div>
									<div class="chatroom-menubar-text-green"">명함 보내기2</div>
								</div>
								<div class="chatroom-4-1-box" style="margin-left:4%; margin-right:4%;">
									<div class="material-symbols-outlined" id="chatroom-4-1-icon2">upload</div>
									<div class="chatroom-menubar-text-green">첨부파일2</div>
								</div>
								<div class="chatroom-4-1-box" style="margin-left:4%; margin-right:4%;">
									<div class="material-symbols-outlined" id="chatroom-4-1-icon3">exit_to_app</div>
									<div class="chatroom-menubar-text-green">취소하기2</div>
								</div>
							</div>
							<div class="chatroom" id="chatroom-1">
								<div class="chatroom-1-2-white-area"></div>
								
								<div class="chatroom2-1text">
								<div class="chatroom-square2" id="chatroom-square02"></div>
										<div class="chatroom2-1-1-1text">구기석</div>
										<div class="chatroom2-1-1-2text">부장</div>
										
								</div>
								<div class="chatroom2-1-2textbox">
									<div class="chatroom2-1-2-text">안녕하세요~</div>
								</div>
								<div class="chatroom2-1-3textbox">오전 10:00 보냄</div>
								
								
							</div>
							<div class="chatroom" id="chatroom-2">
								<div class="chatroom-1-2-white-area"></div>
								
								
								<div class="chatroom2-2-2textbox">
									<div class="chatroom2-1-2-text">안녕하세요~</div>
								</div>
								<div class="chatroom2-2-3textbox">오전 10:00 보냄</div>
								
								
							</div>
							
							<div class="chatroom" id="chatroom-2">
								<div class="chatroom-1-2-white-area"></div>
								
								
								<div class="chatroom2-2-2textbox">
									<div class="chatroom2-1-2-text">첨부파일 송부합니다~</div>
									<div class="chatroom2-1-2-text">구기석 부장님께서 첨부파일을 보내셨습니다</div>
									<div class="chatroom-upload-box">
									<div class="material-symbols-outlined">upload_file</div>
									<div>dd.jpg</div>
								</div>
								</div>
								<div class="chatroom2-2-3textbox">오전 10:00 보냄</div>
								
								
							</div>
							
							<div class="chatroom" id="chatroom-1">
								<div class="chatroom-1-2-white-area"></div>
								
								<div class="chatroom2-1text">
								<div class="chatroom-square2" id="chatroom-square02"></div>
										<div class="chatroom2-1-1-1text">구기석</div>
										<div class="chatroom2-1-1-2text">부장</div>
										
								</div>
								<div class="chatroom2-1-2-1textbox">
									<div class="chatroom2-1-2-text">구기석 과장님께서 머머리 과장님의 명함을 보내셨습니다</div>
									<div class="chatroom-upload-box">
										<div class="material-symbols-outlined">contacts</div>
										<div>프로필 확인하기</div>
									</div>
								</div>
								
								<div class="chatroom2-1-2-1textbox">
									<div class="chatroom2-1-2-text">구기석 과장님께서 머머리 과장님의 명함을 보내셨습니다</div>
									<div class="chatroom-upload-box">
										<div class="material-symbols-outlined">contacts</div>
										<div>프로필 확인하기</div>
									</div>
								</div>
								
								<div class="chatroom2-1-3textbox">오전 10:00 보냄</div>
								<div class="chatroom2-1text">
								<div class="chatroom-square2" id="chatroom-square02"></div>
										<div class="chatroom2-1-1-1text">정인제</div>
										<div class="chatroom2-1-1-2text">과장</div>
										
								</div>
								<div class="chatroom2-1-2-1textbox">
									<div class="chatroom2-1-2-text">구기석 과장님께서 첨부파일을 보내셨습니다</div>
									<div class="chatroom-upload-box">
										<div class="material-symbols-outlined">upload_file</div>
										<div>dd.jpg</div>
									</div>
								</div>
								<div class="chatroom2-1-3textbox">오전 10:00 보냄</div>
								
								
								
							</div>
							
						</div>
						
						
						<div class="chatroom-one-to-three">
							<span class="material-symbols-outlined" id="chatroom-1-3-1">menu</span>
							<input type="text" id="chatroom1-3-text">
							<span class="material-symbols-outlined" id="chatroom-1-3-3">send</span>
						</div>
						
						
					</div>




				<!-- 채팅방 설정창 -->


					<div class="chatroom-setting" id="chatroom-setting" style="display:none">
						<div class="chatroom-setting-box1">
							<div class="title-text01">채팅방 설정</div>
						<span class="material-symbols-outlined" id="chatroom-setting-icon-1">exit_to_app</span>
						</div>
						
						<div class='bottom-area' id='ba'></div>
	
						<div class='add-button' id='main-add-button'></div>
						
						<div class="chatroom-setting-2-1">
							<div class="chatroom-setting-2-1-1">고정 여부</div>
							<input type="checkbox" class="checkbox-square-one" name="chatroom_setting_check1" id="chat-setting-check01">
						</div>
						<div class="chatroom-setting-2-2">
							<div class="chatroom-setting-2-2-1">알림 여부</div>
							<input type="checkbox" class="checkbox-square-one" name="chatroom_setting_check2" id="chat-setting-check02">
						</div>
						
	
						<div class='chatroom-setting-nametitle'>채팅방 참여 이름</div>
	
	
	
	
						<input type="text" name="wantchatdata" class="define-roomname">
						<div class="btn-height">
							<input type="submit" class="btn" value=" 설정 저장  " id="chatroom-setting-out">
						</div>
						
					</div>
					
					<div class="chatroom-setting" id="chatroom-setting" style="display:none">
						<div class="chatroom-setting-box1">
							<div class="title-text01">채팅방 설정</div>
						<span class="material-symbols-outlined" id="chatroom-setting-icon-1">exit_to_app</span>
						</div>
						
						<div class='bottom-area' id='ba'></div>
	
						<div class='add-button' id='main-add-button'></div>
						
						<div class="chatroom-setting-2-1">
							<div class="chatroom-setting-2-1-1">고정 여부</div>
							<input type="checkbox" class="checkbox-square-one" name="chatroom_setting_check1" id="chat-setting-check01">
						</div>
						<div class="chatroom-setting-2-2">
							<div class="chatroom-setting-2-2-1">알림 여부</div>
							<input type="checkbox" class="checkbox-square-one" name="chatroom_setting_check2" id="chat-setting-check02">
						</div>
						
	
						<div class='chatroom-setting-nametitle'>채팅방 참여 이름</div>
	
	
	
	
						<input type="text" name="wantchatdata" class="define-roomname">
						<div class="btn-height">
							<input type="submit" class="btn" value=" 설정 저장  " id="chatroom-setting-out">
						</div>
						
					</div>
					
					
					<!-- 채팅방 회원 프로필 데이터 -->
					<div class="chat-profile-site" id = "chat-profile-site" style="display:none">
						<div class="chatroom-setting-box1">
							<div class="chatroom-person-profile-title-1">사용자 프로필 정보</div>
						<span class="material-symbols-outlined" id="chatroom-setting-icon-2">exit_to_app</span>
						</div>
						
						<div class='bottom-area' id='ba'></div>
	
						<div class='add-button' id='main-add-button'></div>
						
						<div id='chatroom-square02-big'></div>
						<div class="chatroom-person-profile-text">
							<div class="chatroom-profile" id="chatroom-profile-1">이름</div>
							<div class="chatroom-profile1" id="chatroom-profile-2">정인제</div>
						</div>
<!-- 						<div class="chatroom-person-profile-text"> -->
<!-- 							<div class="chatroom-profile" id="chatroom-profile-3">전화번호</div> -->
<!-- 							<div class="chatroom-profile1" id="chatroom-profile-4">011-211-211</div> -->
<!-- 						</div> -->
						<div class="chatroom-person-profile-text">
							<div class="chatroom-profile" id="chatroom-profile-5">소속 부서</div>
							<div class="chatroom-profile1" id="chatroom-profile-6">영업부 영업4팀</div>
						</div>
						<div class="chatroom-person-profile-text">
							<div class="chatroom-profile" id="chatroom-profile-7">직급</div>
							<div class="chatroom-profile1" id="chatroom-profile-8">과장</div>
						</div>
						
	
<!-- 						<div class='chatroom-setting-nametitle'>채팅방 참여 이름</div> -->
	
	
	
	
<!-- 						<input type="text" name="wantchatdata" class="define-roomname"> -->
<!-- 						<div class="btn-height"> -->
<!-- 							<input type="submit" class="btn" value=" 설정 저장  " id="chatroom-setting-out"> -->
<!-- 						</div> -->
					</div>
					<div class="chat-profile-site" id = "chat-profile-site" style="display:none">
						<div class="chatroom-setting-box1">
							<div class="chatroom-person-profile-title-1">사용자 프로필 정보</div>
						<span class="material-symbols-outlined" id="chatroom-setting-icon-2">exit_to_app</span>
						</div>
						
						<div class='bottom-area' id='ba'></div>
	
						<div class='add-button' id='main-add-button'></div>
						
						<div id='chatroom-square02-big'></div>
						<div class="chatroom-person-profile-text">
							<div class="chatroom-profile" id="chatroom-profile-1">이름</div>
							<div class="chatroom-profile1" id="chatroom-profile-2">구기석</div>
						</div>
<!-- 						<div class="chatroom-person-profile-text"> -->
<!-- 							<div class="chatroom-profile" id="chatroom-profile-3">전화번호</div> -->
<!-- 							<div class="chatroom-profile1" id="chatroom-profile-4">011-211-211</div> -->
<!-- 						</div> -->
						<div class="chatroom-person-profile-text">
							<div class="chatroom-profile" id="chatroom-profile-5">소속 부서</div>
							<div class="chatroom-profile1" id="chatroom-profile-6">영업부 영업4팀</div>
						</div>
						<div class="chatroom-person-profile-text">
							<div class="chatroom-profile" id="chatroom-profile-7">직급</div>
							<div class="chatroom-profile1" id="chatroom-profile-8">부장</div>
						</div>
						
	
<!-- 						<div class='chatroom-setting-nametitle'>채팅방 참여 이름</div> -->
	
	
	
	
<!-- 						<input type="text" name="wantchatdata" class="define-roomname"> -->
<!-- 						<div class="btn-height"> -->
<!-- 							<input type="submit" class="btn" value=" 설정 저장  " id="chatroom-setting-out"> -->
<!-- 						</div> -->
					</div>
					
					
					
					
					
					
					<!-- 프로필 보내기 사이트 안쓸거임 -->
					

<!-- 					누구와 대화하시겠습니까? -->
<!-- 					<div class="text-messenger-send-profile-page-01"> -->
					
<!-- 						<div class="title-box" id="who-send-profile-inchatroom"> -->
<!-- 							<div class="title-text01">프로필 링크 전달</div> -->
<!-- 						</div> -->

<!-- 						<div class='bottom-area' id='ba'></div> -->

<!-- 						<div id='who-chat'>어느 분의 프로필을 전달하시겠어요?</div> -->

<!-- 						카탈로그, textarea, button -->

<!-- 						<div class="chatroom-list-space"> -->
<!-- 							<div class="chatroom-introduce">대화방 목록</div> -->
<!-- 							<div class="textbox-messenger-area1"> -->

<!-- 							<div class="messenger-category01"> -->
<!-- 								<select> -->
<!-- 									<option>직책</option> -->
<!-- 									<option>이름</option> -->
<!-- 									<option>팀명</option> -->
<!-- 								</select> -->
<!-- 							</div> -->
<!-- 							<input type="text" name="wantchatdata" id="wantchatdata"> -->
<!-- 							<input type="submit" class="btn" value="검색"> -->
<!-- 						</div> -->


<!-- 						프로필 설정 창, 클래스 바꿔야 -->
<!-- 						<div class="text-messenger-settings"> -->
<!-- 							<div class="textbox-messenger-area2"> -->
<!-- 								<div class="showup" id="showup01"> -->
<!-- 									<span class="material-symbols-outlined" style="font-size:300%" id="chatsetting-slide01">expand_more</span> -->
<!-- 									<div class="chatsetting-02-subtitle" id="subtitle1">전체 목록</div> -->
<!-- 								</div> -->
<!-- 								<div class="team-people-data"> -->
<!--  								<div class="team-whole-data"> -->
<!-- 									<div class="team-area">영업부</div> -->
<!-- 									<div class="team-name">영업 2팀</div> -->
<!-- 								</div> -->
<!-- 								<div class="bottom-area2"></div> -->
<!-- 								<div class="with-chat-data"> -->
<!-- 									<div class="square" style=""></div> -->
<!-- 									<div class="with-chat-name">구기석</div> -->
<!-- 									<div class="with-chat-grade">부장</div> -->
<!-- 									<input type="checkbox" class="checkbox-square-one" name="withfriend01"> -->
<!-- 								</div> -->
<!-- 								<div class="bottom-area2"></div> -->
<!-- 								<div class="with-chat-data"> -->
<!-- 									<div class="square" style=""></div> -->
<!-- 									<div class="with-chat-name">구기석</div> -->
<!-- 									<div class="with-chat-grade">부장</div> -->
<!-- 									<input type="checkbox" class="checkbox-square-one" name="withfriend01"> -->
<!-- 								</div> -->
<!-- 								<div class="bottom-area2"></div> -->
<!-- 								</div> -->
<!-- 								<div class="with-chat-data"> -->
<!-- 									<div class="square" style=""></div> -->
<!-- 									<div class="with-chat-name">구기석</div> -->
<!-- 									<div class="with-chat-grade">부장</div> -->
<!-- 									<input type="checkbox" class="checkbox-square-one" name="withfriend01"> -->
<!-- 								</div> -->
<!-- 								<div class="bottom-area2"></div> -->
<!-- 							</div> -->
<!-- 							<div class="textbox-messenger-area3"> -->
<!-- 								<div class="showup" id="showup02"> -->
<!-- 									<span class="material-symbols-outlined" style="font-size:50px" id="chatsetting-slide01">expand_more</span> -->
<!-- 									<div class="chatsetting-02-subtitle" id="subtitle1">친구 목록</div> -->
<!-- 								</div> -->
<!-- 								<div class="team-people-data"> -->
<!-- 									<div class="team-whole-data"> -->
<!-- 										<div class="team-area">영업부</div> -->
<!-- 										<div class="team-name">영업 2팀</div> -->
<!-- 									</div> -->
<!-- 									<div class='bottom-area2' id='ba'></div> -->
<!-- 									<div class="with-chat-data"> -->
<!-- 										<div class="square" style=""></div> -->
<!-- 										<div class="with-chat-name">구기석</div> -->
<!-- 										<div class="with-chat-grade">부장</div> -->
<!-- 										<input type="checkbox" class="checkbox-square-one" name="withfriend01"> -->
<!-- 									</div> -->
<!-- 									<div class="bottom-area2"></div> -->
<!-- 									<div class="with-chat-data"> -->
<!-- 										<div class="square" style=""></div> -->
<!-- 										<div class="with-chat-name">구기석</div> -->
<!-- 										<div class="with-chat-grade">부장</div> -->
<!-- 										<input type="checkbox" class="checkbox-square-one" name="withfriend01"> -->
<!-- 									</div> -->
<!-- 									<div class="bottom-area2"></div> -->
<!-- 									<div class="with-chat-data"> -->
<!-- 										<div class="square" style=""></div> -->
<!-- 										<div class="with-chat-name">구기석</div> -->
<!-- 										<div class="with-chat-grade">부장</div> -->
<!-- 										<input type="checkbox" class="checkbox-square-one" name="withfriend01"> -->
<!--  									</div> -->
<!-- 									<div class="bottom-area2"></div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="chatting-button-list01"> -->
<!-- 								<div class="chatbutton01"> -->
<!-- 									<input type="submit" class="btn" value="이전 화면" id="sendprofilelink-leave"> -->
<!-- 								</div> -->
<!-- 								<div class="chatbutton01"> -->
<!-- 									<input type="submit" class="btn" value=" 보내기 " id="sendprofilelink-go"> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="white_display_01"></div> -->
<!-- 						</div> -->
<!-- 					</div> -->
					
					
					
					
					<!-- 연락처->명함 보내기 사이트 -->
					
					<!-- 누구와 대화하시겠습니까? -->
					<div class="text-messenger-send-contactss-page-01" id="text-messenger-send-contactss-page-01" style="display:none">
					
						<div class="title-box" id="who-send-profile-inchatroom">
							<div class="title-text01">명함 전달하기</div>
						</div>

						<div class='bottom-area' id='ba'></div>

						<div id='who-chat'>어느 분의 명함을 전달하시겠어요?</div>

						<!-- 카탈로그, textarea, button -->

						<div class="chatroom-list-space">
							<!-- <div class="chatroom-introduce">대화방 목록</div> -->
							<!-- <div class="textbox-messenger-area1"> -->

							<div class="messenger-category01">
								<select>
									<option>직책</option>
									<option>이름</option>
									<option>팀명</option>
								</select>
							</div>
							<input type="text" name="wantchatdata" id="wantchatdata">
							<input type="submit" class="btn" value="검색">
						</div>


						<!-- 프로필 설정 창, 클래스 바꿔야 -->
						<div class="text-messenger-send-contacts-page-01">
							<div class="textbox-messenger-area2">
								<div class="showup" id="showup01">
									<span class="material-symbols-outlined" style="font-size:300%" id="chatsetting-slide01">expand_more</span>
									<div class="chatsetting-02-subtitle" id="subtitle1">전체 목록</div>
								</div>
								<div class="team-people-data">
 								<div class="team-whole-data">
									<div class="team-area">영업부</div>
									<div class="team-name">영업 2팀</div>
								</div>
								<div class="bottom-area2"></div>
								<div class="with-chat-data">
									<div class="square" style=""></div>
									<div class="with-chat-name">구기석</div>
									<div class="with-chat-grade">부장</div>
									<input type="checkbox" class="checkbox-square-one" name="withfriend01">
								</div>
								<div class="bottom-area2"></div>
								<div class="with-chat-data">
									<div class="square" style=""></div>
									<div class="with-chat-name">구기석</div>
									<div class="with-chat-grade">부장</div>
									<input type="checkbox" class="checkbox-square-one" name="withfriend01">
								</div>
								<div class="bottom-area2"></div>
								</div>
								<div class="with-chat-data">
									<div class="square" style=""></div>
									<div class="with-chat-name">구기석</div>
									<div class="with-chat-grade">부장</div>
									<input type="checkbox" class="checkbox-square-one" name="withfriend01">
								</div>
								<div class="bottom-area2"></div>
							</div>
							<div class="textbox-messenger-area3">
								<div class="showup" id="showup02">
									<span class="material-symbols-outlined" style="font-size:50px" id="chatsetting-slide01">expand_more</span>
									<div class="chatsetting-02-subtitle" id="subtitle1">친구 목록</div>
								</div>
								<div class="team-people-data">
									<div class="team-whole-data">
										<div class="team-area">영업부</div>
										<div class="team-name">영업 2팀</div>
									</div>
									<div class='bottom-area2' id='ba'></div>
									<div class="with-chat-data">
										<div class="square" style=""></div>
										<div class="with-chat-name">구기석</div>
										<div class="with-chat-grade">부장</div>
										<input type="checkbox" class="checkbox-square-one" name="withfriend01">
									</div>
									<div class="bottom-area2"></div>
									<div class="with-chat-data">
										<div class="square" style=""></div>
										<div class="with-chat-name">구기석</div>
										<div class="with-chat-grade">부장</div>
										<input type="checkbox" class="checkbox-square-one" name="withfriend01">
									</div>
									<div class="bottom-area2"></div>
									<div class="with-chat-data">
										<div class="square" style=""></div>
										<div class="with-chat-name">구기석</div>
										<div class="with-chat-grade">부장</div>
										<input type="checkbox" class="checkbox-square-one" name="withfriend01">
 									</div>
									<div class="bottom-area2"></div>
								</div>
							</div>
							<div class="chatting-button-list01">
								<div class="chatbutton01">
									<input type="submit" class="btn" value="이전 화면" id="sendcontactslink-leave">
								</div>
								<div class="chatbutton01">
									<input type="submit" class="btn" value=" 보내기 " id="sendcontactslink-go">
								</div>
							</div>
							<div class="white_display_01"></div>
						</div>
					</div>
					
					<!-- 누구와 대화하시겠습니까? 2 -->
					<div class="text-messenger-send-contactss-page-01" id="text-messenger-send-contactss-page-01" style="display:none">
					
						<div class="title-box" id="who-send-profile-inchatroom">
							<div class="title-text01">명함 전달하기</div>
						</div>

						<div class='bottom-area' id='ba'></div>

						<div id='who-chat'>어느 분의 명함을 전달하시겠어요?</div>

						<!-- 카탈로그, textarea, button -->

						<div class="chatroom-list-space">
							<!-- <div class="chatroom-introduce">대화방 목록</div> -->
							<!-- <div class="textbox-messenger-area1"> -->

							<div class="messenger-category01">
								<select>
									<option>직책</option>
									<option>이름</option>
									<option>팀명</option>
								</select>
							</div>
							<input type="text" name="wantchatdata" id="wantchatdata">
							<input type="submit" class="btn" value="검색">
						</div>


						<!-- 프로필 설정 창, 클래스 바꿔야 -->
						<div class="text-messenger-send-contacts-page-01">
							<div class="textbox-messenger-area2">
								<div class="showup" id="showup01">
									<span class="material-symbols-outlined" style="font-size:300%" id="chatsetting-slide01">expand_more</span>
									<div class="chatsetting-02-subtitle" id="subtitle1">전체 목록</div>
								</div>
								<div class="team-people-data">
 								<div class="team-whole-data">
									<div class="team-area">영업부</div>
									<div class="team-name">영업 2팀</div>
								</div>
								<div class="bottom-area2"></div>
								<div class="with-chat-data">
									<div class="square" style=""></div>
									<div class="with-chat-name">구기석</div>
									<div class="with-chat-grade">부장</div>
									<input type="checkbox" class="checkbox-square-one" name="withfriend01">
								</div>
								<div class="bottom-area2"></div>
								<div class="with-chat-data">
									<div class="square" style=""></div>
									<div class="with-chat-name">구기석</div>
									<div class="with-chat-grade">부장</div>
									<input type="checkbox" class="checkbox-square-one" name="withfriend01">
								</div>
								<div class="bottom-area2"></div>
								</div>
								<div class="with-chat-data">
									<div class="square" style=""></div>
									<div class="with-chat-name">구기석</div>
									<div class="with-chat-grade">부장</div>
									<input type="checkbox" class="checkbox-square-one" name="withfriend01">
								</div>
								<div class="bottom-area2"></div>
							</div>
							<div class="textbox-messenger-area3">
								<div class="showup" id="showup02">
									<span class="material-symbols-outlined" style="font-size:50px" id="chatsetting-slide01">expand_more</span>
									<div class="chatsetting-02-subtitle" id="subtitle1">친구 목록</div>
								</div>
								<div class="team-people-data">
									<div class="team-whole-data">
										<div class="team-area">영업부</div>
										<div class="team-name">영업 2팀</div>
									</div>
									<div class='bottom-area2' id='ba'></div>
									<div class="with-chat-data">
										<div class="square" style=""></div>
										<div class="with-chat-name">구기석</div>
										<div class="with-chat-grade">부장</div>
										<input type="checkbox" class="checkbox-square-one" name="withfriend01">
									</div>
									<div class="bottom-area2"></div>
									<div class="with-chat-data">
										<div class="square" style=""></div>
										<div class="with-chat-name">구기석</div>
										<div class="with-chat-grade">부장</div>
										<input type="checkbox" class="checkbox-square-one" name="withfriend01">
									</div>
									<div class="bottom-area2"></div>
									<div class="with-chat-data">
										<div class="square" style=""></div>
										<div class="with-chat-name">구기석</div>
										<div class="with-chat-grade">부장</div>
										<input type="checkbox" class="checkbox-square-one" name="withfriend01">
 									</div>
									<div class="bottom-area2"></div>
								</div>
							</div>
							<div class="chatting-button-list01">
								<div class="chatbutton01">
									<input type="submit" class="btn" value="이전 화면" id="sendcontactslink-leave">
								</div>
								<div class="chatbutton01">
									<input type="submit" class="btn" value=" 보내기 " id="sendcontactslink-go">
								</div>
							</div>
							<div class="white_display_01"></div>
						</div>
					</div>
					
<!-- 				<h1 id="target">ttttt</h1> -->
					<div class="chatlistnull">아직 생성한 채팅방이 없습니다. 같은 회사원분들끼리 대화해보세요!</div>
<!-- 				<div class="chatroom-test"  -->
<!-- 				style="margin:20%; -->
<!--  				width:80%;   -->
<!--  				height:20%;   -->
<!-- 				background-color: #ff0000;  -->
<!-- 				border:1px solid #ff0000;"> -->
<!-- 				</div> -->

<!-- 				<div class="chatroom-list-two-to-two"> -->
<!-- 					<div class="with-chat-subroomname2"></div> -->
<!-- 					<div class="chat-others-profile01"></div> -->
<!-- 					<div class="chatroom-alarm-content"></div> -->
<!-- 				</div> -->
<!-- 				<div class="chatroom-alarm-content"></div> -->
				</main>
				
				


		</body>

		<!-- 메신저 창 띄우기 -->
		<script type="text/javascript">
			const messenger = document.getElementById('messenger-whole');
			const messengericon = document.getElementById('msg'); <!-- 메신저 표시  -->
			const chatroomAlls = document.querySelectorAll(".chatting-room");
			//const chatListAll = document.querySelectorAll(".chatroom-list-box-ajax");
			
			//먼저 채팅리스트박스 선언
			const chatlistnode = document.querySelector('.chatroom-list-box');
			const chatlistnodes = document.querySelectorAll('.chatroom-list-box');
			
			//채팅검색박스
			const chatlistsearch = document.querySelector('.chatroomlist-first-page>.chatroom-list-space');
			
			//테이블 복사해서 다른데다 옮기기 1158
			//노드 복사
			var copy_chat_list_box = chatlistnode.cloneNode(true);
			
			//테이블 없애기
			//$(chatlistnode).remove();
			
			//채팅방 전부 선언
			const chatListAll = document.querySelectorAll(".chatroom-list-two-to-two");
			
			messengericon.onclick = function loadchatlist() {
				
				
				
				//전체화면 토글
				$('.messenger-whole').toggle();
				
				
				$('.chatroomlist-first-page').show();
				$(chatroomAlls).hide();
				$('.chatroom-list-box-ajax').hide();
				$.ajax({
					url:"/sixman/getchatroomList",
					contentType : "application/json; charset=UTF-8",
// 					method:"get",
// 					data : {
						
// 					}
					success:function(data){
// 						alert("성공");
// 						method:"post"
// 						alert('${a_chatroomlist}');
// 						$('.chatroomlist-first-page').on('load', function(){$('.chatroomlist-first-page').show();});
// 						$('.chatroomlist-first-page').load(window.location.href + '.chatroomlist-first-page');
// 						$(chatListAll).show();
// 						lastreadchat_d();
						
						
// 						$(chatListAll).show();
						
// 						var chatlist = JSON.stringify(${a_chatroomlist});
						
// 						$.each(data, function(key, value){
// 							alert('key : ' +key, 'value = ' + value);
// 						});
						var chatlist = JSON.parse(JSON.stringify(data));
						var chatlistCnt = Object.keys(chatlist).length;

						alert("개수 : " + chatlistCnt); // 개수

// 						alert(chatlist);
						console.log(chatlist);
						
						//잘새겨듣자
// 						const target = document.querySelector("#target");
// 						target.innerText = chatlist[0].chatcontent;
// 						target.innerText = "1";
						
						//만약 없어서 null로 나온다면? 바로 대체문구 삽입

						//채팅리스트상자 맨위 클래스
						//const target_chat = document.querySelector('.chatroom-list-box');
						
						//첫 json객체 널일 경우
						const target_chat = document.querySelector(".chatlistnull");
						$(".chatlistnull").show();
// 						//$('.chatroom-list-two-to-two').hide;
// 						alert(chatlistCnt + ": 최종확인");
						if (chatlistCnt == 0) {
// 							target_chat.innerText("아직 생성한 채팅방이 없습니다. 같은 회사원분들끼리 대화해보세요!");
							//배열 널일 경우 확인
							alert(chatlistCnt + ": 최종확인");
							//기타 테이블 없애기
							//$(chatlistsearch).remove();

// 							target_chat.innerText = "아직 생성한 채팅방이 없습니다. 같은 회사원분들끼리 대화해보세요!";
						}else{
// 							//텍스트 지우기
							$(target_chat).hide();

								//상자들
								
// 								const target1 = document.querySelector(".square-first");
// 								const target2 = document.querySelector(".with-chat-subroomname2");
// 								// const target3 = document.querySelector(".with-chat-name01");
// 								// const target4 = document.querySelector(".with-chat-grade01");
// 								const target5 = document.querySelector(".chatroom-alarm-content");
// 								const target6 = document.querySelector(".chatroom-alarm-time");
								
// 								$('.with-chat-data02').hide();
								//교체
								// $(target2)[0].innerText = chatlist[0].chatroomName;
								// $(target5)[0].innerText = chatlist[0].chatcontent;
								// $(target6)[0].innerText = chatlist[0].lastsendTime;

								// $(target2)[0].innerText = chatlist[0].chatroomName;
								// $(target5)[0].innerText = chatlist[0].chatcontent;
								// $(target6)[0].innerText = chatlist[0].lastsendTime;
								
								//$('.with-chat-data02').show(); // 더미데이터 이용

								//노드 복제
								
									
									
									// //복사
									// const newchatlistn = chatlistnode.cloneNode(true);
									// // //붙여넣기
									// chatlistnode.after(newchatlistn);
									chatlist.forEach(element => {
										console.log("content :" + element.chatcontent);
										console.log("roomname :" + element.chatroomName); 
										console.log("lastsendTime :" + element.lastsendTime);  
									});
									
									const chat_l_val_one = document.querySelectorAll(".square-first"); // later
									const chat_l_val_two = document.querySelectorAll(".with-chat-subroomname2");
									const chat_l_val_three = document.querySelectorAll(".chatroom-alarm-content");
									const chat_l_val_four = document.querySelectorAll(".chatroom-alarm-time");
									
									for(let i = 0; i < chatlist.length; i++){
										
										
										
										//요소추가
										const element = chatlist[i];	
										$(chat_l_val_two)[i].innerText = chatlist[i].chatroomName;
										$(chat_l_val_three)[i].innerText = chatlist[i].chatcontent;
										$(chat_l_val_four)[i].innerText = chatlist[i].lastsendTime;
										
// 										//테이블 chatlist-big안에 붙여넣기하고, 왜 못하지?
// 										$(".chatlist-big").append($(copy_chat_list_box));
										
// 										chatlist.forEach(element => {
// 											$(chatlistnode).remove();
// 										});
									}

									//첫번째 div 수정
									
// 									for(let i=1;i<index;i++){
// 									if(){
// 											//노드 복사
// 											const copy_chat_list_box = chatlistnodes[0].cloneNode(true);
// 											//노드 붙여넣기
// 											chatlistnodes[0].after(copy_chat_list_box);
// 											//값 수정
// 											$(chat_l_val_two)[1].innerText = chatlist[1].chatroomName;
// 											$(chat_l_val_three)[1].innerText = chatlist[1].chatcontent;
// 											$(chat_l_val_four)[1].innerText = chatlist[1].lastsendTime;
// 	// 									}
// 									}
									//index 1 ~ chatlistCnt까지 테이블 복제하고 수정
// 									nodeClone();
									
									
									
										alert('준비?');
// 										for (let index = 0; index < chatlistCnt; index++) {
// 											const element = index;
// 											alert("count : "+element)
// 											if( index < chatlistCnt ){
// 											//복사
// 											const newchatlistn = chatlistnode.cloneNode(true);
// 											// //붙여넣기
// 											chatlistnode.after(newchatlistn);
// 											element[index].show();
// 											}
// 										}
									

									
									
			// 						console.log($('a_chatroomlist').chatroomName);
			// 						$("c:forEach items="${a_chatroomlist}" var="chatroom">").replaceAll(c:forEach items=chatlist var="chatroom">);
									
			// 						$.each(chatlist), function(key, value){
			// 							console.log(key + ':' + value);
			// 						};
							}
						
					}, error:function(){
						alert("메세지 로딩에 실패했습니다.. 잠시 후에 다시 이용해주세요");
					}
				});
				$(chatListAll).show();
			}
			
// 			function lastreadchat_d(){
// 				$.ajax({
// 					url:"/sixman/readchatroomList",
// 					success: function() {
// // 						alert(chatListAll);
// // 						$('.chatroom-list-box-ajax').show();
// // 						$(chatListAll).show();
						
// // 						const chatListbig = document.getElementById('chatlist-big');
// // 						chatListbig.remove();
						
// // 						$('.chatroom-list-space').after('<div id="chatlist-big">ㅇㅇ</div>');
// 						$(chatroomAlls).hide();
// 						$('.chatroom-list-box-ajax').show();
// // 						alert('연결');
// // 						alert('안녕'+'${a_chatroomlist}');
						
// 					}, error: function(){
// 						alert('에러');
// 					}
// 				})
// 			}

			
			
			<!-- 채팅방 목록 화면에서 채팅방 생성 화면으로.. -->
			
			//생성 버튼
			const qwe = document.querySelector('#qwe');
			
			//불러오기 밑밥 깔기 - queryselectorall은 맨 위에 것만 가져옴
			const want_all_chat_img_one = document.querySelectorAll(".want_all_chat_img");

			const want_all_chat_deptName_one = document.querySelectorAll(".want_all_chat_deptName");
			const want_all_chat_teamName_one = document.querySelectorAll(".want_all_chat_teamName");
			const want_all_chat_people_name = document.querySelectorAll(".want_all_chat_people_name");
			const want_all_chat_position_one = document.querySelectorAll(".want_all_chat_position");

			const want_all_chat_profileNo_one = document.querySelectorAll(".want_all_chat_profileNo");
			

// 			qwe.onclick = function () {
			qwe.onclick = function qwe_chat_onclick() {
// 				alert('ㅇㅇ');
				$('.chatroomlist-first-page').hide();
				$(chatroomAlls).hide();
				$('.chatlistnull').hide();
// 				function 
			$.ajax({
// 				url:"http://127.0.0.1:8888/sixman/chat/chatwantfirst",
				url:"/sixman/chatwantfirst",
// 				type:"POST" ,
				success:function(data){
					$('.whochat-page-first').show();
					$('.chatting-room').hide;
					
					const chatwantlist = JSON.parse(JSON.stringify(data));
// 					location.reload(true);
// 					$('messenger-whole').show();
					console.log(chatwantlist);
					
					alert("확인");

					const wantchating_one = chatwantlist[0].profileName;


					alert(wantchating_one);
					//document.getElementsByClassName("want_all_chat_profileNo").value=
					

					//document.getElementsByClassName("want_all_chat_img").src="/sixman/resources/img/profile/wantchatimg_one/";

					//document.getElementsByClassName().src="/sixman/resources/img/profile/wantchatimg_one/chatwantlist[0].profileName";

					$(want_all_chat_deptName_one)[0].innerText = chatwantlist[0].deptName;
					$(want_all_chat_teamName_one)[0].innerText = chatwantlist[0].teamName;
					$(want_all_chat_people_name)[0].innerText = chatwantlist[0].name;
					$(want_all_chat_position_one)[0].innerText = chatwantlist[0].position;

					//const alarm = document.getElementsBytagName('input').item('want_all_chat_profileNo',0).value;

					const alarm11 = chatwantlist[0].profileNo;
					alert(alarm11);

					//멤버 넘버 가져오기
					document.getElementById('want_all_chat_profileNo').value= chatwantlist[0].profileNo;
					//alert(alarm2);
					










					//img src
					//$(want_all_chat_deptName_one)[0].getElementsByTagName("img").setattri

					//input type.value

// 					forEach() =>{
						
// 					};
					
				},
				error:function(){
						alert("연결x");
					}
				});
// 				$('.whochat-page-first').on('load', function(){$('.whochat-page-first').show();});
// 				$('.whochat-page-first').load(window.location.href + '.whochat-page-first');
			}
			
			
			<!-- 채팅방 생성 중 친구초대 화면에서 이전화면 -->
			const makingroom_first_leave = document.getElementById('makingroom-first-leave');
			makingroom_first_leave.onclick = function () {
				$('.whochat-page-first').hide();
				$('#qwe').show();
				$('.chatroomlist-first-page').show();
				
				


			}

			<!-- 채팅방 생성 중 친구초대 화면에서 채팅방 이름 생성 화면으로 -->
			const first_making_next = document.getElementById('makingroom-first-next');
			first_making_next.onclick = function () {


				$('.define-chatroomname').show();
				$('.whochat-page-first').hide();
			}
			
			
			
			
			
			
			
			
			<!-- 채팅방 생성 중 이름 조정 화면에서 이전화면 -->
			const second_makingchat_leave = document.getElementById('makingchatroom-second-leave');
			second_makingchat_leave.onclick = function () {
 				$('.define-chatroomname').hide();
 				$('.whochat-page-first').show();
			}
			
			<!-- 채팅방 생성 중 이름 조정 화면에서 채팅방 목록 화면으로..  -->
			const second_makingchat_go = document.getElementById('makingchatroom-second-go');
			$('#makingchatroom-second-go').click(function() {
// 				alert('ㅇㅇ');
				const wantchat1 = $('input[name="withfriend01"]:checked').val();
// 				alert(wantchat1);
				const wantchat2 = $('.define-roomname').val();
// 				alert(wantchat2);
				$('.chatroomlist-first-page').hide();
				
				$.ajax({
					url:"/sixman/chatwantfirst2",
					type:"POST",
					data: {
						memberNo : wantchat1,
						name : wantchat2
					},
					success:function(x){
// 						alert("연결o");
					},
					error:function(){
						alert("연결x");
					}
				});
				$('.define-chatroomname').hide();
				if(chatListAll==null){
					$('.chatroomlist-first-page').show();
				}
				
// 				$('.chatroomlist-first-page').load(location.href + '.chatroomlist-first-page');
			});
// 				

				
// 			function change() {
// 				document.getElementById("qwe").setAttribute("onClick", "change1()");
// 			}

// 			function change1() {
// 				alert("changed");
// 			}
			<!-- 채팅방 목록 화면에서 채팅 화면으로 진입-->
			
			//인덱스 배열
			//const chatListAll = document.querySelectorAll(".chatroom-list-two-to-two");

			const chatRoomAll = document.querySelectorAll(".chatting-room");
// // 			const chatListAllIndex = document.querySelectorAll(".with-chat-subroomname2").index;
// // 			const chatRoomAllIndex = document.querySelectorAll(".chatting-room").index();
 			const chatListAllIndex = chatListAll.length;
 			
 			const chatRoomOne = document.querySelectorAll('.chatting-room-first');
 			

 			
			var chat_num=0;
			
			chatListAll.forEach((count, index) => {
				count.onclick = function () {
					$.ajax({
						url : "/sixman/chatroom",
						data : {chatRoomIndex : index
						},
						success : function(){
// 							alert("채팅룸받아오는거성공");
							alert(index);
							//$('.chatroomlist-first-page').hide();
							//$('.chatting-room').show();
							$('.chatroomlist-first-page').hide();
							$(chatRoomOne).hide();
							//chatroomAlls
							$(chatroomAlls[index]).show();
							$(chatRoomOne[index]).show();
							//if())
// 							$.ajax({
// 									url:"/sixman/chatroom",
// 									success : function (){
// 										alert('success');
// 									}, error:function(){
// 										alert('error');
// 									}
// 								});
						}, error : function(){
							alert("채팅룸받아오는거실패");
						}
					});
					
				
					
				}
			});
			

// 			chatListAll[0].onclick = function () {
// 				var chatrn = $(this).index();
// 				$('.chatroomlist-first-page').hide();
// 				$(chatRoomAll[0]).show();
// 				var indexchatr = $(this).index();
// 			 } 	
			
// 			chatListAll[1].onclick = function () {
// 				$('.chatroomlist-first-page').hide();
// 			 	$(chatRoomAll[1]).show();
// 			 	var indexchatr = $(this).index();
// 			 } 

			
			
			
			
			
			
// 			$(".with-chat-subroomname2").click(function(event){
// 				var i = $(this).index();
// 				alert(i);
				
// 				var j = $("#chatroom-list-two-to-two").index(this);
// 				alert(j);
// 			});
			
// 			var test = document.querySelectorAll(".with-chat-subroomname2");
			
// 			function testFunc() {
// 				var i;
// 				for (i=0; i<test.length; i++) {
// 					test[i].alert(this(index));
// 				}
// 			}
			
			
			

			
			
			
			<!-- 채팅방 -->
			
			<!--채팅방 나가기 버튼 인덱스-->
			const out_icons_of_chattingroom = document.querySelectorAll('#chatroom-1-2-icon');
			
			
			<!-- 채팅방에서 나가기-->
// 			const out_of_chattingroom = document.getElementById('chatroom-1-2-icon');
			out_icons_of_chattingroom[0].onclick = function () {
  				$('.chatting-room').hide();
  				$('.chatroomlist-first-page').show();
  				
  				
			}
			out_icons_of_chattingroom[1].onclick = function () {
  				$('.chatting-room').hide();
  				$('.chatroomlist-first-page').show();
			}
			
			<!-- 채팅방 메뉴 인덱스 -->
			const chattingroom_menubar_icons_all = document.querySelectorAll('#chatroom-1-3-1');
			const chattingroom_menubar_icons_1 = document.querySelectorAll('.chatroom-one-to-three-2');
			
			<!-- 채팅방 메뉴 누르기-->

			chattingroom_menubar_icons_all[0].onclick = function() {
 				$(chattingroom_menubar_icons_1[0]).show();
			}
			chattingroom_menubar_icons_all[1].onclick = function() {
 				$(chattingroom_menubar_icons_1[1]).show();
			}
			
// // 			const chattingroom_menubar = document.getElementById('chatroom-1-3-1');
// 			$(chattingroom_menubar_icons_all[0]).click = function() {
// //  				$('.chatroom-one-to-three-2').show();
//  				alert('1');
// 			}
			
// 			<!-- 메뉴바 - 다른 곳에 누르면 없애기 : 실패-->
// 			const chattingroom_touch_another_menubar = function () {
//  				$('.chatroom-one-to-three-2').show();
// 			}

// 			$('document').click(function(e){
// 				if($(e.target).parents('.chatroom-one-to-three-2').length>1 && $(e.target).parents('.chatroom-one-to-three-2').length<1){
// 					alert('merrong');
// 				}
// 			});
			
			<!-- 메뉴바 없애기 -->
			
// 			const out_of_chattingroom_menubar = document.getElementById('chatroom-4-1-icon3');
			const out_of_chattingroom_menubar = document.querySelectorAll('#chatroom-4-1-icon3');
			out_of_chattingroom_menubar[0].onclick = function() {
 				$('.chatroom-one-to-three-2').hide();
			}
			
			out_of_chattingroom_menubar[1].onclick = function() {
 				$('.chatroom-one-to-three-2').hide();
			}
			
			
			
			<!-- 회원 상세 정보 페이지(프로필) 이동-->
			
// 			const show_chattingroom_setting = document.getElementById('chatroom-1-3-icon');
// 			show_chattingroom_setting.onclick = function () {
//  				$('.chatting-room').hide();
//  				$('.chatroom-setting').show();
// 			}
			
// 			const chat_person_profile = document.getElementById('chatroom-square02');
			const chat_person_profile = document.querySelectorAll('.chatroom-square');
			const chat_person_profile_sites = document.querySelectorAll('.chat-profile-site');
			chat_person_profile[0].onclick = function () {
//  				alert('33');
  				$('.chatting-room').hide();
  				$(chat_person_profile_sites[0]).show();
			}
			chat_person_profile[1].onclick = function () {
//				alert('33');
				$('.chatting-room').hide();
				$(chat_person_profile_sites[1]).show();
		}
			
			<!-- 프로필 화면에서 나가기 -->
// 			const out_of_chattingroom_profile = document.getElementById('chatroom-setting-icon-2');
			const out_of_chattingroom_profile = document.querySelectorAll('#chatroom-setting-icon-2');
			out_of_chattingroom_profile[0].onclick = function () {
//  				alert('33');
   				$('.chat-profile-site').hide();
   				$(chatRoomAll[0]).show(); // 이전 채팅방 관련 queryselectorall 관련 구문 가져옴
			}
			out_of_chattingroom_profile[1].onclick = function () {
//				alert('33');
				$('.chat-profile-site').hide();
				$(chatRoomAll[1]).show();
			}
			
			<!-- 채팅방 설정창-->
			
			<!-- 채팅방 설정 인덱스-->
			const show_chattingroom_setting_icons = document.querySelectorAll('#chatroom-1-3-icon');
			const show_chattingroom_setting_page = document.querySelectorAll('.chatroom-setting');
			
			show_chattingroom_setting_icons[0].onclick = function () {
				$(chatRoomAll[0]).hide();
 				$(show_chattingroom_setting_page[0]).show();
			}
			
			show_chattingroom_setting_icons[1].onclick = function () {
				$(chatRoomAll[1]).hide();
 				$(show_chattingroom_setting_page[1]).show();
			}
			
			
			
			<!-- 채팅방 설정창에서 채팅방으로 돌아오기 -->
			
			
			<!-- 설정 저장 -->
// 			const save_chattingroom_setting = document.getElementById('chatroom-setting-out');
			const save_chattingroom_setting = document.querySelectorAll('#chatroom-setting-out');
			const chat_roomsetting_n=save_chattingroom_setting.length;
			
			save_chattingroom_setting[0].onclick = function () {
// 				alert('33');
  				$('.chatroom-setting').hide();
  				$(chatRoomAll[0]).show();
			}
			save_chattingroom_setting[1].onclick = function () {
// 				alert('33');
  				$('.chatroom-setting').hide();
  				$(chatRoomAll[1]).show();
			}

			<!-- 나가기 -->
// 			const out_of_chattingroom_setting = document.getElementById('chatroom-setting-icon-1');

			const out_of_chattingroom_setting = document.querySelectorAll('#chatroom-setting-icon-1');
			const exit_chatroom_settings = out_of_chattingroom_setting.length;
			
			out_of_chattingroom_setting[0].onclick = function () {
//  				alert('33');
  				$('.chatroom-setting').hide();
  				$(chatRoomAll[0]).show();
			}
			
			out_of_chattingroom_setting[1].onclick = function () {
//  				alert('33');
  				$('.chatroom-setting').hide();
  				$(chatRoomAll[1]).show();
			}
			




			<!-- 메뉴바 명함보내기 버튼 -->
			const chat_send_tagname = document.querySelectorAll('#chatroom-4-1-icon1');
			const chat_send_tagnames_page = document.querySelectorAll('.text-messenger-send-contactss-page-01');
// 			text-messenger-send-contactss-page-01
			chat_send_tagname[0].onclick = function() {
// 				var idx = $('#chatroom-4-1-icon1').index(this);
				alert('2');
				$(".chatting-room").hide();
				$("#text-messenger-send-contactss-page-01").show();
			}
			
// 			chat_send_tagname[1].click(function(){
// 				$(".chatting-room").hide();
// 				$("#text-messenger-send-contactss-page-01").show();
// 			})

// // <!-- 메뉴바 봐서 결정 - 해야할듯-->
// // 			chat_send_tagname[0].onclick() = function(){
// // 				alert('1');
// // 				$(".chatting-room").hide();
// // 				$("#text-messenger-send-contactss-page-01").show();
// // 			}
// // 			chat_send_tagname[1].onclick() = function(){
// // 				$(".chatting-room").hide();
// // 				$("#text-messenger-send-contactss-page-01").show();
// // 			}
			
			
			
			
// // 			명함보내기-이전화면, 이후화면
// // 			const chat_not_send_tagname = document.querySelectorAll('#chatroom-4-1-icon1');
// // 			chat_not_send_tagname[0].click(function(){
// // 				alert('dd');
// // 				$(".text-messenger-send-profile-page-01").hide();
// // 				$(".chatting-room").show();
// // 				$('.chatroom-one-to-three-2').hide();
// // 			})
			
			
			
// // 			$('#sendprofilelink-leave').click(function(){
// // // 				alert('dd');
// // 				$(".text-messenger-send-profile-page-01").hide();
// // 				$(".chatting-room").show();
// // 				$('.chatroom-one-to-three-2').hide();
// // 			})
// // 			$('#sendprofilelink-go').click(function(){
// // // 				alert('dd');
// // 				$(".text-messenger-send-profile-page-01").hide();
// // 				$(".chatting-room").show();
// // 				$('.chatroom-one-to-three-2').hide();
// // 			})
			
// // 			"text-messenger-send-contacts-page-01"

// 			<!-- 명함보내기 이전 버튼-->
// // 			$('#sendcontactslink-leave').click(function(){
// // // 				alert('dd');
// // 				$("#text-messenger-send-contactss-page-01").hide();
// // 				$(".chatting-room").show();
// // 				$('.chatroom-one-to-three-2').hide();
// // 			})

// 			$('#sendcontactslink-leave').click(function(){
// // 				alert('dd');
// 				$("#text-messenger-send-contactss-page-01").hide();
// 				$(".chatting-room").show();
// 				$('.chatroom-one-to-three-2').hide();
// 			})
			
			
// 			<!-- 명함보내기 보내기 버튼-->
// // 			$('#sendcontactslink-go').click(function(){
// // // 				alert('dd');
// // 				$("#text-messenger-send-contactss-page-01").hide();
// // 				$(".chatting-room").show();
// // 				$('.chatroom-one-to-three-2').hide();
// // 			})

// 			$('#sendcontactslink-go').click(function(){
// // 				alert('dd');
// 				$("#text-messenger-send-contactss-page-01").hide();
// 				$(".chatting-room").show();
// 				$('.chatroom-one-to-three-2').hide();
// 			})
			
			<!--대화창목록 삭제-->
			const delete_chatroom = document.querySelectorAll('#chatroom-exit-icon');
			const delete_chatroom_page = document.querySelectorAll("#with-chat-data01-1");
			delete_chatroom[0].onclick=function() {
 				$("#with-chat-data01").hide();
 				$(delete_chatroom_page[0]).show();
// 				$('.chatroom-one-to-three-2').hide();
			}
			
			delete_chatroom[1].onclick=function(){
 				$("#with-chat-data01").hide();
 				$(delete_chatroom_page[1]).show();
// 				$('.chatroom-one-to-three-2').hide();
			}
			
			const delete_chatroom_page_button1 = document.querySelectorAll('#deletechatroom-ok');			
			delete_chatroom_page_button1[0].click(function(){
 				$("#with-chat-data01-1").hide();
 				$(delete_chatroom_page_button1)[0].show();
// 				$('.chatroom-one-to-three-2').hide();
			})
			delete_chatroom_page_button1[1].click(function(){
 				$("#with-chat-data01-1").hide();
 				$(delete_chatroom_page_button1)[1].show();
// 				$('.chatroom-one-to-three-2').hide();
			})
			
			
			/* 	$('#deletechatroom-no').onclick(function(){
	//  				$(".with-chat-data01").hide();
	//  				$(".with-chat-data01-1").show();
					$("#with-chat-data01-1").hide();
	 				$("#with-chat-data01").show();
	// 				$('.chatroom-one-to-three-2').hide();
				});
	 */
// 			<!-- ajax -->
			
// 			$.ajax({
				
				
// 			});
			
			
			
			</script>
			
			

		</html>