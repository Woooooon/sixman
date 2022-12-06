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
<style>
@charset "UTF-8";

*{
    margin: 0;
    padding: 0;
}
html{
    font-size: 10px;
}
ul,li{
    list-style: none;
}

a{
    text-decoration: none;
    color: inherit;
}
p{
    display: inline-block;
}

#documain{
    width: 1000px;
    margin: 100px auto; 
}
#docuhead{
    margin-top: 30px;
}

#docuhead strong{
    font-size: 3rem;
}



.mainto{
    text-align: right;
    display: inline-block;
    margin-top: 30px;
    border-radius: 2px;
    padding: 10px;
    border: 1px solid #000;
    font-size: 1.3rem;
}
.mainto a:first-child{
    margin-left: 0;
}
.mainto a.on{
    background-color: #000;
    color: #fff;
}
.docuwrite{

    display: inline-block;
    margin-top: 30px;
    border-radius: 2px;
    background-color: #000;
    color: #fff;
}
.documentbox{
    width: 100%;
    border-top: 2px solid #000; 
}
.documentbox > div{
    border-bottom: 1px solid #ddd; 
    font-size: 0;
}
.documentbox > div.top{
    border-color: 1px solid #999;
}
.documentbox > div:last-child{
    border-color: 1px solid #000;
}

.documentbox > div > div{
    display: inline-block;
    font-size: 1.4rem;
    text-align: center;
}
.documentbox > div.top > div{
    font-weight: 600;
}
.documentbox .docudate{
    width: 10%;
}
.documentbox .docutitle{
    width: 60%;
    text-align: left;
}

.documentbox .top .docutitle{
    text-align: center;
}
.documentbox .docuno{
    width: 10%;
}
.documentbox .docustate{
    width: 10;
}

/* .first-document{
    display: inline-block;
} */

.docupagebox{
    margin-top: 30px;
    text-align: center;
    font-size: 0;

}
.docupagebox a{
    display: inline-block;
    width: 32px;
    height: 32px;
    border: 1px solid #ddd;
    border-left: 0;
    line-height:  100%;
}

.docupagebox a.bt{
    padding-top: 10px;
    font-size: 1.2rem;;
    letter-spacing: -1px;
}
.docupagebox a.num{
    padding-top: 9px;
    font-size: 1.4rem;
}
.docupagebox a.num.on{
    border-color: #000;
    background-color: #000;
    color: #fff;
}

.docupagebox a:first-child{
    border-left: 1px solid #ddd;
}


</style>


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
           <a href="#" class="bt first"> < </a>
           <a href="#" class="num">1</a>
           <a href="#" class="num">2</a>
           <a href="#" class="num">3</a>
           <a href="#" class="num">4</a>
           <a href="#" class="num">5</a>
           <a href="#" class="bt last">></a>
           
        </div>

        <div class="docuwrite">
            <!-- <button onclick="" id="documentwrite"><a href="">결재 상신</a></button> -->
            <a href="#" class="on">결재상신</a>

        </div>



    </div>

    
    
</body>
</html>