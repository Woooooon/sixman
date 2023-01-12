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
<script defer src="${path}/resources/js/notice/noticeWrite.js"></script>
<script defer src="${path}/resources/js/file/file.js"></script>
</head>
<body>

<c:if test="${loginMember.authorizeNo==3}">
    <%@include file="/WEB-INF/views/common/tempMenuBar.jsp" %>
</c:if>
<c:if test="${loginMember.authorizeNo!=3}">
    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
</c:if>
<main class="main-box">

    <form action="" method="post" enctype="multipart/form-data">
        <div  id="notice-box" class="box">
            <div class="title-box">
                <a href="${path}/notice/list" class="material-symbols-outlined"> chevron_left </a>
                <div class="b-title">글 작성</div>
            </div>
            <div id="wirte-box">
                <p>중요</p>
                <c:if test="${vo.inportantYn == 'Y'}">
                	<c:set var="checked" value="checked"/>
                </c:if>
                <input name="inportantYn" type="checkbox" value="Y" ${checked}>
                <div></div>
                <p>제목</p>
                <div></div>
                <input name="title" type="text" value="${vo.title}">
                <p>파일첨부</p>
                <div id="file-btn" class="btn"><span class="material-symbols-outlined"> add </span></div>
                <div id="file-box">
                    <c:forEach items="${vo.fileList}" var="fv">
	                    <div class="file-item">
	                        <p>${fv.originName}</p>
	                        <span class='material-symbols-outlined' onclick="deleteFile(this, ${fv.no}, 'NOTICE')"> close </span>
	                    </div>
                    </c:forEach>
                </div>
            </div>
            <textarea name="content" id="summernote">${vo.content}</textarea>
            <div id="btn-box">
                <input type="submit" class="btn" value="수정하기">
            </div>
        </div>
    </form>
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