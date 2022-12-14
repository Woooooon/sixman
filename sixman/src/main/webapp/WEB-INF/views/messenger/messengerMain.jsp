<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/messenger.css'/>">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@include file="/WEB-INF/views/common/menuBar.jsp" %>
	<main class="messenger-whole" id='messenger-whole'>
		<div class="first-page">
			<div class="title-box">		
				<div class="title-text01">사내 대화방</div>
				<button type="button" class="material-symbols-outlined" id="qwe" value="add_circle">add_circle</button>
			</div>
			
			<div class='bottom-area' id='ba'></div>
			
			<div class='button' id='main-add-button'></div>
			<div id="none-text" style="display:none">
				<div id='main-center-text1'>현재 대화 목록이 없습니다.</div>
				<div id='main-center-text2'>대화하고 싶으신 분과 대화방을 열여보세요~</div>
			</div>
			
			<div class="chatroom-list-space">
				<div class="chatroom-introduce">대화방 목록</div>
				<div class="textbox-messenger-area1">
					<select>
						<!-- <option>주환</option> -->
						<option>직책</option>
						<option>이름</option>
						<option>팀명</option>
					</select>
					<input type="text" name="wantchatdata">
					<input type="submit" class="btn" value="검색">
				</div>
				<div class="chatroom-list-box">
					
					<div class="with-chat-data01">
						
						
						<div class="with-chat-subroomname">대화방 이름 </div>
						<div class="with-chat-subroomname2">야 지금 뭐해?</div>
					
						<div class="square-one" style=""></div>
						<div class="chatroom-list-two-to-two">
							
							<div class="with-chat-name01">구기석</div>
							<div class="with-chat-grade01">부장</div>
							<div class="chatroom-alarm-content">님께서 메세지를 보내셨습니다.</div>
						</div>
						 
					</div>
					
				</div>
				
			</div>
			
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		<!-- 누구와 대화하시겠습니까? -->
		<div class="whochat-page-first" style="display:none">
			
			
			<div id='who-chat'>누구와 대화하시겠습니까?</div>
			
			<!-- 카탈로그, textarea, button -->
			
			<div class="textbox-messenger-area1">
				<select>
					<!-- <option>주환</option> -->
					<option>직책</option>
					<option>이름</option>
					<option>팀명</option>
				</select>
				<input type="text" name="wantchatdata">
				<input type="submit" class="btn" value="검색">
			</div>
			
			
			<div class="text-messenger-settings">
				<div class="textbox-messenger-area2">
					<div class="showup" id="showup01">
						<span class="material-symbols-outlined" style="font-size:300%">expand_more</span>
						<div class="subtitle" id="subtitle1">전체 목록</div>
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
							<input type="checkbox" id="checkbox-square-one" name="withfriend01">
						</div>
						<div class="bottom-area"></div>
						<div class="with-chat-data">
							<div class="square" style=""></div>
							<div class="with-chat-name">구기석</div>
							<div class="with-chat-grade">부장</div>
							<input type="checkbox" id="checkbox-square-one" name="withfriend01"">
						</div>
						<div class="bottom-area"></div>
						<div class="with-chat-data">
							<div class="square" style=""></div>
							<div class="with-chat-name">구기석</div>
							<div class="with-chat-grade">부장</div>
							<input type="checkbox" id="checkbox-square-one" name="withfriend01">
						</div>
						<div class="bottom-area"></div>
					</div>
				</div>
				<div class="textbox-messenger-area3">
					<div class="showup" id="showup02">
						<span class="material-symbols-outlined" style="font-size:50px">expand_more</span>
						<div class="subtitle" id="subtitle1">친구 목록</div>
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
							<input type="checkbox" id="checkbox-square-one" name="withfriend01">
						</div>
						<div class="bottom-area"></div>
						<div class="with-chat-data">
							<div class="square" style=""></div>
							<div class="with-chat-name">구기석</div>
							<div class="with-chat-grade">부장</div>
							<input type="checkbox" id="checkbox-square-one" name="withfriend01">
						</div>
						<div class="bottom-area"></div>
						<div class="with-chat-data">
							<div class="square" style=""></div>
							<div class="with-chat-name">구기석</div>
							<div class="with-chat-grade">부장</div>
							<input type="checkbox" id="checkbox-square-one" name="withfriend01">
						</div>
						<div class="bottom-area"></div>
					</div>
				</div>
				<div class = "button-list">
					<input type="submit" class="btn" value="이전 버튼" id="makingroom-first-leave">
					<input type="submit" class="btn" value="다음 버튼" id="makingroom-first-next">
				</div>
			</div>
			
			
			
			
			
			
			<div class="define-chatroomname" id="define-chatroomname" style="display:none">
				<div class="title-text01">사내 대화방</div>
					
				<div class='bottom-area' id='ba'></div>
					
				<div class='add-button' id='main-add-button'></div>
					
				<div class='who-chat-roomname'>채팅방 이름</div>
				
			
			
				
				<input type="text" name="wantchatdata" class="define-roomname">
				<div class="btn-height">
				<input type="submit" class="btn" value=" + 채팅방 생성">
				</div>
			</div>
			
		</div>
	</main>
	
	
</body>

<!-- 메신저 창 띄우기 -->
<script type="text/javascript">
	const messenger = document.getElementById('messenger-whole');
	const messengericon = document.getElementById('msg');<!-- 메신저 표시  -->

	messengericon.onclick = function(){
		$('.messenger-whole').toggle();
	}
	
<!--
if($('.messenger-whole').css("display")=="none"){
	$('.messenger-whole').show();
} else{
	$('.messenger-whole').hide();
}
-->

<!--
if(messenger.style.display == 'none') {
	messenger.style.display = 'block';
}else {
	messenger.style.display='none';
}
-->

<!--
	messengericon.onclick = function(){
	if($('.messenger-whole').css("display")=="none"){
		$('.messenger-whole').show();
	} else{
		$('.messenger-whole').hide();
	}
}

-->

	<!-- 채팅방 목록 화면에서 채팅방 생성 화면으로..-->
	const qwe = document.querySelector('#qwe');
	
	qwe.onclick = function(){
		alert('ㅇㅇ');
		$('#qwe').hide();
		$('.chatroom-list-space').hide();
		$('.whochat-page-first').show();w
	}
	
	<!--
	function change(){
		document.getElementById("qwe").setAttribute("onClick", "change1()");
	}
	
	function change1(){
		alert("changed");
	}
	-->
	
	
	
	<!-- 채팅방 생성 중 친구초대 화면에서 이전화면 -->
	const first_making_leave = document.getElementById('makingroom-first-leave');
	first_making_leave.onclick = function(){
		$('.whochat-page-first').hide();
		$('#qwe').show();
		$('.chatroom-list-space').show();
	}
	
	<!-- 채팅방 생성 중 친구초대 화면에서 움직임2 -->
	const first_making_next = document.getElementById('makingroom-first-next');
	first_making_next.onclick = function(){
		$('.define-chatroomname').show();
		$('.whochat-page-first').hide();
	}
	
	
</script>
</html>