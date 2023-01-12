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
<script defer src="${path}/resources/js/notice/noticeDetail.js"></script>
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
                <div id="board-title">${resultMap.vo.title}</div>
                <div>조회수<p id="view-count">${resultMap.vo.view}</p></div>
            </div>
            <div id="file-box">
                <div>
                    <input id="list-check" type="checkbox">
                    <label for="list-check" class="material-symbols-outlined"> arrow_drop_down </label>
                    <div id="file-list">
                    	<c:forEach items="${resultMap.vo.fileList}" var="fv">
	                    	<div class="file-item">
	                            <div>${fv.originName}</div>
	                            <span class="material-symbols-outlined" onclick="download(${fv.no}, 'NOTICE')"> download </span>
	                        </div>   
                    	</c:forEach>
                    </div>
                </div>
                <div>작성일<p id="enroll-date">${resultMap.vo.enrollDate}</p></div>
            </div>
            <div id="content-box">
                ${resultMap.vo.content}
            </div>
        </div>
        <div id="board-footer">
            <div id="before-next">
                <div>
                	<c:if test="${not empty resultMap.next}">
	                	<p>다음글</p>
	                    <p onclick="location.href='/sixman/notice/detail?no=${resultMap.next.no}'">${resultMap.next.title}</p>
	                    <p>${resultMap.next.enrollDate}</p>
                	</c:if>
                </div>
                <div>
                	<c:if test="${not empty resultMap.pre}">
	                	<p>이전글</p>
	                    <p onclick="location.href='/sixman/notice/detail?no=${resultMap.pre.no}'">${resultMap.pre.title}</p>
	                    <p>${resultMap.pre.enrollDate}</p>
                	</c:if>
                </div>
            </div>
            <c:if test="${loginMember.authorizeNo == 3}">
                <div id="btn-box">
                    <div class="btn" onclick="location.href='/sixman/admin/notice/update?no=${resultMap.vo.no}'"><p>수정하기</p></div>
                    <div class="c-btn" onclick="deletePage(${resultMap.vo.no})"><p>삭제하기</p></div>
                </div>
            </c:if>

        </div>
    </div>

</main>

</body>
</html>