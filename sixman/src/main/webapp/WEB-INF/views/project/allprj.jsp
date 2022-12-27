<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var = "path" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 프로젝트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="${path}\resources\css\project\allprj.css">
<script defer src="${path}\resources\js\project\allprj.js"></script>
</head>
<body>
    <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
    <main class="main-box">
        <div class="hidden"></div>
        <div class="prjtype my">
            <span class="material-symbols-outlined">expand_more</span>
            <p>내 프로젝트</p>
        </div>
        <div class="myprj">
        	<c:forEach var="list" items="${list}">
                <div class="project-box">
                    <div class="prj-box">
                        <div class="box-header">
                            <span class="material-symbols-outlined">public</span>
                            <p>${list.title} </p>
                        </div>
                        <div class="favorite"><span class="material-symbols-outlined like">star</span></div>
                    </div>
                    <div class="box-body">
                        <div class="date">
                            <span class="material-symbols-outlined">calendar_today</span>
                            <div class="prjdate">${list.startDate}</div>
                            <p>~</p>
                            <div class="prjdate2">${list.endDate}</div>
                        </div>
                        <div class="reader">
                            <span class="material-symbols-outlined">person</span>
                            <p>${list.leader}</p>
                            <div class="status complete" value="">완료</div>
                        </div>
                        <div class="status-progress"></div>
                    </div>
                </div>
        	</c:forEach>
                
                <div class="project-box">
                    <div class="prj-box">
                        <div class="box-header">
                            <span class="material-symbols-outlined">public</span>
                            <p>프로젝트 이름</p>
                        </div>
                        <div class="favorite"><span class="material-symbols-outlined like">star</span></div>
                    </div>
                    <div class="box-body">
                        <div class="date">
                            <span class="material-symbols-outlined">calendar_today</span>
                            <div class="prjdate">2022-12-20</div>
                            <p>~</p>
                            <div class="prjdate2">2022-12-30</div>
                        </div>
                        <div class="reader">
                            <span class="material-symbols-outlined">person</span>
                            <p>미누킴</p>
                            <div class="status ing" value="">진행중</div>
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
                        <div class="favorite">
                            <span class="material-symbols-outlined like">star</span>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="date">
                            <span class="material-symbols-outlined">calendar_today</span>
                            <div class="prjdate">2022-12-20</div>
                            <p>~</p>
                            <div class="prjdate2">2022-12-30</div>
                        </div>
                        <div class="reader">
                            <span class="material-symbols-outlined">person</span>
                            <p>미누킴</p>
                            <div class="status complete" value="">완료</div>
                        </div>
                        <div class="status-progress"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="hidden"></div> <!-- hr 용으로 줄 만들것-->
        <div class="prjtype all">
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
                            <span class="material-symbols-outlined">calendar_today</span>
                            <div class="prjdate">2022-12-20</div>
                            <p>~</p>
                            <div class="prjdate2">2022-12-30</div>
                        </div>
                        <div class="reader">
                            <span class="material-symbols-outlined">person</span>
                            <p>미누킴</p>
                            <div class="status ing" value="">진행중</div>
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
                            <span class="material-symbols-outlined">calendar_today</span>
                            <div class="prjdate">2022-12-20</div>
                            <p>~</p>
                            <div class="prjdate2">2022-12-30</div>
                        </div>
                        <div class="reader">
                            <span class="material-symbols-outlined">person</span>
                            <p>미누킴</p>
                            <div class="status ing" value="">진행중</div>
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
                            <span class="material-symbols-outlined">calendar_today</span>
                            <div class="prjdate">2022-12-20</div>
                            <p>~</p>
                            <div class="prjdate2">2022-12-30</div>
                        </div>
                        <div class="reader">
                            <span class="material-symbols-outlined">person</span>
                            <p>미누킴</p>
                            <div class="status ing" value="">진행중</div>
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
                            <span class="material-symbols-outlined">calendar_today</span>
                            <div class="prjdate">2022-12-20</div>
                            <p>~</p>
                            <div class="prjdate2">2022-12-30</div>
                        </div>
                        <div class="reader">
                            <span class="material-symbols-outlined">person</span>
                            <p>미누킴</p>
                            <div class="status delay" value="">지연중</div>
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
                            <span class="material-symbols-outlined">calendar_today</span>
                            <div class="prjdate">2022-12-20</div>
                            <p>~</p>
                            <div class="prjdate2">2022-12-30</div>
                        </div>
                        <div class="reader">
                            <span class="material-symbols-outlined">person</span>
                            <p>미누킴</p>
                            <div class="status ing" value="">진행중</div>
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
                            <span class="material-symbols-outlined">calendar_today</span>
                            <div class="prjdate">2022-12-20</div>
                            <p>~</p>
                            <div class="prjdate2">2022-12-30</div>
                        </div>
                        <div class="reader">
                            <span class="material-symbols-outlined">person</span>
                            <p>미누킴</p>
                            <div class="status delay" value="">지연중</div>
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
                            <span class="material-symbols-outlined">calendar_today</span>
                            <div class="prjdate">2022-12-20</div>
                            <p>~</p>
                            <div class="prjdate2">2022-12-30</div>
                        </div>
                        <div class="reader">
                            <span class="material-symbols-outlined">person</span>
                            <p>미누킴</p>
                            <div class="status ing" value="">진행중</div>
                        </div>
                        <div class="status-progress"></div>
                    </div>
                </div>
                
            </div>
        </div>
    </main>
</body>
</html>