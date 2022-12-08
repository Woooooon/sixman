<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/salary/salary.css'/>" />
</head>

<style>


.main-box{

    gap: 40px
}

#main-content{
    display: grid;
    grid-template-rows: 1fr 9fr;
    gap: 40px
}


#search-box{
	padding: 20px;
    display: flex;
    width: 100%;
    height: 100%;
    gap: 0px
}
#search-box{
    display: grid;
    grid-template-columns: 1fr 0.3fr 0.1fr 0.3fr 6fr;
}
#search-box div{
    display: flex;
    justify-content: center;
    align-items: center;
}
#search-font{
    font-size: 1.2em;
    font-weight: 600;
    display: flex;
    justify-content: center;
    align-items: center;
}


#notice-box{
    padding: 20px;
    display: flex;
    flex-direction: column;
    width: 100%;
    height: 100%;
    gap: 15px;
}

.list-box{
    width: 100%;
    height: 100%;
    align-self: center;
}

.list-item{
    display: grid;
    grid-template-columns: 2fr 1fr 1.5fr 1.5fr 1.5fr 1.5fr 1.5fr 1.5fr ;
    height: 6%;
    border-bottom: 1px solid var(--bo-20);
    cursor: pointer;
}
.list-item p{
    padding: 0 20px;
    display: flex;
    align-items: center;
    justify-content: center;
}
.list-item p:not(:nth-of-type(2)){
    justify-content: center;
}
.list-item:hover p{
    color: var(--main-color);
}
.first-item{
    display: grid;
    grid-template-columns: 2fr 1fr 1.5fr 1.5fr 1.5fr 1.5fr 1.5fr 1.5fr ;
    height: 8%;
    border-top: 1px solid var(--bo-80);
    border-bottom: 1px solid var(--bo-80);
    font-size: 1em;
    font-weight: 600;
}
.first-item p{
    display: flex;
    align-items: center;
    justify-content: center;
}

.page-box{
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    align-self: center;
}
.page-btn{
    display: flex;
    align-items: center;
    justify-content: center;
    width: 25px;
    height: 25px;
    border-radius: 5px;
    cursor: pointer;
}
.page-btn:hover{
    border: 1px solid var(--main-color);
}
.checked-p-btn{
    background-color: var(--main-color);
    color: white;
}
.page-box span{
    color: var(--bo-60);
    cursor: pointer;
}
.page-box span:hover{
    color: black
}

</style>

<body>

    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
<main class="main-box">
    <div id="main-content">
        <div>
            <div id="search-box" class="box">
                <div id="search-font">검색기간</div>
                <div id="date">
                    <input type="month" style="width: 100px;">
                    ~
                    <input type="month" style="width: 100px;">
                </div>
                <div></div>
                <div class="btn">검색</div>
                <div></div>
            </div>
        </div>
        <div>
            <div id="notice-box" class="box">
                <div class="list-box">
                    <div class="first-item">
                        <p>날짜</p>
                        <p>성명</p>
                        <p>총 근무시간</p>
                        <p>연장+휴일근로수당(원)</p>
                        <p>기본급(원)</p>
                        <p>지급액계</p>
                        <p>공제액계(원)</p>
                        <p>차인지급액(원)</p>
                    </div>
                    <div class="list-item"> <p>2022-11</p> <p>심원용</p> <p>09:00</p> <p>300,000</p> <p>1,000,000</p> <p>1,400,000</p> <p>130,000</p> <p>1,370,000</p></div>
                    <div class="list-item"> <p>2022-10</p> <p>심원용</p> <p>09:00</p> <p>300,000</p> <p>1,000,000</p> <p>1,400,000</p> <p>130,000</p> <p>1,370,000</p></div>
                    <div class="list-item"> <p>2022-09 </p> <p>심원용</p> <p>09:00</p> <p>300,000</p> <p>1,000,000</p> <p>1,400,000</p> <p>130,000</p> <p>1,370,000</p></div>
                    <div class="list-item"> <p>2022-08</p> <p>심원용</p> <p>09:00</p> <p>300,000</p> <p>1,000,000</p> <p>1,400,000</p> <p>130,000</p> <p>1,370,000</p></div>
                    <div class="list-item"> <p>2022-07</p> <p>심원용</p> <p>09:00</p> <p>300,000</p> <p>1,000,000</p> <p>1,400,000</p> <p>130,000</p> <p>1,370,000</p></div>
                   
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
            </div>
        </div>
    </div>
    
	
</main>

</body>
</html>