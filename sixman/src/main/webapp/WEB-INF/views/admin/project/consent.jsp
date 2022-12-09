<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var = "path" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 승낙</title>
<link rel="stylesheet" href="${path}\resources\css\admin\project\consent.css">
</head>
<body>
    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
    <main class="main-box">
        <div class="consent-box box">
            <div class="consent-title-box">
                <div class="consent-title"><p>프로젝트 생성 승인</p></div>
                <br>
            </div>
            <div class="header-box">
                <div class="hidden"></div>
                <label><p><input type="checkbox">&nbsp;전체선택</p></label>    
            </div>
            <div class="project-list">
                <label><div class="project-item"><input type="checkbox">&nbsp;회식은 언제 하는가에 대하여</div></label>
                <label><div class="project-item"><input type="checkbox">&nbsp;마크로 java도 한다던데...</div></label>
                <label><div class="project-item"><input type="checkbox">&nbsp;중요한건 꺾이지 않는 마음</div></label>
            </div>
            
            <div class="consent-page-num">
                <button class="page-num go-prev">&lt;</button>
                &nbsp;
                <button class="page-num">1</button>
                &nbsp;
                <button class="page-num go-next">&gt;</button>
            </div>
            <div class="footer">
                <button class="btn footer-btn">승인하기</button>
                &nbsp;
                <button class="c-btn footer-btn">삭제하기</button>
            </div>
        </div>
    </main>
</body>
</html>