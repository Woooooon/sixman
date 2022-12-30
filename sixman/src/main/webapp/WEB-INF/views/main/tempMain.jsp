<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='resources/css/mainPage.css'/>">
</head>
<script>
    window.addEventListener('load', ()=>{
        getNotificationPermission();
    });
</script>
<body>

<%@include file="/WEB-INF/views/common/tempMenuBar.jsp" %>

<main id="main-page" class="main-box">
    
</main>

</body>
</html>