<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/sixman/resources/css/approval/list.css">
</head>
<body>

    <%@include file="/WEB-INF/views/common/tempMenuBar.jsp" %>

    <main class="main-box">
        <div class="approval-main box">
            <div class="list-title">전자문서</div>

            <div class="list-box">
                <div class="list-box-header">
                    <div class="category">
                        <p>전체</p>
                        <p>대기</p>
                        <p>진행</p>
                        <p>완료</p>
                        <p>반려</p>
                    </div>
                    <div class="option">
                        <div class="type"></div>
                        <div class="search">
                            <input type="text">
                            <span class="material-symbols-outlined"> search </span>
                        </div>
                    </div>
                </div>

                <div class="list">
                    <div class="list-header">
                        <div class="list-item">
                            <span>타입</span>
                            <span>상태</span>
                            <span>제목</span>
                            <span>기안자</span>
                            <span>기안일</span>
                        </div>
                    </div>
                    <div class="list-main">
                        <c:forEach items="${list}" var="vo">

                        <div class="list-item" onclick="location.href='/sixman/approval/detail?no=${vo.no}'">
                            <span>${vo.typeName }</span>
                            <span>${vo.state }</span>
                            <span>${vo.title }</span>
                            <span>${vo.sendName }</span>
                            <span>${vo.enrollDate }</span>
                        </div>

                        </c:forEach>
                    </div>
                </div>

                <div class="list-footer">

                    <div class="page-box">
                        <span class="material-symbols-outlined" <c:if test="${pv.currentPage ne 1}">onclick="location.href='/sixman/approval/list?p=1&'"</c:if>> keyboard_double_arrow_left </span>
                        <span class="material-symbols-outlined" <c:if test="${pv.currentPage ne 1}">onclick="location.href='/sixman/approval/list?p=${pv.currentPage - 1}'"</c:if>> chevron_left </span>
                        <c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
                        <div class="page-btn <c:if test="${i eq pv.currentPage}"> checked-p-btn</c:if>" onclick="location.href='/sixman/approval/list?p=${i}'">${i}</div>
                        </c:forEach>
                        <span class="material-symbols-outlined" <c:if test="${pv.maxPage ne pv.currentPage}">onclick="location.href='/sixman/approval/list?p=${pv.currentPage + 1}'"</c:if>> chevron_right </span>
                        <span class="material-symbols-outlined" <c:if test="${pv.maxPage ne 1}">onclick="location.href='/sixman/approval/list?p=${pv.maxPage}'"</c:if>> keyboard_double_arrow_right </span>
                    </div>

                    <div class="write-btn btn" onclick="location.href='/sixman/approval/write'">
                        작성하기
                    </div>

                </div>
            </div>

        </div>
    </main>

</body>
</html>