<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="<c:url value='/resources/css/addressBook/list.css'/>" />
        <script defer src="<c:url value='/resources/js/address/list.js'/>"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
        <script src="https://kit.fontawesome.com/ae846b135b.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
        <div class="share-modal close">
            <form action="/sixman/address/send" method='POST'>
                <div class="receiver">
                    <label for="">받는사람</label>
                    <input type="text" name="reciver"/>
                    <input type="text" id="reciverName"/>
                    <input type="submit" value="전 송" />
                    <span class="material-symbols-outlined" id="close-modal"> close </span>
                </div>
                <div class="select-list">
                    <div class="list-title">
                        <span class="material-symbols-outlined">contacts</span>
                        <label for="">주소록</label>
                    </div>
                    <div class="list-sortation">
                        <p></p>
                        <p>구 분</p>
                        <p>상 호</p>
                        <p>이 름</p>
                        <p>연락처</p>
                        <p>EMAIL</p>
                    </div>
                </div>
                
            </form>
        </div>
        <main id="main-page" class="main-box">
            <div class="main-box-2">
                <aside id="myaddress-wrap" class="box">
                    <div class="sortation-title">
                        <div class="title-sor">
                            <span class="material-symbols-outlined"> contacts </span>
                            <p>주소록</p>
                        </div>
                        <span class="material-symbols-outlined" id="cateSet">auto_fix</span>
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
                                    <c:forEach items="${addressListAll}" var="i">
                                        <c:if test="${j.no eq i.sortationNo}">
                                            <li>
                                                <div class="address-item">
                                                    <a href="/sixman/address/detail?no=${i.no}"><span class="material-symbols-outlined">storefront</span>${i.company}</a>
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
                            <c:forEach items="${addressListAll}" var="i">
                                <c:if test="${defaultSortation.no eq i.sortationNo}">
                                    <li>
                                        <div class="address-item">
                                            <a href="/sixman/address/detail?no=${i.no}"><span class="material-symbols-outlined">storefront</span>${i.company}</a>
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
                            <span class="material-symbols-outlined">contacts</span>
                            <label>주소록</label>
                        </div>
                        <div class="address-search">
                            <form action="">
                                <select name="category" id="">
                                    <option value="a.name">이 름</option>
                                    <option value="a.phone">연락처</option>
                                    <option value="a.position">직 급</option>
                                    <option value="a.email">이메일</option>
                                    <option value="a.address">주 소</option>
                                    <option value="a.company">상 호</option>
                                    <option value="s.name">구 분</option>
                                </select>
                                <input type="text" name="keyword"/>
                                <input type="submit" value="검 색" />
                            </form>
                        </div>
                    </div>
                    <div class="body-controller">
                        <input type="checkbox" class="selectAll" id="selectAll" />
                        <label for="selectAll">전체선택</label>
                        <a href="/sixman/address/add"><span class="material-symbols-outlined"> add_box </span></a>
                        <span class="material-symbols-outlined delete"> delete </span>
                        <span class="material-symbols-outlined share" id="checkShare"> share </span>
                    </div>
                    <div class="body">
	                    <c:forEach items="${addressList}" var="i">
	                        <div class="card-item">
	                            <input type="checkbox" id="cardNo${i.no}" class="cardCheck" value="${i.no}"/>
	                            <div class="card-sortation">
	                                <p>${i.sortationName}</p>
	                            </div>
	                            <div class="card-top">
	                                <label for="cardNo${i.no}">
	                                    <img src="/sixman/resources/img/address/${i.fileName}" alt="명함사진" />
	                                </label>
	                            </div>
	                            <div class="card-bottom">
	                                <div class="essential-info">
	                                    <p id="card-name">${i.name}</p>
	                                    <p id="card-company"><i class="fa-solid fa-building"></i>${i.company}</p>
	                                </div>
	                                <p id="card-address">${i.address}</p>
	                                <div class="info-phone">
                                        <strong>Tel.</strong>
                                        <p id="card-phone">${i.phone}</p>
                                    </div>
	                                <div class="info-email">
                                        <strong>Mail.</strong>
                                        <a id="card-email" href="/sixman/mail/write?email=${i.email}">${i.email}</a>
                                    </div>
	                                <a id="card-detail" href="/sixman/address/detail?no=${i.no}">자세히</a>
	                            </div>
	                        </div>
                        </c:forEach>
                    </div>
                    <div class="footer">
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
