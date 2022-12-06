<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='resources/css/messengerMain.css'/>">
</head>
<body>
	<div class="messenger-whole" id="messenger-main">
		<h1>사내 대화방</h1>
		
		<div class='bottom-area' id='ba'></div>
		
		<div class='button' id='main-add-button'></div>
		
		<div id='main-center-text'>현재 대화 목록이 없습니다.</div>
		<div id='main-center-text2'>대화하고 싶으신 분과 대화방을 열여보세요~</div>
		
	</div>
</body>
</html>