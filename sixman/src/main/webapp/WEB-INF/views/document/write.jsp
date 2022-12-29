<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var = "path" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${path}/resources/css/document/documentwrite.css">

<!-- 섬머노트 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>    
 <script defer src="${path}/resources/js/document/documentwrite.js"></script>     
</head>
<body>

<%@include file="/WEB-INF/views/common/menuBar.jsp" %>

<div class="main-box">
    <form action="" id="docuhi" method="POST" enctype="multipart/form-data" >
    <div id="sub-box" class="box">
        <div id="write-title">결제문서작성</div>
        <div id="write-box" class="box2">
                
            <div class="writelist">
                <div class="writeno"> 
                    <div>문서번호</div>
                    <div type="text" name="no">${dvo.no}</div>
                </div>
                <div class="writeno">
                    <div>기안일</div>
                    <div>${dvo.enrollDate }</div>
                </div>
                <div class="writeno">
                    <div>기안자</div>
                    <div type="text" name="sendPay">${loginMember.name}</div>
                </div>
                <div class="writeno">
                    <div>참조자</div>
                    <input type="text" name="refer" value="입력해주세요.">
                </div>
            </div>
            <div class="docbox">
                <div class="ppp">
                    <div>직급</div>
                    <div class="btn"><span class="material-symbols-outlined"> add </span> </div>
                    <div>심원용</div>
                </div>
                <div class="ppp">
                    <div>직급</div>
                    <div class="btn"><span class="material-symbols-outlined"> add </span> </div>
                    <div>심투용</div>
                </div>
                <div class="ppp">
                    <div>직급</div>
                    <div class="btn"><span class="material-symbols-outlined"> add </span> </div>
                    <div>심삼용</div>
                </div>
            </div>
        </div>
        <div id="write-header">
            <div id="header-title">
                <div class="header-item-title">제목</div>
                <input name="title" type="text" value="${dvo.title}">
            </div>
            <div id="file-box">
                <div class="header-item-title">파일추가
                    <div id="file-btn" class="btn"><span class="material-symbols-outlined"> add </span></div>
                </div>
                <div id="file-list"></div>

            </div>
        </div>
        <textarea name="content" id="summernote"></textarea>
        <div id="btn-box">
            <!-- <input name="subit" class="c-btn" type="submit" value="반려하기"> -->
            <input name="submit" class="btn" type="submit" value="작성하기">
            <input name="submit" class="c-btn" type="submit" value="임시저장">
        </div>
    </div>
</form>
</div>

</body>
<script>
    $(document).ready(function () {
        $('#summernote').summernote({
            placeholder: '내용을 작성하세요',
            height: 450,
            margin: 0,
            lang: "ko-KR",
            toolbar: [
                // [groupName, [list of button]]
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['font', ['strikethrough', 'superscript', 'subscript']],
                ['fontsize', ['fontsize']],
                ['color', ['color']],
                ['insert', ['table', 'picture']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']]
            ]
        });
    });


   
</script>
</html>