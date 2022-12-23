<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>테스트</h1>
	
    <h1 id="clock"></h1>


    <script>
        const clock = document.querySelector("#clock")

        function getClock() {
            const date = new Date();
            const hours = String(date.getHours()).padStart(2, "0");
            const min = String(date.getMinutes()).padStart(2, "0");
            const sec = String(date.getSeconds()).padStart(2, "0");
            clock.innerText = `${hours}:${min}:${sec}`;
        }

        getClock();
        setInterval(getClock, 1000);

    </script>




</body>
</html>