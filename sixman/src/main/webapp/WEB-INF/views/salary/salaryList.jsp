<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link rel="stylesheet" href="<c:url value='/resources/css/salary/salaryList.css'/>" /> --%>
<%-- <script src="${path}/resources/js/salary/salaryList.js" defer ></script> --%>
</head>

<style>


/* 달력 */
.dateHead div {
  background: #e31b20;
  color: #fff;
  text-align: center;
  border-radius: 5px;
}

.grid {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  grid-gap: 5px;
}

.grid div {
  padding: .6rem;
  font-size: .9rem;
  cursor: pointer;
}

.dateBoard div {
  color: #222;
  font-weight: bold;
  min-height: 6rem;
  padding: .6rem .8rem;
  border-radius: 5px;
  border: 1px solid #eee;
}

.noColor {
  background: #eee;
}

.header {
  display: flex;
  justify-content: space-between;
  padding: 1rem 2rem;
}

/* 좌우 버튼 */
.btn {
 display: block;
 width: 20px;
 height: 20px;
 border: 3px solid #000;
 border-width: 3px 3px 0 0;
 cursor: pointer;
}

.prevDay {
  transform: rotate(-135deg);
}

.nextDay {
  transform: rotate(45deg);
}

/* ---- */

@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css");

* {
  margin: 0;
  padding: 0;
  list-style: none;
  box-sizing: border-box;  
  font-family: Pretendard;
}

.rap {
  max-width: 820px;
  padding: 0 1.4rem;
  margin-top: 1.4rem;
}

.dateHead {
  margin: .4rem 0;
}



</style>

<body>

    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
<main class="main-box">

 <div class='rap'>
    <div class="header">
       <div class="btn prevDay"></div>
      <h2 class='dateTitle'></h2>
      <div class="btn nextDay"></div>
    </div>
    
    <div class="grid dateHead">
      <div>일</div>
      <div>월</div>
      <div>화</div>
      <div>수</div>
      <div>목</div>
      <div>금</div>
      <div>토</div>
    </div>

    <div class="grid dateBoard"></div>
  </div>
    
</main>

<script>
//달력 생성
 const makeCalendar = (date) => {
 // 현재 년도와 월 받아오기
 const currentYear = new Date(date).getFullYear();
 const currentMonth = new Date(date).getMonth() + 1;

 // 첫날의 요일 구하기 - 초기 시작위치를 위해서
 const firstDay = new Date(date.setDate(1)).getDay();
 // 마지막 날짜 구하기
 const lastDay = new Date(currentYear, currentMonth, 0).getDate();

 // 남은 박스만큼 다음달 날짜 표시
 const limitDay = firstDay + lastDay;
 const nextDay = Math.ceil(limitDay / 7) * 7;

 let htmlDummy = '';

 // 한달전 날짜 표시하기
 for (let i = 0; i < firstDay; i++) {
   htmlDummy += `<div class="noColor"></div>`;
 }

 // 이번달 날짜 표시하기
 for (let i = 1; i <= lastDay; i++) {    
   htmlDummy += `<div>${i}</div>`;
 }

 // 다음달 날짜 표시하기
 for (let i = limitDay; i < nextDay; i++) {
   htmlDummy += `<div class="noColor"></div>`;
 }

 document.querySelector(`.dateBoard`).innerHTML = htmlDummy;
 document.querySelector(`.dateTitle`).innerText = `${currentYear}년 ${currentMonth}월`;
}


const date = new Date();

makeCalendar(date);

//이전달 이동
document.querySelector(`.prevDay`).onclick = () => {
makeCalendar(new Date(date.setMonth(date.getMonth() - 1)));
}

//다음달 이동
document.querySelector(`.nextDay`).onclick = () => {
makeCalendar(new Date(date.setMonth(date.getMonth() + 1)));
}
</script>

</body>
</html>