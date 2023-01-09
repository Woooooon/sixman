<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="<c:url value='/resources/css/admin/organizationChart/list.css'/>" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,1,200" />
        <script defer src="<c:url value='/resources/js/admin/organizationChart/list.js'/>"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
        <script src="https://kit.fontawesome.com/ae846b135b.js" crossorigin="anonymous"></script>
    </head>
    <script>
        window.onload = ()=>{
            if ('${alert}' != '') {
                popup.warningPop('경고', '${alert}');
            }
        }
    </script>
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
                                                <a href="/sixman/admin/member/detail?no=${i.no}"><span class="material-symbols-outlined">account_box</span>${i.name} ${i.positionName}</a>
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
					                                            <a href="/sixman/admin/member/detail?no=${i.no}"><span class="material-symbols-outlined">account_box</span>${i.name} ${i.positionName}</a>
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
                                                <a href=""><span class="material-symbols-outlined">account_box</span>${i.name} ${i.positionName}</a>
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
                        <c:if test="${not empty company.name}">
                                <figure id="companyLogo">
                                    <img src="/sixman/resources/img/logo/${company.logoName}" alt="기업로고" />
                                </figure>
                            </c:if>
                            <c:if test="${empty company.name}">
                                <figure id="companyLogo">
                                    <img src="/sixman/resources/img/defaultCompany.png" alt="기업로고" />
                                </figure>
                            </c:if>
                        <div class="header">
                            <div class="title">
                                <span class="material-symbols-outlined">diversity_3</span>
                                <h1>조직도</h1>
                            </div>
                            <div class="controller-wrap">
                                <div class="view-controller">
                                    <button><span class="material-symbols-outlined">format_list_bulleted</span></button>
                                    <button><span class="material-symbols-outlined">account_tree</span></button>
                                </div>
                                <div class="employee-controller">
                                    <a href="/sixman/admin/member/join" class="add-emp">사원 등록</a>
                                    <button class="remove-emp">삭 제</button>
                                </div>
                            </div>
                        </div>
                        <div id="employee-info-wrap">
                            <div id="sortation">
                                <input type="checkbox" class="selectAll" />
                                <p>사번</p>
                                <p>이름</p>
                                <p>직급</p>
                                <p>부서</p>
                                <p>팀</p>
                                <p>권한</p>
                                <p>입사날짜</p>
                            </div>
                            <c:forEach items="${MemberList}" var="i">
                                <div class="list-item">
                                    <input type="checkbox" value="${i.no}" name="memberInfo" class="selectOne" />
                                    <p>${i.id}</p>
                                    <a name="memberName" href="/sixman/admin/member/detail?no=${i.no}">${i.name}</a>
                                    <p name="imgName">${i.fileName}</p>
                                    <select name="positionNo" id="">
                                    <c:forEach items="${positionList}" var="j">
                                        <option value="${j.no}" <c:if test="${j.no eq i.positionNo}">selected</c:if>>${j.position}</option>
                                    </c:forEach>
                                    </select>
                                    <select name="deptNo" id="">
                                    	<option value="1">부서 발령 전</option>
                                        <c:forEach items="${deptList}" var="j">
                                        <option value="${j.deptNo}" <c:if test="${j.deptNo eq i.deptNo}">selected</c:if>>${j.deptName}</option>
                                        </c:forEach>
                                    </select>
                                    <select name="teamNo" id="">
                                        <c:forEach items="${subDeptList}" var="j">	
                                        	<c:if test="${j.deptNo eq i.deptNo}">
                                        		<option value="${j.teamNo}" <c:if test="${j.teamNo eq i.teamNo}">selected</c:if>>${j.teamName}</option>
                                        	</c:if>
                                        </c:forEach>
                                    </select>
                                    <select name="authorizeList" id="">
                                    <c:forEach items="${authorizeList}" var="j">
                                        <option value="${j.no}" <c:if test="${j.no eq i.authorizeNo}">selected</c:if>>${j.rank}</option>
                                        </c:forEach>
                                    </select>
                                    <p>${i.joinDate}</p>
                                    <button class="update">수 정</button>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="page-box">
                            <span class="material-symbols-outlined" <c:if test="${pv.currentPage ne 1}">onclick="location.href='/sixman/admin/employee/list?page=1&&category=${category}&&keyword=${keyword}'"</c:if>> keyboard_double_arrow_left </span>
                            <span class="material-symbols-outlined" <c:if test="${pv.currentPage ne 1}">onclick="location.href='/sixman/admin/employee/list?page=${pv.currentPage - 1}&&category=${category}&&keyword=${keyword}'"</c:if>> chevron_left </span>
                            <c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
                            <div class="page-btn <c:if test="${i eq pv.currentPage}"> checked-p-btn</c:if>" onclick="location.href='/sixman/admin/employee/list?page=${i}&&category=${category}&&keyword=${keyword}'">${i}</div>
                            </c:forEach>
                            <span class="material-symbols-outlined" <c:if test="${pv.maxPage ne pv.currentPage}">onclick="location.href='/sixman/admin/employee/list?page=${pv.currentPage + 1}&&category=${category}&&keyword=${keyword}'"</c:if>> chevron_right </span>
                            <span class="material-symbols-outlined" <c:if test="${pv.maxPage ne 1}">onclick="location.href='/sixman/admin/employee/list?page=${pv.maxPage}&&category=${category}&&keyword=${keyword}'"</c:if>> keyboard_double_arrow_right </span>
                        </div>
                    </article>
                </section>
                <aside id="detail-wrap">
                    <div id="newbie" class="box">
                        <div class="side-title">
                            <h2><span class="material-symbols-outlined">child_care</span>최근 입사 한 사원</h2>
                        </div>
                        <span class="material-symbols-outlined" id="prev"> chevron_left </span>
                        <span class="material-symbols-outlined" id="next"> chevron_right </span>
                        <div class="newbie-wrapper">
                            <ul class="newbie-list">
                                <c:forEach items="${newbieList}" var="i">
                                <li class="newbie-box" id="asd">
                                    <a href="" class="newbie-detail">
                                        <div class="newbie-pic">
                                        	<c:if test="${empty i.fileName}">
                                        		<img src="/sixman/resources/img/defaultProfilePic.png" alt="" />
                                        	</c:if>
                                        	<c:if test="${not empty i.fileName}">
                                            	<img src="/sixman/resources/img/profile/${i.fileName}" alt="" />
                                            </c:if>
                                        </div>
                                        <div class="info-box">
                                            <div class="select-dept-info">
                                                <p>${i.deptName}</p>
                                                <p>${i.teamName}</p>
                                            </div>
                                            <div class="select-employee-info">
                                                <p>${i.name}</p>
                                                <p>${i.positionName}</p>
                                            </div>
                                        </div>
                                    </a>
                                </li>
								</c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div id="select-wrap" class="box">
                        <div class="side-title sep">
                            <h2><span class="material-symbols-outlined">person_pin</span>선택된 사원목록</h2>
                        </div>
                    </div>
                </aside>
            </div>
        </main>
    </body>
</html>

