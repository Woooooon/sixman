<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var = "path" value = "${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<head>
<meta charset="UTF-8">
<title>기안문서함1</title>
<link rel="stylesheet" href="<c:url value='/resources/css/document1.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/document2.css'/>">

</head>
<style>
@charset "UTF-8";
</style>



<body>

<%@include file="/WEB-INF/views/common/menuBar.jsp" %>
<main class="main-box">
    <div id="docu-main" class="box">
        <div class="main-head">
            <div class="main-title">기안문서함</div>
        </div>

        <div class="main-to">
          
            <!-- <a href="#" class="on">기안양식</a> -->
            <div class="mid-box">
                <div class="mid1"><a href="#">전체</a></div>
                <div class="mid2"><a href="#">대기</a></div>
                <div class="mid3"><a href="#">진행</a></div>
                <div class="mid4"><a href="#">완료</a></div>
                <div class="mid5"><a href="#">반려</a></div>
            </div>
            
            <div class="search-bar"><input id="search-input" type="text" placeholder="검색"><span id="search-btn" class="material-symbols-outlined"> search </span></div>
        </div>

        <!-- <button id="searchbo"><a href="">검색</a></button>
        <button id="docubox"><a href="">기안양식</a></button> -->

        <div class="list-box">

            <div class="list-item first">
                <input type='checkbox'
                id="allCheck"
                name='allCheck' 
                value='selectall'
                onclick='selectAll(this)'/> 
               
                <p>문서번호</p>
                <p>기안 양식</p>
                <p>제목</p>
                <p>기안일</p>
                <p>결재상태</p>
            </div>
            <div id="list-count" class="b-page-count hilight"></div>
            
            <c:forEach  items="${dvo}" var="dvo" >
            <div class="list-item">
                
                    <input type="checkbox" name="RowCheck"value="${dvo.no}">
                    <p>${dvo.no}</p>
                    <p>${dvo.type}</p>
                    <div class="text_ct"><a href="${path}/document/detail?no=${dvo.no}">${dvo.title}</a></div>
                    <!-- <p  class="text_ct"><a href="${path}/document/detail?no=${dvo.no}">${dvo.title}</a></p> -->
                    <!-- <p><fmt:formatDate value="${dvo.enrollDate}" partern="yyyy/MM/dd"/></p> -->
                    <p>${dvo.enrollDate}</p>
                    <p>${dvo.state}</p>
                </div>
                
          
            </c:forEach>
            
          
           

            
        </div>


        <div class="page-box">
            <div class="page-box">
                <span class="material-symbols-outlined" <c:if test="${pv.currentPage ne 1}">onclick="location.href='/sixman/document/first?page=1&&keyword=${keyword}'"</c:if>> keyboard_double_arrow_left </span>
                <span class="material-symbols-outlined" <c:if test="${pv.currentPage ne 1}">onclick="location.href='/sixman/document/first?page=${pv.currentPage - 1}&&keyword=${keyword}'"</c:if>> chevron_left </span>
                <c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
                            <div class="page-btn <c:if test="${i eq pv.currentPage}"> checked-p-btn</c:if>" onclick="location.href='/sixman/document/first?page=${i}&&keyword=${keyword}'">${i}</div>
                            </c:forEach>
                            <span class="material-symbols-outlined" <c:if test="${pv.maxPage ne pv.currentPage}">onclick="location.href='/sixman/document/first?page=${pv.currentPage + 1}&&keyword=${keyword}'"</c:if>> chevron_right </span>
                            <span class="material-symbols-outlined" <c:if test="${pv.maxPage ne 1}">onclick="location.href='/sixman/document/first?page=${pv.maxPage}&&keyword=${keyword}'"</c:if>> keyboard_double_arrow_right </span>
            </div>
         
        </div>
        <textarea name="content" id="summernote">${vo.content}</textarea>

        <div class="docu-write">
            <!-- <button onclick="" id="documentwrite"><a href="">결재 상신</a></button> -->
           <!-- <input type="button" value="결재상신"> -->
          <a href="${path}/document/write"> <input name="submit" class="btn" type="submit" value="결재상신"></a>
           <input name="button" class="btn btn-outline-info"  value="삭제" onclick="deleteValue();">
        </div>
   
    



    </div>

    

    
</main>


</body>

<script>
function selectAll(selectAll)  {
    const checkboxes 
       = document.querySelectorAll('input[type="checkbox"]');
    
    checkboxes.forEach((checkbox) => {
      checkbox.checked = selectAll.checked
    })
  }
</script>

<script type="text/javascript">
    (function(){
        var chkObj = Document.getElementsByName("RowCheck");
        var rowCnt = chkObj.length;

        $("input[name='allCheck']").click(function(){
            var chk_listArr = $("input[name='RowCheck']");
            for(var i=0; i<chk_listArr.length; i++){
                chk_listArr[i].checked = this.checked;
            }
        });
        $("input[name='RowCheck']").click(function(){
            if($("input[name='RowCheck']:checked").length == rowCnt){
                $("input[name='allCheck']")[0].checked = true;
            }
            else{
                $("input[name='allCheck']")[0].checked = false;
            }
        });
    });
    function deleteValue(){
        var url = "document/first";
        var valueArr = new Array();
        var list = $("input[name='RowCheck']");
        for(var i=0; i< list.length; i++){
            if(list[i].checked){
                valueArr.push(list[i].value);
            }
        }
        if(valueArr.length ==0){
            alert("선택된 글이 없습니다.")
        }
        else{
            var chk = confirm("삭제하시겠습니까?");
            $.ajax({
                url : url,
                type : 'POST',
                traditional : true,
                data :{
                    valueArr : valueArr //보내고자 하는 data 변수설정
                }, 
                success: function(jdata){
                    if(jdata = 1){
                        alert("삭제성공!");
                        location.replace("list") //리스트 페이지로 새로고침
                    }
                    else{
                        alert("삭제실패");
                    }
                }
            });
        }
    }
</script>
</html>