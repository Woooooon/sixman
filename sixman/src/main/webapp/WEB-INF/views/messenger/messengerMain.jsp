<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
					<div class="chatroomlist-first-page" id="chatroomlist-first-page">
						<div class="title-box">
							<div class="title-text01">사내 대화방</div>
							<button type="button" class="material-symbols-outlined" id="qwe" >add_circle</button>
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
						<div class="chatlist-big">
							<div class="chatroom-list-box">
								
								<div class="with-chat-data01">
									<div class="square-first" style=""></div>
									<div class="chatroom-list-two-to-two" id="chatroom-list-two-to-two">
										<div class="with-chat-subroomname2">야 지금 뭐해?</div>
										<div class="chat-others-profile01">
											<div class="with-chat-name01">정인제</div>
											<div class="with-chat-grade01">과장</div>
										</div>
										<div class="chatroom-alarm-content">님께서 첨부파일을 보내셨습니다.</div>
										<br>
										<div class="chatroom-alarm-content">오후 2:12</div>
									</div>
									<div class="chatroom-exit-button">
										<span class="material-symbols-outlined" id="chatroom-exit-icon">exit_to_app</span>
									</div>
									
								</div>
								<div class="with-chat-data01-1" style="display:none;">
	<!-- 								<div class="square-first" style=""></div> -->
										<div class="width-chat-subroomname2-1">해당 대화창을 삭제하시겠습니까?</div>
										<div class="button-list-chatroom-delete">
											<button type="button" class="btn" id="deletechatroom-ok">예</button>
											<button type="button" class="btn" id="deletechatroom-no">아니오</button>
										</div>
										
								</div>
							</div>
							<div class="chatroom-list-box">
								
								<div class="with-chat-data01">
									<div class="square-first" style=""></div>
									<div class="chatroom-list-two-to-two" id="chatroom-list-two-to-two">
										<div class="with-chat-subroomname2">야 지금 뭐해?</div>
										<div class="chat-others-profile01">
											<div class="with-chat-name01">구기석</div>
											<div class="with-chat-grade01">부장</div>
										</div>
										<div class="chatroom-alarm-content">님께서 첨부파일을 보내셨습니다.</div>
										<br>
										<div class="chatroom-alarm-content">오후 2:12</div>
									</div>
									<div class="chatroom-exit-button">
										<span class="material-symbols-outlined" id="chatroom-exit-icon">exit_to_app</span>
									</div>
									
								</div>
								<div class="with-chat-data01-1" style="display:none;">
	<!-- 								<div class="square-first" style=""></div> -->
										<div class="width-chat-subroomname2-1">해당 대화창을 삭제하시겠습니까?</div>
										<div class="button-list-chatroom-delete">
											<button type="button" class="btn" id="deletechatroom-ok">예</button>
											<button type="button" class="btn" id="deletechatroom-no">아니오</button>
										</div>
										
								</div>
								
							</div>
						</div>
								
							</div>
							
							
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
							<input type="text" name="wantchatdata" id="wantchatdata">
							<input type="submit" class="btn" value="검색">
						</div>


						<div class="text-messenger-settings">
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
	
	
	
	
						<input type="text" name="wantchatdata" class="define-roomname">
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
							<div class="chatting-room-first">
								<div class="chatroom-one-to-one">
									<div class="chatroom-square"></div>
									<div class="chatroom-box1-1-profile-data">
										<div class="chatroom1-1-1text">영업부 영업4팀</div>
										<div class="chatroom1-1-2text">
											<div class="chatroom1-1-2text-1-1">정인제</div>
											<div>과장</div>
										</div>
									</div>
									<div class="material-symbols-outlined" id="chatroom-1-2-icon">chevron_right</div>
									<span class="material-symbols-outlined" id="chatroom-1-3-icon">settings</span>
								</div>
							
							
							</div>
						
						
						<div class="chatroom-one-to-two">
							<div class="chatroom-one-to-three-2"  style="display:none">
								<div class="chatroom-4-1-box" style="margin-left:4%; margin-right:4%;">	
									<span class="material-symbols-outlined" id="chatroom-4-1-icon1">contacts</span>
									<div class="chatroom-menubar-text-green"">명함 보내기</div>
								</div>
								<div class="chatroom-4-1-box" style="margin-left:4%; margin-right:4%;">
									<span class="material-symbols-outlined" id="chatroom-4-1-icon2">upload</span>
									<div class="chatroom-menubar-text-green">첨부파일</div>
								</div>
								<div class="chatroom-4-1-box" style="margin-left:4%; margin-right:4%;">
									<span class="material-symbols-outlined" id="chatroom-4-1-icon3">exit_to_app</span>
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
									<span class="material-symbols-outlined" id="chatroom-4-1-icon1">contacts</span>
									<div class="chatroom-menubar-text-green"">명함 보내기</div>
								</div>
								<div class="chatroom-4-1-box" style="margin-left:4%; margin-right:4%;">
									<span class="material-symbols-outlined" id="chatroom-4-1-icon2">upload</span>
									<div class="chatroom-menubar-text-green">첨부파일</div>
								</div>
								<div class="chatroom-4-1-box" style="margin-left:4%; margin-right:4%;">
									<span class="material-symbols-outlined" id="chatroom-4-1-icon3">exit_to_app</span>
									<div class="chatroom-menubar-text-green">취소하기</div>
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
					
				</main>


		</body>

		<!-- 메신저 창 띄우기 -->
		<script type="text/javascript">
			const messenger = document.getElementById('messenger-whole');
			const messengericon = document.getElementById('msg'); <!-- 메신저 표시  -->

			messengericon.onclick = function () {
				$('.messenger-whole').toggle();
			}

		<!--
		if ($('.messenger-whole').css("display") == "none") {
				$('.messenger-whole').show();
			} else {
				$('.messenger-whole').hide();
			}
			-->

