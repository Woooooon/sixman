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
<link rel="stylesheet" href="${path}/resources/css/docuwrite.css">

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
<div class="main-box">
    <div>
    <div action="">

        <div  id="notice-box" class="box">
            <div class="title-box">
                <div class="b-title">결재문서 작성</div>
                <div class="tt"></div>
            </div>
         
            <br>
            <br>

          <div id="write-box" class="box2">
            
                <div class="writelist">
                    <div class="writeno">
                        <div>문서번호</div>
                        <div>20221214</div>
                    </div>
                    <div class="writeno">
                        <div>기안일</div>
                        <div>2022</div>
                    </div>
                    <div class="writeno">
                        <div>기안자</div>
                        <div>구기석</div>
                    </div>
                    <div class="writeno">
                        <div>참조자</div>
                        <div>심원용</div>
                    </div>
                </div>
                <div class="docbox">
                    <div class="ppp">
                        <div>직급</div>
                        <div> + 이미지</div>
                        <div>심원용</div>
                    </div>
                    <div class="ppp">
                        <div>직급</div>
                        <div>+ 이미지</div>
                        <div>심투용</div>
                    </div>
                    <div class="ppp">
                        <div>직급</div>
                        <div>+ 이미지</div>
                        <div>심삼용</div>
                    </div>
                </div>
            </div>
            
        </div>
        <div class="docutitlebox">
            <div class="docu-title">
                <div class="ti-1">제목</div>
                <div class="ti-2">아몰루?</div>
            </div>
            <div class="docu-content">파일추가</div>
        </div>

        <div class="filebox">

             <div class="writefile">
                
                <div id="file-btn" class="btn"><span class="material-symbols-outlined"> add </span></div>
                <div id="file-box"></div>
             </div>
     
        </div>
        </div>

        <div name="" id="summernote"></div>
        <div id="btn-box">
            <input name="subit" class="c-btn" type="submit" value="반려하기">
            <input name="submit" class="btn" type="submit" value="작성하기">
            <input name="submit" class="c-btn" type="submit" value="임시저장">
        </div>
     </form>
    

    </div>

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