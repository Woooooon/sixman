<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/resources/css/documentApprove.css'/>">
<title>결재선</title>
</head>
<style>
@charset "UTF-8";
</style>
<body>
 <%@include file="/WEB-INF/views/common/menuBar.jsp" %>

 <main class="main-box">
    <div class="main-box-2 box">
        
        <div class="document-save">
             <button class="button-save">결재선 저장</button>
         </div>

      <div class="approve-title">결재선 지정</div>
     <br>
     <div class="list-box">
        <div class="list-item first">  
            <div>순서</div>
            <div>이름</div>
            <div>직책</div>
            <div>부서</div>
            <div><input type="button" value="결재선 추가"></div>
        </div>
        <div class="list-item">
            <div>1</div>
            <div>구루루</div>
            <div>집사</div>
            <div>내무부</div>
            <div><input type="button" value="결재선 제거"></div>
        </div>
        <div class="list-item">
            <div>1</div>
            <div>구루루</div>
            <div>집사</div>
            <div>내무부</div>
            <div><input type="button" value="결재선 제거"></div>
        </div>
        <div class="list-item">
            <div>1</div>
            <div>구루루</div>
            <div>집사</div>
            <div>외무부</div>
            <div><input type="button" value="결재선 제거"></div>
        </div>
        <div class="list-item">
            <div>1</div>
            <div>구루루</div>
            <div>집사</div>
            <div>내무부</div>
            <div><input type="button" value="결재선 제거"></div>
        </div>
        <div class="list-item">
            <div>1</div>
            <div>구루루</div>
            <div>집사</div>
            <div>내무부</div>
            <div><input type="button" value="결재선 제거"></div>
        </div>
    </div>

</div>
</main>






    
</body>
</html>