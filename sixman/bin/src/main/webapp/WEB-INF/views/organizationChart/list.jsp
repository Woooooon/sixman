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
                            <input type="text" />
                            <input type="submit" value="검 색" />
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
                            <span class="material-symbols-outlined">person_add</span>
                            <label>조직도</label>
                        </div>
                        <div id="employee-info-wrap">
                            <div id="sortation" class="list-item">
                                <p>사번</p>
                                <p>이름</p>
                                <p>직급</p>
                                <p>부서</p>
                                <p>팀</p>
                                <p>입사날짜</p>
                            </div>
                            <div class="list-item">
                                <input type="radio" name="member" />
                                <p>P123123123</p>
                                <p>윤태원</p>
                                <p>사원</p>
                                <p>영업부</p>
                                <p>영업2팀</p>
                                <p>2022년 11월 20일</p>
                            </div>
                            <div class="list-item">
                                <input type="radio" name="member" />
                                <p>P123123123</p>
                                <p>윤태원</p>
                                <p>사원</p>
                                <p>영업부</p>
                                <p>영업2팀</p>
                                <p>2022년 11월 20일</p>
                            </div>
                            <div class="list-item">
                                <input type="radio" name="member" />
                                <p>P123123123</p>
                                <p>윤태원</p>
                                <p>사원</p>
                                <p>영업부</p>
                                <p>영업2팀</p>
                                <p>2022년 11월 20일</p>
                            </div>
                            <div class="list-item">
                                <input type="radio" name="member" />
                                <p>P123123123</p>
                                <p>윤태원</p>
                                <p>사원</p>
                                <p>영업부</p>
                                <p>영업2팀</p>
                                <p>2022년 11월 20일</p>
                            </div>
                            <div class="list-item">
                                <input type="radio" name="member" />
                                <p>P123123123</p>
                                <p>윤태원</p>
                                <p>사원</p>
                                <p>영업부</p>
                                <p>영업2팀</p>
                                <p>2022년 11월 20일</p>
                            </div>
                            <div class="list-item">
                                <input type="radio" name="member" />
                                <p>P123123123</p>
                                <p>윤태원</p>
                                <p>사원</p>
                                <p>영업부</p>
                                <p>영업2팀</p>
                                <p>2022년 11월 20일</p>
                            </div>
                            <div class="list-item">
                                <input type="radio" name="member" />
                                <p>P123123123</p>
                                <p>윤태원</p>
                                <p>사원</p>
                                <p>영업부</p>
                                <p>영업2팀</p>
                                <p>2022년 11월 20일</p>
                            </div>
                            <div class="list-item">
                                <input type="radio" name="member" />
                                <p>P123123123</p>
                                <p>윤태원</p>
                                <p>사원</p>
                                <p>영업부</p>
                                <p>영업2팀</p>
                                <p>2022년 11월 20일</p>
                            </div>
                            <div class="list-item">
                                <input type="radio" name="member" />
                                <p>P123123123</p>
                                <p>윤태원</p>
                                <p>사원</p>
                                <p>영업부</p>
                                <p>영업2팀</p>
                                <p>2022년 11월 20일</p>
                            </div>
                            <div class="list-item">
                                <input type="radio" name="member" />
                                <p>P123123123</p>
                                <p>윤태원</p>
                                <p>사원</p>
                                <p>영업부</p>
                                <p>영업2팀</p>
                                <p>2022년 11월 20일</p>
                            </div>
                        </div>
                    </article>
                </section>
                <aside id="detail-wrap">
                    <div id="employee-detail" class="box"></div>
                    <div id="dept-detail" class="box"></div>
                </aside>
            </div>
        </main>
    </body>
</html>
