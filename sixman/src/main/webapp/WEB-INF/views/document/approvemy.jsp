<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/resources/css/documentApprove.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/document/documentModalMy.css'/>">

<title>결재선</title>
</head>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<style>
@charset "UTF-8";
</style>
<body>
 <%@include file="/WEB-INF/views/common/menuBar.jsp" %>

 <div class="approve-modal close">

  <div class="savetop"></div>
       

    <form action="">
        <div class="docu-save">
            <!-- <span class="material-symbols-outlined"> close </span> -->
        </div>
        <div id="savelistbox">
          <div class="listtitle">결재선 리스트</div>
          <div>
            
            <p>순서</p>
            <p>이름</p>
            <p>직책</p>
            <p>부서</p>
          </div>
          <div>
            <input type="checkbox">
            <p>1</p>
            <p>구기석</p>
            <p>사원</p>
            <p>외무부</p>
          </div>
          <div>
            <input type="checkbox">
            <p>2</p>
            <p>구기석</p>
            <p>사원</p>
            <p>외무부</p>
          </div>
          <div>
            <input type="checkbox">
            <p>3</p>
            <p>구기석</p>
            <p>사원</p>
            <p>외무부</p>
          </div>
          <div>
            <input type="checkbox">
            <p>4</p>
            <p>구기석</p>
            <p>사원</p>
            <p>외무부</p>
          </div>
          <div>
            <input type="checkbox">
            <p>5</p>
            <p>구기석</p>
            <p>사원</p>
            <p>외무부</p>
          </div>
         
        </div>



          <div class="savebutton">
            <input type="button" class="btn" value="선택 취소">
            <input type="button" class="btn" value="결재선 선택">
          </div>


    </form>
</div>



 <main class="main-box">
    <div class="main-box-2 box">
        
      
      <div class="approve-title">결재선 지정</div>
     <br>
     <div class="list-box">
        <div class="list-item first">  
            <div>순서</div>
            <div>이름</div>
            <div>직책</div>
            <div>부서</div>
            <div><input type="button" class="btn" value="결재선 추가"></div>
        </div>
        <div class="list-item">
            <div>1</div>
            <div>구루루</div>
            <div>집사</div>
            <div>내무부</div>
            <div><input type="button" class="btn" value="결재선 제거"></div>
        </div>
        <div class="list-item">
            <div>1</div>
            <div>구루루</div>
            <div>집사</div>
            <div>내무부</div>
            <div><input type="button" class="btn" value="결재선 제거"></div>
        </div>
        <div class="list-item">
            <div>1</div>
            <div>구루루</div>
            <div>집사</div>
            <div>외무부</div>
            <div><input type="button" class="btn" value="결재선 제거"></div>
        </div>
        <div class="list-item">
            <div>1</div>
            <div>구루루</div>
            <div>집사</div>
            <div>내무부</div>
            <div><input type="button" class="btn" value="결재선 제거"></div>
        </div>
        <div class="list-item">
            <div>1</div>
            <div>구루루</div>
            <div>집사</div>
            <div>내무부</div>
            <div><input type="button" class="btn" value="결재선 제거"></div>
        </div>
        
    </div>
    <div class="document-save">
      <button class="btn">결재선 저장</button>
  </div>

</div>
</main>






    
</body>
</html>