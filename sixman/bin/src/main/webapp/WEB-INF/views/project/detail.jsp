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
<script defer src="${path}\resources\js\project\detail.js"></script>
</head>
<body>
    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
    <form action="">
	<main class="main-box">
        <div class="box detail-box">
            <div class="head">
                <p>프로젝트 제목</p>
                <div class="detail-btn">
                    <button class="btn" type="button">수정하기</button>
                    <button class="c-btn" type="button">삭제하기</button>
                </div>
            </div>
            <div class="status">
                <div class="status-1">
                    <span class="material-symbols-outlined">wb_incandescent</span>
                    <p>상태</p>
                </div>
                <div class="status-btn">
                    <div class="ing backgray">진행중</div>
                    <div class="delay backgray">지연중</div>
                    <div class="complete backgray">완료</div>
                </div>
            </div>
            <div class="member">
                <div class="member-1">
                    <span class="material-symbols-outlined">groups</span>
                    <p>인원</p>
                </div>
                <div class="member-list">
                    <div class="name">· 김민우</div>
                    <div class="name">· 김민우</div>
                    <div class="name">· 김민우</div>
                </div>
            </div>
            <div class="date">
                <div class="prjdate">
                    <span class="material-symbols-outlined">calendar_today</span>
                    <p>날짜</p>
                </div>
                <input type="date" class="startdate"><p>~</p><input type="date" class="enddate">
            </div>
            <div class="percent">
                <div class="clear">
                    <span class="material-symbols-outlined">check_box</span>
                    <p>완료</p>
                </div>
                <div class="progress">
                 <div class="progress-bar"></div>
                </div>
            </div>
            <div class="inputcontainer">
                <div class="statusinput">
                    <span class="material-symbols-outlined">more_horiz</span>
                    <p>진행도</p>
                </div>
                <input  class="valueinput" type="number">
                <input  class="maxinput" type="hidden">
            </div>
            <div class="todo">
                <div class="todo-plus">
                    <span class="material-symbols-outlined">add</span>
                    <p><a href="#" id="btn-modal">TO-DO 추가</a></p>
                </div>
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
    </form>
    <!-- Modal -->
    <div id="container">
        <h2>ㅋㅋ</h2>
        <div id="lorem-ipsum"></div>
    </div>
    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <p>TO-DO 제목란</p>
                <div class="close-area"><span class="material-symbols-outlined">close</span></div>
            </div>
            <div class="status">
                <div class="status-1">
                    <span class="material-symbols-outlined">wb_incandescent</span>
                    <p>상태</p>
                </div>
                <div class="status-btn">
                    <div class="ing backgray">진행중</div>
                    <div class="delay backgray">지연중</div>
                    <div class="complete backgray">완료</div>
                </div>
            </div>
            <div class="member">
                <div class="member-1">
                    <span class="material-symbols-outlined">groups</span>
                    <p>인원</p>
                </div>
                <div class="member-list">
                    <div class="name">김민우</div>
                </div>
            </div>
            <div class="date">
                <div class="prjdate">
                    <span class="material-symbols-outlined">calendar_today</span>
                    <p>날짜</p>
                </div>
                <input type="date">
            </div>
            <div class="hidden"></div>
            <div class="contentbox">
                <textarea name="content" class="content"></textarea>
            </div>
            <div class="footer-btn">
                <button class="btn" type="button">수정하기</button>
                <button class="c-btn" type="button">삭제하기</button>
            </div>
        </div>
    </div>
</body>
</html>