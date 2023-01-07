<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="<c:url value='/resources/css/addressBook/recive.css'/>" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <script defer src="<c:url value='/resources/js/address/recive.js'/>"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    </head>
    <body>
        <%@include file="/WEB-INF/views/common/menuBar.jsp" %>

        <main id="main-page" class="main-box">
            <div class="main-box-2">
                <section id="recive-wrap" class="box">
                    <div class="header">
                        <div class="title">
                            <span class="material-symbols-outlined">contacts</span>
                            <label>주소록 받아오기</label>
                        </div>
                        <div class="sender-search">
                            <form action="">
                                <select name="category" id="">
                                    <option value="">이 름</option>
                                    <option value="">직 급</option>
                                    <option value="">부 서</option>
                                    <option value="">팀</option>
                                </select>
                                <input type="text" />
                                <input type="submit" value="검 색" />
                            </form>
                        </div>
                    </div>
                    <div class="body-controller">
                        <input type="checkbox" class="selectAll" />
                        <label for="">전체선택</label>
                        <span class="material-symbols-outlined reciveAllBtn" > download_for_offline </span>
                        <span class="material-symbols-outlined deleteAllBtn"> delete </span>
                    </div>
                    <div class="body">
                        <c:forEach items="${reciveList}" var="i">
                            <div class="card-item">
                                <input type="checkbox" id="cardNo${i.no}" class="cardCheck" value="${i.no}" />
                                <input type="text" value="${i.sendAddress}" class="addressNo">
                                <label for="cardNo${i.no}">
                                    <c:if test="${i.addressList.size() eq 1}">
                                        <div class="card-top">
                                            <div class="card-img">
                                                <img src="/sixman/resources/img/address/${i.addressList[0].fileName}" alt="명함사진" />
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${i.addressList.size() eq 2}">
                                        <div class="card-top grid-2">
                                            <div class="card-img">
                                                <img src="/sixman/resources/img/address/${i.addressList[0].fileName}" alt="명함사진" />
                                            </div>
                                            
                                            <div class="card-img">
                                                <img src="/sixman/resources/img/address/${i.addressList[1].fileName}" alt="명함사진" />
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${i.addressList.size() > 3}">
                                        <div class="card-top grid">
                                            <c:forEach items="${i.addressList}" var="j" end="3">
                                                <div class="card-img">
                                                    <img src="/sixman/resources/img/address/${j.fileName}" alt="명함사진" />
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </c:if>
                                </label>
                                <div class="card-bottom">
                                    <div class="sender-info">
                                        <div class="member-info">
                                            <p id="who">보낸사람</p>
                                            <p id="card-name">${i.senderName}</p>
                                            <p id="card-position">${i.senderPosition}</p>
                                        </div>
                                        <div class="member-info">
                                            <p id="card-dept">${i.senderDept}</p>
                                            <p id="card-team">${i.senderTeam}</p>
                                        </div>
                                    </div>
                                    <div class="show-date">
                                        <p class="card-date">${i.enrollDate}</p>
                                        <a id="card-detail" href="/sixman/address/recive/detail?no=${i.no}">자세히</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="footer">
                        <div class="page-box">
                            <span class="material-symbols-outlined" <c:if test="${pv.currentPage ne 1}">onclick="location.href='/sixman/address/reciver?page=1&&category=${category}&&keyword=${keyword}'"</c:if>> keyboard_double_arrow_left </span>
                            <span class="material-symbols-outlined" <c:if test="${pv.currentPage ne 1}">onclick="location.href='/sixman/address/reciver?page=${pv.currentPage - 1}&&category=${category}&&keyword=${keyword}'"</c:if>> chevron_left </span>
                            <c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
                            <div class="page-btn <c:if test="${i eq pv.currentPage}"> checked-p-btn</c:if>" onclick="location.href='/sixman/address/reciver?page=${i}&&category=${category}&&keyword=${keyword}'">${i}</div>
                            </c:forEach>
                            <span class="material-symbols-outlined" <c:if test="${pv.maxPage ne pv.currentPage}">onclick="location.href='/sixman/address/reciver?page=${pv.currentPage + 1}&&category=${category}&&keyword=${keyword}'"</c:if>> chevron_right </span>
                            <span class="material-symbols-outlined" <c:if test="${pv.maxPage ne 1}">onclick="location.href='/sixman/address/reciver?page=${pv.maxPage}&&category=${category}&&keyword=${keyword}'"</c:if>> keyboard_double_arrow_right </span>
                        </div>
                    </div>
                </section>
            </div>
        </main>
    </body>
</html>
