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
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
        <link rel="stylesheet" href="/sixman\resources\jstree\default\style.min.css" />
        <script src="https://kit.fontawesome.com/ae846b135b.js" crossorigin="anonymous"></script>
        <script defer src="<c:url value='/resources/js/address/list.js'/>"></script>
    </head>
    <body>
        <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
        <div class="share-modal close">
            <form action="">
                <div class="receiver">
                    <label for="">받는사람</label>
                    <input type="text" />
                    <input type="submit" value="전 송" />
                    <span class="material-symbols-outlined" id="close-modal"> close </span>
                </div>
                <div class="select-list">
                    <div class="list-title">
                        <span class="material-symbols-outlined">contacts</span>
                        <label for="">주소록</label>
                    </div>
                    <div class="list-sortation">
                        <p></p>
                        <p>구 분</p>
                        <p>상 호</p>
                        <p>이 름</p>
                        <p>직 급</p>
                        <p>연락처</p>
                    </div>
                    <div class="list-item">
                        <input type="checkbox" value="" name="" checked />
                        <p>거래처</p>
                        <p>요기요</p>
                        <p>윤태원</p>
                        <p>사원</p>
                        <p>010-8888-6666</p>
                    </div>
                    <div class="list-item">
                        <input type="checkbox" value="" name="" checked />
                        <p>거래처</p>
                        <p>요기요</p>
                        <p>윤태원</p>
                        <p>사원</p>
                        <p>010-8888-6666</p>
                    </div>
                    <div class="list-item">
                        <input type="checkbox" value="" name="" checked />
                        <p>거래처</p>
                        <p>요기요</p>
                        <p>윤태원</p>
                        <p>사원</p>
                        <p>010-8888-6666</p>
                    </div>
                    <div class="list-item">
                        <input type="checkbox" value="" name="" checked />
                        <p>거래처</p>
                        <p>요기요</p>
                        <p>윤태원</p>
                        <p>사원</p>
                        <p>010-8888-6666</p>
                    </div>
                    <div class="list-item">
                        <input type="checkbox" value="" name="" checked />
                        <p>거래처</p>
                        <p>요기요</p>
                        <p>윤태원</p>
                        <p>사원</p>
                        <p>010-8888-6666</p>
                    </div>
                    <div class="list-item">
                        <input type="checkbox" value="" name="" checked />
                        <p>거래처</p>
                        <p>요기요</p>
                        <p>윤태원</p>
                        <p>사원</p>
                        <p>010-8888-6666</p>
                    </div>
                </div>
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
            </form>
        </div>
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
                    <div class="body-controller">
                        <input type="checkbox" class="selectAll" id="selectAll" />
                        <label for="selectAll">전체선택</label>
                        <a href="/sixman/address/add"><span class="material-symbols-outlined"> add_box </span></a>
                        <span class="material-symbols-outlined delete"> delete </span>
                        <span class="material-symbols-outlined share" id="checkShare"> share </span>
                    </div>
                    <div class="body">
                        <label for="selectOne">
                            <div class="card-container">
                                <div class="card">
                                    <input type="checkbox" class="selectOne" id="selectOne" />
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
                                            <span class="material-symbols-outlined share"> share </span>
                                            <a href=""><span class="material-symbols-outlined"> edit </span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </label>
                        <label for="a11">
                            <div class="card-container">
                                <div class="card">
                                    <input type="checkbox" class="selectOne" id="a11" />
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
                                            <span class="material-symbols-outlined share"> share </span>
                                            <a href=""><span class="material-symbols-outlined"> edit </span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </label>
                        <label for="a10">
                            <div class="card-container">
                                <div class="card">
                                    <input type="checkbox" class="selectOne" id="a10" />
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
                                            <span class="material-symbols-outlined share"> share </span>
                                            <a href=""><span class="material-symbols-outlined"> edit </span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </label>
                        <label for="a9">
                            <div class="card-container">
                                <div class="card">
                                    <input type="checkbox" class="selectOne" id="a9" />
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
                                            <span class="material-symbols-outlined share"> share </span>
                                            <a href=""><span class="material-symbols-outlined"> edit </span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </label>
                        <label for="a8">
                            <div class="card-container">
                                <div class="card">
                                    <input type="checkbox" class="selectOne" id="a8" />
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
                                            <span class="material-symbols-outlined share"> share </span>
                                            <a href=""><span class="material-symbols-outlined"> edit </span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </label>
                        <label for="a7">
                            <div class="card-container">
                                <div class="card">
                                    <input type="checkbox" class="selectOne" id="a7" />
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
                                            <span class="material-symbols-outlined share"> share </span>
                                            <a href=""><span class="material-symbols-outlined"> edit </span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </label>
                        <label for="a6">
                            <div class="card-container">
                                <div class="card">
                                    <input type="checkbox" class="selectOne" id="a6" />
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
                                            <span class="material-symbols-outlined share"> share </span>
                                            <a href=""><span class="material-symbols-outlined"> edit </span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </label>
                        <label for="a5">
                            <div class="card-container">
                                <div class="card">
                                    <input type="checkbox" class="selectOne" id="a5" />
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
                                            <span class="material-symbols-outlined share"> share </span>
                                            <a href=""><span class="material-symbols-outlined"> edit </span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </label>
                        <label for="a4">
                            <div class="card-container">
                                <div class="card">
                                    <input type="checkbox" class="selectOne" id="a4" />
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
                                            <span class="material-symbols-outlined share"> share </span>
                                            <a href=""><span class="material-symbols-outlined"> edit </span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </label>
                        <label for="a3">
                            <div class="card-container">
                                <div class="card">
                                    <input type="checkbox" class="selectOne" id="a3" />
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
                                            <span class="material-symbols-outlined share"> share </span>
                                            <a href=""><span class="material-symbols-outlined"> edit </span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </label>
                        <label for="a2">
                            <div class="card-container">
                                <div class="card">
                                    <input type="checkbox" class="selectOne" id="a2" />
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
                                            <span class="material-symbols-outlined share"> share </span>
                                            <a href=""><span class="material-symbols-outlined"> edit </span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </label>
                        <label for="a1">
                            <div class="card-container">
                                <div class="card">
                                    <input type="checkbox" class="selectOne" id="a1" />
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
                                            <span class="material-symbols-outlined share"> share </span>
                                            <a href=""><span class="material-symbols-outlined"> edit </span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </label>
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

