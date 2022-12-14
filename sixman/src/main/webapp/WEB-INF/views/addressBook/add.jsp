<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="<c:url value='/resources/css/addressBook/add.css'/>" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <script defer src="<c:url value='/resources/js/address/add.js'/>"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <!-- jstree -->
        <script defer src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
        <link rel="stylesheet" href="/sixman\resources\jstree\default\style.min.css" />
        <script src="https://kit.fontawesome.com/ae846b135b.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="/WEB-INF/views/common/menuBar.jsp" %>

        <main id="main-page" class="main-box">
            <div class="main-box-2">
                <aside id="myaddress-wrap" class="box">
                    <div class="dept-guide">
                        <span class="material-symbols-outlined"> contacts </span>
                        <p>주소록</p>
                    </div>
                    <div id="jstree">
                        <ul>
                            <li data-jstree='{"icon":"fa fa-folder-open icon-color"}'>
                                <input type="text" value="거래처" disabled />
                                <ul>
                                    <li data-jstree='{"icon":"fa fa-folder icon-color"}'>
                                        <input type="text" value="영업 2팀" disabled />
                                        <ul>
                                            <li data-jstree='{"icon":"fa fa-user icon-color"}'>윤태원</li>
                                            <li data-jstree='{"icon":"fa fa-user icon-color"}'>구기석</li>
                                        </ul>
                                    </li>
                                    <li data-jstree='{"icon":"fa fa-folder icon-color"}'>
                                        <input type="text" value="영업 3팀" disabled />
                                        <ul>
                                            <li data-jstree='{"icon":"fa fa-user icon-color"}'>윤태원</li>
                                            <li data-jstree='{"icon":"fa fa-user icon-color"}'>구기석</li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </aside>
                <section id="card-wrap" class="box">
                    <div class="header">
                        <span class="material-symbols-outlined">contacts</span>
                        <label>주소록 등록</label>
                    </div>
                    <div class="body">
                        <form action="">
                            <div id="card-pic">
                                <img src="<c:url value='/resources/img/jang.jpg'/>" alt="" class="image-box" />
                            </div>
                            <div id="pic-controller">
                                <label for="pic-add" onchange="readURL(this)">
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
                                <input type="text" id="address" />
                                <button type="button" id="address_kakao">검 색</button>
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
