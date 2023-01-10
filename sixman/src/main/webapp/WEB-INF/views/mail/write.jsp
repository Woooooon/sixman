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
<script defer src="${path}/resources/js/file/file.js"></script>
</head>
<body>

<%@include file="/WEB-INF/views/common/menuBar.jsp" %>
<main class="main-box">

    <form action="/sixman/mail/write" method="POST" enctype="multipart/form-data">
        <c:if test="${not empty save}">
            <input type="hidden" name="mailNo" value="${vo.mailNo}">
        </c:if>
        <div id="notice-box" class="box">
            <div class="title-box">
                <a href="${path}/mail/list" class="material-symbols-outlined"> chevron_left </a>
                <div class="b-title">메일 작성</div>
            </div>
            <div id="wirte-box">
                <p>받는사람</p>
                <div></div>
                <div id="resive-member"><input id="email-input" type="text" value="${email}"><div class="btn" onclick="openWindowPop()"><p>주소록</p></div></div>
                <div id="members">
                	<c:forEach items="${vo.sender}" var="sender">
                		<div class="members-item"><input type="email" name="sender" value="${sender}"><span class="t-btn material-symbols-outlined">close</span></div>
                	</c:forEach>
                </div>
                <p>제목</p>
                <div></div>
                <input name="title" type="text" value="${vo.title}">
                <p>파일첨부</p>
                <div id="file-btn" class="btn"><span class="material-symbols-outlined"> add </span></div>
                <div id="file-box">
                    <c:if test="${not empty save}">
                        <c:forEach items="${vo.fileList}" var="fv">
                            <div class="file-item">
                                <p>${fv.originName}</p>
                                <span class='material-symbols-outlined' onclick="deleteFile(this, ${fv.no}, 'MAIL')"> close </span>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
            <textarea name="content" id="summernote">${vo.content}</textarea>
            <div id="btn-box">
                <input name="saveYn" class="btn" type="submit" value="작성하기">
                <input name="saveYn" class="c-btn" type="submit" value="임시저장">
            </div>

		</div>
	</form>

</main>

</body>
<script>

    window.addEventListener('load', ()=>{
        const itemArr = document.querySelectorAll('.members-item');
        itemArr.forEach(element => {
            element.querySelector('span').addEventListener('click', ()=>{
                element.remove();
            });
        });
    })

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

    const form = document.querySelector('form');
    form.addEventListener('submit', (e)=>{
        const senders = document.querySelectorAll('input[type=email]');

        let sender = '';
        for (let i = 0; i < senders.length; i++) {
            const element = senders[i];

            sender += element.value;

            if(i!=senders.length-1){
                sender += ',';
            }
        }

        const titleInput = document.querySelector('input[name=title]');


        sendMsg('${loginMember.name}', titleInput.value, 'MAIL', sender);
    });

    function openWindowPop() {
    window.open('/sixman/employee/popup', '조직도 팝업', 'top=0, left=8000, width=800, height=500, status=no, menubar=no, toolbar=no, resizable=no');
    }

    function childValue(memberArr) {  
        memberArr.forEach(element => {
            const inputMail = document.createElement('input');
            inputMail.setAttribute('type','email');
            inputMail.setAttribute('name','sender');

            const email = element.email;
            inputMail.value = email

            const span = document.createElement('span');
            span.classList.add('t-btn');
            span.classList.add('material-symbols-outlined');
            span.innerHTML = 'close';

            const div = document.createElement('div');
            div.classList.add('members-item');
            div.append(inputMail, span);

            span.addEventListener('click', ()=>{
                div.remove();
            });

            document.querySelector('#members').append(div);
        });
    }

</script>
</html>