<!--
if (messenger.style.display == 'none') {
				messenger.style.display = 'block';
			} else {
				messenger.style.display = 'none';
			}
			-->

<!--
				messengericon.onclick = function() {
					if ($('.messenger-whole').css("display") == "none") {
						$('.messenger-whole').show();
					} else {
						$('.messenger-whole').hide();
					}
				}

			-->
			<!-- 채팅방 목록 화면에서 채팅방 생성 화면으로.. -->
			const qwe = document.querySelector('#qwe');

			qwe.onclick = function () {
// 				alert('ㅇㅇ');
				$('.chatroomlist-first-page').hide();
				$('.whochat-page-first').show();
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
			second_makingchat_go.onclick = function () {
// 				alert('ㅇㅇ');
				$('.define-chatroomname').hide();
				$('.chatroomlist-first-page').show();
			}

				
// 			function change() {
// 				document.getElementById("qwe").setAttribute("onClick", "change1()");
// 			}

// 			function change1() {
// 				alert("changed");
// 			}
			<!-- 채팅방 목록 화면에서 채팅 화면으로 진입-->
// 			const chatlist_to_chattingroom = document.getElementById('chatroom-list-two-to-two');
// 			chatlist_to_chattingroom.onclick = function () {
// 				$('.chatroomlist-first-page').hide();
// 			 	$('.chatting-room').show();
// 			 }

			//인덱스 배열
			const chatListAll = document.querySelectorAll("#chatroom-list-two-to-two");
			const chatRoomAll = document.querySelectorAll(".chatting-room");
// // 			const chatListAllIndex = document.querySelectorAll(".with-chat-subroomname2").index;
// // 			const chatRoomAllIndex = document.querySelectorAll(".chatting-room").index();
 			const chatListAllIndex = chatListAll.length;
 			
 			
// 			const chatlist_to_chattingroom = document.getElementById('chatroom-list-two-to-two');
// 			chatlist_to_chattingroom.onclick = function () {
// // 		 		var chatrn = $(this).index();
// // 		 		alert(chartrn);
// 				$('.chatroomlist-first-page').hide();
// 			 	$('.chatting-room').show();
// 			 }
 			
 			
// 			var chatrn=0;
			
			
			chatListAll[0].onclick = function () {
				var chatrn = $(this).index();
				$('.chatroomlist-first-page').hide();
				$(chatRoomAll[0]).show();
				
				alert(chatListAllIndex);
// 				var indexchatr = $(this).index();
// 				alert(indexchatr);

			 } 	
			
			chatListAll[1].onclick = function () {
				$('.chatroomlist-first-page').hide();
			 	$(chatRoomAll[1]).show();
			 	alert(chatListAllIndex);
// 			 	var indexchatr = $(this).index();
// 				alert(indexchatr);
			 } 
			
// 			for(int i=0; i<chatListAllIndex; i++){
// 				chatListAll[i].onclick = function () {
// 					$('.chatroomlist-first-page').hide();
// 					$(chatRoomAll[i]).show();
// 				 } 	
// 			}






// 			${'.with-chat-subroomname2'}.onclick = function () {
// //  				var chatrn = $(this).index();
// 				${'.chatroomlist-first-page'}.hide();
// 				${'.chatting-room'}.show();
// //  				alert(chatListAllIndex);
// //  				var indexchatr = $(this).index();
// //  				alert(indexchatr);
//  			 } 	
			
			
			
			
			
			
			
			
			
			
			
			

			
			
			
// 			${".with-chat-subroomname2"}.click(function(){
				
// 			})
			

			
			
			
			
			
			
			
			

			
			
			
			<!-- 채팅방 -->
			
			
			
			<!-- 채팅방에서 나가기-->
			const out_of_chattingroom = document.getElementById('chatroom-1-2-icon');
			out_of_chattingroom.onclick = function () {
 				$('.chatting-room').hide();
 				$('.chatroomlist-first-page').show();
			}
			
			<!-- 채팅방 메뉴 누르기-->
			const chattingroom_menubar = document.getElementById('chatroom-1-3-1');
			chattingroom_menubar.onclick = function() {
 				$('.chatroom-one-to-three-2').show();
 				
			}
			
			<!-- 메뉴바 - 다른 곳에 누르면 없애기 : 실패-->
// 			const chattingroom_touch_another_menubar = function () {
//  				$('.chatroom-one-to-three-2').show();
// 			}

			$('document').click(function(e){
				if($(e.target).parents('.chatroom-one-to-three-2').length>1 && $(e.target).parents('.chatroom-one-to-three-2').length<1){
					alert('merrong');
				}
			});
			
			
			const out_of_chattingroom_menubar = document.getElementById('chatroom-4-1-icon3');
			out_of_chattingroom_menubar.onclick = function() {
 				$('.chatroom-one-to-three-2').hide();
 				
			}
			<!-- 회원 상세 정보 페이지 이동-->
			
// 			const show_chattingroom_setting = document.getElementById('chatroom-1-3-icon');
// 			show_chattingroom_setting.onclick = function () {
//  				$('.chatting-room').hide();
//  				$('.chatroom-setting').show();
// 			}
			
			const chat_person_profile = document.getElementById('chatroom-square02');
			chat_person_profile.onclick = function () {
//  				alert('33');
  				$('.chatting-room').hide();
  				$('.chat-profile-site').show();
			}
			
			
			<!-- 채팅방 설정창-->
			const show_chattingroom_setting = document.getElementById('chatroom-1-3-icon');
			show_chattingroom_setting.onclick = function () {
 				$('.chatting-room').hide();
 				$('.chatroom-setting').show();
			}
			
			<!-- 채팅방 섫정창에서 채팅방으로 돌아오기 -->
			
			
			<!-- 설정 저장 -->
			const save_chattingroom_setting = document.getElementById('chatroom-setting-out');
			save_chattingroom_setting.onclick = function () {
// 				alert('33');
  				$('.chatroom-setting').hide();
  				$('.chatting-room').show();
			}
			<!-- 나가기 -->
			const out_of_chattingroom_setting = document.getElementById('chatroom-setting-icon-1');
			out_of_chattingroom_setting.onclick = function () {
//  				alert('33');
  				$('.chatroom-setting').hide();
  				$('.chatting-room').show();
			}
			<!-- 프로필 화면에서 나가기 -->
			const out_of_chattingroom_profile = document.getElementById('chatroom-setting-icon-2');
			out_of_chattingroom_profile.onclick = function () {
//  				alert('33');
   				$('.chat-profile-site').hide();
  				$('.chatting-room').show();
			}
			
			<!--모달창1(프로필, 연락처 링크)  -->
// 			$('#chatroom-4-1-icon1').click(function(){
// 				$(".chatlist-modal").fadeIn();
// 			})
			
// 			<!--모달창1(프로필, 연락처 링크)-->
// 			$('.chatroom-one-to-two').not('#chatroom-one-to-three-2, .chatroom-4-1-box').click(function(){
// //  				alert('d');
// 				if($('.chatlist-modal').length>0){
// 					$(".chatlist-modal").fadeOut();
// // 					alert('d');
// 				}
// 			})
// 			$('.chatlist-modal').click(function(){
// 				$(".chatlist-modal").fadeOut();
// 			})
			
// 			$('.chatlist-modal-text02-1').click(function(){
// 				$(".chatlist-modal").hide();
// 				$(".chatting-room").hide();
// 				$(".text-messenger-send-profile-page-01").show();
// 			})
			<!-- 섞기 -->

// 			text-messenger-send-contactss-page-01
			$('#chatroom-4-1-icon1').click(function(){
				
				$(".chatting-room").hide();
				$("#text-messenger-send-contactss-page-01").show();
			})
			
			
			
			
			
// 			프로필 링크-이전화면, 이후화면
			$('#sendprofilelink-leave').click(function(){
// 				alert('dd');
				$(".text-messenger-send-profile-page-01").hide();
				$(".chatting-room").show();
				$('.chatroom-one-to-three-2').hide();
			})
			$('#sendprofilelink-go').click(function(){
// 				alert('dd');
				$(".text-messenger-send-profile-page-01").hide();
				$(".chatting-room").show();
				$('.chatroom-one-to-three-2').hide();
			})
			
// 			"text-messenger-send-contacts-page-01"

			$('#sendcontactslink-leave').click(function(){
// 				alert('dd');
				$("#text-messenger-send-contactss-page-01").hide();
				$(".chatting-room").show();
				$('.chatroom-one-to-three-2').hide();
			})
			$('#sendcontactslink-go').click(function(){
// 				alert('dd');
				$("#text-messenger-send-contactss-page-01").hide();
				$(".chatting-room").show();
				$('.chatroom-one-to-three-2').hide();
			})
			
			<!--대화창목록 삭제-->
			$('#chatroom-exit-icon').click(function(){
 				$(".with-chat-data01").hide();
 				$(".with-chat-data01-1").show();
// 				$('.chatroom-one-to-three-2').hide();
			})
			
			$('#deletechatroom-ok').click(function(){
 				$(".with-chat-data01-1").hide();
 				$(".with-chat-data01").show();
// 				$('.chatroom-one-to-three-2').hide();
			})
			
			$('#deletechatroom-no').click(function(){
//  				$(".with-chat-data01").hide();
//  				$(".with-chat-data01-1").show();
				$(".with-chat-data01-1").hide();
 				$(".with-chat-data01").show();
// 				$('.chatroom-one-to-three-2').hide();
			})
			</script>

		</html>