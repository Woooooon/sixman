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
	<main class="messenger-whole">
		<div class="title-box">		
			<div class="title-text01">사내 대화방</div>
			<button type="button" class="material-symbols-outlined" id="qwe" value="add_circle">add_circle</button>
		</div>
		
		<div class='bottom-area' id='ba'></div>
		
		<div class='button' id='main-add-button'></div>
		<div class="first-page">
			<div id='main-center-text1'>현재 대화 목록이 없습니다.</div>
			<div id='main-center-text2'>대화하고 싶으신 분과 대화방을 열여보세요~</div>
		</div>
	</main>
	
	
</body>

<script type="text/javascript">

	const qwe = document.querySelector('#qwe');
	
	qwe.onclick = function(){
		alert('ㅇㅇ');
	}
	
	<!--
	function change(){
		document.getElementById("qwe").setAttribute("onClick", "change1()");
	}
	
	function change1(){
		alert("changed");
	}
	-->
</script>
</html>