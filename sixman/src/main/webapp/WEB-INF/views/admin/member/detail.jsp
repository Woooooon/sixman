<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="<c:url value='/resources/css/admin/member/detail.css'/>" />
        <script defer src="<c:url value='/resources/js/admin/member/detail.js'/>"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
        <!-- kakao -->
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    </head>

    <body>
        <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
        <main id="main-page" class="main-box">
            <div id="main-box-2">
                <aside id="dept-wrap" class="box">
                   <div class="dept-list">
	                   <div class="dept-title">
	                        <span class="material-symbols-outlined">inventory_2</span>
	                        <p>부서 목록</p>
	                    </div>
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
                                                <a href=""><span class="material-symbols-outlined">account_box</span>${i.name} ${i.positionName}</a>
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
					                                            <a href=""><span class="material-symbols-outlined">account_box</span>${i.name} ${i.positionName}</a>
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
                <section id="member-wrap">
                    <form action="/sixman/admin/member/detail?no=${selectMember.no}" method="POST" enctype="multipart/form-data" id="form">
                        <article id="member-info" class="box">
                            <figure id="companyLogo">
                                <img alt="기업로고" src="<c:url value='/resources/img/google.png'/>" />
                            </figure>
                            <div class="header">
                                <span class="material-symbols-outlined">person_add</span>
                                <label>사원 등록</label>
                            </div>
                            <div class="wrap">
                                <div class="info-wrap">
                                    <div class="left-info">
                                        <div id="profile-view">
                                            <c:if test="${empty selectMember.fileName}">
                                        		<img src="/sixman/resources/img/defaultProfilePic.png" alt="" class="image-box"/>
                                        	</c:if>
                                        	<c:if test="${not empty selectMember.fileName}">
                                            	<img src="/sixman/resources/img/profile/${selectMember.fileName}" alt="" class="image-box"/>
                                            </c:if>
                                        </div>
                                        <div id="dept" class="write">
                                            <label for="">부 서</label>
                                            <select name="deptNo" id="dept">
                                            	<option value="1" selected>부 서</option>
                                            	<c:forEach items="${deptList}" var="i">
                                                <option value="${i.deptNo}" <c:if test="${selectMember.deptNo eq i.deptNo}">selected</c:if>>${i.deptName}</option>
                                            	</c:forEach>
                                            </select>
                                        </div>
                                        <div id="position" class="write">
                                            <label for="">직 급</label>
                                            <select name="positionNo">
                                                <c:forEach items="${positionList}" var="i">
                                                <option value="${i.no}" <c:if test="${selectMember.positionNo eq i.no}">selected</c:if>>${i.position}</option>
                                            	</c:forEach>
                                            </select>
                                        </div>
                                        <div id="birth" class="write">
                                            <label for="">생년월일</label>
                                            <input type="text" name="birthday" placeholder="YYMMDD" value="${selectMember.birthday}"/>
                                        </div>
                                        <div id="email" class="write">
                                            <label for="">E-MAIL</label>
                                            <input type="text" name="email" value="${selectMember.email}"/>
                                        </div>
                                    </div>
                                    <div class="right-info">
                                        <div id="id" class="write">
                                            <label for="">사 번</label>
                                            <input type="text" name="id" placeholder="영,숫자로만 입력하세요." value="${selectMember.id}"/>
                                            <span>*</span>
                                        </div>
                                        <div id="name" class="write">
                                            <label for="">성 명</label>
                                            <input type="text" name="name" value="${selectMember.name}"/>
                                            <span>*</span>
                                        </div>
                                        <div id="phone" class="write">
                                            <label for="">연락처</label>
                                            <input type="text" name="phone" placeholder="'-'를 제외하고 입력하세요." value="${selectMember.phone}"/>
                                        </div>
                                        <div id="authorize" class="write">
                                            <label for="">권 한</label>
                                            <select name="authorizeNo">
                                                <c:forEach items="${authorizeList}" var="i">
                                                    <option value="${i.no}" <c:if test="${selectMember.authorizeNo eq i.no}">selected</c:if>>${i.level}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div id="team" class="write">
                                            <label for="">팀</label>
                                            <select name="teamNo" id="">
                                            	<c:forEach items="${teamList}" var="i">
                                            		<c:if test="${i.deptNo ne 1}">
	                                            		<option value="${i.teamNo}" <c:if test="${selectMember.teamNo eq i.teamNo}">selected</c:if>>${i.teamName}</option>
	                                            	</c:if>
                                            	</c:forEach>
                                            </select>
                                        </div>
                                        <div id="bank" class="write">
                                            <label for="">계좌번호</label>
                                            <select name="bankNo">
                                                <c:forEach items="${bankList}" var="i">
                                                    <option value="${i.no}" <c:if test="${selectMember.bankNo eq i.no}">selected</c:if>>${i.name}</option>
                                                </c:forEach>
                                            </select>
                                            <input type="text" name="account" placeholder="'-'를 제외하고 입력하세요." value="${selectMember.account}"/>
                                        </div>
                                    </div>
                                </div>
                                <div id="address-wrap" class="write">
                                    <label for="">주 소</label>
                                    <input type="text" id="address" name="address" value="${selectMember.address}" readonly />
                                    <button type="button" id="address_kakao">검 색</button>
                                </div>
                                <div id="submit">
                                    <input type="submit" value="수 정" />
                                    <input type="button" value="삭 제" />
                                </div>
                            </div>
                        </article>
                        <article id="file-wrap">
                            <div id="required-file" class="box">
                                <div class="title">
                                    <h2>중요파일 등록</h2>
                                </div>
                                <div id="profile-pic">
                                    <div class="addfile">
                                        <span>프로필사진</span>
                                        <c:if test="${empty selectMember.fileNo}">
                                        <button type="button" class="plus" id="add-pic">
                                            <span class="material-symbols-outlined">add</span>
                                            추 가
                                        </button>
                                        </c:if>
                                        <c:if test="${not empty selectMember.fileNo}">
                                        <button type="button" class="plus" id="add-pic">
                                            <span class="material-symbols-outlined">add</span>
                                            변 경
                                        </button>
                                        </c:if>
                                    </div>
                                    <c:if test="${not empty selectMember.fileNo}">
                                    <input type="checkbox" class="hide" name="proflieNo" value="${selectMember.fileNo}"/> 
                                    <div id="file-info" class="profileInfo"> 
                                        <div class="checked"> 
                                            <span class="material-symbols-outlined">image</span> 
                                        </div> 
                                        <label for=""> 
                                        ${selectMember.fileOriginName}
                                        </label> 
                                        <button type="button" class="remove"> 
                                            <span id="remove-file" class="material-symbols-outlined">remove</span>삭 제 
                                        </button> 
                                    </div>
                                    </c:if>
                                </div>
                                <div id="resume">
                                    <div class="addfile">
                                        <span>이력서</span>
                                        <input type="file" />
                                        <c:if test="${empty selectMember.resumeFileInfo}">
                                        <button type="button" class="plus" id="add-resume">
                                            <span class="material-symbols-outlined">add</span>
                                            추 가
                                        </button>
                                        </c:if>
                                        <c:if test="${not empty selectMember.resumeFileInfo}">
                                        <button type="button" class="plus" id="add-resume">
                                            <span class="material-symbols-outlined">add</span>
                                            변 경
                                        </button>
                                        </c:if>
                                    </div>
                                    <c:forEach items="${selectMember.resumeFileInfo}" var="i">
                                    <input type="checkbox" class="hide" name="resumeNo" value="${i.no}"/> 
                                    <div id="file-info" class="resumeInfo"> 
                                        <div class="checked"> 
                                            <span class="material-symbols-outlined">draft</span> 
                                        </div> 
                                        <label for=""> 
                                        ${i.originName}
                                        </label> 
                                        <button type="button" class="remove"> 
                                            <span id="remove-file" class="material-symbols-outlined">remove</span>삭 제 
                                        </button> 
                                    </div>
                                    </c:forEach>
                                </div>
                                <div id="copy-account">
                                    <div class="addfile">
                                        <span>통장사본</span>
                                        <input type="file" />
                                        <c:if test="${empty selectMember.accountFileInfo}">
	                                        <button type="button" class="plus" id="add-account">
	                                            <span class="material-symbols-outlined">add</span>
	                                            추 가
	                                        </button>
                                        </c:if>
                                        <c:if test="${not empty selectMember.accountFileInfo}">
                                        	<button type="button" class="plus" id="add-account"	>
	                                            <span class="material-symbols-outlined">add</span>
	                                            변 경
                                        	</button>
                                       	</c:if>
                                    </div>
                                    <c:forEach items="${selectMember.accountFileInfo}" var="i">
                                    <input type="checkbox" class="hide" name="accountNo" value="${i.no}"/> 
                                    <div id="file-info" class="accountInfo"> 
                                        <div class="checked"> 
                                            <span class="material-symbols-outlined">draft</span> 
                                        </div> 
                                        <label for=""> 
                                        ${i.originName}
                                        </label> 
                                        <button type="button" class="remove"> 
                                            <span id="remove-file" class="material-symbols-outlined">remove</span>삭 제 
                                        </button> 
                                    </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div id="attachment-file" class="box">
                                <div class="title">
                                    <h2>첨부파일</h2>
                                    <div id="controller">
                                        <input type="checkbox" class="all_check" />
                                        <span id="add-attfile" class="material-symbols-outlined">add_circle</span>
                                        <span id="remove-attfile" class="material-symbols-outlined">delete</span>
                                    </div>
                                </div>

                                <div class="att-filelist">
                                    <c:forEach items="${selectMember.evidenceFileList}" var="i">
                                        <input type="checkbox" class="hide" name="evidenceNo" value="${i.no}"/> 
                                        <div id="file-info"> 
                                        <input type="checkbox" class="check_list" value="${i.no}"/> 
                                        <div class="checked"> 
                                            <span class="material-symbols-outlined">draft</span> 
                                        </div> 
                                        <label for=""> 
                                        ${i.originName}
                                        </label> 
                                        <button type="button" class="remove"> 
                                            <span id="remove-file" class="material-symbols-outlined">remove</span>삭 제 
                                        </button> 
                                    </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </article>
                    </form>
                </section>
            </div>
        </main>
    </body>
</html>