<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
    <main id="main-box">
        <div class="main-box">
            <div class="head-box">
                <div class="name-box">
                    <div class="prj">프로젝트명</div>
                    <input type="text" name="prj_name">
                    <button class="btn create_btn">작성하기</button>
                    <button class="c-btn cancel-btn">취소하기</button>
                </div>
                <div class="body-box">
                    <div class="prj">일정</div>
                    <input type="date"> ~ <input type="date">
                </div>
            </div>
        </div>
        <div class="side-box">

        </div>
    </main>
</body>
</html>