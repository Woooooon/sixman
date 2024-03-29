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
                <div id="date-box" style="font-size: 1.3em; font-weight: 350; color: var(--main-color-dark);">${day}</div>
                <div id="time-box" style="font-size: 2.7em;">${time}</div>
                <div id="btn-box">
                    <div class="btn"><p>출 근</p></div>
                    <div class="btn"><p>퇴 근</p></div>
                </div>
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
            <article class="box" id="scadual-box">
                <div>
                    <div class="box-title">오늘일정</div>
                    <div class="item-box">
                         <div class="box-item">
                            <div></div>
                            <div>프로젝트 발표 준비</div>
                            <div>09:00</div>
                         </div>
                         <div class="box-item">
                            <div></div>
                            <div>프로젝트 발표</div>
                            <div>11:20</div>
                         </div>
                         <div class="box-item">
                            <div></div>
                            <div>뒷풀이</div>
                            <div>17:00</div>
                         </div>
                    </div>
                </div>
                <div>
                    <div class="box-title">내일일정</div>
                    <div class="item-box">
                        <div class="box-item">
                            <div></div>
                            <div>끝장나게 숨쉬기</div>
                            <div>08:00</div>
                         </div>
                        <div class="box-item">
                            <div></div>
                            <div>신나게 놀기</div>
                            <div>14:00</div>
                         </div>
                    </div>
                </div>
            </article>
        </section>
        <section id="g-col-3">
            <article class="box">
                <div id="prj-box">
                    <div class="prj-title">
                        <p>프로젝트</p>
                        <div class="prj-status">
                            <c:if test="${prjList[1].status eq 'C' }"><p>완료</p></c:if>
                        </div>
                    </div>
                    <div class="prj-detail-wrap">
                        <div class="prj-detail-title">
                            <p> ${prjList[1].title} </p>
                            <div class="prj-detail-leader"><p>리더 </p> <span>${prjList[1].leader}</span></div>
                        </div>
                        <div class="progressBar">
                            <div class="guage" value="${prjList[1].progress}">${prjList[1].progress}</div>
                            <input type="hidden" id="progress_val" value="${prjList[1].progress}">
                        </div>
                        <div class="dateBox">
                            <c:choose>
                                <c:when test="${fn:length(prjList[1].startDate) > 12 }">
                                    <div class="prj-detail-startDate"><p>시작 :</p><span><c:out value="${fn:substring(prjList[1].startDate, 0, 10)}" /></span></div>
                                </c:when>
                            </c:choose>
                            <c:choose>
                                <c:when test="${fn:length(prjList[1].endDate) > 12 }">
                                    <div class="prj-detail-endDate"><p>마감 :</p> <span><c:out value="${fn:substring(prjList[1].endDate, 0, 10)}" /></span></div>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </article>
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