<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="<c:url value='/resources/css/addressBook/test.css'/>" />
        <script defer src="<c:url value='/resources/js/address/test.js'/>"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    </head>
    <body>
        <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
        <div class="share-modal close">
            <form action="">
                <div class="receiver">
                    <label for="">받는사람</label>
                    <input type="text" />
                    <input type="submit" value="전 송" />
                    <span class="material-symbols-outlined" id="close-modal"> close </span>
                </div>
                <div class="select-list">
                    <div class="list-title">
                        <span class="material-symbols-outlined">contacts</span>
                        <label for="">주소록</label>
                    </div>
                    <div class="list-sortation">
                        <p></p>
                        <p>구 분</p>
                        <p>상 호</p>
                        <p>이 름</p>
                        <p>직 급</p>
                        <p>연락처</p>
                    </div>
                    <div class="list-item">
                        <input type="checkbox" value="" name="" checked />
                        <p>거래처</p>
                        <p>요기요</p>
                        <p>윤태원</p>
                        <p>사원</p>
                        <p>010-8888-6666</p>
                    </div>
                    <div class="list-item">
                        <input type="checkbox" value="" name="" checked />
                        <p>거래처</p>
                        <p>요기요</p>
                        <p>윤태원</p>
                        <p>사원</p>
                        <p>010-8888-6666</p>
                    </div>
                    <div class="list-item">
                        <input type="checkbox" value="" name="" checked />
                        <p>거래처</p>
                        <p>요기요</p>
                        <p>윤태원</p>
                        <p>사원</p>
                        <p>010-8888-6666</p>
                    </div>
                    <div class="list-item">
                        <input type="checkbox" value="" name="" checked />
                        <p>거래처</p>
                        <p>요기요</p>
                        <p>윤태원</p>
                        <p>사원</p>
                        <p>010-8888-6666</p>
                    </div>
                    <div class="list-item">
                        <input type="checkbox" value="" name="" checked />
                        <p>거래처</p>
                        <p>요기요</p>
                        <p>윤태원</p>
                        <p>사원</p>
                        <p>010-8888-6666</p>
                    </div>
                    <div class="list-item">
                        <input type="checkbox" value="" name="" checked />
                        <p>거래처</p>
                        <p>요기요</p>
                        <p>윤태원</p>
                        <p>사원</p>
                        <p>010-8888-6666</p>
                    </div>
                </div>
                <div class="page-box">
                    <span class="material-symbols-outlined"> keyboard_double_arrow_left </span>
                    <span class="material-symbols-outlined"> chevron_left </span>
                    <div class="page-btn checked-p-btn">1</div>
                    <div class="page-btn">2</div>
                    <div class="page-btn">3</div>
                    <div class="page-btn">4</div>
                    <div class="page-btn">5</div>
                    <span class="material-symbols-outlined"> chevron_right </span>
                    <span class="material-symbols-outlined"> keyboard_double_arrow_right </span>
                </div>
            </form>
        </div>
        <main id="main-page" class="main-box">
            <div class="main-box-2">
                <aside id="myaddress-wrap" class="box">
                    <div class="dept-guide">
                        <span class="material-symbols-outlined"> contacts </span>
                        <p>주소록</p>
                    </div>
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
                <section id="addressBook-wrap" class="box">
                    <div class="header">
                        <div class="title">
                            <span class="material-symbols-outlined">contacts</span>
                            <label>주소록</label>
                        </div>
                        <div class="address-search">
                            <form action="">
                                <select name="category" id="">
                                    <option value="">이 름</option>
                                    <option value="">연락처</option>
                                    <option value="">직 급</option>
                                    <option value="">이메일</option>
                                    <option value="">주 소</option>
                                    <option value="">구 분</option>
                                </select>
                                <input type="text" />
                                <input type="submit" value="검 색" />
                            </form>
                        </div>
                    </div>
                    <div class="body-controller">
                        <input type="checkbox" class="selectAll" id="selectAll" />
                        <label for="selectAll">전체선택</label>
                        <a href="/sixman/address/add"><span class="material-symbols-outlined"> add_box </span></a>
                        <span class="material-symbols-outlined delete"> delete </span>
                        <span class="material-symbols-outlined share" id="checkShare"> share </span>
                    </div>
                    <div class="body">
                        <div class="card-item">
                            <input type="checkbox" id="cardNo" class="cardCheck" />
                            <div class="card-sortation">
                                <p>거래처</p>
                            </div>
                            <div class="card-top">
                                <label for="cardNo">
                                    <img src="/sixman/resources/img/defaultProfilePic.png" alt="" />
                                </label>
                            </div>
                            <div class="card-bottom">
                                <div class="essential-info">
                                    <p id="card-name">윤태원</p>
                                    <p id="card-company"><span class="material-symbols-outlined"> store </span>Yogiyo</p>
                                </div>
                                <p id="card-address">서울시 역삼동 123-7</p>
                                <p id="card-phone"><strong>Tel.</strong>010-8888-6666</p>
                                <a id="card-email" href=""><strong>Mail.</strong>asd@gmail.com</a>
                                <a id="card-detail" href="">자세히</a>
                            </div>
                        </div>
                        <div class="card-item">
                            <input type="checkbox" id="cardNo" class="cardCheck" />
                            <div class="card-sortation">
                                <p>거래처</p>
                            </div>
                            <div class="card-top">
                                <label for="cardNo">
                                    <img src="/sixman/resources/img/defaultProfilePic.png" alt="" />
                                </label>
                            </div>
                            <div class="card-bottom">
                                <div class="essential-info">
                                    <p id="card-name">윤태원</p>
                                    <p id="card-company"><span class="material-symbols-outlined"> store </span>요기요</p>
                                </div>
                                <p id="card-address">서울시 역삼동 123-7</p>
                                <p id="card-phone"><strong>Tel.</strong>010-8888-6666</p>
                                <a id="card-email" href=""><strong>Mail.</strong>asd@gmail.com</a>
                                <a id="card-detail" href="">자세히</a>
                            </div>
                        </div>
                        <div class="card-item">
                            <input type="checkbox" id="cardNo" class="cardCheck" />
                            <div class="card-sortation">
                                <p>거래처</p>
                            </div>
                            <div class="card-top">
                                <label for="cardNo">
                                    <img src="/sixman/resources/img/defaultProfilePic.png" alt="" />
                                </label>
                            </div>
                            <div class="card-bottom">
                                <div class="essential-info">
                                    <p id="card-name">윤태원</p>
                                    <p id="card-company"><span class="material-symbols-outlined"> store </span>요기요</p>
                                </div>
                                <p id="card-address">서울시 역삼동 123-7</p>
                                <p id="card-phone"><strong>Tel.</strong>010-8888-6666</p>
                                <a id="card-email" href=""><strong>Mail.</strong>asd@gmail.com</a>
                                <a id="card-detail" href="">자세히</a>
                            </div>
                        </div>
                        <div class="card-item">
                            <input type="checkbox" id="cardNo" class="cardCheck" />
                            <div class="card-sortation">
                                <p>거래처</p>
                            </div>
                            <div class="card-top">
                                <label for="cardNo">
                                    <img src="/sixman/resources/img/defaultProfilePic.png" alt="" />
                                </label>
                            </div>
                            <div class="card-bottom">
                                <div class="essential-info">
                                    <p id="card-name">윤태원</p>
                                    <p id="card-company"><span class="material-symbols-outlined"> store </span>요기요</p>
                                </div>
                                <p id="card-address">서울시 역삼동 123-7</p>
                                <p id="card-phone"><strong>Tel.</strong>010-8888-6666</p>
                                <a id="card-email" href=""><strong>Mail.</strong>asd@gmail.com</a>
                                <a id="card-detail" href="">자세히</a>
                            </div>
                        </div>
                        <div class="card-item">
                            <input type="checkbox" id="cardNo" class="cardCheck" />
                            <div class="card-sortation">
                                <p>거래처</p>
                            </div>
                            <div class="card-top">
                                <label for="cardNo">
                                    <img src="/sixman/resources/img/defaultProfilePic.png" alt="" />
                                </label>
                            </div>
                            <div class="card-bottom">
                                <div class="essential-info">
                                    <p id="card-name">윤태원</p>
                                    <p id="card-company"><span class="material-symbols-outlined"> store </span>요기요</p>
                                </div>
                                <p id="card-address">서울시 역삼동 123-7</p>
                                <p id="card-phone"><strong>Tel.</strong>010-8888-6666</p>
                                <a id="card-email" href=""><strong>Mail.</strong>asd@gmail.com</a>
                                <a id="card-detail" href="">자세히</a>
                            </div>
                        </div>
                    </div>
                    <div class="footer">
                        <div class="page-box">
                            <span class="material-symbols-outlined"> keyboard_double_arrow_left </span>
                            <span class="material-symbols-outlined"> chevron_left </span>
                            <div class="page-btn checked-p-btn">1</div>
                            <div class="page-btn">2</div>
                            <div class="page-btn">3</div>
                            <div class="page-btn">4</div>
                            <div class="page-btn">5</div>
                            <span class="material-symbols-outlined"> chevron_right </span>
                            <span class="material-symbols-outlined"> keyboard_double_arrow_right </span>
                        </div>
                    </div>
                </section>
            </div>
        </main>
    </body>
</html>
