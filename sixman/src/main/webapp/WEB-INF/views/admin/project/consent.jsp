<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var = "path" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
    <main class="main-box">
        <div class="consent-box">
            <div class="consent-title-box">
                <div class="consent-title">프로젝트 승낙</div>
            </div>
            <div class="header-box">
                <label><input type="checkbox"><p>전체선택</p></label>    
            </div>
            <div class="project-list">
                <label><input type="checkbox"><div class="project-name">프로젝트 - 회식은 언제 하는가에 대하여</div></label>
                <label><input type="checkbox"><div class="project-name">프로젝트 - 마크로 java도 한다던데...</div></label>
                <label><input type="checkbox"><div class="project-name">데프트 - 중요한건 꺾이지 않는 마음</div></label>
            </div>
            <div class="consent-page-num">
                <button class="page-num go-prev">&lt;</button>
                <button class="page-num">1</button>
                <button class="page-num go-next">&gt;</button>
            </div>
        </div>
    </main>
</body>
</html>