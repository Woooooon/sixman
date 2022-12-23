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
<link rel="stylesheet" href="${path}/resources/css/mail/mailWrite.css">
<!-- 섬머노트 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>    
<script defer src="${path}/resources/js/mail/mail.js"></script>    
</head>
<body>

<%@include file="/WEB-INF/views/common/menuBar.jsp" %>
<main class="main-box">

    <form action="" method="POST" enctype="multipart/form-data">

        <div  id="notice-box" class="box">
            <div class="title-box">
                <a href="${path}/mail/list" class="material-symbols-outlined"> chevron_left </a>
                <div class="b-title">메일 작성</div>
            </div>
            <div id="wirte-box">
                <p>받는사람</p>
                <div></div>
                <div id="resive-member"><input id="email-input" type="text"><div class="btn"><p>주소록</p></div></div>
                <div id="members">
                    
                </div>
                <p>제목</p>
                <div></div>
                <input name="title" type="text">
                <p>파일첨부</p>
                <div id="file-btn" class="btn"><span class="material-symbols-outlined"> add </span></div>
                <div id="file-box">
                </div>
            </div>
            <textarea name="content" id="summernote"></textarea>
            <div id="btn-box">
                <input name="saveYn" class="btn" type="submit" value="작성하기">
                <input name="saveYn" class="c-btn" type="submit" value="임시저장">
            </div>

        </form>
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