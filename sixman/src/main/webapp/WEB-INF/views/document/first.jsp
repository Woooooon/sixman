<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기안문서함1</title>
<link rel="stylesheet" href="<c:url value='/resources/css/document1.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/document2.css'/>">
</head>
<style>
@charset "UTF-8";
</style>
<script>
   
    </script>


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
            
            <div class="search-bar"><span class="material-symbols-outlined"> search </span><input type="text" placeholder="검색"></div>

        </div>

        <!-- <button id="searchbo"><a href="">검색</a></button>
        <button id="docubox"><a href="">기안양식</a></button> -->

        <div class="list-box">

            <div class="list-item first">
                <input type='checkbox'
                name='dddd' 
                value='selectall'
                onclick='selectAll(this)'/> 
                <!-- <span></span> -->
                <p>기안일</p>
                <p>기안 양식</p>
                <p>제목</p>
                <p>문서번호</p>
                <p>결재상태</p>
            </div>
            <div id="list-count" class="b-page-count hilight"></div>

            <div class="list-item">
                
                <input type="checkbox" name="dddd">
                <!-- <span></span> -->
               <p>${dvo.enrollDate}</p>
               <p>${dvo.type}</p>
               <p>${dvo.title}</p>
               <p>${dvo.no}</p>
               <p>${dvo.state}</p>
            </div>
          
           

            
        </div>


        <div class="page-box">
            <span class="material-symbols-outlined"> keyboard_double_arrow_left </span>
            <span class="material-symbols-outlined"> chevron_left </span>
            <div class="page-btn checked-p-btn">1</div>
            <div class="page-btn">2</div>
            <div class="page-btn">3</div>
            <div class="page-btn">4</div>
            <div class="page-btn">5</div>
            <span class="material-symbols-outlined"> chevron_right </span>
            <span class="material-symbols-outlined"> keyboard_double_arrow_right </span>
       
        </div>

        <div class="docu-write">
            <!-- <button onclick="" id="documentwrite"><a href="">결재 상신</a></button> -->
           <!-- <input type="button" value="결재상신"> -->
          <a href="${path}/document/write"> <input name="submit" class="btn" type="submit" value="결재상신"></a>
           <input name="subit" class="btn" type="submit" value="삭제">
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
</html>