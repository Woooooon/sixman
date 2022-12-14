<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/resources/css/documentApprove.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/document/documentModal.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/document/treemodal.css'/>">

<title>결재선</title>
</head>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<style>
@charset "UTF-8";
</style>
<body>
 <%@include file="/WEB-INF/views/common/menuBar.jsp" %>

<!-- <div class="approve-modal close">

    <form action="">
        <div class="docu-save">
            결재선<input type="subit" value="저장">
            <span class="material-symbols-outlined"> close </span>
        </div>



        <ul class="tree">
            <li>
              <input type="checkbox" id="root">
              <label for="root">회계부</label>
              <ul>
                <li>
                  <input type="checkbox" id="node1">
                  <label for="node1" class="lastTree">회계부단독1</label>
                </li>
                <li>
                  <input type="checkbox" id="node2">
                  <label for="node2">회계부단독1-부서1</label>
                  <ul>
                    <li>
                      <input type="checkbox" id="node21">
                      <label for="node21" class="lastTree">회계부단독1-부서1-작은부서1</label>
                    </li>
                  </ul>
                <li>
                  <input type="checkbox" id="node3">
                  <label for="node3">회계부2</label>
                  <ul>
                    <li>
                      <input type="checkbox" id="node31">
                      <label for="node31" class="lastTree">회계부2-단독부서1</label>
                    </li>
                    <li>
                      <input type="checkbox" id="node32">
                      <label for="node32">회계부2-부서3개</label>
                      <ul>
                        <li>
                          <input type="checkbox" id="node321">
                          <label for="node321" class="lastTree">회계부2-부서3개-내부1</label>
                        </li>
                        <li>
                          <input type="checkbox" id="node322">
                          <label for="node322" class="lastTree">회계부2-부서3개-내부2</label>
                        </li>
                        <li>
                          <input type="checkbox" id="node323">
                          <label for="node323" class="lastTree">회계부2-부서3개내부3</label>
                        </li>
                      </ul>
                    <li>
                      <input type="checkbox" id="node33">
                      <label for="node33" class="lastTree">회계부3</label>
                    </li>
                  </ul>
                </li>
              </ul>
            </li>
          </ul>


    </form>
</div> -->



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