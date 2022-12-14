<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="<c:url value='/resources/css/admin/organizationChart/list.css'/>" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,700,1,200" />
        <script defer src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
        <script defer src="<c:url value='/resources/js/admin/organizationChart/list.js'/>"></script>
        <link rel="stylesheet" href="/sixman\resources\jstree\default\style.min.css" />
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
        <script src="https://kit.fontawesome.com/ae846b135b.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="/WEB-INF/views/common/menuBar.jsp" %>

        <main id="main-page" class="main-box">
            <div class="main-box-2">
                <aside id="dept-wrap" class="box">
                    <div class="dept-guide">
                        <span class="material-symbols-outlined"> diversity_3 </span>
                        <p>배달의 민족</p>
                    </div>
                    <div id="jstree">
                        <ul>
                            <li data-jstree='{"icon":"fa fa-folder-open icon-color"}'>
                                <input type="text" value="영업부" disabled />
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
                            <div class="controller-wrap">
                                <div class="view-controller">
                                    <button><span class="material-symbols-outlined">format_list_bulleted</span></button>
                                    <button><span class="material-symbols-outlined">account_tree</span></button>
                                </div>
                                <div class="employee-controller">
                                    <a href="/sixman/admin/member/join" class="add-emp">사원 등록</a>
                                    <button class="remove-emp">삭 제</button>
                                </div>
                            </div>
                        </div>
                        <div id="employee-info-wrap">
                            <div id="sortation">
                                <input type="checkbox" class="selectAll" />
                                <p>사번</p>
                                <p>이름</p>
                                <p>직급</p>
                                <p>부서</p>
                                <p>팀</p>
                                <p>권한</p>
                                <p>입사날짜</p>
                            </div>
                            <label for="member1">
                                <div class="list-item">
                                    <input type="checkbox" id="member1" name="memberInfo" class="selectOne" />
                                    <p>P123123123</p>
                                    <p>윤태원</p>
                                    <select name="" id="">
                                        <option value="">사원</option>
                                        <option value="">부장</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">영업부</option>
                                        <option value="">인사부</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">영업 1팀</option>
                                        <option value="">영업 2팀</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">1</option>
                                        <option value="">2</option>
                                        <option value="">3</option>
                                    </select>
                                    <p>2022년 11월 20일</p>
                                </div>
                            </label>
                            <label for="member2">
                                <div class="list-item">
                                    <input type="checkbox" id="member2" name="memberInfo" class="selectOne" />
                                    <p>P123123123</p>
                                    <p>윤태원</p>
                                    <select name="" id="">
                                        <option value="">사원</option>
                                        <option value="">부장</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">영업부</option>
                                        <option value="">인사부</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">영업 1팀</option>
                                        <option value="">영업 2팀</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">1</option>
                                        <option value="">2</option>
                                        <option value="">3</option>
                                    </select>
                                    <p>2022년 11월 20일</p>
                                </div>
                            </label>
                            <label for="member3">
                                <div class="list-item">
                                    <input type="checkbox" id="member3" name="memberInfo" class="selectOne" />
                                    <p>P123123123</p>
                                    <p>윤태원</p>
                                    <select name="" id="">
                                        <option value="">사원</option>
                                        <option value="">부장</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">영업부</option>
                                        <option value="">인사부</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">영업 1팀</option>
                                        <option value="">영업 2팀</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">1</option>
                                        <option value="">2</option>
                                        <option value="">3</option>
                                    </select>
                                    <p>2022년 11월 20일</p>
                                </div>
                            </label>
                            <label for="member4">
                                <div class="list-item">
                                    <input type="checkbox" id="member4" name="memberInfo" class="selectOne" />
                                    <p>P123123123</p>
                                    <p>윤태원</p>
                                    <select name="" id="">
                                        <option value="">사원</option>
                                        <option value="">부장</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">영업부</option>
                                        <option value="">인사부</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">영업 1팀</option>
                                        <option value="">영업 2팀</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">1</option>
                                        <option value="">2</option>
                                        <option value="">3</option>
                                    </select>
                                    <p>2022년 11월 20일</p>
                                </div>
                            </label>
                            <label for="member5">
                                <div class="list-item">
                                    <input type="checkbox" id="member5" name="memberInfo" class="selectOne" />
                                    <p>P123123123</p>
                                    <p>윤태원</p>
                                    <select name="" id="">
                                        <option value="">사원</option>
                                        <option value="">부장</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">영업부</option>
                                        <option value="">인사부</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">영업 1팀</option>
                                        <option value="">영업 2팀</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">1</option>
                                        <option value="">2</option>
                                        <option value="">3</option>
                                    </select>
                                    <p>2022년 11월 20일</p>
                                </div>
                            </label>
                            <label for="member6">
                                <div class="list-item">
                                    <input type="checkbox" id="member6" name="memberInfo" class="selectOne" />
                                    <p>P123123123</p>
                                    <p>윤태원</p>
                                    <select name="" id="">
                                        <option value="">사원</option>
                                        <option value="">부장</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">영업부</option>
                                        <option value="">인사부</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">영업 1팀</option>
                                        <option value="">영업 2팀</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">1</option>
                                        <option value="">2</option>
                                        <option value="">3</option>
                                    </select>
                                    <p>2022년 11월 20일</p>
                                </div>
                            </label>
                            <label for="member7">
                                <div class="list-item">
                                    <input type="checkbox" id="member7" name="memberInfo" class="selectOne" />
                                    <p>P123123123</p>
                                    <p>윤태원</p>
                                    <select name="" id="">
                                        <option value="">사원</option>
                                        <option value="">부장</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">영업부</option>
                                        <option value="">인사부</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">영업 1팀</option>
                                        <option value="">영업 2팀</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">1</option>
                                        <option value="">2</option>
                                        <option value="">3</option>
                                    </select>
                                    <p>2022년 11월 20일</p>
                                </div>
                            </label>
                            <label for="member8">
                                <div class="list-item">
                                    <input type="checkbox" id="member8" name="memberInfo" class="selectOne" />
                                    <p>P123123123</p>
                                    <p>윤태원</p>
                                    <select name="" id="">
                                        <option value="">사원</option>
                                        <option value="">부장</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">영업부</option>
                                        <option value="">인사부</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">영업 1팀</option>
                                        <option value="">영업 2팀</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">1</option>
                                        <option value="">2</option>
                                        <option value="">3</option>
                                    </select>
                                    <p>2022년 11월 20일</p>
                                </div>
                            </label>
                            <label for="member9">
                                <div class="list-item">
                                    <input type="checkbox" id="member9" name="memberInfo" class="selectOne" />
                                    <p>P123123123</p>
                                    <p>윤태원</p>
                                    <select name="" id="">
                                        <option value="">사원</option>
                                        <option value="">부장</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">영업부</option>
                                        <option value="">인사부</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">영업 1팀</option>
                                        <option value="">영업 2팀</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">1</option>
                                        <option value="">2</option>
                                        <option value="">3</option>
                                    </select>
                                    <p>2022년 11월 20일</p>
                                </div>
                            </label>
                            <label for="member10">
                                <div class="list-item">
                                    <input type="checkbox" id="member10" name="memberInfo" class="selectOne" />
                                    <p>P123123123</p>
                                    <p>윤태원</p>
                                    <select name="" id="">
                                        <option value="">사원</option>
                                        <option value="">부장</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">영업부</option>
                                        <option value="">인사부</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">영업 1팀</option>
                                        <option value="">영업 2팀</option>
                                    </select>
                                    <select name="" id="">
                                        <option value="">1</option>
                                        <option value="">2</option>
                                        <option value="">3</option>
                                    </select>
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
                    <div id="set-position" class="box">
                        <div class="side-title">
                            <p>직급 설정</p>
                            <span class="material-symbols-outlined"> add_box </span>
                        </div>

                        <div class="select">
                            <div class="text">직급 목록</div>
                            <span class="material-symbols-outlined"> expand_more </span>
                            <ul class="option-list">
                                <li class="option-wrap">
                                    <div class="option">대표</div>
                                    <div class="remove-position">
                                        <span class="material-symbols-outlined">remove</span>
                                    </div>
                                </li>
                                <li class="option-wrap">
                                    <div class="option">부장</div>
                                    <div class="remove-position">
                                        <span class="material-symbols-outlined">remove</span>
                                    </div>
                                </li>
                                <li class="option-wrap">
                                    <div class="option">사원</div>
                                    <div class="remove-position">
                                        <span class="material-symbols-outlined">remove</span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div id="select-wrap" class="box">
                        <div class="side-title sep">
                            <p>선택된 사원목록</p>
                        </div>
                        <div class="select-employee-list">
                            <div class="select-employee-box">
                                <div class="select-employee-pic">
                                    <img src="<c:url value='/resources/img/jang.jpg'/>" alt="" />
                                </div>
                                <div class="info-box">
                                    <div class="select-dept-info">
                                        <p>영업부</p>
                                        <p>영업 2팀</p>
                                    </div>
                                    <div class="select-employee-info">
                                        <p>구기석</p>
                                        <p>부장</p>
                                    </div>
                                </div>
                            </div>
                            <span class="material-symbols-outlined removeBtn">person_remove</span>
                        </div>
                    </div>
                </aside>
            </div>
        </main>
    </body>
</html>
