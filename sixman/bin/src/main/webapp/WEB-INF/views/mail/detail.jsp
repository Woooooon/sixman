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
            <span class="material-symbols-outlined"> chevron_left </span>
            <div class="b-title">받은 메일함</div>
        </div>
        <div class="list-box">
            <div class="first-item">
                <div class="t-btn">답장</div>
                <div class="t-btn">삭제</div>
                <div class="t-btn">이동<span class="material-symbols-outlined"> arrow_drop_down </span></div>
            </div>
            <div id="mail-header">
                <div id="board-title">이건 제목입니다.</div>
                <div id="send-member">
                    <p>보낸사람</p>
                    <input type="email" readonly>
                    <div class="btn"><span class="material-symbols-outlined"> add </span><p>주소록</p></div>
                </div>
                <div id="file-box">
                    <div>
                        <input id="list-check" type="checkbox">
                        <label for="list-check" class="material-symbols-outlined"> arrow_drop_down </label>
                        <div id="file-list">
                            <div class="file-item">
                                <div>파일제목asdfasdfasdfasdf</div>
                                <span class="material-symbols-outlined"> download </span>
                            </div>
                            <div class="file-item">
                                <div>파일제목</div>
                                <span class="material-symbols-outlined"> download </span>
                            </div>
                            <div class="file-item">
                                <div>파일제목</div>
                                <span class="material-symbols-outlined"> download </span>
                            </div>
                            <div class="file-item">
                                <div>파일제목</div>
                                <span class="material-symbols-outlined"> download </span>
                            </div>
                        </div>
                    </div>
                    <div>작성일<p id="enroll-date">2022-05-05 11:11</p></div>
                </div>
            </div>
            <div id="content-box">
                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Impedit minus ullam inventore praesentium eum! Corrupti at veniam quaerat nostrum, molestiae quibusdam tempora quidem incidunt possimus minima, nemo distinctio eum id.
                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Impedit minus ullam inventore praesentium eum! Corrupti at veniam quaerat nostrum, molestiae quibusdam tempora quidem incidunt possimus minima, nemo distinctio eum id.
                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Impedit minus ullam inventore praesentium eum! Corrupti at veniam quaerat nostrum, molestiae quibusdam tempora quidem incidunt possimus minima, nemo distinctio eum id.
                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Impedit minus ullam inventore praesentium eum! Corrupti at veniam quaerat nostrum, molestiae quibusdam tempora quidem incidunt possimus minima, nemo distinctio eum id.
                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Impedit minus ullam inventore praesentium eum! Corrupti at veniam quaerat nostrum, molestiae quibusdam tempora quidem incidunt possimus minima, nemo distinctio eum id.
                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Impedit minus ullam inventore praesentium eum! Corrupti at veniam quaerat nostrum, molestiae quibusdam tempora quidem incidunt possimus minima, nemo distinctio eum id.
                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Impedit minus ullam inventore praesentium eum! Corrupti at veniam quaerat nostrum, molestiae quibusdam tempora quidem incidunt possimus minima, nemo distinctio eum id.
                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Impedit minus ullam inventore praesentium eum! Corrupti at veniam quaerat nostrum, molestiae quibusdam tempora quidem incidunt possimus minima, nemo distinctio eum id.
                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Impedit minus ullam inventore praesentium eum! Corrupti at veniam quaerat nostrum, molestiae quibusdam tempora quidem incidunt possimus minima, nemo distinctio eum id.
                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Impedit minus ullam inventore praesentium eum! Corrupti at veniam quaerat nostrum, molestiae quibusdam tempora quidem incidunt possimus minima, nemo distinctio eum id.
                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Impedit minus ullam inventore praesentium eum! Corrupti at veniam quaerat nostrum, molestiae quibusdam tempora quidem incidunt possimus minima, nemo distinctio eum id.
                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Impedit minus ullam inventore praesentium eum! Corrupti at veniam quaerat nostrum, molestiae quibusdam tempora quidem incidunt possimus minima, nemo distinctio eum id.
            </div>
        </div>
        <div id="board-footer">
            <div class="btn"><p>다시쓰기</p></div>
        </div>
    </div>

</main>

</body>
</html>