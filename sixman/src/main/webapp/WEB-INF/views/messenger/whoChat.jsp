<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/messenger.css'/>">
</head>
<body>
	<form action="" class="messenger-whole" id="messenger-whole">
		<div class="title-text01"><h2>사내 대화방</h2></div>
		
		<div class='bottom-area' id='ba'></div>
		
		<div class='add-button' id='main-add-button'></div>
		
		<div id='who-chat'>누구와 대화하시겠습니까?</div>
		
		<!-- 카탈로그, textarea, button -->
		
		<c:forEach items="">
			<h3>직책</h3>
			<h3>이름</h3>
			<h3>팀명</h3>
		</c:forEach>
		
		<div class="textbox-messenger"><input type="textbox"></div>
		<div class="btn"></div>
	</form>
</body>
</html>