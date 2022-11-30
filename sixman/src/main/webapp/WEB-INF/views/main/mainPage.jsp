<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='resources/css/mainPage.css'/>">
</head>
<body>

<%@include file="/WEB-INF/views/common/menuBar.jsp" %>

<main id="main-page" class="main-box">
    <div id="main-page2">
        <section id="g-col-1">
            <article id="main-box1" class="box">
                <div id="time-box">11월 11일 11:00</div>
                <div id="btn-box">
                    <div class="btn"><p>출 근</p></div>
                    <div class="btn"><p>퇴 근</p></div>
                </div>
                <div id="status-box"></div>
            </article>
            <article id="main-box2" class="box">
                <div id="main-mail">
                    <div><span class="material-symbols-outlined">mail</span></div>
                    <div><p>20</p>/<p>30</p></div>
                    <div class="btn"><p>메일작성</p></div>
                </div>
                <div id="mail-list">
                    <div>최근메일</div>
                    <div class="box-item"><p>최부장</p><p>이것좀asdfasdfasdfasdfasdf 처리해줘요</p><p>11:30</p></div>
                    <div class="box-item"><p>최부장</p><p>이것좀 처리해줘요</p><p>11:30</p></div>
                    <div class="box-item"><p>최부장</p><p>이것좀 처리해줘요</p><p>11:30</p></div>
                    <div class="box-item"><p>최부장</p><p>이것좀 처리해줘요</p><p>11:30</p></div>
                    <div class="box-item"><p>최부장</p><p>이것좀 처리해줘요</p><p>11:30</p></div>
                </div>
            </article>
            <article id="document-box" class="box">
                <div class="box-title">전자문서</div>
                <div>
                    <div>
                        <span class="material-symbols-outlined">edit_document</span>
                        <p>기안문서</p>
                        <p>21</p>
                    </div>
                    <div>
                        <span class="material-symbols-outlined">description</span>
                        <p>결재문서</p>
                        <p>21</p>
                    </div>
                    <div>
                        <span class="material-symbols-outlined">task</span>
                        <p>완료문서</p>
                        <p>21</p>
                    </div>
                </div>
            </article>
            <article class="box">
                <div class="box-title">공지사항</div>
                <div class="item-box">
                    <div class="box-item"><p>[공지사항]</p><p>ㅁ나어리ㅏㅣㅁㄴㅇㄻㄴㅇㄹ핳헤ㅔㅔㅔㅔ 처리해줘요</p><p>11:30</p></div>
                    <div class="box-item"><p>[공지사항]</p><p>ㅁ나어리ㅏㅣㅁㄴㅇㄻㄴㅇㄹ핳헤ㅔㅔㅔㅔ 처리해줘요</p><p>11:30</p></div>
                    <div class="box-item"><p>[공지사항]</p><p>ㅁ나어리ㅏㅣㅁㄴㅇㄻㄴㅇㄹ핳헤ㅔㅔㅔㅔ 처리해줘요</p><p>11:30</p></div>
                    <div class="box-item"><p>[공지사항]</p><p>ㅁ나어리ㅏㅣㅁㄴㅇㄻㄴㅇㄹ핳헤ㅔㅔㅔㅔ 처리해줘요</p><p>11:30</p></div>
                    <div class="box-item"><p>[공지사항]</p><p>ㅁ나어리ㅏㅣㅁㄴㅇㄻㄴㅇㄹ핳헤ㅔㅔㅔㅔ 처리해줘요</p><p>11:30</p></div>
                    <div class="box-item"><p>[공지사항]</p><p>ㅁ나어리ㅏㅣㅁㄴㅇㄻㄴㅇㄹ핳헤ㅔㅔㅔㅔ 처리해줘요</p><p>11:30</p></div>
                </div>
            </article>
        </section>
        <section id="g-col-2">
            <article id="calendar-box" class="box">

            </article>
            <article class="box"></article>
        </section>
        <section id="g-col-3">
            <article class="box"></article>
            <article class="box"></article>
        </section>
    </div>
</main>

</body>
</html>