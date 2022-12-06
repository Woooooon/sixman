<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="<c:url value='/resources/css/organizationChart/list.css'/>" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
        <script defer src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
    </head>
    <body>
        <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
        <main id="main-page" class="main-box">
            <div class="main-box-2">
                <aside id="dept-wrap" class="box"></aside>
                <section id="employee-wrap">
                    <header id="employee-search" class="box">
                        <form action="" method="get">
                            <div id="search-content">
                                <input type="text" />
                                <input type="submit" value="검 색" />
                            </div>
                            <div id="search-controller">
                                <label for="name">이 름<input type="radio" id="name" value="name" name="category" /></label>
                                <label for="dept">부 서<input type="radio" id="dept" value="dept" name="category" /></label>
                                <label for="id">사 번<input type="radio" id="id" value="id" name="category" /></label>
                                <label for="position">직 급<input type="radio" id="position" value="position" name="category" /></label>
                            </div>
                        </form>
                    </header>
                    <article id="employee-list" class="box">
                        <figure id="companyLogo">
                            <img alt="기업로고" src="<c:url value='/resources/img/google.png'/>" />
                        </figure>
                        <div class="header">
                            <div class="title">
                                <span class="material-symbols-outlined">diversity_3</span>
                                <label>조직도</label>
                            </div>
                            <div class="view-controller">
                                <button><span class="material-symbols-outlined">format_list_bulleted</span></button>
                                <button><span class="material-symbols-outlined">account_tree</span></button>
                            </div>
                        </div>
                        <div id="employee-info-wrap">
                            <div id="sortation">
                                <p>사번</p>
                                <p>이름</p>
                                <p>직급</p>
                                <p>부서</p>
                                <p>팀</p>
                                <p>입사날짜</p>
                            </div>
                            <label for="member1">
                                <div class="list-item">
                                    <input type="radio" id="member1" name="memberInfo" />
                                    <p>P123123123</p>
                                    <p>윤태원</p>
                                    <p>사원</p>
                                    <p>영업부</p>
                                    <p>영업2팀</p>
                                    <p>2022년 11월 20일</p>
                                </div>
                            </label>
                            <label for="member2">
                                <div class="list-item">
                                    <input type="radio" id="member2" name="memberInfo" />
                                    <p>P123123123</p>
                                    <p>윤태원</p>
                                    <p>사원</p>
                                    <p>영업부</p>
                                    <p>영업2팀</p>
                                    <p>2022년 11월 20일</p>
                                </div>
                            </label>
                            <label for="member3">
                                <div class="list-item">
                                    <input type="radio" id="member3" name="memberInfo" />
                                    <p>P123123123</p>
                                    <p>윤태원</p>
                                    <p>사원</p>
                                    <p>영업부</p>
                                    <p>영업2팀</p>
                                    <p>2022년 11월 20일</p>
                                </div>
                            </label>
                            <label for="member4">
                                <div class="list-item">
                                    <input type="radio" id="member4" name="memberInfo" />
                                    <p>P123123123</p>
                                    <p>윤태원</p>
                                    <p>사원</p>
                                    <p>영업부</p>
                                    <p>영업2팀</p>
                                    <p>2022년 11월 20일</p>
                                </div>
                            </label>
                            <label for="member5">
                                <div class="list-item">
                                    <input type="radio" id="member5" name="memberInfo" />
                                    <p>P123123123</p>
                                    <p>윤태원</p>
                                    <p>사원</p>
                                    <p>영업부</p>
                                    <p>영업2팀</p>
                                    <p>2022년 11월 20일</p>
                                </div>
                            </label>
                            <label for="member10">
                                <div class="list-item">
                                    <input type="radio" id="member10" name="memberInfo" />
                                    <p>P123123123</p>
                                    <p>윤태원</p>
                                    <p>사원</p>
                                    <p>영업부</p>
                                    <p>영업2팀</p>
                                    <p>2022년 11월 20일</p>
                                </div>
                            </label>
                            <label for="member6">
                                <div class="list-item">
                                    <input type="radio" id="member6" name="memberInfo" />
                                    <p>P123123123</p>
                                    <p>윤태원</p>
                                    <p>사원</p>
                                    <p>영업부</p>
                                    <p>영업2팀</p>
                                    <p>2022년 11월 20일</p>
                                </div>
                            </label>
                            <label for="member7">
                                <div class="list-item">
                                    <input type="radio" id="member7" name="memberInfo" />
                                    <p>P123123123</p>
                                    <p>윤태원</p>
                                    <p>사원</p>
                                    <p>영업부</p>
                                    <p>영업2팀</p>
                                    <p>2022년 11월 20일</p>
                                </div>
                            </label>
                            <label for="member8">
                                <div class="list-item">
                                    <input type="radio" id="member8" name="memberInfo" />
                                    <p>P123123123</p>
                                    <p>윤태원</p>
                                    <p>사원</p>
                                    <p>영업부</p>
                                    <p>영업2팀</p>
                                    <p>2022년 11월 20일</p>
                                </div>
                            </label>
                            <label for="member9">
                                <div class="list-item">
                                    <input type="radio" id="member9" name="memberInfo" />
                                    <p>P123123123</p>
                                    <p>윤태원</p>
                                    <p>사원</p>
                                    <p>영업부</p>
                                    <p>영업2팀</p>
                                    <p>2022년 11월 20일</p>
                                </div>
                            </label>
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
                    </article>
                </section>
                <aside id="detail-wrap">
                    <div id="employee-detail" class="box">
                        <figure id="companyLogo">
                            <img alt="기업로고" src="<c:url value='/resources/img/google.png'/>" />
                        </figure>
                        <div id="employee-pic">
                            <img src="<c:url value='/resources/img/jang.jpg'/>" alt="" />
                        </div>
                        <p>영업부</p>
                        <div id="employee-name">
                            <p>윤태원</p>
                            <p>사원</p>
                        </div>
                        <p>영업 2팀</p>
                        <div id="detail-controller">
                            <a href=""><span class="material-symbols-outlined">mail</span></a>
                            <a href=""><span class="material-symbols-outlined">group_add</span></a>
                            <a href=""><span class="material-symbols-outlined">sms</span></a>
                        </div>
                    </div>
                    <div id="dept-detail" class="box">
                        <div id="dept-detail-title">
                            <h2>영업부</h2>
                            <h3>영업 2팀</h3>
                        </div>
                        <div class="dept-detail-list">
                            <div class="dept-employee-detail">
                                <div class="dept-employee-pic">
                                    <img src="<c:url value='/resources/img/jang.jpg'/>" alt="" />
                                </div>
                                <p>구기석</p>
                                <p>부장</p>
                            </div>
                            <div class="dept-list-controller">
                                <a href=""><span class="material-symbols-outlined">mail</span></a>
                                <a href=""><span class="material-symbols-outlined">group_add</span></a>
                                <a href=""><span class="material-symbols-outlined">sms</span></a>
                            </div>
                        </div>
                        <div class="dept-detail-list">
                            <div class="dept-employee-detail">
                                <div class="dept-employee-pic">
                                    <img src="<c:url value='/resources/img/jang.jpg'/>" alt="" />
                                </div>
                                <p>구기석</p>
                                <p>부장</p>
                            </div>
                            <div class="dept-list-controller">
                                <a href=""><span class="material-symbols-outlined">mail</span></a>
                                <a href=""><span class="material-symbols-outlined">group_add</span></a>
                                <a href=""><span class="material-symbols-outlined">sms</span></a>
                            </div>
                        </div>
                        <div class="dept-detail-list">
                            <div class="dept-employee-detail">
                                <div class="dept-employee-pic">
                                    <img src="<c:url value='/resources/img/jang.jpg'/>" alt="" />
                                </div>
                                <p>구기석</p>
                                <p>부장</p>
                            </div>
                            <div class="dept-list-controller">
                                <a href=""><span class="material-symbols-outlined">mail</span></a>
                                <a href=""><span class="material-symbols-outlined">group_add</span></a>
                                <a href=""><span class="material-symbols-outlined">sms</span></a>
                            </div>
                        </div>
                        <div class="dept-detail-list">
                            <div class="dept-employee-detail">
                                <div class="dept-employee-pic">
                                    <img src="<c:url value='/resources/img/jang.jpg'/>" alt="" />
                                </div>
                                <p>구기석</p>
                                <p>부장</p>
                            </div>
                            <div class="dept-list-controller">
                                <a href=""><span class="material-symbols-outlined">mail</span></a>
                                <a href=""><span class="material-symbols-outlined">group_add</span></a>
                                <a href=""><span class="material-symbols-outlined">sms</span></a>
                            </div>
                        </div>
                        <div class="dept-detail-list">
                            <div class="dept-employee-detail">
                                <div class="dept-employee-pic">
                                    <img src="<c:url value='/resources/img/jang.jpg'/>" alt="" />
                                </div>
                                <p>구기석</p>
                                <p>부장</p>
                            </div>
                            <div class="dept-list-controller">
                                <a href=""><span class="material-symbols-outlined">mail</span></a>
                                <a href=""><span class="material-symbols-outlined">group_add</span></a>
                                <a href=""><span class="material-symbols-outlined">sms</span></a>
                            </div>
                        </div>
                        <div class="dept-detail-list">
                            <div class="dept-employee-detail">
                                <div class="dept-employee-pic">
                                    <img src="<c:url value='/resources/img/jang.jpg'/>" alt="" />
                                </div>
                                <p>구기석</p>
                                <p>부장</p>
                            </div>
                            <div class="dept-list-controller">
                                <a href=""><span class="material-symbols-outlined">mail</span></a>
                                <a href=""><span class="material-symbols-outlined">group_add</span></a>
                                <a href=""><span class="material-symbols-outlined">sms</span></a>
                            </div>
                        </div>
                        <div class="dept-detail-list">
                            <div class="dept-employee-detail">
                                <div class="dept-employee-pic">
                                    <img src="<c:url value='/resources/img/jang.jpg'/>" alt="" />
                                </div>
                                <p>구기석</p>
                                <p>부장</p>
                            </div>
                            <div class="dept-list-controller">
                                <a href=""><span class="material-symbols-outlined">mail</span></a>
                                <a href=""><span class="material-symbols-outlined">group_add</span></a>
                                <a href=""><span class="material-symbols-outlined">sms</span></a>
                            </div>
                        </div>
                        <div id="list-controller">
                            <span class="material-symbols-outlined"> chevron_left </span>
                            <span class="material-symbols-outlined"> chevron_right </span>
                        </div>
                    </div>
                </aside>
            </div>
        </main>
    </body>
</html>
