<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var = "path" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 프로젝트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,600,1,200" />
<link rel="stylesheet" href="${path}\resources\css\project\allprj.css">
<script defer src="${path}\resources\js\project\allprj.js"></script>
</head>
<body link="#12887A" vlink="#62C276" alink="blue">
    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
    <main class="main-box">
        <div class="hidden"></div>
        <div class="prjtype all">
            <span class="material-symbols-outlined">expand_more</span>
            <p>전체 프로젝트</p>
        </div>
        <div class="prj-all">
            <div class="prj-all-box">
                <c:forEach var="list" items="${prjList}">
	                <div class="project-box">
	                    <div class="prj-box">
	                        <div class="box-header">
	                            <span class="material-symbols-outlined">public</span>
	                            <a href="${path}/project/detail?no=${list.no}"><p>${list.title}</a></p>
	                        </div>
							<div class="favorite">
								<input type="checkbox" id="check_favorite${list.no}" value="${list.no}">
								<label for="check_favorite${list.no}" class="normal"><span class="material-symbols-outlined">star</span></label>
							</div>
	                    </div>
	                    <div class="box-body">
	                        <div class="date">
	                            <span class="material-symbols-outlined">calendar_today</span>
	                            <c:choose>
	                            	<c:when test="${fn:length(list.startDate) > 12 }">
			                            <div class="prjdate"><c:out value="${fn:substring(list.startDate, 0, 10)}" /></div>
			                            <p>~</p>
			                            <div class="prjdate2"><c:out value="${fn:substring(list.endDate, 0, 10)}" /></div>
		                            </c:when>
	                            </c:choose>
	                        </div>
	                        <div class="leader">
	                            <span class="material-symbols-outlined">person</span>
	                            <p>${list.leader}</p>
								<c:if test="${list.status eq 'I'}">
	                            <div class="status ing">진행중</div>
								</c:if>
								<c:if test="${list.status eq 'D'}">
	                            <div class="status delay">지연중</div>
								</c:if>
								<c:if test="${list.status eq 'C'}">
	                            <div class="status complete">완 료</div>
								</c:if>
	                        </div>
							<div class="progressBar">
								<div class="guage" value="${list.progress}">${list.progress}</div>
								<input type="hidden" id="progress_val" class="status-progress${list.no}" value="${list.progress}">
							</div>
	                    </div>
	                </div>
   				</c:forEach>
            </div>
        </div>
    </main>
</body>
</html>