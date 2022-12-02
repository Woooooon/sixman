<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/member/join.css'/>" />
</head>
<body>
    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>

    <main id="main-page" class="main-box">
        <div id="main-box-2">
            <aside id="dept-tree" class="box"></aside>
            <section id="member-controller">
                <form action="">
                    <article id="member-info" class="box">
                        <div class="left-info">
                            <div>
                                <div>
                                    <img alt="프로필사진" src="<c:url value='/resources/img/cat.png'/>" />
                                </div>
                                <div>
                                    <div id="dept">
                                        <label for="">부 서</label>
                                        <select name="dept_no" id="dept">
                                            <option value="1">영업부</option>
                                            <option value="2">인사부</option>
                                            <option value="3">관리부</option>
                                            <option value="4">마케팅부</option>
                                        </select>
                                    </div>
                                    <div id="dept">
                                        <label for="">직 급</label>
                                        <select name="" id="">
                                            <option value="1">사 원</option>
                                            <option value="2">대 리</option>
                                            <option value="3">과 장</option>
                                            <option value="4">차 장</option>
                                            <option value="5">부 장</option>
                                        </select>
                                    </div>
                                    <div id="dept">
                                        <label for="">생년월일</label>
                                        <input type="text" />
                                    </div>
                                    <div id="dept">
                                        <label for="">E-MAIL</label>
                                        <input type="text" />
                                    </div>
                                </div>
                            </div>
                            <div class="right-info"></div>
                        </div>
                        <div id="adress">
                            <input type="text" />
                        </div>
                        <input type="submit" value="사원 등록" />
                    </article>
                    <article id="member-file">
                        <div id="required-file" class="box"></div>
                        <div id="add-file" class="box"></div>
                    </article>
                </form>
            </section>
        </div>
    </main>
</body>
</html>
