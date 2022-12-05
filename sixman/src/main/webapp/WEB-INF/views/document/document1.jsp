<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기안문서함1</title>
<link rel="stylesheet" href="<c:url value='resources/css/document1.css'/>">

</head>


<body>

<%@include file="/WEB-INF/views/common/menuBar.jsp" %>

    <div id="documain">
        <div id="mainhead"><a href=""><strong>기안문서함</strong></a></div>


        <div class="mainto">
            <a href="#" class="on">검색</a>
            <a href="#" class="on">기안양식</a>
        </div>


        
        <div id="mid1"><a href="">전체</a></div>
        <div id="mid2"><a href="">대기</a></div>
        <div id="mid3"><a href="">진행</a></div>
        <div id="mid4"><a href="">완료</a></div>
        <div id="mid5"><a href="">반려</a></div>

        <!-- <button id="searchbo"><a href="">검색</a></button>
        <button id="docubox"><a href="">기안양식</a></button> -->
       


        <div class="documentbox">
            <div class="first-document">
                <div class="docudate"><a href="">기안일</a></div>
                <div class="docutitle"><a href="">제목</a></div>
                <div class="docuno"><a href="">문서번호</a></div>
                <div class="docustate"><a href="">결재상태</a></div>
            </div>
            <div>
                <div class="docudate">2022/12/05</div>
                <div class="docutitle">아몰루</div>
                <div class="docuno">3212</div>
                <div class="docustate">결재대기</div>
            </div>
            <div>
                <div class="docudate">2022/12/05</div>
                <div class="docutitle">아몰루</div>
                <div class="docuno">3212</div>
                <div class="docustate">결재대기</div>
            </div>
            <div>
                <div class="docudate">2022/12/05</div>
                <div class="docutitle">아몰루</div>
                <div class="docuno">3212</div>
                <div class="docustate">결재대기</div>
            </div>
            <div>
                <div class="docudate">2022/12/05</div>
                <div class="docutitle">아몰루</div>
                <div class="docuno">3212</div>
                <div class="docustate">결재대기</div>
            </div>

        </div>
        <div class="docupagebox">
            <div class="leftdocument"><p>왼쪽</p></div>
            <div class="firstdocument"><p>1</p></div>
            <div class="seconddocument"><p>2</p></div>
            <div class="thirddocument"><p>3</p></div>
            <div class="fourthdocument"><p>4</p></div>
            <div class="fifthdocument"><p>5</p></div>
            <div class="rightdocument"><p>오른</p></div>
        </div>

        <div class="docuwrite">
            <!-- <button onclick="" id="documentwrite"><a href="">결재 상신</a></button> -->
            <a href="#" class="on">결재상신</a>

        </div>



    </div>

    
    
</body>
</html>