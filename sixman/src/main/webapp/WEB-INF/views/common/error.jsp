<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
    margin: 0;
}
#error-box{
    width: 60vw;
    /* height: 100vh; */
    margin: auto;
    margin-top: 100px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

#error-title{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 0;
    position: relative;
}

#error-title p:nth-of-type(1){
    font-size: 8em;
    font-weight: 700;
    color: #0E6D62;
}

#error-title p:nth-of-type(2){
    font-size: 1.7em;
    font-weight: 700;
    color: #12887A;
    position: relative;
    top: -30px;
}

#error-msg{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 10px;
    margin: 30px;
}
#error-msg p:nth-of-type(1){
    font-size: 1.2em;
    color: #12887A;
}
#error-msg p:nth-of-type(2){
    text-align: center;
    color: rgb(90, 90, 90);
}
#error-img{
    width: 350px;
    height: 350px;
    background-color: red;
    background: url('/sixman/resources/img/error.png');
    background-size: cover;
}
#error-btn-box{
    display: flex;
    gap: 30px;
    justify-content: center;
    align-items: center;
}
.btn{
    cursor: pointer;
    width: 110px;
    height: 40px;
    background-color: #12887A;
    color: white;
    border-radius: 5px;
    display: flex;
    justify-content: center;
    align-items: center;
}
.btn:hover{
    background-color: #17a897;
}

</style>
</head>
<body>

    <div id="error-box">
        <div id="error-title">
            <p>${code}</p>
            <p>${errorMsg}</p>
        </div>
        <div id="error-img"></div>
        <div id="error-msg">
            <p>${title}</p>
            <p>${msg}</p>
        </div>
        <div id="error-btn-box">
            <div class="btn" onclick="location.href='/sixman/main'">메인으로</div>
            <div class="btn" onclick="window.history.back();">뒤로가기</div>
        </div>
    </div>

</body>
</html>