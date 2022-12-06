<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var = "path" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/list.css">
<link rel="stylesheet" href="${path}/resources/css/mail/mailList.css">
<script defer src="${path}/resources/js/mail/mailList.js"></script>
</head>
<body>

<%@include file="/WEB-INF/views/common/menuBar.jsp" %>
<main class="main-box">
	<div id="notice-box" class="box">
        <div class="title-box">
            <div class="b-title">받은메일함</div>
        </div>
        <div class="header-box">
            <a href="${path}/mail/write" class="btn" onclick="location.href='/sixman/notice/write'"><span class="material-symbols-outlined"> add </span><p>메일쓰기</p></a>
            <div class="search-bar"><input type="text" placeholder="검색"><span class="material-symbols-outlined"> search </span></div>
        </div>
        <div class="list-box">
            <div class="first-item">
                <div class="none">
                    <input type="checkbox">
                    <p>읽음</p>
                    <p>삭제</p>
                    <div class="category-btn checked click-able">
                        이동
                        <span class="material-symbols-outlined"> arrow_drop_down </span>
                        <div id="category-box">
                            <div class="category-items">
                                <label>즐겨찾기<input name="category" type="radio"><span class='material-symbols-outlined'> close </span></label>
                                <label>즐겨찾기<input name="category" type="radio"></label>
                            </div>
                            <div class="category-footer">
                                <div>
                                    <input type="text">
                                    <div class="btn"><p>추가</p></div>
                                </div>
                                <div class="btn"><p>이동</p></div>
                            </div>
                        </div>
                    </div>
                    <div id="mail-count"><p class="hilight">50</p>/<p>100</p>안읽은 메일</div>
                </div>
                <div>
                    <div class="category-btn">
                        필터
                        <span class="material-symbols-outlined"> arrow_drop_down </span>
                        <div id="category-box3">
                            <div class="category-items">
                                <button>모든메일</button>
                                <button>읽은메일만</button>
                                <button>안읽은메일만</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="list-item">
                <input type="checkbox">
                <span class="material-symbols-outlined"> mail </span>
                <p>김부장</p>
                <p>제목제목</p>
                <p>11.23 16:30</p>
            </div>
            <div class="list-item read">
                <input type="checkbox">
                <span class="material-symbols-outlined"> drafts </span>
                <p>김부장</p>
                <p>제목제목</p>
                <p>11.23 16:30</p>
            </div>
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