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
<body>
    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
    <main class="main-box">
        <div class="hidden"></div>
        <div class="prjtype all">
            <span class="material-symbols-outlined">expand_more</span>
            <p>전체 프로젝트</p>
        </div>
        <div class="prj-all">
            <div class="prj-all-box">
                <c:forEach var="list" items="${List}">
	                <div class="project-box">
	                    <div class="prj-box">
	                        <div class="box-header">
	                            <span class="material-symbols-outlined">public</span>
	                            <p>${list.title}</p>
	                        </div>
	                        <div class="favorite"><span class="material-symbols-outlined normal">star</span></div>
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
	                        <div class="reader">
	                            <span class="material-symbols-outlined">person</span>
	                            <p>${list.leader }</p>
	                            <div class="status ing"></div>
	                        </div>
	                        <div class="status-progress"></div>
	                    </div>
	                </div>
   				</c:forEach>
            </div>
        </div>
    </main>
</body>
</html>