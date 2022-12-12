<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/attendance/attendanceAdmin.css'/>" />
</head>

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
                    <input type="date" placeholder="2022-12-02" style="width: 100px;">
                    ~
                    <input type="date" placeholder="2022-12-02" style="width: 100px;">
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
                    <div class="list-item"> <p>2022-11-28</p> <p>심원용</p> <p>09:00</p> <p>18:00</p> <p>0</p> <p>8</p></div>
                    <div class="list-item"> <p>2022-11-27</p> <p>심원용</p> <p>09:00</p> <p>18:00</p> <p>0</p> <p>8</p></div>
                    <div class="list-item"> <p>2022-11-26</p> <p>심원용</p> <p>09:00</p> <p>18:00</p> <p>0</p> <p>8</p></div>
                    <div class="list-item"> <p>2022-11-25</p> <p>심원용</p> <p>09:00</p> <p>18:00</p> <p>0</p> <p>8</p></div>
                    <div class="list-item"> <p>2022-11-24</p> <p>심원용</p> <p>09:00</p> <p>18:00</p> <p>0</p> <p>8</p></div>
                   
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
            <div id="date-box">2022-11-30</div>
            <div id="time-box">11:00</div>
            <div id="btn-box">
                <div class="btn">출근</div>
                <div class="c-btn">퇴근</div>
            </div>
            <div id="result-box">
                <div>시작: &nbsp<input type="text" style="width: 50px; height: 25px;"></div>
                <div>종료: &nbsp<input type="text" style="width: 50px; height: 25px;"></div>
            </div>
        </div>
        <div id="work-week" class="box">
            <div id="week-header">이번주 근로시간</div>
            <div>
                <select name="category">
                    <option value="first">2022-12</option>
                    <option value="second">2022-11</option>
                    <option value="third">2022-10</option>
                    <option value="four">2022-09</option>
                </select>
                <select name="category2">
                    <option value="first">2022-11-28 ~ 2022-12-04</option>
                    <option value="second">2022-12-05 ~ 2022-12-11</option>
                    <option value="third">2022-12-12 ~ 2022-12-18</option>
                    <option value="four">2022-12-18 ~ 2022-12-25</option>
                    <option value="four">2022-12-26 ~ 2023-01-01</option>
                </select>
            </div>
            <div id="work-time">
                소정 근로시간 &nbsp&nbsp&nbsp&nbsp<input type="text" style="width: 50px; height: 25px;">
            </div>
            <div id="work-time2">
                소정 외근로시간 &nbsp<input type="text"style="width: 50px; height: 25px;">
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

</body>
</html>