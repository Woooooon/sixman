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
            <a href="${path}/notice/write" class="btn" onclick="location.href='/sixman/notice/write'"><span class="material-symbols-outlined"> add </span><p>글쓰기</p></a>
            <div class="search-bar"><input type="text" placeholder="검색"><span class="material-symbols-outlined"> search </span></div>
        </div>
        <div class="list-box">
            <div class="first-item">
                <p>번호</p>
                <p>제목</p>
                <p>작성일자</p>
                <p>조회수</p>
            </div>
            <div class="list-item"> <p>번호</p> <p>제목</p> <p>작성일자</p> <p>조회수</p> </div>
            <div class="list-item"> <p>번호</p> <p>제목</p> <p>작성일자</p> <p>조회수</p> </div>
            <div class="list-item"> <p>번호</p> <p>제목</p> <p>작성일자</p> <p>조회수</p> </div>
            <div class="list-item"> <p>번호</p> <p>제목</p> <p>작성일자</p> <p>조회수</p> </div>
            <div class="list-item"> <p>번호</p> <p>제목</p> <p>작성일자</p> <p>조회수</p> </div>
            <div class="list-item"> <p>번호</p> <p>제목</p> <p>작성일자</p> <p>조회수</p> </div>
            <div class="list-item"> <p>번호</p> <p>제목</p> <p>작성일자</p> <p>조회수</p> </div>
            <div class="list-item"> <p>번호</p> <p>제목</p> <p>작성일자</p> <p>조회수</p> </div>
            <div class="list-item"> <p>번호</p> <p>제목</p> <p>작성일자</p> <p>조회수</p> </div>
            <div class="list-item"> <p>번호</p> <p>제목</p> <p>작성일자</p> <p>조회수</p> </div>
            <div class="list-item"> <p>번호</p> <p>제목</p> <p>작성일자</p> <p>조회수</p> </div>
            <div class="list-item"> <p>번호</p> <p>제목</p> <p>작성일자</p> <p>조회수</p> </div>
            <div class="list-item"> <p>번호</p> <p>제목</p> <p>작성일자</p> <p>조회수</p> </div>
            <div class="list-item"> <p>번호</p> <p>제목</p> <p>작성일자</p> <p>조회수</p> </div>
            <div class="list-item"> <p>번호</p> <p>제목</p> <p>작성일자</p> <p>조회수</p> </div>
        </div>
        <div class="page-box">
            <span class="material-symbols-outlined"> keyboard_double_arrow_left </span>
            <span class="material-symbols-outlined"> chevron_left </span>
            <div class="page-btn checked-p-btn">1</div>
            <div class="page-btn">2</div>
            <div class="page-btn">3</div>
            <div class="page-btn">4</div>
            <div class="page-btn">5</div>
            <span class="material-symbols-outlined"> chevron_right </span>
            <span class="material-symbols-outlined"> keyboard_double_arrow_right </span>
        </div>
    </div>
</main>

</body>
</html>