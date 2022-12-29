<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var = "path" value = "${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 생성</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="${path}\resources\css\project\create.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script defer src="${path}/resources/js/project/create.js"></script>
</head>
<body>
    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
    <form action="" method="post" enctype="multipart/form-data">
        <main class="main-box">
            <div class="main-box2">
                <div class="create-box box">
                    <div class="head-box">
                        <div class="name-box">
                            <div class="box1">
                                <div class="prj">프로젝트명</div>
                                <input type="text" name="title">
                            </div>
                            <div class="box2">
                                <button class="btn create_btn cbtn">작성하기</button>
                                <button class="c-btn cancel-btn cbtn" onclick="history.back()">취소하기</button>
                            </div>
                        </div>
                        <div style="height: 20px;"></div>
                        <div class="body-box">
                            <div class="line">
                                <div class="prj">일 정</div>
                                <input type="date" name="startDate" id="startDate"> <p>~</p> <input type="date" name="endDate" id="endDate">
                                <div class="prj prj2">생성자</div>
                                <div class="prj writer1" name="writer">${loginMember.name}</div>
                                <input type="hidden" name="writer" value="${loginMember.no}">
                            </div>
                            <div class="line">
                                <div class="prj">부 서</div>
                                <div class="select" data-role="selectBox">
                                    <span date-value="optValue" class="selected-option"><!-- 선택된 옵션 값이 출력되는 부분 --></span>
                                    <input type="hidden" id="teamvalue" name="team">
                                    <ul class="hide">
                                    	<c:forEach items="${deptList}" var="dept">
                                        <label for="teamvalue"><li class="option-wrap">${dept.deptName }</li></label>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <div style="width: 30px;"></div>
                                <div class="prj">담당자</div>
                                <div class="select" data-role="selectBox">
                                    <span date-value="optValue" class="selected-option"><!-- 선택된 옵션 값이 출력되는 부분 --></span>
                                    <input type="hidden" id="leadervalue" name="leader">
                                    <!-- 옵션 영역 -->
                                    <ul class="hide">
                                    <c:forEach items="${positionList }" var="position">
                                    <label for="leadervalue"><li class="option-wrap">${position.position}</li></label>
                                    </c:forEach>
                                    </ul>
                                </div>
                                <div style="width: 30px;"></div>
                                <div class="prj">참여자</div>
                                <div class="select" data-role="selectBox">
                                    <span date-value="optValue" class="selected-option"><!-- 선택된 옵션 값이 출력되는 부분 --></span>
                                    <input type="hidden" id="membervalue" name="memberNo">
                                    <ul class="hide">
                                        <label for="membervalue"><li class="option-wrap">김민우</li></label>
                                        <label for="membervalue"><li class="option-wrap">구기석</li></label>
                                        <label for="membervalue"><li class="option-wrap">임정한</li></label>
                                        <label for="membervalue"><li class="option-wrap">윤태원</li></label>
                                    </ul>
                                </div>
                            </div>
                            <div class="team-member-box"></div>
                            <div class="line">
                                <div class="btn prj" id="file-btn">첨부파일</div>
                                <!-- <div id="file-btn" class="btn"><span class="material-symbols-outlined"> add </span></div> -->
                                <div id="file-box"></div>
                            </div>            
                            <div class="line">
                                <div class="prj">내 용</div>
                                <textarea name="content" class="content"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="side-box">
                    <div class="calendar box">
                        <div class="header">
                            <button class="nav-btn go-prev" onclick="prevMonth()" type="button">&lt;</button>
                            <div class="year-month"></div>
                            <button class="nav-btn go-next" onclick="nextMonth()" type="button">&gt;</button>
                        </div>
                        <div class="main">
                            <div class="days">
                                <div class="day">일</div>
                                <div class="day">월</div>
                                <div class="day">화</div>
                                <div class="day">수</div>
                                <div class="day">목</div>
                                <div class="day">금</div>
                                <div class="day">토</div>
                            </div>
                            <div class="dates"></div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </form>
</body>
</html>