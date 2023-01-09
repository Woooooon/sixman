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
<link rel="stylesheet" href="${path}/resources/css/mail/mailDetail.css">
<script defer src="${path}/resources/js/mail/mailList.js"></script>
<script defer src="${path}/resources/js/mail/mailAjax.js"></script>
<script defer src="${path}/resources/js/file/file.js"></script>
<script>
	window.onload = ()=>{
        getCategoryList();
	}
</script>
</head>
<body>

<%@include file="/WEB-INF/views/common/menuBar.jsp" %>
<main class="main-box">

	<div id="notice-box" class="box">
        <div class="title-box">
            <span class="material-symbols-outlined" onclick="location.href='${path}/mail/list'"> chevron_left </span>
            <div class="b-title">받은 메일함</div>
        </div>
        <div class="list-box">
            <div class="first-item">
                <div class="t-btn" onclick="location.href='/sixman/mail/write?email=${vo.userEmail}';">답장</div>
                <div class="t-btn" onclick="deleteAjax(true, ${vo.mailNo})">삭제</div>
                <div class="t-btn category-btn click-able">
                    이동
                    <span class="material-symbols-outlined"> arrow_drop_down </span>
                    <div id="category-box" style="display: none;">
                        <div class="category-items">
                            <c:forEach items="${categoryList}" var="category">
                            <label>${category.NAME}<input name="category" type="radio" value="${category.NO}"><span class="material-symbols-outlined"> close </span></label>
                        	</c:forEach>
                        </div>
                        <div class="category-footer">
                            <div class="c-btn" onclick="createCategoryModal(true)"><p>추가</p></div>
                            <div class="btn" onclick="changeCategory(true, ${vo.mailNo})"><p>이동</p></div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="mail-header">
                <div id="board-title">${vo.title}</div>
                <div id="send-member">
                    <p>보낸사람</p>
                    <input type="email" readonly value="${vo.userEmail}">
                    <div class="btn" onclick="location.href='/sixman/address/add?email=${vo.userEmail}'"><span class="material-symbols-outlined"> add </span><p>주소록</p></div>
                    <p>받는사람</p>
                    <div id="members">
                        <c:forEach items="${vo.sender}" var="sender">
                            <div class="members-item"><input type="email" name="sender" value="${sender}" readonly></div>
                        </c:forEach>
                    </div>
                </div>
                
                <div id="file-box">
                    <div>
                        <c:if test="${not empty vo.fileList}">
                            <input id="list-check" type="checkbox">
                            <label for="list-check" class="material-symbols-outlined"> arrow_drop_down </label>
                            <div id="file-list">
                                <c:forEach items="${vo.fileList}" var="fv">
                                    <div class="file-item">
                                        <div>${fv.originName}</div>
                                        <span class="material-symbols-outlined" onclick="download(${fv.no}, 'MAIL')"> download </span>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:if>
                    </div>
                    <div>작성일<p id="enroll-date">${vo.sendTime}</p></div>
                </div>
            </div>
            <div id="content-box">
                ${vo.content}
            </div>
        </div>
        <div id="board-footer">
            <c:if tes="${vo.userEmail == loginMember.email}">
                <c:if test="${empty save}">
                    <div class="btn" onclick="location.href='/sixman/mail/reWrite?no=${vo.mailNo}'"><p>다시쓰기</p></div>
                </c:if>
                <c:if test="${not empty save}">
                    <div class="btn" onclick="location.href='/sixman/mail/reWrite?no=${vo.mailNo}&save=true'"><p>다시쓰기</p></div>
                </c:if>
            </c:if>
        </div>
    </div>

</main>

</body>
</html>