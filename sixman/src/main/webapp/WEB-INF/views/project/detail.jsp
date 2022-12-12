<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var = "path" value = "${pageContext.request.contextPath}"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 상세보기</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="${path}\resources\css\project\detail.css">
</head>
<body>
    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
	<main class="main-box">
        <div class="box detail-box">
            <div class="head">
                <p>프로젝트 제목</p>
            </div>
            <div class="status">
                <div class="status-1"><span class="material-symbols-outlined">wb_incandescent</span>상태</div>
                <div class="status-btn">
                    <button class="ing">진행중</button>
                    <button class="delay">지연중</button>
                    <button class="complete">완료</button>
                </div>
            </div>
            <div class="member">
                <div class="member-1"><span class="material-symbols-outlined">groups</span>인원</div>
                <div class="member-list">
                    <div class="name">· 김민우</div>
                    <div class="name">· 김민우</div>
                    <div class="name">· 김민우</div>
                </div>
            </div>
            <div class="date">
                <div class="prjdate"><span class="material-symbols-outlined">calendar_today</span>날짜</div>
                <input type="date" id="startdate"><p>~</p><input type="date" id="enddate">
            </div>
            <div class="percent">
                <div class="clear"><span class="material-symbols-outlined">check_box</span>완료</div>
                <div class="progress">
                 <progress value="20" max="100" id="progress"/>
                </div>
                <input type="range">
                <script>
                    function up() {
                        document.querySelector('#progress').value = '70';
                    }
                </script>
                <button onclick="up()">상승</button>
            </div>
            <div class="todo">
                <div class="todo-plus"><span class="material-symbols-outlined">add</span>TO-DO 추가</div>
            </div>
            <div class="hidden"></div>
            <div class="content">
                <textarea name="content" id="prj-content">내용ㅋㅋ</textarea>
            </div>
            <div class="hidden"></div>
            <div class="todo-list">
                <div class="todo-box">
                    <div class="todo-title">제목제목</div>
                    <div class="todo-writer">김민우</div>
                    <progress value="30" max="100"></progress>
                    <div class="todo"><input type="checkbox">숨쉬기 성공</div>
                    <div class="todo"><input type="checkbox" checked>잠자기 실패</div>
                    <div class="todo"><input type="checkbox">밥먹기 성공</div>
                </div>
                <div class="todo-box">
                    <div class="todo-title">제목제목</div>
                    <div class="todo-writer">김민우</div>
                    <progress value="60" max="100"></progress>
                    <div class="todo"><input type="checkbox" checked>숨쉬기 성공</div>
                    <div class="todo"><input type="checkbox">잠자기 실패</div>
                    <div class="todo"><input type="checkbox"checked>밥먹기 성공</div>
                </div>
                <div class="todo-box">
                    <div class="todo-title">제목제목</div>
                    <div class="todo-writer">김민우</div>
                    <progress value="30" max="100"></progress>
                    <div class="todo"><input type="checkbox">숨쉬기 성공</div>
                    <div class="todo"><input type="checkbox">잠자기 실패</div>
                    <div class="todo"><input type="checkbox"checked>밥먹기 성공</div>
                </div>
            </div>
        </div><!--detail box-->
    </main>
</body>
</html>