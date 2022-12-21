<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var = "path" value = "${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주간 일정</title>
<link rel="stylesheet" href="${path}\resources\css\schedule\weeks.css">
<script defer src="${path}\resources\js\schedule\weeks.js"></script>
</head>
<body>  
    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
    <main class="main-box">
        <div class="calendar box">
            <div class="header">
                <div class="nav-1">
                    <button class="btn write"><p>작성하기</p></button>
                </div>
                <div class="week-name">
                <button class="go-prev wbtn" onclick="prevMonth()" type="button">&lt;</button>
                <div class="month-week"></div>
                <button class="go-next wbtn" onclick="nextMonth()" type="button">&gt;</button>
                </div>
                <div>
                <div class="category">
                    <br>
                    <button class="category-btn" onclick="location.href='${path}/schedule/calendar'">월간</button>
                    <button class="category-btn">주간</button>
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
                <div class="schedules">
                    <div class="schedule">일정 없음</div>
                    <div class="schedule">월래쉬는날</div>
                    <div class="schedule">화사하게쉬는날</div>
                    <div class="schedule">수울먹게쉬는날</div>
                    <div class="schedule">목살먹는날</div>
                    <div class="schedule">금방쉬는날</div>
                    <div class="schedule">토할때까지쉬는날</div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>