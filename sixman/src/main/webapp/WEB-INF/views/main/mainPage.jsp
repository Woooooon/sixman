<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var = "path" value = "${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='resources/css/mainPage.css'/>">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script defer src="${path}\resources\js\main\maincalendar.js"></script>
</head>
<script>
    window.addEventListener('load', ()=>{
        getNotificationPermission();
       
    });
</script>
<body>

<%@include file="/WEB-INF/views/common/menuBar.jsp" %>

<main id="main-page" class="main-box">
    <div id="main-page2">
        <section id="g-col-1">
            <article id="main-box1" class="box">
                <div id="time-box">11월 11일 11:00</div>
                <div id="btn-box">
                    <div class="btn"><p>출 근</p></div>
                    <div class="btn"><p>퇴 근</p></div>
                </div>
                <div id="status-box"></div>
            </article>
            <article id="main-box2" class="box">
                <div id="main-mail">
                    <div><span class="material-symbols-outlined">mail</span></div>
                    <div><p>${mailMap.nonListCount}</p>/<p>${mailMap.listCount}</p></div>
                    <div class="btn" onclick="location.href='${path}/mail/write'"><p>메일작성</p></div>
                </div>
                <div id="mail-list">
                    <div onclick="location.href='${path}/mail/list'">최근메일</div>
                    <c:forEach items="${mailMap.list}" var="vo">
                    	<div class="box-item" onclick="location.href='${path}/mail/detail?no=${vo.mailNo}'"><p>${vo.userName}</p><p>${vo.title}</p><p>${fn:substring(vo.sendTime,5,10)}</p></div>
                    </c:forEach>
                </div>
            </article>
            <article id="document-box" class="box">
                <div class="box-title">전자문서</div>
                <div>
                    <div>
                        <span class="material-symbols-outlined">edit_document</span>
                        <p>기안문서</p>
                        <p>21</p>
                    </div>
                    <div>
                        <span class="material-symbols-outlined">description</span>
                        <p>결재문서</p>
                        <p>21</p>
                    </div>
                    <div>
                        <span class="material-symbols-outlined">task</span>
                        <p>완료문서</p>
                        <p>21</p>
                    </div>
                </div>
            </article>
            <article class="box">
                <div class="box-title" onclick="location.href='${path}/notice/list'">공지사항</div>
                <div class="item-box">
                    <c:forEach items="${noticelist}" var="vo">
                    	<div class="box-item" onclick="location.href='${path}/notice/detail?no=${vo.no}'"><p>[공지사항]</p><p>${vo.title}</p><p>${fn:substring(vo.enrollDate,5,10)}</p></div>
                    </c:forEach>
                </div>
            </article>
        </section>
        <section id="g-col-2">
            <article id="calendar-box" class="box">
                <div class="header">
                    <div class="year-month"></div>
                    <div class="nav">
                        <button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
                        <button class="nav-btn go-today" onclick="goToday()">오늘</button>
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
            </article>
            <article class="box"></article>
        </section>
        <section id="g-col-3">
            <article class="box"></article>
            <article class="box">
                <div id="dept-detail">
                    <div id="dept-detail-title">
                        <h2>${loginMember.deptName}</h2>
                        <h3>${loginMember.teamName}</h3>
                    </div>
                    <div class="dept-list-wrap">
                        <c:forEach items="${deptMemberList}" var="i">
                            <div class="dept-detail-list">
                                <div class="dept-employee-detail">
                                    <div class="dept-employee-pic">
                                        <img src="<c:url value='/resources/img/profile/${i.fileName}'/>" alt="" />
                                    </div>
                                    <p>${i.name}</p>
                                    <p>${i.positionName}</p>
                                </div>
                                <div class="dept-list-controller">
                                    <a href="/sixman/mail/write?email=${i.email}"><span class="material-symbols-outlined">mail</span></a>
                                    <a href="/sixman/address/add?email=${i.email}&name=${i.name}&position=${i.positionName}&company=${i.name}&phone=${i.phone}"><span class="material-symbols-outlined">group_add</span></a>
                                    <a href=""><span class="material-symbols-outlined">sms</span></a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </article>
        </section>
    </div>
</main>

</body>
</html>