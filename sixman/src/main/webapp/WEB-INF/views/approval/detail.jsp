<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/sixman/resources/css/document/documentwrite.css">
<link rel="stylesheet" href="/sixman/resources/css/approval/detail.css">
</head>
<body>

    <%@include file="/WEB-INF/views/common/tempMenuBar.jsp" %>
    <div class="main-box">
        <div id="sub-box" class="box">
            <div id="write-title">결제문서작성</div>
            <div id="write-box" class="box2">
                    
                <div class="writelist">
                    <div class="writeno"> 
                        <div>문서번호</div>
                        <div type="text" name="no">${vo.no}</div>
                    </div>
                    <div class="writeno">
                        <div>기안일</div>
                        <div>${vo.enrollDate}</div>
                    </div>
                    <div class="writeno">
                        <div>기안자</div>
                        <div type="text" name="sendName">${vo.sendName}</div>
                    </div>
                </div>
                <div class="docbox">
                    <div class="doc-member-item">
                    	<div>기안</div>
                        <div><span class="material-symbols-outlined"> done </span></div>
                        <div>${vo.sendName}</div>
                        <c:set var="done" value="Y"/>
                    </div>    
                <c:forEach items="${vo.line}" var="member" varStatus="status">
                    <div class="doc-member-item">
                    	<c:if test="${!status.last}">
                    		<div>검토</div>
                    	</c:if>
                    	<c:if test="${status.last}">
                    		<div>결재</div>
                    	</c:if>
                    	
                    	<c:choose>
                    		<c:when test="${member.state=='N' and member.appMan == loginMember.no and done == 'Y'}">
                    			<c:set var="done" value="N"/>
                                <c:set var="isMe" value="Y"/>
                    			<div onclick="approval('${member.no}', this)"><span class="material-symbols-outlined btn"> add </span></div>
                    		</c:when>
                    		<c:when test="${member.state=='Y'}">
                    		    <c:set var="done" value="Y"/>
                    			<div><span class="material-symbols-outlined"> done </span></div>
                    		</c:when>
                    		<c:otherwise>
                                <c:set var="done" value="N"/>
                                <div></div>
                            </c:otherwise>
                    	</c:choose>

                        <div>${member.name}&nbsp;<p>${member.positionName}</p></div>
                    </div>                	
                </c:forEach>
                </div>
            </div>
            <div id="doc-header">
                <div id="title-box">
                    <div class="doc-title">제목</div>
                    <input id="title-input" name="title" type="text" readonly value="${vo.title}">
                </div>
                <div id="doc-menu-box">
                    <div>
                        <div>문서타입</div>
                        <select name="type">
                            <c:if test="${vo.type==1}">
                                <option value="1">일반문서</option>
                            </c:if>
                            <c:if test="${vo.type==2}">
                                <option value="2">휴가신청</option>
                            </c:if>
                        </select>
                    </div>
                    <div>
                        <div>시행일자</div>
                        <div id="date-box">
                            <input type="text" name="startDate" value="${vo.startDate}" readonly>
                            <div>~</div>
                            <input type="text" name="endDate" value="${vo.endDate}" readonly>
                        </div>
                    </div>
                </div>
            </div>
            <div id="file-box">
                <div class="header-item-title">첨부파일
                    <div id="file-btn" class="btn"><span class="material-symbols-outlined"> add </span></div>
                </div>
                <div id="file-list"></div>
            </div>
            <div class="approval-content">본문</div>
            <div id="content-box">
                ${vo.content}
            </div>
            <div id="btn-box">
                <c:if test="${isMe=='Y'}">
                    <input name="subit" class="c-btn" type="submit" value="반려하기">
                </c:if>
            </div>
        </div>
    </div>
    
</body>
<script>

    function approval(no, obj) {
        
        const httpRequest = new XMLHttpRequest();
        httpRequest.open('post', '/sixman/approval/check');
        httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
        httpRequest.send(`no=${no}`);
    }

</script>
</html>