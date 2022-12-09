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
<link rel="stylesheet" href="${path}/resources/css/notice/noticeWrite.css">
<!-- 섬머노트 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>    
</head>
<body>

<%@include file="/WEB-INF/views/common/menuBar.jsp" %>
<main class="main-box">

    <div  id="notice-box" class="box">
        <div class="title-box">
            <a href="${path}/notice/list" class="material-symbols-outlined"> chevron_left </a>
            <div class="b-title">글 작성</div>
        </div>
        <div id="wirte-box">
            <p>중요</p>
            <input type="checkbox">
            <div></div>
            <p>제목</p>
            <div></div>
            <input type="text">
            <p>파일첨부</p>
            <div class="btn"><span class="material-symbols-outlined"> add </span></div>
            <div id="file-box">
                <div class="file-item">
                    <p>민아럼닝ㅁㄴ이ㅏㅓㄻㄴ;ㅇ라ㅣㅁㄴ.jpg</p>
                    <span class="material-symbols-outlined"> close </span>
                </div>
            </div>
        </div>
        <div name="" id="summernote"></div>
        <div id="btn-box">
            <div class="btn"><p>작성하기</p></div>
        </div>
    </div>

</main>

</body>
<script>
    $(document).ready(function () {
        $('#summernote').summernote({
            placeholder: '내용을 작성하세요',
            height: 450,
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