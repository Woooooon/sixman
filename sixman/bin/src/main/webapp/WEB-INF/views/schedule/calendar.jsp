<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var = "path" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정</title>
<link rel="stylesheet" href="${path}\resources\css\schedule\calendar.css">
<script src="${path}/resources/js/schedule/calendar.js" defer ></script>
</head>
<body>
    <!-- 메뉴바 고정 -->
    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>

    <main class="main-box">
        <div class="calendar box">
            <div class="header">
                <div class="nav-1">
                    <button class="btn write"><p>작성하기</p></button>
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
</body>
<script>
  

</script>
</html>