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
                        <div type="text" name="no"></div>
                    </div>
                    <div class="writeno">
                        <div>기안일</div>
                        <div></div>
                    </div>
                    <div class="writeno">
                        <div>기안자</div>
                        <div type="text" name="sendName">${loginMember.name}</div>
                    </div>
                    <div class="writeno">
                        <div>참조자</div>
                        <div></div>
                    </div>
                </div>
                <div class="docbox">
                    <div class="ppp">
                        <div>직급</div>
                        <div><span class="material-symbols-outlined btn"> add </span></div>
                        <div>심원용</div>
                    </div>
                    <div class="ppp">
                        <div>직급</div>
                        <div><span class="material-symbols-outlined btn"> add </span></div>
                        <div>심투용</div>
                    </div>
                    <div class="ppp">
                        <div>직급</div>
                        <div><span class="material-symbols-outlined btn"> add </span></div>
                        <div>심삼용</div>
                    </div>
                </div>
            </div>
            <div id="header-title">
                <div class="header-item-title">제목</div>
                <input id="title-input" readonly name="title" type="text" value="${dvo.title}">
            </div>
            <div id="write-header">
                <div id="file-box">
                    <div class="header-item-title">첨부파일
                    </div>
                    <div id="file-list"></div>
                </div>
            </div>
            <div class="approval-content">본문</div>
            <div id="content-box">

            </div>
            <div id="btn-box">
                <!-- <input name="subit" class="c-btn" type="submit" value="반려하기"> -->
                <input name="submit" class="btn" type="submit" value="작성하기">
                <input name="submit" class="c-btn" type="submit" value="임시저장">
            </div>
        </div>
    </div>
    
</body>
<script>
</script>
</html>