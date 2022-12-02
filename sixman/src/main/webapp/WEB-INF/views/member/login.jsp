<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="<c:url value='resources/css/member/login.css'/>" />
    </head>
    <body>
        <main>
            <section id="loginBox">
                <figure id="companyLogo">
                    <img alt="기업로고" src="<c:url value='/resources/img/google.png'/>" />
                </figure>
                <form action="/sixman" method="POST">
                    <div id="memberId">
                        <input type="text" name="Id" placeholder="Username" />
                    </div>
                    <div id="memberPwd">
                        <input type="text" name="PWD" placeholder="Password" />
                    </div>
                    <input type="submit" value="Login" />
                </form>
            </section>
            <figure id="sixman">
                <img src="<c:url value='resources/img/logo.png'/>" alt="SIXMAN" />
            </figure>
        </main>
    </body>
</html>
