<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var = "path" value = "${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}\resources\css\project\create.css">
</head>
<body>
    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
    <main class="main-box">
        <div class="main-box2">
        <div class="create-box box">
            <div class="head-box">
                <div class="name-box">
                    <div class="prj">프로젝트명</div>
                    <input type="text" name="prj_name">
                    <span></span>
                    <button class="btn create_btn cbtn">작성하기</button>
                    &nbsp;
                    <button class="c-btn cancel-btn cbtn">취소하기</button>
                </div>
                <div style="height: 20px;"></div>
                <div class="body-box">
                    <div class="line">
                    <div class="prj">일 정</div>
                    <input type="date" name="prjDate1"> ~ <input type="date" name="prjDate2">
                    </div>
                    <div class="line">
                    <div class="prj">팀</div>
                    <select>
                        <option name="team">영업1팀</option>
                        <option name="team">영업2팀</option>
                        <option name="team">비품관리팀</option>
                    </select>
                    
                    <div class="prj">담당자</div>
                    <select>
                        <option name="manager">구기석</option>
                        <option name="manager">김민우</option>
                    </select>
                    </div>
                    <div class="line">
                    <div class="prj">참여자</div>
                    <select>
                        <option name="member">임정한</option>
                        <option name="member">윤태원</option>
                        <option name="member">양수철</option>
                        <option name="member">주  환</option>
                    </select>
                    </div>            
                    <div class="line">
                    <div class="prj">첨부파일</div>
                    <div id="file-btn" class="btn"><span class="material-symbols-outlined"> add </span></div>
                    <div id="file-box">
                    </div>
                    </div>            
                    <div>
                    <div class="prj">내 용</div>
                    <textarea name="content" class="content"></textarea>
                    </div>
                </div>
            </div>
        </div>
            <div class="side-box">
                calendar
            </div>
        </div>
    </main>
</body>
</html>