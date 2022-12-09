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
<link rel="stylesheet" href="${path}/resources/css/notice/noticeDetail.css">
<script defer src="${path}/resources/js/file/file.js"></script>
</head>
<body>

<%@include file="/WEB-INF/views/common/menuBar.jsp" %>
<main class="main-box">

	<div id="notice-box" class="box">
        <div class="title-box">
            <span class="material-symbols-outlined" onclick="location.href='${path}/notice/list'"> chevron_left </span>
            <div class="b-title">글 목록</div>
        </div>
        <div class="list-box">
            <div class="first-item">
                <div id="board-title">${vo.title}</div>
                <div>조회수<p id="view-count">${vo.view}</p></div>
            </div>
            <div id="file-box">
                <div>
                    <input id="list-check" type="checkbox">
                    <label for="list-check" class="material-symbols-outlined"> arrow_drop_down </label>
                    <div id="file-list">
                    	<c:forEach items="${vo.fileList}" var="fv">
	                    	<div class="file-item">
	                            <div>${fv.originName}</div>
	                            <span class="material-symbols-outlined" onclick="dounload()"> download </span>
	                        </div>   
                    	</c:forEach>
                    </div>
                </div>
                <div>작성일<p id="enroll-date">${enrollDate}</p></div>
            </div>
            <div id="content-box">
                ${content}
            </div>
        </div>
        <div id="board-footer">
            <div id="before-next">
                <div>
                    <p>다음글</p>
                    <p>제목제목제에에에에에목</p>
                    <p>2022-05-05 11:11</p>
                </div>
                <div>
                    <p>이전글</p>
                    <p>제목제목제에에에에에목</p>
                    <p>2022-05-05 11:11</p>
                </div>
            </div>
            <div id="btn-box">
                <div class="btn"><p>수정하기</p></div>
                <div class="c-btn"><p>삭제하기</p></div>
            </div>

        </div>
    </div>

</main>

</body>
</html>