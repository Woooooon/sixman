<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일별근무시간</title>
<%-- <link rel="stylesheet" href="<c:url value='/resources/css/attendance/attendanceBoard.css'/>" /> --%>
<script src="${path}/resources/js/attendance/board.js" defer ></script>
</head>

<style>

.main-box{
    display: grid;
    grid-template-columns: 1fr 0.25fr;
    gap: 40px
}

#main-content{
    display: grid;
    grid-template-rows: 1fr 9fr;
    gap: 40px
}

#right-content{
    display: grid;
    grid-template-rows: 1fr 0.7fr 1fr;
    gap: 30px
}

#search-box{
    gap: 10px;
	padding: 20px;
    display: flex;
    width: 100%;
    height: 100%;
}
#search-box{
    display: grid;
    grid-template-columns: 1fr 0.7fr 0.7fr 0.7fr 0.7fr 3fr 1fr 4fr;
}
#search-box div{
    display: flex;
    justify-content: center;
    align-items: center;
}
#search-font{
    font-size: 1.2em;
    font-weight: 600;
    display: flex;
    justify-content: center;
    align-items: center;
}

#notice-box{
    padding: 40px;
    display: flex;
    flex-direction: column;
    width: 100%;
    height: 100%;
    gap: 15px;
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
#btn-box > form > .btn{
    width: 120px;
    height: 70px;
    cursor: pointer;
    font-size: 1.7em;
    font-weight: 500;
    border: none;
}
#btn-box > form > .c-btn{
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
#restinfo2, #restinfo3{
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 50px;
    background-color: #E2E2E2;
}
#restinfo1{
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 65px;
    background-color: #E2E2E2;
}
#restinfo4{
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 58px;
    background-color: #E2E2E2;
}
#restinfo5{
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 40px;
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
/* .list-item:hover p{
    color: var(--main-color);
} */
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

#date-btn{
    /* padding-right: 15px; */
    width: 100px;
    border: none;
}

.progress {
    margin-left: 25px;
    background-color: #D3D3D3;
    border-radius: 15px;
    height: 20px;
    width: 130px;
}

