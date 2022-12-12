<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/chattingRoom.css'/>">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
<%@include file="/WEB-INF/views/common/menuBar.jsp"%>
	<form action="" class="messenger-whole" id="messenger-whole">
	
		<div class="1st-box">
			<div class="square"></div>
			<div class="imfor">
				<div class='who-chat-teamimfor'>영업부 영업4팀</div>
				<div class='who-chat-name'>정ㅇㅇ 과장</div>
			</div>
			<div class="1st-button"></div>
			<div class="2nd-button"></div>
			<div class="3rd-button"></div>
		</div>
		<div class="2nd-box">
			<div class="you">
				<div class="chat-profile">
					<div class="square"></div>
					<div class='who-chat-name'>정ㅇㅇ 과장</div>
				</div>
				<div class="messenger-box1">
					<div class="chat-box"></div>
					<div class="send-time"></div>
				</div>
			</div>
			<div class="me">
				<div class="messenger-box1">
					<div class="chat-box"></div>
					<div class="send-time"></div>
				</div>
			</div>
		</div>
		<div class="3rd-box">
			<input type="textbox" name="wantchatdata" class="define-roomname">
		</div>
	</form>
	
	<script>
		
	</script>
</body>
</html>