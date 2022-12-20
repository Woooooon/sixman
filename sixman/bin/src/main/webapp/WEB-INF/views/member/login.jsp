<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="/sixman/resources/css/member/login.css"/>
    </head>
    <body>
        <main>
            <section id="loginBox">
                <figure id="companyLogo">
                    <img src="/sixman/resources/img/google.png" alt="기업로고" />
                </figure>
                <form action="" method="POST">
                    <div id="memberId">
                        <input type="text" name="Id" placeholder="Username" />
                    </div>
                    <div id="memberPwd">
                        <input type="text" name="pwd" placeholder="Password" />
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
