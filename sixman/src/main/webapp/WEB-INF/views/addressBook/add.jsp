<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <script defer src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
        <script defer src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
        <link rel="stylesheet" href="<c:url value='/resources/css/addressBook/add.css'/>" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
    </head>
    <body>
        <%@include file="/WEB-INF/views/common/menuBar.jsp" %>

        <main id="main-page" class="main-box">
            <div class="main-box-2">
                <aside id="myaddress-wrap" class="box"></aside>
                <section id="card-wrap" class="box">
                    <div class="header">
                        <span class="material-symbols-outlined">contacts</span>
                        <label>주소록 등록</label>
                    </div>
                    <div class="body">
                        <form action="">
                            <div id="card-pic">
                                <img src="<c:url value='/resources/img/jang.jpg'/>" alt="" />
                            </div>
                            <div id="pic-controller">
                                <label for="pic-add">
                                    <span class="material-symbols-outlined">add</span>
                                    <input type="file" id="pic-add" />명함 추가
                                </label>
                            </div>
                            <div id="card-info">
                                <div class="info-box left">
                                    <label for="">
                                        <p>상 호</p>
                                        <input type="text" />
                                    </label>
                                    <label for="">
                                        <p>성 명</p>
                                        <input type="text" />
                                    </label>
                                </div>
                                <div class="info-box right">
                                    <label for="">
                                        <p>구 분</p>
                                        <select name="" id="">
                                            <option value="">기 본</option>
                                        </select>
                                    </label>
                                    <label for="">
                                        <p>상 호</p>
                                        <input type="text" />
                                    </label>
                                </div>
                            </div>
                            <div id="card-phone-email">
                                <label for="">
                                    <p>연락처</p>
                                    <input type="text" />
                                </label>
                                <label for="">
                                    <p>E-MAIL</p>
                                    <input type="text" />
                                </label>
                            </div>
                            <div id="card-info-address">
                                <label for="">주 소</label>
                                <input type="text" />
                                <button type="button">검 색</button>
                            </div>
                            <div id="memo">
                                <div id="title">
                                    <p>Memo</p>
                                </div>
                                <textarea></textarea>
                            </div>
                            <div id="sub">
                                <input type="submit" value="등 록" />
                            </div>
                        </form>
                    </div>
                </section>
            </div>
        </main>
    </body>
</html>
