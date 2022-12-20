<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var = "path" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 프로젝트</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="${path}\resources\css\project\allprj.css">
</head>
<body>
    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
    <main class="main-box">
        <div class="prjtype">
            <span class="material-symbols-outlined">expand_more</span>
            <p>내 프로젝트</p>
        </div>
        <div class="myprj">
                <div class="project-box">
                    <div class="prj-box">
                        <div class="box-header">
                            <span class="material-symbols-outlined">public</span>
                            <p>프로젝트 이름</p>
                        </div>
                        <div class="favorite"><span class="material-symbols-outlined">star</span></div>
                    </div>
                    <div class="box-body">
                        <div class="date">
                            <span class="material-symbols-outlined">calendar_today</span><div class="period"></div>
                        </div>
                        <div class="reader">
                            <span class="material-symbols-outlined">person</span>
                            <p>리더이름</p>
                            <div class="status" value=""></div>
                        </div>
                        <div class="status-progress"></div>
                    </div>
                </div>
    
                <div class="project-box">
                    <div class="prj-box">
                        <div class="box-header">
                            <span class="material-symbols-outlined">public</span>
                            <p>프로젝트 이름</p>
                        </div>
                        <div class="favorite"><span class="material-symbols-outlined" style="color: #2fa597;">star</span></div>
                    </div>
                    <div class="box-body">
                        <div class="date">
                            <span class="material-symbols-outlined">calendar_today</span><div class="period"></div>
                        </div>
                        <div class="reader">
                            <span class="material-symbols-outlined">person</span>
                            <p>미누킴</p>
                            <div class="status" value="">지연중</div>
                        </div>
                        <div class="status-progress"></div>
                    </div>
                </div>

                <div class="project-box">
                    <div class="prj-box">
                        <div class="box-header">
                            <span class="material-symbols-outlined">public</span>
                            <p>프로젝트 이름</p>
                        </div>
                        <div class="favorite"><span class="material-symbols-outlined">star</span></div>
                    </div>
                    <div class="box-body">
                        <div class="date">
                            <span class="material-symbols-outlined">calendar_today</span><div class="period"></div>
                        </div>
                        <div class="reader">
                            <span class="material-symbols-outlined">person</span>
                            <p>미누킴</p>
                            <div class="status" value="">지연중</div>
                        </div>
                        <div class="status-progress"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="hidden"></div> <!-- hr 용으로 줄 만들것-->
        <div class="prjtype">
            <span class="material-symbols-outlined">expand_more</span>
            <p>전체 프로젝트</p>
        </div>
        <div class="prj-all">
            <div class="prj-all-box">
                <div class="project-box">
                    <div class="prj-box">
                        <div class="box-header">
                            <span class="material-symbols-outlined">public</span>
                            <p>프로젝트 이름</p>
                        </div>
                        <div class="favorite"><span class="material-symbols-outlined">star</span></div>
                    </div>
                    <div class="box-body">
                        <div class="date">
                            <span class="material-symbols-outlined">calendar_today</span><div class="period"></div>
                        </div>
                        <div class="reader">
                            <span class="material-symbols-outlined">person</span>
                            <p>미누킴</p>
                            <div class="status" value="">지연중</div>
                        </div>
                        <div class="status-progress"></div>
                    </div>
                </div>
                <div class="project-box">
                    <div class="prj-box">
                        <div class="box-header">
                            <span class="material-symbols-outlined">public</span>
                            <p>프로젝트 이름</p>
                        </div>
                        <div class="favorite"><span class="material-symbols-outlined">star</span></div>
                    </div>
                    <div class="box-body">
                        <div class="date">
                            <span class="material-symbols-outlined">calendar_today</span><div class="period"></div>
                        </div>
                        <div class="reader">
                            <span class="material-symbols-outlined">person</span>
                            <p>미누킴</p>
                            <div class="status" value="">지연중</div>
                        </div>
                        <div class="status-progress"></div>
                    </div>
                </div>
                <div class="project-box">
                    <div class="prj-box">
                        <div class="box-header">
                            <span class="material-symbols-outlined">public</span>
                            <p>프로젝트 이름</p>
                        </div>
                        <div class="favorite"><span class="material-symbols-outlined">star</span></div>
                    </div>
                    <div class="box-body">
                        <div class="date">
                            <span class="material-symbols-outlined">calendar_today</span><div class="period"></div>
                        </div>
                        <div class="reader">
                            <span class="material-symbols-outlined">person</span>
                            <p>미누킴</p>
                            <div class="status" value="">지연중</div>
                        </div>
                        <div class="status-progress"></div>
                    </div>
                </div>
                <div class="project-box">
                    <div class="prj-box">
                        <div class="box-header">
                            <span class="material-symbols-outlined">public</span>
                            <p>프로젝트 이름</p>
                        </div>
                        <div class="favorite"><span class="material-symbols-outlined">star</span></div>
                    </div>
                    <div class="box-body">
                        <div class="date">
                            <span class="material-symbols-outlined">calendar_today</span><div class="period"></div>
                        </div>
                        <div class="reader">
                            <span class="material-symbols-outlined">person</span>
                            <p>미누킴</p>
                            <div class="status" value="">지연중</div>
                        </div>
                        <div class="status-progress"></div>
                    </div>
                </div>

                <div class="project-box">
                    <div class="prj-box">
                        <div class="box-header">
                            <span class="material-symbols-outlined">public</span>
                            <p>프로젝트 이름</p>
                        </div>
                        <div class="favorite"><span class="material-symbols-outlined">star</span></div>
                    </div>
                    <div class="box-body">
                        <div class="date">
                            <span class="material-symbols-outlined">calendar_today</span><div class="period"></div>
                        </div>
                        <div class="reader">
                            <span class="material-symbols-outlined">person</span>
                            <p>미누킴</p>
                            <div class="status" value="">지연중</div>
                        </div>
                        <div class="status-progress"></div>
                    </div>
                </div>

                <div class="project-box">
                    <div class="prj-box">
                        <div class="box-header">
                            <span class="material-symbols-outlined">public</span>
                            <p>프로젝트 이름</p>
                        </div>
                        <div class="favorite"><span class="material-symbols-outlined">star</span></div>
                    </div>
                    <div class="box-body">
                        <div class="date">
                            <span class="material-symbols-outlined">calendar_today</span><div class="period"></div>
                        </div>
                        <div class="reader">
                            <span class="material-symbols-outlined">person</span>
                            <p>미누킴</p>
                            <div class="status" value="">지연중</div>
                        </div>
                        <div class="status-progress"></div>
                    </div>
                </div>

                <div class="project-box">
                    <div class="prj-box">
                        <div class="box-header">
                            <span class="material-symbols-outlined">public</span>
                            <p>프로젝트 이름</p>
                        </div>
                        <div class="favorite"><span class="material-symbols-outlined">star</span></div>
                    </div>
                    <div class="box-body">
                        <div class="date">
                            <span class="material-symbols-outlined">calendar_today</span><div class="period"></div>
                        </div>
                        <div class="reader">
                            <span class="material-symbols-outlined">person</span>
                            <p>미누킴</p>
                            <div class="status" value="">지연중</div>
                        </div>
                        <div class="status-progress"></div>
                    </div>
                </div>
                
            </div>
        </div>
    </main>
</body>
</html>