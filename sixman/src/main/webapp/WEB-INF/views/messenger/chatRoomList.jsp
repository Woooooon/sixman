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
<%@include file="/WEB-INF/views/common/menuBar.jsp" .checkbox-square input[type="checkbox"]{display : none}%>
	<form action="" class="messenger-whole" id="messenger-whole">
		<div class="title-text01">사내 대화방</div>
		
		<div class='bottom-area' id='ba'></div>
		
		<div class='add-button' id='main-add-button'></div>
		
		<div class='who-chat-roomname'>채팅방 이름</div>
		
	
	
		
		<input type="textbox" name="wantchatdata" class="define-roomname">
		<div class="btn-height">
		<input type="submit" class="btn" value=" + 채팅방 생성">
		</div>
	</form>
	
	<script>
		
	</script>
</body>
</html>