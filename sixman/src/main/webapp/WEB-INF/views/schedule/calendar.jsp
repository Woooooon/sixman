<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var = "path" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="${path}\resources\css\schedule\calendar.css">
<script defer src="${path}/resources/js/schedule/calendar.js"></script>
</head>
<body>
    <!-- 메뉴바 고정 -->
    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>

    <main class="main-box">
        <div class="calendar box">
            <div class="header">
                <div class="nav-1">
                    <button  type="button" class="btn write" id="btn-modal"><p>작성하기</p></button>
                </div>
                <div class="year-month"></div>
                <div>
                <div class="nav">
                    <button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
                    <button class="nav-btn go-today" onclick="goToday()">오늘</button>
                    <button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
                </div>
                <div class="category">
                    <br>
                    <button class="category-btn">월간</button>
                    <button class="category-btn" onclick="location.href='${path}/schedule/weeks'">주간</button>
                    <button class="category-btn">일간</button>
                </div>
                </div>
            </div>
            <div class="main">
                <div class="days">
                    <div class="day">일</div>
                    <div class="day">월</div>
                    <div class="day">화</div>
                    <div class="day">수</div>
                    <div class="day">목</div>
                    <div class="day">금</div>
                    <div class="day">토</div>
                </div>
                <div class="dates"></div>
            </div>
        </div>
    </main>
    <!-- Modal -->
    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <p>일정 제목란</p>
                <div class="close-area">
                    <span class="material-symbols-outlined">close</span>
                </div>
            </div>
            <div class="scheduledate">
                <div class="schedule-title">
                    <p>일정</p>
                </div>
                <input type="date" name="startdate">
                <p>~</p>
                <input type="date" name="enddate">
            </div>
            <div class="schedule-color">
                <p>색상</p>
                <div class="select" data-role="selectBox">
                    <span date-value="optValue" class="selected-option" id="membervalue"><!-- 선택된 옵션 값이 출력되는 부분 --></span>
                    <ul class="hide">
                        <li class="option-wrap">red</li>
                        <li class="option-wrap">green</li>
                        <li class="option-wrap">blue</li>
                    </ul>
                </div>
            </div>
            <div class="hidden"></div>
            <div class="contentbox">
                <p>내용</p>
                <textarea name="content" class="content"></textarea>
            </div>
            <div class="footer-btn">
                <button class="btn" type="button">작성하기</button>
                <button class="c-btn" type="button" onclick="location.href='history.back()'">취소하기</button>
            </div>
        </div>
    </div>
</body>
</html>