<!-- 
<div class="card-container">
    <div class="card">
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
                <a href=""><span class="material-symbols-outlined"> share </span></a>
                <a href=""><span class="material-symbols-outlined"> edit </span></a>
            </div>
        </div>
    </div>
</div>
<div class="card-container">
    <div class="card">
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
                <a href=""><span class="material-symbols-outlined"> share </span></a>
                <a href=""><span class="material-symbols-outlined"> edit </span></a>
            </div>
        </div>
    </div>
</div>
<div class="card-container">
    <div class="card">
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
                <a href=""><span class="material-symbols-outlined"> share </span></a>
                <a href=""><span class="material-symbols-outlined"> edit </span></a>
            </div>
        </div>
    </div>
</div>
<div class="card-container">
    <div class="card">
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
                <a href=""><span class="material-symbols-outlined"> share </span></a>
                <a href=""><span class="material-symbols-outlined"> edit </span></a>
            </div>
        </div>
    </div>
</div>
<div class="card-container">
    <div class="card">
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
                <a href=""><span class="material-symbols-outlined"> share </span></a>
                <a href=""><span class="material-symbols-outlined"> edit </span></a>
            </div>
        </div>
    </div>
</div>
<div class="card-container">
    <div class="card">
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
                <a href=""><span class="material-symbols-outlined"> share </span></a>
                <a href=""><span class="material-symbols-outlined"> edit </span></a>
            </div>
        </div>
    </div>
</div>
<div class="card-container">
    <div class="card">
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
                <a href=""><span class="material-symbols-outlined"> share </span></a>
                <a href=""><span class="material-symbols-outlined"> edit </span></a>
            </div>
        </div>
    </div>
</div>
<div class="card-container">
    <div class="card">
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
                <a href=""><span class="material-symbols-outlined"> share </span></a>
                <a href=""><span class="material-symbols-outlined"> edit </span></a>
            </div>
        </div>
    </div>
</div>
<div class="card-container">
    <div class="card">
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
                <a href=""><span class="material-symbols-outlined"> share </span></a>
                <a href=""><span class="material-symbols-outlined"> edit </span></a>
            </div>
        </div>
    </div>
</div>
<div class="card-container">
    <div class="card">
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
                <a href=""><span class="material-symbols-outlined"> share </span></a>
                <a href=""><span class="material-symbols-outlined"> edit </span></a>
            </div>
        </div>
    </div>
</div>
<div class="card-container">
    <div class="card">
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
                <a href=""><span class="material-symbols-outlined"> share </span></a>
                <a href=""><span class="material-symbols-outlined"> edit </span></a>
            </div>
        </div>
    </div>
</div> -->
