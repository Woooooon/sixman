<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="<c:url value='/resources/css/addressBook/detail.css'/>" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <script defer src="<c:url value='/resources/js/address/detail.js'/>"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        
        <script src="https://kit.fontawesome.com/ae846b135b.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="/WEB-INF/views/common/menuBar.jsp" %>

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
                <section id="card-wrap" class="box">
                    <div class="header">
                        <span class="material-symbols-outlined">contacts</span>
                        <label>${selectAddress.company}</label>
                    </div>
                    <div class="body">
                        <form action="/sixman/address/detail" method="POST" enctype="multipart/form-data" id="form">
                            <div id="card-pic">
                                <img src="<c:url value='/resources/img/address/${selectAddress.fileName}'/>" alt="" class="image-box" />
                            </div>
                            <div id="pic-controller">
                                <label for="pic-add" onchange="readURL(this)">
                                    <input type="text" id="addNo" name="no" value="${selectAddress.no}"/>
                                    <span class="material-symbols-outlined">add</span>
                                    <input type="file" id="pic-add" name="cardFile" />명함 추가
                                </label>
                            </div>
                            <div id="card-info">
                                <div class="info-box left">
                                    <label for="">
                                        <p>상 호</p>
                                        <input type="text" name="company" value="${selectAddress.company}"/>
                                    </label>
                                    <label for="">
                                        <p>성 명</p>
                                        <input type="text" name="name" value="${selectAddress.name}"/>
                                    </label>
                                </div>
                                <div class="info-box right">
                                    <label for="">
                                        <p>구 분</p>
                                        <select name="sortationNo" id="">
                                            <option value="${defaultSortation.no}" <c:if test="${selectAddress.sortationName eq defaultSortation.name}"> selected </c:if>>${defaultSortation.name}</option>
                                            <c:forEach items="${sortationList}" var="i">
                                                <option value="${i.no}" <c:if test="${selectAddress.sortationName eq i.name}"> selected </c:if>>${i.name}</option>
                                            </c:forEach>
                                        </select>
                                    </label>
                                    <label for="">
                                        <p>직 급</p>
                                        <input type="text" name="position" value="${selectAddress.position}" />
                                    </label>
                                </div>
                            </div>
                            <div id="card-phone-email">
                                <label for="">
                                    <p>연락처</p>
                                    <input type="text" name="phone" value="${selectAddress.phone}"  />
                                </label>
                                <label for="">
                                    <p>E-MAIL</p>
                                    <input type="text" name="email" value="${selectAddress.email}"  />
                                </label>
                            </div>
                            <div id="card-info-address">
                                <label for="">주 소</label>
                                <input type="text" id="address" name="address"  value="${selectAddress.address}" />
                                <button type="button" id="address_kakao">검 색</button>
                            </div>
                            <div id="memo">
                                <div id="title">
                                    <p>Memo</p>
                                </div>
                                <textarea name="comment">${selectAddress.comment}</textarea>
                            </div>
                            <div id="sub">
                                <input type="submit" value="수 정" />
                            </div>
                        </form>
                    </div>
                </section>
            </div>
        </main>
    </body>
</html>
