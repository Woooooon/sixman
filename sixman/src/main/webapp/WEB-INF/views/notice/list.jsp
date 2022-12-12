<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var = "path" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/notice/noticeList.css">
<script defer src="${path}/resources/js/notice/noticeList.js"></script>
</head>
<body>

<%@include file="/WEB-INF/views/common/menuBar.jsp" %>
<main class="main-box">
	<div id="notice-box" class="box">
        <div class="title-box">
            <div class="b-title">공지사항</div>
            <div class="b-page-count hilight">50</div>
        </div>
        <div class="header-box">
            <a href="/sixman/notice/write" class="btn" onclick="location.href='/sixman/notice/write'"><span class="material-symbols-outlined"> add </span><p>글쓰기</p></a>
            <div class="search-bar"><input id="search-input" type="text" placeholder="검색"><span id="search-btn" class="material-symbols-outlined"> search </span></div>
        </div>
        <div class="list-box">
        </div>
        <div class="page-box">
        </div>
    </div>
</main>
</body>
</html>