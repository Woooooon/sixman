<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var = "path" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태현황(달력)</title>
<!-- <link rel="stylesheet" href="<c:url value='/resources/css/attendance/attendanceCalendar.css'/>" />  -->
<script src="${path}/resources/js/attendance/calendar.js" defer ></script>
</head>

<style>

@charset "UTF-8";

.main-box{
    display: grid;
    grid-template-columns: 1fr 0.25fr;
    gap: 40px
}

#main-content{
    gap: 40px
}

#right-content{
    display: grid;
    grid-template-rows: 1fr 0.7fr 1fr;
    gap: 30px
}

#clock{
    padding: 20px;
    display: grid;
    grid-template-rows: 0.5fr 1fr 1.5fr 0.3fr;
    width: 100%;
    height: 100%;
    gap: 15px;
}
#date-box{
    color: var(--main-color-dark);
    font-size: 1.3em;
    font-weight: 200;
    display: flex;
    justify-content: center;
}
#time-box{
    color: var(--main-color-dark);
    font-size: 2.9em;
    font-weight: 500;
    display: flex;
    justify-content: center;
}
#btn-box{
    display: flex;
    justify-content: center;
    gap: 30px;
}
#btn-box > .btn{
    width: 120px;
    height: 70px;
    cursor: pointer;
    font-size: 1.7em;
    font-weight: 500;
}
#btn-box > .c-btn{
    width: 120px;
    height: 70px;
    cursor: pointer;
    font-size: 1.7em;
    font-weight: 500;
}
#work-week{
    padding: 20px;
    display: grid;
    grid-template-rows: 1fr 1fr 1.5fr 1.5fr;
    width: 100%;
    height: 100%;
    gap: 15px
}
#rest-information{
    padding: 20px;
    display: grid;
    grid-template-rows: 1fr 1fr 1fr 1fr 1fr 1fr;
    width: 100%;
    height: 100%;
    gap: 15px;
}
#result-box{
    display: grid;
    grid-template-columns: 1fr 1fr;
}
#result-box > div{
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1.4em;
    font-weight: 530;
}
#week-header{
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1.5em;
    font-weight: 500;
}
#select-week{
    display: flex;
    justify-content: center;
    align-items: center;
}
#information-header{
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1.5em;
    font-weight: 500;
}
#work-time, #work-time2{
    display: flex;
    align-items: center;
    font-size: 1em;
    font-weight: 530;
}
#restinfo1, #restinfo2, #restinfo3,#restinfo4,#restinfo5{
    display: grid;
    grid-template-columns: 1fr 1fr;
}
#restinfo1, #restinfo2, #restinfo3,#restinfo4,#restinfo5{
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 50px;
    background-color: #E2E2E2;
}
#restinfo-title1,#restinfo-title2,#restinfo-title3,#restinfo-title4,#restinfo-title5{
    color: blue;
}
.title-box{
    display: flex;
    align-items: center;
    gap: 20px;
}

.b-title{
    display: flex;
    align-items: center;
    justify-content: center;

    width: 130px;
    padding: 15px;
    border-bottom: 1px solid var(--main-color);
    font-size: 1.5em;
    font-weight: 500;
}

.hilight{
    color: var(--main-color);
}

