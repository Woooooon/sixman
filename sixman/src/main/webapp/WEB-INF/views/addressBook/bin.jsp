<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="<c:url value='/resources/css/addressBook/bin.css'/>" />
        <script defer src="<c:url value='/resources/js/address/bin.js'/>"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
        <script src="https://kit.fontawesome.com/ae846b135b.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
        <main id="main-page" class="main-box">
            <div class="main-box-2">
                <aside id="myaddress-wrap" class="box">
                    <div class="sortation-title">
                        <span class="material-symbols-outlined"> contacts </span>
                        <p>주소록</p>
                    </div>
                    <div class="sortation-list">
                    	<c:forEach items="${sortationList}" var="j">
                            <c:if test="${j.no ne 1 }">
                                <ul>
                                    <div class="sortation-item">
                                        <label for="sortationNo${j.no}">
                                            <input type="checkbox" id="sortationNo${j.no}">
                                            <div class="toggleBtn">
                                                <span class="material-symbols-outlined">change_history</span>
                                            </div>
                                            ${j.name}
                                        </label>
                                    </div>
                                    <c:forEach items="${dlelteAddressListAll}" var="i">
                                        <c:if test="${j.no eq i.sortationNo}">
                                            <li>
                                                <div class="address-item">
                                                    <a href="/sixman/address/detail?no=${i.sortationNo}"><span class="material-symbols-outlined">storefront</span>${i.company}</a>
                                                </div>
                                            </li>													
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </c:if>
                    	</c:forEach>
                        <ul>
                            <div class="sortation-item">
                                <label for="sortationNo${defaultSortation.no}">
                                    <input type="checkbox" id="sortationNo${defaultSortation.no}">
                                    <div class="toggleBtn">
                                        <span class="material-symbols-outlined">change_history</span>
                                    </div>
                                    ${defaultSortation.name}
                                </label>
                            </div>
                            <c:forEach items="${dlelteAddressListAll}" var="i">
                                <c:if test="${j.no eq i.sortationNo}">
                                    <li>
                                        <div class="address-item">
                                            <a href="/sixman/address/detail?no=${i.sortationNo}"><span class="material-symbols-outlined">storefront</span>${i.company}</a>
                                        </div>
                                    </li>													
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                </aside>
                <section id="addressBook-wrap" class="box">
                    <div class="header">
                        <div class="title">
                            <span class="material-symbols-outlined">delete</span>
                            <label>휴지통</label>
                        </div>
                        <div class="address-search">
                            <form action="">
                                <select name="category" id="">
                                    <option value="a.name">이 름</option>
                                    <option value="a.phone">연락처</option>
                                    <option value="a.position">직 급</option>
                                    <option value="a.email">이메일</option>
                                    <option value="a.company">상 호</option>
                                    <option value="s.name">구 분</option>
                                </select>
                                <input type="text" name="keyword"/>
                                <input type="submit" value="검 색" />
                            </form>
                        </div>
                    </div>
                    <div class="body">
                        <div class="sortation">
                            <input type="checkbox" class="selectAll" id="selectAll" />
                            <p>구 분</p>
                            <p>상 호</p>
                            <p>이 름</p>
                            <p>직 급</p>
                            <p>전화번호</p>
                            <p>EMAIL</p>
                        </div>
	                    <c:forEach items="${dlelteAddressList}" var="i">
                            <label for="cardNo${i.no}">
                                <div class="card-item">
                                    <input type="checkbox" id="cardNo${i.no}" class="selectOne" value="${i.no}"/>
                                    <div class="card-sortation">
                                        <p>${i.sortationName}</p>
                                    </div>
                                    <p id="card-company">${i.company}</p>
                                    <p id="card-name">${i.name}</p>
                                    <p id="card-position">${i.position}</p>
                                    <p id="card-phone">${i.phone}</p>
                                    <p id="card-email">${i.email}</p>
                                </div>
                            </label>
                        </c:forEach>
                    </div>
                    <div class="footer">
                        <div class="controller">
                            <input type="button" id="restore" value="복 원">
                            <input type="button" id="delete" value="삭 제">
                        </div>
                        <div class="page-box">
                            <span class="material-symbols-outlined" <c:if test="${pv.currentPage ne 1}">onclick="location.href='/sixman/address?page=1&&category=${category}&&keyword=${keyword}'"</c:if>> keyboard_double_arrow_left </span>
                            <span class="material-symbols-outlined" <c:if test="${pv.currentPage ne 1}">onclick="location.href='/sixman/address?page=${pv.currentPage - 1}&&category=${category}&&keyword=${keyword}'"</c:if>> chevron_left </span>
                            <c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
                            <div class="page-btn <c:if test="${i eq pv.currentPage}"> checked-p-btn</c:if>" onclick="location.href='/sixman/address?page=${i}&&category=${category}&&keyword=${keyword}'">${i}</div>
                            </c:forEach>
                            <span class="material-symbols-outlined" <c:if test="${pv.maxPage ne pv.currentPage}">onclick="location.href='/sixman/address?page=${pv.currentPage + 1}&&category=${category}&&keyword=${keyword}'"</c:if>> chevron_right </span>
                            <span class="material-symbols-outlined" <c:if test="${pv.maxPage ne 1}">onclick="location.href='/sixman/address?page=${pv.maxPage}&&category=${category}&&keyword=${keyword}'"</c:if>> keyboard_double_arrow_right </span>
                        </div>
                    </div>
                </section>
            </div>
        </main>
    </body>
</html>
