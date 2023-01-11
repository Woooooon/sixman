<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수당월별내역</title>
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
#search-box form{
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
    padding: 40px;
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

#date-btn{
    width: 80px;
    border: none;
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
    display: none;
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

#modal-2-1,#modal-3-2,#modal-4-2,#modal-4-3,#modal-4-4,#modal-4-5,#modal-4-6,#modal-4-7, #modal-4-8{
    display: grid;
    grid-template-columns: 1fr 1fr 1fr 1fr;   
}
#modal-2-2{
    display: grid;
    grid-template-columns: 1fr 1fr 0.5fr 1.5fr;   
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
                <div id="modal-header">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <input type="text" id="workDay" style="border: none; font-size:1.2em;font-weight:600; width:290px;"></div>
                <div>
                    <span id="close" class="material-symbols-outlined"> close </span>
                </div>
            </div>
            <div id="modal-2" class="box">
                <div id="modal-2-1">
                    <div>성명: ${loginMember.name}</div>
                    <div>사번: ${loginMember.no}</div>
                    <div>입사날짜: 2022-01-02</div>
                    <div>계좌번호: ${loginMember.account}</div>
                </div>
                <div id="modal-2-2">
                    <div>직급: ${loginMember.positionName}</div>
                    <div>부서: 물류부</div>
                    <div>은행명: ${loginMember.bankName}</div>
                    <div>이메일: ${loginMember.email}</div>
                    
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
                    <div>2</div>
                    <div>0</div>
                    <div><input type="text" id="workTime" style="border: none; width: 30px; font-size: 1em;"></div>
                    <div>17045</div>
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
                    <div><input type="text" id="basePayjs" style="border: none; width: 67px; font-size: 1em;"></div>
                    <div>국민연금</div>
                    <div>122050</div>
                </div>
                <div id="modal-4-3">
                    <div>연장근로수당</div>
                    <div>0</div>
                    <div>건강보험</div>
                    <div>88245</div>
                </div>
                <div id="modal-4-4">
                    <div>휴일근로수당</div>
                    <div>0</div>
                    <div>장기요양보험료</div>
                    <div>10825</div>
                </div>
                <div id="modal-4-5">
                    <div>식대보조금</div>
                    <div>176000</div>
                    <div>고용보험</div>
                    <div>23600</div>
                </div>
                <div id="modal-4-6">
                    <div></div>
                    <div></div>
                    <div>소득세</div>
                    <div>151885</div>
                </div>
                <div id="modal-4-7">
                    <div></div>
                    <div></div>
                    <div>지방소득세</div>
                    <div>15185</div>
                </div>
                <div id="modal-4-8">
                    <div></div>
                    <div></div>
                    <div id="modal-4-8-1">공제액계</div>
                    <div id="modal-4-8-2"><input type="text" id="minusPayjs" style="border: none; width: 60px; font-size: 1em; background-color:#E2E2E2 ;"></div>
                </div>
                <div id="modal-4-9">
                    <div>지급액계</div>
                    <div><input type="text" id="plustotalPayjs" style="border: none; width: 67px; font-size: 1em;  font-weight:600; background-color:#E2E2E2 ;"></div>
                    <div>차인지급액</div>
                    <div><input type="text" id="totalPayjs" style="border: none; width: 67px; font-size: 1em;  font-weight:600; background-color:#E2E2E2 ;"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- 위에는 모달 -->
<main class="main-box">
    <div id="main-content">
        <div>
            <div id="search-box" class="box">
                <form action="/sixman/salary/salary" method="get">
                    <div id="search-font">검색기간</div>
                    <div id="date">
                        <input id="start-month" type="month" name="startDay" style="width: 110px;" value="2022-01">
                        ~
                        <input id="end-month" type="month" name="endDay" style="width: 110px;">
                    </div>
                    <div></div>
                    <div><input class="btn" id="date-btn" type="submit" value="검색"></div>
                    <div></div>
                </form>
    
            </div>
        </div>
        <div>
            <div id="notice-box" class="box">
                <div class="list-box">
                    <div class="first-item">
                        <p>날짜</p>
                        <p>성명</p>
                        <p>총 근무시간</p>
                        <p>연장+식대보조금(원)</p>
                        <p>기본급(원)</p>
                        <p>지급액계</p>
                        <p>공제액계(원)</p>
                        <p>차인지급액(원)</p>
                    </div>
                    <c:forEach items="${voList}" var="x">
                        <div class="list-item"> 
                            <p>${x.payDate}</p> 
                            <p>${x.name}</p> 
                            <p>${x.workTime}</p> 
                            <p>${x.eatPay}</p> 
                            <p>${x.basePay}</p> 
                            <p>${x.basePay + x.holidayPay + x.bonusPay + x.eatPay}</p> 
                            <p>${x.minusPay}</p> 
                            <p>${x.realPay}</p>
                        </div>
                    </c:forEach>
       
                </div>
                <div class="page-box">
                    <span class="material-symbols-outlined"> keyboard_double_arrow_left </span>
                    <span class="material-symbols-outlined"> chevron_left </span>
                    <div class="page-btn checked-p-btn">1</div>
                    <!-- <div class="page-btn">2</div>
                    <div class="page-btn">3</div>
                    <div class="page-btn">4</div>
                    <div class="page-btn">5</div> -->
                    <span class="material-symbols-outlined"> chevron_right </span>
                    <span class="material-symbols-outlined"> keyboard_double_arrow_right </span>
                </div>
            </div>
        </div>
    </div>

    <script>
        
    //이번달 넘어가게 선택불가능
    var now_utc = Date.now()
    var timeOff = new Date().getTimezoneOffset()*60000; 
    var today = new Date(now_utc-timeOff).toISOString().substring(0, 7);
    document.getElementById("start-month").setAttribute("max", today);
    document.getElementById("end-month").setAttribute("max", today);

    //이번달
    document.getElementById('end-month').value= new Date().toISOString().slice(0, 7);

    //모달 닫기버튼
    document.querySelector("#close").addEventListener("click", () => {
        document.querySelector(".share-modal").style.display = "none"
    })
  
    //모달 모두열기
    var modalAll = document.querySelectorAll(".list-item");
    
    for (let i = 0; i < modalAll.length; i++) {
        modalAll[i].addEventListener("click", () => {
        document.querySelector(".share-modal").style.display = "flex"
    })
    }

     //모달 클릭햇을때 값
     const abcArray = document.querySelectorAll('.list-item');

    for(let i = 0; i < abcArray.length; i++){
        abcArray[i].addEventListener('click',function(x){

            resultArray = x.currentTarget.innerText;

            const a = resultArray.split('\n\n');
            
            var abc = document.getElementById('workDay').value = a[0];
            var abc2 = abc+('월 급여명세서');


            document.getElementById('workDay').value = abc2;
            
            document.getElementById('workTime').value = a[2];

            // document.getElementById('plusPayjs').value = a[3];

            document.getElementById('basePayjs').value = a[4];

            document.getElementById('plustotalPayjs').value = a[5];

            document.getElementById('totalPayjs').value = a[7];

            document.getElementById('minusPayjs').value = a[6];
            
        });
}


    </script>
    
	
</main>

</body>
</html>