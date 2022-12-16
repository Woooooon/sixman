<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var = "path" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 프로젝트</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</head>
<body>
    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
    <main class="main-box" id="main">
        <div class="my-project-box">
            <div class="prj-box">
                <div class="box-header"><span class="material-symbols-outlined">public</span>프로젝트 이름</div>
                <div class="favorite"><span class="material-symbols-outlined">star</span></div>
            </div>
            <div class="box-body">
                <div class="date">
                    <span class="material-symbols-outlined">calendar_today</span><div class="period"></div>
                </div>
                <div class="reader">
                    <p>리더이름</p>
                    <div class="status" value=""></div>
                </div>
                <div class="status-percent">
                    <div class="percent">0%완료</div>
                    <div class="works">0/0</div>
                </div>
                <div class="status-progress"></div>
            </div>
        </div>
    </main>
</body>
</html>