<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="<c:url value='/resources/css/admin/member/join.css'/>" />
        <script defer src="<c:url value='/resources/js/admin/member/join.js'/>"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
        <!-- kakao -->
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <!-- jstree -->
        <script defer src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
        <link rel="stylesheet" href="/sixman\resources\jstree\default\style.min.css" />
        <script src="https://kit.fontawesome.com/ae846b135b.js" crossorigin="anonymous"></script>
    </head>

    <body>
        <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
        <main id="main-page" class="main-box">
            <div id="main-box-2">
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
                <section id="member-wrap">
                    <form action="/sixman/admin/member/join" method="POST" enctype="multipart/form-data" id="form">
                        <article id="member-info" class="box">
                            <figure id="companyLogo">
                                <img alt="기업로고" src="<c:url value='/resources/img/google.png'/>" />
                            </figure>
                            <div class="header">
                                <span class="material-symbols-outlined">person_add</span>
                                <label>사원 등록</label>
                            </div>
                            <div class="wrap">
                                <div class="info-wrap">
                                    <div class="left-info">
                                        <div id="profile-view">
                                            <img alt="프로필사진" src="<c:url value='/resources/img/defaultProfilePic.png'/>" class="image-box" />
                                        </div>
                                        <div id="dept" class="write">
                                            <label for="">부 서</label>
                                            <select name="deptNo" id="dept">
                                            	<c:forEach items="${deptList}" var="i">
                                                <option value="${i.no}" <c:if test="${i.no eq 1}">selected</c:if>>${i.name}</option>
                                            	</c:forEach>
                                            </select>
                                        </div>
                                        <div id="position" class="write">
                                            <label for="">직 급</label>
                                            <select name="positionNo">
                                                <c:forEach items="${positionList}" var="i">
                                                <option value="${i.no}" <c:if test="${i.no eq 1}">selected</c:if>>${i.position}</option>
                                            	</c:forEach>
                                            </select>
                                        </div>
                                        <div id="birth" class="write">
                                            <label for="">생년월일</label>
                                            <input type="text" name="birthday" placeholder="YYMMDD" />
                                        </div>
                                        <div id="email" class="write">
                                            <label for="">E-MAIL</label>
                                            <input type="text" name="email" />
                                        </div>
                                    </div>
                                    <div class="right-info">
                                        <div id="id" class="write">
                                            <label for="">사 번</label>
                                            <input type="text" name="id" placeholder="영,숫자로만 입력하세요." />
                                            <span>*</span>
                                        </div>
                                        <div id="name" class="write">
                                            <label for="">성 명</label>
                                            <input type="text" name="name" />
                                            <span>*</span>
                                        </div>
                                        <div id="phone" class="write">
                                            <label for="">연락처</label>
                                            <input type="text" name="phone" placeholder="'-'를 제외하고 입력하세요." />
                                        </div>
                                        <div id="authorize" class="write">
                                            <label for="">권 한</label>
                                            <select name="authorizeNo">
                                                <c:forEach items="${authorizeList}" var="i">
                                                    <option value="${i.no}">${i.level}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div id="team" class="write">
                                            <label for="">팀</label>
                                            <select name="" id="">
                                                <option value="1">영업 1팀</option>
                                                <option value="2">영업 2팀</option>
                                                <option value="3">영업 3팀</option>
                                            </select>
                                        </div>
                                        <div id="bank" class="write">
                                            <label for="">계좌번호</label>
                                            <select name="bankNo">
                                                <c:forEach items="${bankList}" var="i">
                                                    <option value="${i.no}">${i.name}</option>
                                                </c:forEach>
                                            </select>
                                            <input type="text" name="account" placeholder="'-'를 제외하고 입력하세요." />
                                        </div>
                                    </div>
                                </div>
                                <div id="address-wrap" class="write">
                                    <label for="">주 소</label>
                                    <input type="text" id="address" name="address" readonly />
                                    <button type="button" id="address_kakao">검 색</button>
                                </div>
                                <div id="submit">
                                    <input type="submit" value="사원 등록" />
                                </div>
                            </div>
                        </article>
                        <article id="file-wrap">
                            <div id="required-file" class="box">
                                <div class="title">
                                    <h2>중요파일 등록</h2>
                                </div>
                                <div id="profile-pic">
                                    <div class="addfile">
                                        <span>프로필사진</span>
                                        <button type="button" class="plus" id="add-pic">
                                            <span class="material-symbols-outlined">add</span>
                                            추 가
                                        </button>
                                    </div>
                                </div>
                                <div id="resume">
                                    <div class="addfile">
                                        <span>이력서</span>
                                        <input type="file" />
                                        <button type="button" class="plus" id="add-resume">
                                            <span class="material-symbols-outlined">add</span>
                                            추 가
                                        </button>
                                    </div>
                                </div>
                                <div id="copy-account">
                                    <div class="addfile">
                                        <span>통장사본</span>
                                        <input type="file" />
                                        <button type="button" class="plus" id="add-account">
                                            <span class="material-symbols-outlined">add</span>
                                            추 가
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div id="attachment-file" class="box">
                                <div class="title">
                                    <h2>첨부파일</h2>
                                    <div id="controller">
                                        <input type="checkbox" class="all_check" />
                                        <span id="add-attfile" class="material-symbols-outlined">add_circle</span>
                                        <span id="remove-attfile" class="material-symbols-outlined">delete</span>
                                    </div>
                                </div>

                                <div class="att-filelist"></div>
                            </div>
                        </article>
                    </form>
                </section>
            </div>
        </main>
    </body>
</html>
