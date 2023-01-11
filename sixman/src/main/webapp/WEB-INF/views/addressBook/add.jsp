<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="<c:url value='/resources/css/addressBook/add.css'/>" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <script defer src="<c:url value='/resources/js/address/add.js'/>"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script src="https://kit.fontawesome.com/ae846b135b.js" crossorigin="anonymous"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
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
                        <span class="material-symbols-outlined"> new_label </span>
                        <label>주소록 등록</label>
                    </div>
                    <div class="body">
                        <form action="/sixman/address/add" method="POST" enctype="multipart/form-data" id="form">
                            <div id="card-pic">
                                <img src="<c:url value='/resources/img/address/defaultAddressPic.png'/>" alt="" class="image-box" />
                            </div>
                            <div id="pic-controller">
                                <label for="pic-add" onchange="readURL(this)">
                                    <span class="material-symbols-outlined">add</span>
                                    <input type="file" id="pic-add" name="cardFile" />명함 추가
                                </label>
                            </div>
                            <div id="card-info">
                                <div class="info-box left">
                                    <label for="">
                                        <p>* 상 호</p>
                                        <input type="text" name="company" placeholder="필수 입력 사항입니다"/>
                                    </label>
                                    <label for="">
                                        <p>* 성 명</p>
                                        <input type="text" name="name" placeholder="영문 또는 한글로 작성 해주세요."/>
                                    </label>
                                </div>
                                <div class="info-box right">
                                    <label for="">
                                        <p>구 분</p>
                                        <select name="sortationNo" id="">
                                            <option value="${defaultSortation.no}">${defaultSortation.name}</option>
                                            <c:forEach items="${sortationList}" var="i">
                                                <option value="${i.no}">${i.name}</option>
                                            </c:forEach>
                                        </select>
                                    </label>
                                    <label for="">
                                        <p>직 급</p>
                                        <input type="text" name="position" placeholder="영문 또는 한글로 작성 해주세요."/>
                                    </label>
                                </div>
                            </div>
                            <div id="card-phone-email">
                                <label for="">
                                    <p>* 연락처</p>
                                    <input type="text" name="phone" placeholder="'-'제외 후 입력 해 주세요."/>
                                </label>
                                <label for="">
                                    <p>E-MAIL</p>
                                    <input type="text" name="email" value="${email}" placeholder="Sixman@SIXMAN.com"/>
                                </label>
                            </div>
                            <div id="card-info-address">
                                <label for="">주 소</label>
                                <input type="text" id="address" name="address" />
                                <button type="button" id="address_kakao">검 색</button>
                            </div>
                            <div id="memo">
                                <div id="title">
                                    <p>Memo</p>
                                </div>
                                <textarea name="comment"></textarea>
                            </div>
                            <div id="sub">
                                <input type="submit" value="등 록" />
                            </div>
                        </form>
                    </div>
                </section>
            </div>
        </main>
    </body>
</html>
