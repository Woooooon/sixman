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

    <form action="">

        <div  id="notice-box" class="box">
            <div class="title-box">
                <div class="b-title">결재문서 작성</div>
                <div class="tt"></div>
            </div>
         
            <br>
            <br>


          <div id="write-box" class="box2">
            
            <div class="writebx">
                <div class="write-list">

                    <div class="writelist">
                        <div class="writelist-no">문서번호</div>
                        
                    </div>
                    <div class="writedate">
                        <div class="writedate-date">기안일</div>
                        
                    </div>
                    <div class="writer">
                        <div class="writer-er">기안자</div>
                        
                    </div>
                    <div class="writech">
                        <div class="writech-er">참조자</div>
                    </div>

                </div>
                <div class="writelister">
                    <div class="writelist">
                        <div class="writelist-reno">121212</div>
                    </div>

                    <div class="writedate">
                        <div class="writedate-reda">221212</div>
                    </div>

                    <div class="writer">
                        <div class="writer-reer">심삼용</div>
                    </div>

                    <div class="writech">
                        <div class="writech-list">구기석 , 심투용 부장</div>
                    </div>


                </div>
                
            
                <div class="imageboxlist">
                    <div class="imageboxlist-1">
                        <div class="a-1">직급</div>
                        <div class="a-2">사인 이미지</div>
                        <div class="a-3">구기석 사원</div>
                    </div>
                    <div class="imageboxlist-2">
                        <div class="b-1">직급</div>
                        <div class="b-2">사인 이미지</div>
                        <div class="b-3">구기석 사원</div>
                    </div>
                    <div class="imageboxlist-3">
                        <div class="c-1">직급</div>
                        <div class="c-2">사인 이미지</div>
                        <div class="c-3">구기석 사원</div>
                    </div>

                </div>
            </div>

                <div class="filebox">

                    <div class="writefile">
                        <div>첨부파일</div>
                        <div id="file-btn" class="btn">첨부파일<span class="material-symbols-outlined"> add </span></div>
                    </div>
        
        
                 
        
                        <div class="writetitlebox">
                            <div class="writetitle">
                                <div class="writetitle-ti">제목</div>
                                <div class="writetitle-tle">아 몰루루루ㅜ루루루루루루루</div>
                            </div>
                            <div class="writecontent">내용</div>
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