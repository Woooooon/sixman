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

</style>

<body>

    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
<main class="main-box">
    <div id="main-content">
        <div>
            <div id="search-box" class="box">
                <div id="search-font">검색기간</div>
                <div>
                    <button>7일</button>
                </div>
                <div>
                    <button>1개월</button>
                </div>
                <div>
                    <button>3개월</button>
                </div>
                <div>
                    <button>1년</button>
                </div>
                <div id="date">
                    <input id="start-day" type="date" style="width: 100px;">
                    ~
                    <input id="end-day" type="date" style="width: 100px;">
                </div>
                <div class="btn">검색</div>
                <div></div>
            </div>
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
                    <div class="list-item"> <p>2022-11-28</p> <p>양수철</p> <p>09:00</p> <p>18:00</p> <p>0</p> <p>8</p></div>
                    <div class="list-item"> <p>2022-11-27</p> <p>양수철</p> <p>09:00</p> <p>18:00</p> <p>0</p> <p>8</p></div>
                    <div class="list-item"> <p>2022-11-26</p> <p>양수철</p> <p>09:00</p> <p>18:00</p> <p>0</p> <p>8</p></div>
                    <div class="list-item"> <p>2022-11-25</p> <p>양수철</p> <p>09:00</p> <p>18:00</p> <p>0</p> <p>8</p></div>
                    <div class="list-item"> <p>2022-11-24</p> <p>양수철</p> <p>09:00</p> <p>18:00</p> <p>0</p> <p>8</p></div>
                    
                </div>
                <div class="page-box">
                    <span class="material-symbols-outlined"> keyboard_double_arrow_left </span>
                    <span class="material-symbols-outlined"> chevron_left </span>
                    <div class="page-btn checked-p-btn">1</div>
                    <div class="page-btn">2</div>
                    <div class="page-btn">3</div>
                    <div class="page-btn">4</div>
                    <div class="page-btn">5</div>
                    <span class="material-symbols-outlined"> chevron_right </span>
                    <span class="material-symbols-outlined"> keyboard_double_arrow_right </span>
                </div>
            </div>
        </div>
    </div>
    <div id="right-content">
        <div id="clock" class="box">
            <div id="date-box">${day}</div>
            <div id="time-box">${time}</div>
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

    //오늘날짜 이후는 선택못하게 제한설정
    var now_utc = Date.now()
    var timeOff = new Date().getTimezoneOffset()*60000;
    var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
    console.log(today)
    document.getElementById("end-day").setAttribute("max", today);
    document.getElementById("start-day").setAttribute("max", today);

    //오늘날짜
    document.getElementById('end-day').value = new Date().toISOString().substring(0, 10);

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