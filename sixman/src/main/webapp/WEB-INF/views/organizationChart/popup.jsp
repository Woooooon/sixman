<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="<c:url value='/resources/css/organizationChart/popup.css'/>" />
        <!-- <link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>" /> -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <script defer src="<c:url value='/resources/js/organizationChart/popup.js'/>"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    </head>
    <body>
        <main>
            <div class="main-box-2" >
                <section id="employee-wrap" class="box">
                    <header id="employee-search">
                        <form action="" method="get">
                            <div id="search-content">
                                <input type="text" name="keyword"/>
                                <input type="submit" value="검 색" />
                            </div>
                            <div id="search-controller">
                                <label for="name">이 름<input type="radio" id="name" value="m.name" name="category" /></label>
                                <label for="deptName">부 서<input type="radio" id="deptName" value="d.name" name="category" /></label>
                                <label for="teamName">팀<input type="radio" id="teamName" value="t.name" name="category" /></label>
                                <label for="id">사 번<input type="radio" id="id" value="m.id" name="category" /></label>
                                <label for="positionName">직 급<input type="radio" id="positionName" value="p.position" name="category" /></label>
                            </div>
                        </form>
                    </header>
                    <article id="employee-list">
                        <div class="header">
                            <div class="title">
                                <span class="material-symbols-outlined">person_search</span>
                                <label>사원 조회</label>
                            </div>
                        </div>
                        <div id="employee-info-wrap">
                            <div id="sortation">
                                <input type="checkbox" class='selectAll'>
                                <p>사번</p>
                                <p>이름</p>
                                <p>직급</p>
                                <p>부서</p>
                                <p>팀</p>
                                <p>입사날짜</p>
                            </div>
                        <c:forEach items="${MemberList}" var="i">
                            <label for="member${i.no}">
                                <div class="list-item">
                                    <input type="checkbox" id="member${i.no}" name="memberInfo" value='${i.no}' class='selectOne'/>
                                    <p class="hide list-file">${i.fileName}</p>
                                    <p class="hide list-no">${i.no}</p>
                                    <p class="hide list-email">${i.email}</p>
                                    <p class="list-id">${i.id}</p>
                                    <p class="list-name">${i.name}</p>
                                    <p class="list-position">${i.positionName}</p>
                                    <c:if test="${i.deptNo eq 1}">
                                        <p class="list-dept"></p>
                                    </c:if>
                                    <c:if test="${i.deptNo ne 1}">
                                        <p class="list-dept">${i.deptName}</p>
                                    </c:if>
                                    <p class="list-team">${i.teamName}</p>
                                    <p class="list-date">${i.joinDate}</p>
                                </div>
                            </label>
                            </c:forEach>
                        </div>
                        <div class="page-box">
                            <input type="button" id='push' value='완료'>
                            <span class="material-symbols-outlined" <c:if test="${pv.currentPage ne 1}">onclick="location.href='/sixman/employee/list?page=1&&category=${category}&&keyword=${keyword}'"</c:if>> keyboard_double_arrow_left </span>
                            <span class="material-symbols-outlined" <c:if test="${pv.currentPage ne 1}">onclick="location.href='/sixman/employee/list?page=${pv.currentPage - 1}&&category=${category}&&keyword=${keyword}'"</c:if>> chevron_left </span>
                            <c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
                            <div class="page-btn <c:if test="${i eq pv.currentPage}"> checked-p-btn</c:if>" onclick="location.href='/sixman/employee/list?page=${i}&&category=${category}&&keyword=${keyword}'">${i}</div>
                            </c:forEach>
                            <span class="material-symbols-outlined" <c:if test="${pv.maxPage ne pv.currentPage}">onclick="location.href='/sixman/employee/list?page=${pv.currentPage + 1}&&category=${category}&&keyword=${keyword}'"</c:if>> chevron_right </span>
                            <span class="material-symbols-outlined" <c:if test="${pv.maxPage ne 1}">onclick="location.href='/sixman/employee/list?page=${pv.maxPage}&&category=${category}&&keyword=${keyword}'"</c:if>> keyboard_double_arrow_right </span>
                        </div>
                    </article>
                </section>
            </div>
        </main>
    </body>
</html>
