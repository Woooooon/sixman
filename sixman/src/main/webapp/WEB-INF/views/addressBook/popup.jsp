<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="<c:url value='/resources/css/addressBook/popup.css'/>" />
        <link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>" />
        <script defer src="<c:url value='/resources/js/main/main.js'/>"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <script defer src="<c:url value='/resources/js/address/popup.js'/>"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    </head>
    <body>
        <div id="myaddress-wrap" class="box">
            <div class="sortation-title">
                <div class="title-sor">
                    <span class="material-symbols-outlined"> interests </span>
                    <p>카테고리 수정</p>
                </div>
                <span class="material-symbols-outlined" id="cateSet">auto_fix</span>
            </div>
            <div class="sortation-list">
                <c:forEach items="${sortationList}" var="j">
                    <c:if test="${j.no ne 1 }">
                        <ul>
                            <div class="sortation-item">
                                <input type="checkbox" value="${j.no}">
                                <div class="toggleBtn">
                                    <span class="material-symbols-outlined"> diversity_2 </span>
                                </div>
                                ${j.name}
                            </div>
                            <span class="material-symbols-outlined" id="remove">delete </span>
                        </ul>
                    </c:if>
                </c:forEach>
            </div>
            <div class="plus">
                <input type="text" id="cateName">
                <input type="text" name="delete" id="delete">
                <input type="button" value="추가">
            </div>
        </div>
    </body>
</html>
