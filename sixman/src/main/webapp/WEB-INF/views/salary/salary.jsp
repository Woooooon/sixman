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

/*-------------------------------------------------  모달창     ------------------------------------------------    */

.share-modal.close {
    display: none;
}

.share-modal {
    position: absolute;
    top: 0;
    left: 0;
    z-index: 999999;
    background-color: var(--bo-60);
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.share-modal #modal {
    width: 40%;
    height: 60%;
    background-color: #fff;
    box-shadow: 0px 0px 4px 1px var(--bo-40);
    padding: 10px;
}

#modal{
    display: grid;
    grid-template-rows: 1fr 1.5fr 1.5fr 5fr;
    gap: 20px;

}
#modal-1{
    display: grid;
    grid-template-columns: 2fr 0.1fr; 
}

#modal-1 span {
    float: right;
    cursor: pointer;
    color: var(--bo-40);
}


#modal-1 span:hover {
    color: #000;
}


#modal-header{
    font-size: 1.5em;
    font-weight: 600;
    display: flex; 
    justify-content: center;
    align-items: center; 
}

#modal-2, #modal-3, #modal-4{
    display: grid;
    grid-template-rows: 1fr 1fr;
}

#modal-2-1,#modal-2-2,#modal-3-2,#modal-4-2,#modal-4-3,#modal-4-4,#modal-4-5,#modal-4-6,#modal-4-7, #modal-4-8{
    display: grid;
    grid-template-columns: 1fr 1fr 1fr 1fr;
    
}

#modal-2-1 div,#modal-2-2 div,#modal-3-2 div,#modal-4-2 div,#modal-4-3 div,#modal-4-4 div,#modal-4-5 div,#modal-4-6 div,#modal-4-7 div, #modal-4-8 div{
    display: flex;
    justify-content: center;
    align-items: center;
}

#modal-4{
    display: grid;
    grid-template-rows: repeat(9, 1fr);
}

#modal-3-1,#modal-4-1,#modal-4-9{
    display: grid;
    grid-template-columns: 1fr 1fr 1fr 1fr;
    background-color: #E2E2E2;
    font-size: 1em;
    font-weight: 600;
}

#modal-3-1 div,#modal-4-1 div,#modal-4-9 div{
    display: flex;
    justify-content: center;
    align-items: center;
}


#modal-4-8-1,#modal-4-8-2{
    background-color: #E2E2E2;
}




</style>

<body>

    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
    
    <div class="share-modal">
        <div id="modal">
            <div id="modal-1"> 
                <div id="modal-header">&nbsp&nbsp&nbsp&nbsp 2022년 10월분 급여명세서</div>
                <div>
                    <span class="material-symbols-outlined"> close </span>
                </div>
            </div>
            <div id="modal-2" class="box">
                <div id="modal-2-1">
                    <div>성명: 심원용</div>
                    <div>생년월일: 2002-01-01</div>
                    <div>입사날짜: 2019-0321</div>
                    <div>이메일: abc@naver.com</div>
                </div>
                <div id="modal-2-2">
                    <div>직책: 차장</div>
                    <div>부서: 제1영업</div>
                    <div>은행명: 국민은행</div>
                    <div>계좌번호: 00-00-0000000</div>
                </div>
            </div>
            <div id="modal-3" class="box">
                <div id="modal-3-1">
                    <div>연장근로시간</div>
                    <div>휴일근로시간</div>
                    <div>총 근로시간</div>
                    <div>통상시급(원)</div>
                </div>
                <div id="modal-3-2">
                    <div>22</div>
                    <div>6</div>
                    <div>170</div>
                    <div>11,123</div>
                </div>
            </div>
            <div id="modal-4" class="box">
                <div id="modal-4-1">
                    <div>지급내역</div>
                    <div>지급액(원)</div>
                    <div>공제내역</div>
                    <div>공제액(원)</div>
                </div>
                <div id="modal-4-2">
                    <div>기본급</div>
                    <div>1,000,000</div>
                    <div>국민연금</div>
                    <div>20,000</div>
                </div>
                <div id="modal-4-3">
                    <div>연장근로수당</div>
                    <div>1,000,000</div>
                    <div>건강보험</div>
                    <div>20,000</div>
                </div>
                <div id="modal-4-4">
                    <div>휴일근로수당</div>
                    <div>200,000</div>
                    <div>고용보험</div>
                    <div>20,000</div>
                </div>
                <div id="modal-4-5">
                    <div>식대보조금</div>
                    <div>100,000</div>
                    <div>장기요양보험료</div>
                    <div>20,000</div>
                </div>
                <div id="modal-4-6">
                    <div></div>
                    <div></div>
                    <div>소득세</div>
                    <div>20,000</div>
                </div>
                <div id="modal-4-7">
                    <div></div>
                    <div></div>
                    <div>지방소득세</div>
                    <div>20,000</div>
                </div>
                <div id="modal-4-8">
                    <div></div>
                    <div></div>
                    <div id="modal-4-8-1">공제액계</div>
                    <div id="modal-4-8-2">120,000</div>
                </div>
                <div id="modal-4-9">
                    <div>지급액계</div>
                    <div>1,400,000</div>
                    <div>차인지급액</div>
                    <div>1,370,000</div>
                </div>
            </div>
        </div>
    </div>
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