.header-box{
    padding: 0 50px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.header-box .btn{
    padding-right: 15px;
    width: 100px;
}

.search-bar{
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: var(--bo-20);
    border-radius: 50px;
    padding: 5px 10px;
}

.search-bar input{
    width: 120px;
    height: 15px;
    border: none;
    background: none;
    outline: none;
    font-size: 12px;
    color: var(--bo-80);
}

.search-bar span{
    font-size: 1.3em;
    color: gray;
}

.list-box{
    width: 100%;
    height: 100%;
    align-self: center;
}

.list-item{
    display: grid;
    grid-template-columns: 2fr 1fr 1.5fr 1.5fr 1.5fr 1.5fr;
    height: 6%;
    border-bottom: 1px solid var(--bo-20);
    cursor: pointer;
}
.list-item p{
    padding: 0 20px;
    display: flex;
    align-items: center;
    justify-content: center;
}
.list-item p:not(:nth-of-type(2)){
    justify-content: center;
}
.list-item:hover p{
    color: var(--main-color);
}
.first-item{
    display: grid;
    grid-template-columns: 2fr 1fr 1.5fr 1.5fr 1.5fr 1.5fr ;
    height: 8%;
    border-top: 1px solid var(--bo-80);
    border-bottom: 1px solid var(--bo-80);
    font-size: 1em;
    font-weight: 600;
}
.first-item p{
    display: flex;
    align-items: center;
    justify-content: center;
}

.page-box{
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    align-self: center;
}
.page-btn{
    display: flex;
    align-items: center;
    justify-content: center;
    width: 25px;
    height: 25px;
    border-radius: 5px;
    cursor: pointer;
}
.page-btn:hover{
    border: 1px solid var(--main-color);
}
.checked-p-btn{
    background-color: var(--main-color);
    color: white;
}
.page-box span{
    color: var(--bo-60);
    cursor: pointer;
}
.page-box span:hover{
    color: black
}


/* ------------------------------------------------------------------ */
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
    /* display: grid;
    grid-template-rows: 1fr 1fr; */
    padding: 15px;
    text-align: right;
    border-bottom: 1px solid #aaa;
    border-left: 1px solid #aaa;
    z-index: 1;
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



/*  */

</style>

<body>

    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>

    <main class="main-box">

        <div id="main-content" class="box">
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
                    <div class="dates">
                        <div></div>
                        <div>123ddddd</div>
                    </div>
                </div>
            </div>
        </div>
        <div id="right-content">
            <div id="clock" class="box">
                <div id="date-box">2022-11-30</div>
                <div id="time-box">11:00</div>
                <div id="btn-box">
                    <div id="start-btn" class="btn">출근</div>
                    <div id="end-btn" class="c-btn">퇴근</div>
                </div>
                <div id="result-box">
                    <div>시작: &nbsp<input type="text" style="width: 50px; height: 25px;"></div>
                    <div>종료: &nbsp<input type="text" style="width: 50px; height: 25px;"></div>
                </div>
            </div>
            <div id="work-week" class="box">
                <div id="week-header">이번주 근로시간</div>
                <div id="select-week">    
                    <select name="category">
                        <option value="first">2022-11-28 ~ 2022-12-04</option>
                        <option value="second">2022-12-05 ~ 2022-12-11</option>
                        <option value="third">2022-12-12 ~ 2022-12-18</option>
                        <option value="four">2022-12-18 ~ 2022-12-25</option>
                        <option value="four">2022-12-26 ~ 2023-01-01</option>
                    </select>
                </div>
                <div id="work-time">
                    소정 근로시간 &nbsp&nbsp&nbsp&nbsp<progress max="100" value="70" style="width:140px; height: 35px;"></progress>
                </div>
                <div id="work-time2">
                    소정 외근로시간&nbsp&nbsp<progress max="100" value="10" style="width:140px; height:35px;"></progress>
                </div>
            </div>
            <div id="rest-information" class="box">
                <div id="information-header">내 휴가 정보</div>
                <div id="restinfo1" class="box">
                    <div id="restinfo-title1">입사일</div>
                    <div>2019-10-01</div>
                </div>
                <div id="restinfo2" class="box">
                    <div id="restinfo-title2">연차휴가</div>
                    <div>16일 0시간</div>
                </div>
                <div id="restinfo3" class="box">
                    <div id="restinfo-title3">사용연차</div>
                    <div> 10일 1시간</div>
                </div>
                <div id="restinfo4" class="box">
                    <div id="restinfo-title4">대체휴가</div>
                    <div> 0일 0시간</div>
                </div>
                <div id="restinfo5" class="box">
                    <div id="restinfo-title5">휴가 잔여일</div>
                    <div>5일 7시간</div>
                </div>
            </div>
        </div>
    
    </main>
    
    <script>

    //출근버튼
    document.querySelector("#start-btn").addEventListener("click", () => {
        popup.alertPop("출근","시간나오게");
    })

    //퇴근버튼
    document.querySelector("#end-btn").addEventListener("click", () => {
        popup.alertPop("퇴근","시간나오게");
    })

    </script>


</body>

</html>