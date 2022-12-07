<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="<c:url value='/resources/css/addressBook/receive.css'/>" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
        <script defer src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
    </head>
    <body>
        <%@include file="/WEB-INF/views/common/menuBar.jsp" %>

        <main id="main-page" class="main-box">
            <div class="main-box-2">
                <section id="receive-wrap" class="box">
                    <div class="header">
                        <div class="title">
                            <span class="material-symbols-outlined">contacts</span>
                            <label>주소록 받아오기</label>
                        </div>
                        <div class="sender-search">
                            <form action="">
                                <select name="category" id="">
                                    <option value="">이 름</option>
                                    <option value="">직 급</option>
                                    <option value="">부 서</option>
                                    <option value="">팀</option>
                                </select>
                                <input type="text" />
                                <input type="submit" value="검 색" />
                            </form>
                        </div>
                    </div>
                    <div class="body-controller">
                        <input type="checkbox" />
                        <label for="">전체선택</label>
                        <span class="material-symbols-outlined"> add_box </span>
                        <span class="material-symbols-outlined"> delete </span>
                    </div>
                    <div class="body">
                        <div class="card-container">
                            <div class="card">
                                <input type="checkbox" name="" checked />
                                <div class="card-front">
                                    <img src="<c:url value='/resources/img/jang.jpg'/>" alt="" />
                                    <div class="card-sortation">
                                        <p>거래처</p>
                                    </div>
                                </div>
                                <div class="card-back">
                                    <div class="info-wrap">
                                        <p>요기요</p>
                                        <div class="card-sortation">
                                            <p>거래처</p>
                                        </div>
                                        <div class="card-info">
                                            <p>윤태원</p>
                                            <p>사원</p>
                                        </div>
                                        <p>010-8888-6666</p>
                                        <p>asd@gmail.com</p>
                                        <p>서울시 역삼동 어쩌고저쩌고 여기저기 어디저기</p>
                                    </div>
                                    <div class="card-controller">
                                        <a href=""><span class="material-symbols-outlined"> mail </span></a>
                                        <span class="material-symbols-outlined"> share </span>
                                        <a href=""><span class="material-symbols-outlined"> edit </span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="footer">
                        <div class="page-box">
                            <span class="material-symbols-outlined"> keyboard_double_arrow_left </span>
                            <span class="material-symbols-outlined"> chevron_left </span>
                            <div class="page-btn checked-p-btn">1</div>
                            <div class="page-btn">2</div>
                            <div class="page-btn">3</div>
                            <div class="page-btn">4</div>
                            <div class="page-btn">5</div>
                            <span class="material-symbols-outlined"> chevron_right </span>
                            <span class="material-symbols-outlined"> keyboard_double_arrow_right </span>
                        </div>
                    </div>
                </section>
            </div>
        </main>
    </body>
</html>
