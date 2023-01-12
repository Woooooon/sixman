<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var = "path" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/list.css">
<link rel="stylesheet" href="${path}/resources/css/mail/mailList.css">
<script defer src="${path}/resources/js/mail/mailList.js"></script>
<script defer src="${path}/resources/js/mail/mailAjax.js"></script>
<script>
	window.addEventListener('load', function() {
		let listType = '${listType}';
		if(listType!=null){
			if(listType == '') {listType = null;}
			mailAjax(1, null, listType);
		}else{
			mailAjax(1);
		}
	});
</script>
</head>
<body>

<%@include file="/WEB-INF/views/common/menuBar.jsp" %>
<main class="main-box">
	<div id="notice-box" class="box">
		<div id="title-header">
			<div class="title-box">
				<c:choose>
					<c:when test="${not empty listType}"><div class="b-title">${listType}</div></c:when>
					<c:otherwise><div class="b-title">전체메일함</div></c:otherwise>
				</c:choose>
			</div>
			<div id="category-list">
				<div class="category-item create-btn"><span class="material-symbols-outlined"> add </span>추가</div>
			</div>
		</div>
        <div class="header-box">
           	<c:choose>
        		<c:when test="${listType=='휴지통'}">
        			<a href="${path}/mail/write" class="btn" onclick=""><span class="material-symbols-outlined"> delete </span><p>비우기</p></a>
        		</c:when>
        		<c:otherwise>
        			<a href="${path}/mail/write" class="btn" onclick="location.href='/sixman/notice/write'"><span class="material-symbols-outlined"> add </span><p>메일쓰기</p></a>
        		</c:otherwise>
        	</c:choose>
            <div class="search-bar"><input id="search-input" type="text" placeholder="검색"><span class="material-symbols-outlined" onclick="search()"> search </span></div>
        </div>
        <div class="list-box">
            <div class="first-item">
                <div id="checkbox-box" class="none">
                    <input type="checkbox">
                    <c:choose>
                    	<c:when test="${listType == '임시보관함'}">
		                    <p onclick="deleteAjax()">삭제</p>
                    	</c:when>
                    	<c:when test="${listType == '휴지통'}">
		                    <p onclick="restoreAjax()">복원</p>
		                    <p onclick="realDelete()">영구삭제</p>
                    	</c:when>
                    	<c:otherwise>
	                    	<p onclick="updateRead()">읽음</p>
		                    <p onclick="deleteAjax()">삭제</p>
		                    <div class="category-btn">
		                    	이동
		                        <span class="material-symbols-outlined"> arrow_drop_down </span>
		                        <div id="category-box" style="display: none;">
		                            <div class="category-items">
		                            </div>
		                            <div class="category-footer">
										<div class="c-btn create-btn"><p>추가</p></div>
		                                <div class="btn" onclick="changeCategory()"><p>이동</p></div>
		                            </div>
		                        </div>
		                    </div>
		                    <c:if test="${not empty listType}"><div id="mail-count"><p class="hilight" id="mail-list-count"></p></div></c:if>
		                    <c:if test="${empty listType}"><div id="mail-count"><p class="hilight" id="mail-non-count">50</p>/<p id="mail-list-count"></p>안읽은 메일</div></c:if>
                    	</c:otherwise>
                    </c:choose>
                </div>
                
                <c:if test="${empty listType}">
	                <div>
	                    <div class="category-btn click-able">
							필터
	                        <span class="material-symbols-outlined"> arrow_drop_down </span>
	                        <div id="category-box2" style="display: none;">
	                            <div class="category-items" id="filter-box">
									<label><input type="radio" name="filter">모든메일</label>
									<label><input type="radio" name="filter" value="읽은메일">읽은메일만</label>
									<label><input type="radio" name="filter" value="안읽은메일">안읽은메일만</label>
	                            </div>
	                        </div>
	                    </div>
	                </div>
                </c:if>
            </div>
			<div id="list-item-box">
			</div>
        </div>
        <div class="page-box">
        </div>
    </div>
</main>

</body>
</html>