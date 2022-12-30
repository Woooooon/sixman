<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String msg = (String)session.getAttribute("msg");
	session.removeAttribute("msg");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="/sixman/resources/css/member/login.css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,200,1,0" />    
        <link rel="stylesheet" href="/sixman/resources/css/main.css">
        <script defer src="/sixman/resources/js/main/main.js"></script>
        <script defer>
            window.onload = ()=>{
                const msg = '<%=msg%>';
                if(msg != '' && msg != 'null'){
                    popup.alertPop("로그인이 필요합니다.", "로그인 먼저 해주시기 바랍니다.");
                }
            }
        </script>
    </head>
    <body>
        <main>
            <section id="loginBox">
            	<c:if test="${not empty company.name}">
	                <figure id="companyLogo">
	                    <img src="/sixman/resources/img/logo/${company.logoName}" alt="기업로고" />
	                </figure>
                </c:if>
                <form action="" method="POST">
                    <div id="memberId">
                        <input type="text" name="id" placeholder="Username" />
                    </div>
                    <div id="memberPwd">
                        <input type="password" name="pwd" placeholder="Password" />
                    </div>
                    <input type="submit" value="Login" />
                </form>
            </section>
            <figure id="sixman">
                <img src="/sixman/resources/img/logo.png" alt="SIXMAN" />
            </figure>
        </main>
    </body>
</html>
