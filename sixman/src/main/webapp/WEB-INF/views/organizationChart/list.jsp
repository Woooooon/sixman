<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="<c:url value='/resources/css/organizationChart/list.css'/>" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <script defer src="<c:url value='/resources/js/organizationChart/list.js'/>"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    </head>
    <body>
        <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
        <main id="main-page" class="main-box">
            <div class="main-box-2">
                <aside id="dept-wrap" class="box">
                    <div class="dept-title">
                        <span class="material-symbols-outlined">inventory_2</span>
                        <p>부서 목록</p>
                    </div>
                    
                    <div class="dept-list">
                    	<c:forEach items="${deptList}" var="j">
	                    	<ul>
	                            <div class="deptList-item">
	                                <label for="deptNo${j.deptNo}">
		                                <input type="checkbox" id="deptNo${j.deptNo}">
		                                <div class="toggleBtn">
		                                    <span class="material-symbols-outlined">change_history</span>
		                                </div>
	                            	    ${j.deptName}
	                                </label>
	                            </div>
                                <c:forEach items="${memberListAll}" var="i">
                                    <c:if test="${j.deptNo eq i.deptNo and empty i.teamName}">
                                        <li>
                                            <div class="memberList-item">
                                                <p><span class="material-symbols-outlined">account_box</span>${i.name} ${i.positionName}</p>
                                            </div>
                                        </li>													
                                    </c:if>
                                </c:forEach>
		                    	<c:forEach items="${subDeptList}" var="l">
		                    		<c:if test="${j.deptNo eq l.deptNo }">
										<li>
			                                <ul>
			                                    <div class="teamList-item">
			                                        <label for="teamNo${l.teamNo}">
				                                        <input type="checkbox" id="teamNo${l.teamNo}">
				                                        <div class="toggleBtn">
				                                            <span class="material-symbols-outlined">change_history</span>
				                                        </div>
			                                      	    ${l.teamName}
			                                        </label>
			                                    </div>
												<c:forEach items="${memberListAll}" var="i">
													<c:if test="${l.teamNo eq i.teamNo}">
														<li>
					                                        <div class="memberList-item">
					                                            <p><span class="material-symbols-outlined">account_box</span>${i.name} ${i.positionName}</p>
					                                        </div>
					                                    </li>													
													</c:if>
												</c:forEach>		                    				
		                    				</ul>
	                    				</li>
		                    		</c:if>
		                    	</c:forEach>
	                    	</ul>
                    	</c:forEach>
	                    	<ul>
                                <div class="deptList-item">
                                    <label for="deptNo">
                                        <input type="checkbox" id="deptNo">
                                        <div class="toggleBtn">
                                            <span class="material-symbols-outlined">change_history</span>
                                        </div>
                                        부서 발령 전
                                    </label>
                                </div>
                                <c:forEach items="${memberListAll}" var="i">
                                    <c:if test="${i.deptNo eq 1}">
                                        <li>
                                            <div class="memberList-item">
                                                <p><span class="material-symbols-outlined">account_box</span>${i.name} ${i.positionName}</p>
                                            </div>
                                        </li>													
                                    </c:if>
                                </c:forEach>
                            </ul>
                    </div>
                </aside>
                <section id="employee-wrap">
                    <header id="employee-search" class="box">
                        <form action="" method="get">
                            <div id="search-content">
                                <input type="text" name="keyword"/>
                                <input type="submit" value="검 색" />
                            </div>
                            <div id="search-controller">
                                <label for="name">이 름<input type="radio" id="name" value="m.name" name="category" /></label>
                                <label for="deptName">부 서<input type="radio" id="deptName" value="d.name" name="category" /></label>
                                <label for="teamName">팀<input type="radio" id="teamName" value="t.name" name="category" /></label>
                                <label for="id">사 번<input type="radio" id="id" value="m.id" name="category" /></label>
                                <label for="positionName">직 급<input type="radio" id="positionName" value="p.position" name="category" /></label>
                            </div>
                        </form>
                    </header>
                    <article id="employee-list" class="box">
                        <figure id="companyLogo">
                            <img src="/sixman/resources/img/defaultCompany.png" alt="" id="headerLogo">
                        </figure>
                        <div class="header">
                            <div class="title">
                                <span class="material-symbols-outlined">diversity_3</span>
                                <label>조직도</label>
                            </div>
                        </div>
                        <div id="employee-info-wrap">
                            <div id="sortation">
                                <p>사번</p>
                                <p>이름</p>
                                <p>직급</p>
                                <p>부서</p>
                                <p>팀</p>
                                <p>입사날짜</p>
                            </div>
                            <c:forEach items="${MemberList}" var="i">
                            <label for="member${i.no}">
                                <div class="list-item">
                                    <input type="radio" id="member${i.no}" name="memberInfo" />
                                    <input type="text" class="list-phone" value="${i.phone}"/>
                                    <p class="hide list-file">${i.fileName}</p>
                                    <p class="hide list-no">${i.no}</p>
                                    <p class="hide list-email">${i.email}</p>
                                    <p class="list-id">${i.id}</p>
                                    <p class="list-name">${i.name}</p>
                                    <p class="list-position">${i.positionName}</p>
                                    <c:if test="${i.deptNo eq 1}">
                                        <p class="list-dept"></p>
                                    </c:if>
                                    <c:if test="${i.deptNo ne 1}">
                                        <p class="list-dept">${i.deptName}</p>
                                    </c:if>
                                    <p class="list-team">${i.teamName}</p>
                                    <p class="list-date">${i.joinDate}</p>
                                </div>
                            </label>
                            </c:forEach>
                            
                        </div>
                        <div class="page-box">
                            <span class="material-symbols-outlined" <c:if test="${pv.currentPage ne 1}">onclick="location.href='/sixman/employee/list?page=1&&category=${category}&&keyword=${keyword}'"</c:if>> keyboard_double_arrow_left </span>
                            <span class="material-symbols-outlined" <c:if test="${pv.currentPage ne 1}">onclick="location.href='/sixman/employee/list?page=${pv.currentPage - 1}&&category=${category}&&keyword=${keyword}'"</c:if>> chevron_left </span>
                            <c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
                            <div class="page-btn <c:if test="${i eq pv.currentPage}"> checked-p-btn</c:if>" onclick="location.href='/sixman/employee/list?page=${i}&&category=${category}&&keyword=${keyword}'">${i}</div>
                            </c:forEach>
                            <span class="material-symbols-outlined" <c:if test="${pv.maxPage ne pv.currentPage}">onclick="location.href='/sixman/employee/list?page=${pv.currentPage + 1}&&category=${category}&&keyword=${keyword}'"</c:if>> chevron_right </span>
                            <span class="material-symbols-outlined" <c:if test="${pv.maxPage ne 1}">onclick="location.href='/sixman/employee/list?page=${pv.maxPage}&&category=${category}&&keyword=${keyword}'"</c:if>> keyboard_double_arrow_right </span>
                        </div>
                    </article>
                </section>
                <aside id="detail-wrap">
                    <div id="employee-detail" class="box">
                        <figure id="companyLogo-detail">
                            <c:if test="${not empty company.logoName}">
                                <img src="/sixman/resources/img/logo/${company.logoName}" alt="" id="headerLogo">
                            </c:if>
                            <c:if test="${empty company.logoName}">
                                <img src="/sixman/resources/img/defaultCompany.png" alt="" id="headerLogo">
                            </c:if>
                        </figure>
                        <div id="employee-pic">
                            <c:if test="${empty loginMember.fileName}">
                                <img id="emp-img" src="<c:url value='/resources/img/defaultProfilePic.png'/>" alt="" />
                            </c:if>
                            <c:if test="${not empty loginMember.fileName}">
                                <img id="emp-img" src="<c:url value='/resources/img/profile/${loginMember.fileName}'/>" alt="" />
                            </c:if>
                        </div>
                        <div id="emp-deptInfo">
                            <p id="emp-dept">${loginMember.deptName}</p>
                            <p id="emp-team">${loginMember.teamName}</p>
                        </div>
                        <div id="employee-name">
                            <p id="emp-name">${loginMember.name}</p>
                            <p id="emp-position">${loginMember.positionName}</p>
                        </div>
                        <div id="detail-controller">
                            <a id="emp-email" href="/sixman/mail/write?email=${loginMember.email}"><span class="material-symbols-outlined">mail</span></a>
                            <a id="emp-add" href="/sixman/address/add?email=${loginMember.email}&name=${loginMember.name}&position=${loginMember.positionName}&company=${company.name}&phone=${loginMember.phone}"><span class="material-symbols-outlined">group_add</span></a>
                            <a id="emp-chat" href=""><span class="material-symbols-outlined">sms</span></a>
                        </div>
                    </div>
                    <div id="dept-detail" class="box">
                        <div id="dept-detail-title">
                            <h2>${loginMember.deptName}</h2>
                            <h3>${loginMember.teamName}</h3>
                        </div>
                        <div class="dept-list-wrap">
                            <c:forEach items="${deptMemberList}" var="i">
                                <div class="dept-detail-list">
                                    <div class="dept-employee-detail">
                                        <div class="dept-employee-pic">
                                            <img src="<c:url value='/resources/img/profile/${i.fileName}'/>" alt="" />
                                        </div>
                                        <p>${i.name}</p>
                                        <p>${i.positionName}</p>
                                    </div>
                                    <div class="dept-list-controller">
                                        <a href="/sixman/mail/write?email=${i.email}"><span class="material-symbols-outlined">mail</span></a>
                                        <a href="/sixman/address/add?email=${i.email}&name=${i.name}&position=${i.positionName}&company=${i.name}&phone=${i.phone}"><span class="material-symbols-outlined">group_add</span></a>
                                        <a href=""><span class="material-symbols-outlined">sms</span></a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </aside>
            </div>
        </main>
    </body>
</html>
