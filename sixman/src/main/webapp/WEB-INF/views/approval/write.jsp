<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/sixman/resources/css/document/documentwrite.css">
<link rel="stylesheet" href="/sixman/resources/css/approval/write.css">
<!-- 섬머노트 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>       
</head>
<body>

    <%@include file="/WEB-INF/views/common/tempMenuBar.jsp" %>
    <div class="main-box">
        <form action="" id="" method="POST" enctype="multipart/form-data" >
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
                    </div>
                    <div class="docbox">
                        <div class="doc-member-item">
                            <div>기안</div>
                            <div></div>
                            <div>${loginMember.name}</div>
                        </div>
                    </div>
                </div>
                <div id="doc-header">
                    <div id="title-box">
                        <div class="doc-title">제목</div>
                        <input id="title-input" name="title" type="text" value="">
                    </div>
                    <div id="doc-menu-box">
                        <div>
                            <div>문서타입</div>
                            <select name="type">
                                <option value="1">일반문서</option>
                                <option value="2">휴가신청</option>
                            </select>
                        </div>
                        <div>
                            <div>시행일자</div>
                            <div id="date-box">
                                <input type="date" name="startDate">
                                <div>~</div>
                                <input type="date" name="endDate">
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
                <textarea name="content" id="summernote"></textarea>
                <div id="btn-box">
                    <!-- <input name="subit" class="c-btn" type="submit" value="반려하기"> -->
                    <input name="dSave" class="btn" type="submit" value="작성하기">
                    <input name="dSave" class="c-btn" type="submit" value="임시저장">
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

    openLineList();

    function openLineList() {
        window.open('/sixman/approval/lineList', '결재선 지정', 'top=50%, left=50%, width=800, height=500, status=no, menubar=no, toolbar=no, resizable=no');
    }

    function getLine(no, members) {
        const box = document.querySelector('.docbox');

        let item = '';
        for (let index = 0; index < members.length; index++) {
            const element = members[index];
            let type = '검토';
            if(index==members.length-1){
                type = '결재';
            }

            item += 
                `
                <div class="doc-member-item">
                    <div>`+type+`</div>
                    <div></div>
                    <div>`+element.name+`</div>
                    <input type="hidden" name="docSaveNo" value="`+element.no+`">
                </div>
                `;
            
        }

        box.innerHTML += item;
        box.innerHTML += `<input type="hidden" name="apNo" value="`+no+`">`

    }
</script>
</html>