<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="<c:url value='/resources/css/addressBook/reciveAddress.css'/>" />
        <script defer src="<c:url value='/resources/js/address/reciveAddress.js'/>"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
        <script src="https://kit.fontawesome.com/ae846b135b.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
        <main id="main-page" class="main-box">
            <div class="main-box-2">
                <section id="addressBook-wrap" class="box">
                    <div class="header">
                        <div class="title">
                            <span class="material-symbols-outlined">contacts</span>
                            <label>${reciveInfo.senderName}님이 보낸 주소록</label>
                            <input type="text" value="${reciveInfo.no}" id="reciveInfo" />
                        </div>
                    </div>
                    <div class="body-controller">
                        <input type="checkbox" class="selectAll" id="selectAll" />
                        <label for="selectAll">전체선택</label>
                        <span class="material-symbols-outlined insert"> download_for_offline </span>
                        <span class="material-symbols-outlined delete"> delete </span>
                    </div>
                    <div class="body">
                        <c:forEach items="${reciveAddressList}" var="i">
                            <div class="card-item">
                                <input type="checkbox" id="cardNo${i.no}" class="cardCheck" value="${i.no}" />
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
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </section>
            </div>
        </main>
    </body>
</html>
