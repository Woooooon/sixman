<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="<c:url value='/resources/css/member/switch.css'/>" />

        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
        <script defer src="<c:url value='/resources/js/member/switch.js'/>"></script>
    </head>

    <body>
        <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
        <main id="main-page" class="main-box">
            <div id="main-box-2">
                <section id="switch-wrap" class="box">
                    <form action="" method="post">
                        <div class="body">
                            <div class="header">
                                <span class="material-symbols-outlined"> lock </span>
                                <h2>비밀번호 재설정</h2>
                            </div>
                            <div class="newpwd">
                                <input type="password" placeholder="새 비밀번호" name="pwd" id="pwd" class="success" />
                                <p id="p1-comment"></p>
                            </div>
                            <div class="newpwdCheck">
                                <input type="password" placeholder="새 비밀번호 확인" id="pwdCheck" class="success" />
                                <p id="p2-comment"></p>
                            </div>
                        </div>
                        <c:if test="${mypage eq null}">
                            <div class="footer">
                                <span>
                                    신규 회원의 비밀번호는 ID와 일치 하기
                                    <br />
                                    때문에 보안성이 떨어집니다.
                                    <br />
                                    반드시 변경하시고 이용해 주세요.
                                </span>
                            </div>
                        </c:if>
                        <input type="submit" value="변 경" />
                    </form>
                </section>
            </div>
        </main>
    </body>
</html>
<c:if test="${mypage eq null}">
    <script>
        popup.alertPop('어서오세요.', '${loginMember.name}님 귀하의 입사를 축하드립니다.');
    </script>
</c:if>
