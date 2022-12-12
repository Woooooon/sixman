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
</head>
<body>
<%@include file="/WEB-INF/views/common/menuBar.jsp" %>
	<form action="" class="messenger-whole" id="messenger-whole">
		<div class="title-text01">사내 대화방</div>
		
		<div class='bottom-area' id='ba'></div>
		
		<div class='add-button' id='main-add-button'></div>
		
		<div id='who-chat'>누구와 대화하시겠습니까?</div>
		
		<!-- 카탈로그, textarea, button -->
		
		
		
		<div class="textbox-messenger-area1">
			<select>
				<!-- <option>주환</option> -->
				<option>직책</option>
				<option>이름</option>
				<option>팀명</option>
			</select>
			<input type="textbox" name="wantchatdata">
			<input type="submit" class="btn" value="검색">
		</div>
		<div class="text-messenger-settings">
			<div class="textbox-messenger-area2">
				<div class="showup">
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
					</div>
					<div class="bottom-area"></div>
					<div class="with-chat-data">
						<div class="square" style=""></div>
						<div class="with-chat-name">구기석</div>
						<div class="with-chat-grade">부장</div>
						<div class="checkbox-square">
							<input type="checkbox" id="checkbox-square">
						</div>
					</div>
					<div class="bottom-area"></div>
					<div class="with-chat-data">
						<div class="square" style=""></div>
						<div class="with-chat-name">구기석</div>
						<div class="with-chat-grade">부장</div>
					</div>
					<div class="bottom-area"></div>
				</div>
			</div>
			<div class="textbox-messenger-area3">
				<div class="showup">
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
					</div>
					<div class="bottom-area"></div>
					<div class="with-chat-data">
						<div class="square" style=""></div>
						<div class="with-chat-name">구기석</div>
						<div class="with-chat-grade">부장</div>
					</div>
					<div class="bottom-area"></div>
					<div class="with-chat-data">
						<div class="square" style=""></div>
						<div class="with-chat-name">구기석</div>
						<div class="with-chat-grade">부장</div>
					</div>
					<div class="bottom-area"></div>
				</div>
			</div>
			</div>
		</div>
		<div class = "button-list">
			<input type="submit" class="btn" value="이전 버튼">
			<input type="submit" class="btn" value="다음 버튼">
		</div>
	</form>
	
	<script>
		
	</script>
</body>
</html>