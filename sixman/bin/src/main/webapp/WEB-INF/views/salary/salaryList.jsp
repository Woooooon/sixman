<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/salary/salaryList.css'/>" />
</head>

<style>


#modal.modal-overlay {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background: rgba(255, 255, 255, 0.25);
    box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
    backdrop-filter: blur(1.5px);
    -webkit-backdrop-filter: blur(1.5px);
    border-radius: 10px;
    border: 1px solid rgba(255, 255, 255, 0.18);
    z-index:100;
          
}
#modal .modal-window {
    background: white;
    box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
    backdrop-filter: blur( 13.5px );
    -webkit-backdrop-filter: blur( 13.5px );
    border-radius: 10px;
    border: 1px solid rgba( 255, 255, 255, 0.18 );
    width: 670px;
    height: 510px;
    position: relative;
    /* top: -100px;
    padding: 10px; */
}
#title{
    width: 100%;
    height: 25%;
    display: flex;
    justify-content: center;
    align-items: center;
}
#modal{
    display: grid;
    
}
#modal .close-area {
    display: inline;
    float: right;
    padding-top: 10px;
    padding-right: 30px;
    cursor: pointer;
    text-shadow: 1px 1px 2px gray;
    color: black;
    font-size: 20px;
}



</style>

<body>

    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
<main class="main-box">

    <div id="main-content">
        <div id="modal" class="modal-overlay">
            <div class="modal-window">
                <div class="close-area">X</div>
                <div id="title">
                    
                </div>
               
            </div>
        </div>

    </div>
    
</main>

<script>
    const modal = document.getElementById("modal")
        const btnModal = document.getElementById("header-login")
        const requestURI = window.location.pathname + window.location.search;
        sessionStorage.setItem("requestURI", requestURI);
        
        // 헤더1 로그인
        btnModal.addEventListener("click", e => {
        	document.getElementById('uri').value = sessionStorage.getItem("requestURI");
            modal.style.display = "flex"
        })

        // 헤더2 로그인
        const btnModal_1 = document.getElementById("header-login_1")
        btnModal_1.addEventListener("click", e => {
        	document.getElementById('uri').value = sessionStorage.getItem("requestURI");
            modal.style.display = "flex"
        })
       
        // 닫는 버튼
        const closeBtn = modal.querySelector(".close-area")
        closeBtn.addEventListener("click", e => {
        	sessionStorage.removeItem("requestURI");
        	modal.style.display = "none"
        })

</script>

</body>
</html>