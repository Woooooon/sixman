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

<c:if test="${loginMember.authorizeNo==3}">
    <%@include file="/WEB-INF/views/common/tempMenuBar.jsp" %>
</c:if>
<c:if test="${loginMember.authorizeNo!=3}">
    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
</c:if>

<main class="main-box">
	<div id="notice-box" class="box">
        <div class="title-box">
            <div class="b-title">공지사항</div>
            <div id="list-count" class="b-page-count hilight"></div>
        </div>
        <div class="header-box">
            <c:if test="${loginMember.authorizeNo==3}">
                <a href="/sixman/admin/notice/write" class="btn"><span class="material-symbols-outlined"> add </span><p>글쓰기</p></a>
            </c:if>
            <c:if test="${loginMember.authorizeNo!=3}">
                <div></div>
            </c:if>
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