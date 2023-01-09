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
                        <div class="list-item">
                            <span>타입</span>
                            <span>상태</span>
                            <span>제목</span>
                            <span>기안자</span>
                            <span>기안일</span>
                        </div>
                        <div class="list-item">
                            <span>타입</span>
                            <span>상태</span>
                            <span>제목</span>
                            <span>기안자</span>
                            <span>기안일</span>
                        </div>
                        <div class="list-item">
                            <span>타입</span>
                            <span>상태</span>
                            <span>제목</span>
                            <span>기안자</span>
                            <span>기안일</span>
                        </div>
                        <div class="list-item">
                            <span>타입</span>
                            <span>상태</span>
                            <span>제목</span>
                            <span>기안자</span>
                            <span>기안일</span>
                        </div>
                        <div class="list-item">
                            <span>타입</span>
                            <span>상태</span>
                            <span>제목</span>
                            <span>기안자</span>
                            <span>기안일</span>
                        </div>
                        <div class="list-item">
                            <span>타입</span>
                            <span>상태</span>
                            <span>제목</span>
                            <span>기안자</span>
                            <span>기안일</span>
                        </div>
                        <div class="list-item">
                            <span>타입</span>
                            <span>상태</span>
                            <span>제목</span>
                            <span>기안자</span>
                            <span>기안일</span>
                        </div>
                        <div class="list-item">
                            <span>타입</span>
                            <span>상태</span>
                            <span>제목</span>
                            <span>기안자</span>
                            <span>기안일</span>
                        </div>
                        <div class="list-item">
                            <span>타입</span>
                            <span>상태</span>
                            <span>제목</span>
                            <span>기안자</span>
                            <span>기안일</span>
                        </div>
                        <div class="list-item">
                            <span>타입</span>
                            <span>상태</span>
                            <span>제목</span>
                            <span>기안자</span>
                            <span>기안일</span>
                        </div>
                        <div class="list-item">
                            <span>타입</span>
                            <span>상태</span>
                            <span>제목</span>
                            <span>기안자</span>
                            <span>기안일</span>
                        </div>
                        <div class="list-item">
                            <span>타입</span>
                            <span>상태</span>
                            <span>제목</span>
                            <span>기안자</span>
                            <span>기안일</span>
                        </div>
                    </div>
                </div>

                <div class="list-footer">

                    <div class="page-box">
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