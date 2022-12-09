<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var = "path" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정</title>
<style>
    .calendar{
        width: 100%;
        height: 100%;
        padding: 30px;
    }

    .header{
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .year-month{
        font-size: 30px;
    }

    .btn {
        border: none;
        width: 85px;
        height: 30px;
    }


    .nav{
        display: flex;
        border-radius: 5px;
    }

    .nav-btn{
        width: 28px;
        height: 30px;
        border: none;
        font-size: 16px;
        line-height: 34px;
        background-color: transparent;
        cursor: pointer;
    }

    .nav-btn:hover{
        background-color: rgb(197, 197, 197);
        border-radius: 5px;
    }

    .category-btn{
        width: 48px;
        height: 26px;
        border: 1px solid #aaa;
        background-color: #FFFFFF;
        cursor: pointer;
    }

    .category-btn:hover{
        background-color: #17a897;
        color: #FFFFFF;
        border: none;
    }
    
    .go-prev , .go-next {
        color: #aaa;
        font-weight: bold;
    }
    
    .go-prev:hover , .go-next:hover {
        color: #333333;
    }

    .go-today{
        width: 75px;
    }

    .days{
        display: flex;
        margin: 25px 0 10px;
    }

    .day{
        width: calc(100% / 7);
        text-align: center;
    }

    .dates{
        display: flex;
        flex-flow: row wrap;
        height: 500px;
        border-top: 1px solid #aaa;
        border-right: 1px solid #aaa;
    }

    .date{
        width: calc(100% / 7);
        padding: 15px;
        text-align: right;
        border-bottom: 1px solid #aaa;
        border-left: 1px solid #aaa;
    }

    .day:nth-child(7n + 1),
    .date:nth-child(7n + 1){
        color: #d13e3e;
    }

    .day:nth-child(7n),
    .date:nth-child(7n){
        color: #396EE2;
    }

    .other{
        opacity: 0.3;
    }

    .today{
        position: relative;
        color: #FFFFFF;
    }

    .today::before{
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: -1;
        width: 30px;
        height: 30px;
        display: block;
        background-color: #FF0000;
        border-radius: 50%;
        content: '';
    }


</style>
<script defer src="${path}/resources/js/schedule.js"></script>
</head>
<body>
    <!-- 메뉴바 고정 -->
    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>

    <main class="main-box">
        <div class="calendar box">
            <div class="header">
                <div class="nav-1">
                    <button class="btn write" onclick="location.href='${path}/schedule/write.jsp'"><p>작성하기</p></button>
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
                <div class="dates"></div>
            </div>
        </div>
    </main>
</body>
<script>
  

</script>
</html>