.progress-bar {
    display: flex;
    align-items: center;
    justify-content: center;
    background-image: repeating-linear-gradient(
    to left,
    #12887A,
    #2fa597,
    #59c0b4);
    box-shadow: 0 5px 5px -6px #12887A, 0 3px 7px #2fa597;
    border-radius: 15px;
    color: #fff;
    height: 100%;
    width: 0;
    transition: 1s ease 0.3s;
}



</style>

<body>

    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
    
<main class="main-box">
    <div id="main-content">
        <div>
            <form action="/sixman/attendance/board3" method="post">
                <div id="search-box" class="box">
                    <div id="search-font">검색기간</div>
                    <div class="btn">7일</div>
                    <div class="btn">1개월</div>
                    <div class="btn">3개월</div>
                    <div class="btn">1년</div>
                    <div id="date">
                        <input id="start-day" type="date" style="width: 100px;" name="start" value="2022-01-01">
                        ~
                        <input id="end-day" type="date" style="width: 100px;" name="end">
                    </div>
                    <div><input class="btn" id="date-btn" type="submit" value="검색"></div>
                    <div></div>
                </div>
            </form>         
        </div>
        <div>
            <div id="notice-box" class="box">
                <div class="list-box">
                    <div class="first-item">
                        <p>날짜</p>
                        <p>성명</p>
                        <p>시작시간</p>
                        <p>종료시간</p>
                        <p>추가근무시간</p>
                        <p>총 근무시간</p>
                    </div>
                        <c:forEach items="${voList}" var="x">
                            <div class="list-item">
                                <p>${x.workDay}</p>
                                <p>${x.name}</p>
                                <p>${x.start}</p>
                                <p>${x.end}</p>
                                <p>${x.workoverTime}</p>
                                <p>${x.workTime}</p>
                            </div>
                        </c:forEach>
                </div>
                <div class="page-box">
                	<span class="material-symbols-outlined" <c:if test="${pv.currentPage ne 1}">onclick="location.href='/sixman/attendance/board?page=1'"</c:if>> keyboard_double_arrow_left </span>
                    <span class="material-symbols-outlined" <c:if test="${pv.currentPage ne 1}">onclick="location.href='/sixman/attendance/board?page=${pv.currentPage - 1}'"</c:if>> chevron_left </span>
                    <c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
                    <div class="page-btn <c:if test="${i eq pv.currentPage}"> checked-p-btn</c:if>" onclick="location.href='/sixman/attendance/board?page=${i}'">${i}</div>
                    </c:forEach>
                    <span class="material-symbols-outlined" <c:if test="${pv.maxPage ne pv.currentPage}">onclick="location.href='/sixman/attendance/board?page=${pv.currentPage + 1}'"</c:if>> chevron_right </span>
                    <span class="material-symbols-outlined" <c:if test="${pv.maxPage ne 1 and pv.maxPage eq pv.currentPage}">onclick="location.href='/sixman/attendance/board?page=${pv.maxPage}'"</c:if>> keyboard_double_arrow_right </span>
                </div>
            </div>
        </div>
    </div>
    <div id="right-content">
        <div id="clock" class="box">
            <div id="date-box">${day}</div>
            <div id="time-box">${time}</div>
            <div id="btn-box">
                <form action="/sixman/attendance/board" method="post"><input type="submit" name="" id="start-btn" class="btn" value="출근"></form>
                <form action="/sixman/attendance/board2" method="post"><input type="submit" name="" id="end-btn" class="c-btn" value="퇴근"></form>
            </div>
            <div id="result-box">
                <div>시작: ${todayWork.start}</div>
                <div>종료: ${todayWork.end}</div>
            </div>
        </div>
        <div id="work-week" class="box">
            <div id="week-header">이번주 근로시간</div>
            <div id="select-week">
                <input id="start-day" type="date" style="width: 100px;" name="start" value="2022-01-08">
                        ~
                <input id="end-day" type="date" style="width: 100px;" name="end" value="2023-01-14">
            </div>
            <div id="work-time">
                총 근무시간 &nbsp&nbsp 
                <div class="progress">
                    <div class="progress-bar" style="width:80%;">80%</div>
                </div>
            </div>
            <div id="work-time2">
                추가 근무시간                
                <div class="progress">
                    <div class="progress-bar" style="width:30%;">30%</div>
                </div>
            </div>
        </div>
        <div id="rest-information" class="box">
            <div id="information-header">내 휴가 정보</div>
            <div id="restinfo1" class="box">
                <div id="restinfo-title1">입사일</div>
                <div>2022-01-02</div>
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

    //오늘날짜 이후는 선택못하게 제한설정
    var now_utc = Date.now()
    var timeOff = new Date().getTimezoneOffset()*60000;
    var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
    document.getElementById("end-day").setAttribute("max", today);
    document.getElementById("start-day").setAttribute("max", today);

    //오늘날짜
    document.getElementById('end-day').value = new Date().toISOString().substring(0, 10);

    //출근버튼
    // document.querySelector("#start-btn").addEventListener("click", () => {
    //     popup.alertPop("출근","시간나오게");
    // })

    //퇴근버튼
    // document.querySelector("#end-btn").addEventListener("click", () => {
    //     popup.alertPop("퇴근","시간나오게");
    // })

    var start = document.getElementById('start123');
    var end = document.getElementById('end123');

    var result = start-end;
    

    const progress = document.querySelector('.progress-bar');
const valueinput = document.querySelector('.valueinput');
const maxIntput = document.querySelector('.maxinput');

let finalValue = valueinput.value;
let max = 100;
changeGuage()

function changeGuage(){
    progress.style.width = `${(finalValue / max) * 100}%`;
    progress.innerText = `${Math.ceil((finalValue / max) * 100)}%`;
}

 

</script>

</body>
</html>