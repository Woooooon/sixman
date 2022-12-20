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
<link rel="stylesheet" href="${path}/resources/css/mail/mailDetail.css">
</head>
<body>

<%@include file="/WEB-INF/views/common/menuBar.jsp" %>
<main class="main-box">

	<div id="notice-box" class="box">
        <div class="title-box">
            <span class="material-symbols-outlined" onclick="location.href='${path}/mail/list'"> chevron_left </span>
            <div class="b-title">받은 메일함</div>
        </div>
        <div class="list-box">
            <div class="first-item">
                <div class="t-btn">답장</div>
                <div class="t-btn">삭제</div>
                <div class="t-btn">이동<span class="material-symbols-outlined"> arrow_drop_down </span></div>
            </div>
            <div id="mail-header">
                <div id="board-title">${vo.title}</div>
                <div id="send-member">
                    <p>보낸사람</p>
                    <input type="email" readonly value="${vo.sendUserMail}">
                    <div class="btn"><span class="material-symbols-outlined"> add </span><p>주소록</p></div>
                </div>
                <div id="file-box">
                    <div>
                        <c:if test="${not empty vo.fileList}">
                            <input id="list-check" type="checkbox">
                            <label for="list-check" class="material-symbols-outlined"> arrow_drop_down </label>
                            <div id="file-list">
                                <c:forEach items="${vo.fileList}" var="fv">
                                    <div class="file-item">
                                        <div>${fv.orginName}</div>
                                        <span class="material-symbols-outlined" onclick="download(${fv.no}, 'MAIL')"> download </span>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:if>
                    </div>
                    <div>작성일<p id="enroll-date">${vo.sendTime}</p></div>
                </div>
            </div>
            <div id="content-box">
                ${vo.content}
            </div>
        </div>
        <div id="board-footer">
            <div class="btn"><p>다시쓰기</p></div>
        </div>
    </div>

</main>

</body>
</html>