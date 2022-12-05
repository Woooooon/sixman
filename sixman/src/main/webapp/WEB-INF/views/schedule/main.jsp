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
    *{
        margin: 0;
        padding: 0;
        font-family: sans-serif;
        box-sizing: border-box;
    }

    body{
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

    .calendar{
        width: 600px;
        margin: 50px;
    }

    .header{
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    #main-box{
        position: relative;
    }

    .year-month{
        font-size: 35px;
    }

    .nav{
        display: flex;
        border: 1px solid #333333;
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

    .go-today{
        width: 75px;
        border-left: 1px solid #333333;
        border-right: 1px solid #333333;
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
        border-top: 1px solid #333333;
        border-right: 1px solid #333333;
    }

    .date{
        width: calc(100% / 7);
        padding: 15px;
        text-align: right;
        border-bottom: 1px solid #333333;
        border-left: 1px solid #333333;
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
</head>
<body>
    <!-- 메뉴바 고정 -->
    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>

    <main id="main-box">
        <div class="calendar">
            <div class="header">
                <div class="year-month"></div>
                <div class="nav">
                    <button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
                    <button class="nav-btn go-today" onclick="goToday()">Today</button>
                    <button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
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
    let date = new Date();

    const renderCalender = () =>{
        const viewYear  = date.getFullYear();
        const viewMonth = date.getMonth();

        document.querySelector('.year-month').textContent = `${viewYear}년 ${viewMonth + 1}월`;

        console.log(viewYear);

        const prevLast = new Date(viewYear, viewMonth , 0);
        const thisLast = new Date(viewYear, viewMonth + 1 , 0);

        console.log('prevLast : ' + prevLast);
        console.log('thisLast : ' + thisLast);

        const PLDate = prevLast.getDate();
        const PLDay = prevLast.getDay();

        console.log('PLDate : ' + PLDate);
        console.log('PLDay : ' + PLDay);

        const TLDate = thisLast.getDate();
        const TLDay = thisLast.getDay();

        console.log('TLDate : ' + TLDate);
        console.log('TLDay : ' + TLDay);

        const prevDates = [];
        const thisDates = [...Array(TLDate + 1).keys()].slice(1);
        const nextDates = [];

        if(PLDay !== 6) {
            for(let i = 0; i < PLDay + 1; i++) {
                prevDates.unshift(PLDate - i);
            }
        }

        for(let i = 1; i < 7 - TLDay; i++) {
            nextDates.push(i);
        }
        console.log('----------------');    
        console.log(prevDates);
        console.log('----------------');
        console.log(thisDates);
        console.log('----------------');
        console.log(nextDates);
        console.log('----------------');

        const dates = prevDates.concat(thisDates, nextDates);
        const firstDateIndex = dates.indexOf(1);
        const lastDateIndex = dates.lastIndexOf(TLDate);

        console.log(dates);
        dates.forEach((date, i) => {
            const condition = i >= firstDateIndex && i < lastDateIndex + 1
                              ? 'this'
                              : 'other';
            dates[i] = `<div class="date"><span class=${condition}>${date}</span></div>`;
        });

        document.querySelector('.dates').innerHTML = dates.join('');

        const today = new Date();
        if(viewMonth === today.getMonth() && viewYear === today.getFullYear()){
            for(let date of document.querySelectorAll('.this')) {
                if(+date.innerText === today.getDate()) {
                    date.classList.add('today');
                    break;
                }
            }
        }
    };

    renderCalender();

    const prevMonth = () =>{
        date.setMonth(date.getMonth() - 1);
        renderCalender();
    };

    const nextMonth = () =>{
        date.setMonth(date.getMonth() + 1);
        renderCalender();
    };

    const goToday = () => {
        date = new Date();
        renderCalender();
    };


</script>
</html>