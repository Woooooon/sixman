<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="<c:url value='/resources/css/addressBook/list.css'/>" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
        <script defer src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
    </head>
    <body>
        <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
        <main id="main-page" class="main-box">
            <div class="main-box-2">
                <aside id="myaddress-wrap" class="box"></aside>
                <section id="addressBook-wrap" class="box">
                    <div class="header">
                        <div class="title">
                            <span class="material-symbols-outlined">contacts</span>
                            <label>주소록</label>
                        </div>
                        <div class="address-search">
                            <form action="">
                                <select name="category" id="">
                                    <option value="">이 름</option>
                                    <option value="">연락처</option>
                                    <option value="">직 급</option>
                                    <option value="">이메일</option>
                                    <option value="">주 소</option>
                                    <option value="">구 분</option>
                                </select>
                                <input type="text" />
                                <input type="submit" value="검 색" />
                            </form>
                        </div>
                    </div>
                    <div class="body">
                        <div class="address-card-wrap">
                            <div class="card">
                                <img src="<c:url value='/resources/img/jang.jpg'/>" alt="" />
                                <div class="card-sortation">
                                    <p>거래처</p>
                                </div>
                            </div>
                            <div class="card-info">
                                <p>요기요</p>
                                <div class="card-sortation">
                                    <p>거래처</p>
                                </div>
                                <div class="card-person">
                                    <p>윤태원</p>
                                    <p>사원</p>
                                </div>
                                <p>010-8888-6666</p>
                                <p>asd@gmail.com</p>
                                <p>서울시 역삼동 어쩌고저쩌고 여기저기 어디저기</p>
                                <div class="card-background"></div>
                                <div class="card-controller">
                                    <span class="material-symbols-outlined"> mail </span>
                                    <span class="material-symbols-outlined"> share </span>
                                    <span class="material-symbols-outlined"> edit </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="footer"></div>
                </section>
            </div>
        </main>
    </body>
</html>
