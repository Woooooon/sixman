<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="<c:url value='/resources/css/admin/company/edit.css'/>" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,1,200" />
        <script defer src="<c:url value='/resources/js/admin/company/edit.js'/>"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
        <script src="https://kit.fontawesome.com/ae846b135b.js" crossorigin="anonymous"></script>
        <!-- kakao 지도 및 주소 -->
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=86079ab6eba84f5d81340eaefed4928c&libraries=services"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    </head>
    <body>
        <%@include file="/WEB-INF/views/common/menuBar.jsp" %>

        <main id="main-page" class="main-box">
            <div class="main-box-2">
                <section class="edit-wrap box">
                    <aside class="edit-menu">
                        <ul>
                            <li><label for="company">기업 정보 설정</label></li>
                            <li><label for="dept">부서 설정</label></li>
                            <li><label for="position">직급 설정</label></li>
                        </ul>
                    </aside>
                    <article class="edit-content">
                        <div class="edit-company">
                            <input type="radio" id="company" name="edit" />
                            <form action="/sixman/admin/company/edit" method="POST" enctype="multipart/form-data" id="form">
                                <div id="company-pic">
                                    <img src="/sixman/resources/img/companyLogoSet.png" alt="" />
                                    <div id="preview">
                                        <c:if test="${not empty company.logoName}">
                                            <img src="/sixman/resources/img/logo/${company.logoName}" name="companyLogo" id="img-box" />
                                        </c:if>
                                        <c:if test="${empty company.logoName}">
                                            <img src="/sixman/resources/img/defaultCompany.png" alt="150X50" name="companyLogo" id="img-box" />
                                        </c:if>
                                    </div>
                                </div>
                                <input type="file" id="companyLogo" name="companyLogo" />
                                <div id="company-info">
                                    <div class="info-item" id="company-name-edit">
                                        <label>* 기 업 명</label>
                                        <input type="text" name="name" value="${company.name}" />
                                        <label for="companyLogo">
                                            <span class="material-symbols-outlined">add</span>
                                            로고추가
                                        </label>
                                    </div>
                                    <div class="info-item">
                                        <label>* 사업자 번호</label>
                                        <input type="text" name="license" placeholder="'-' 제외한 숫자만 입력하세요." value="${company.license}" />
                                    </div>
                                    <div class="info-item">
                                        <label> 연 락 처</label>
                                        <input type="text" name="phone" placeholder="'-' 제외한 숫자만 입력하세요." value="${company.phone}" />
                                    </div>
                                    <div class="info-item address-info">
                                        <label> 주 소</label>
                                        <input type="text" id="address" name="address" value="${company.address}" readonly />
                                        <button type="button" id="address_kakao">검 색</button>
                                    </div>
                                    <div id="map"></div>
                                    <div id="submit">
                                        <input type="submit" value="등 록" />
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="edit-dept">
                            <input type="radio" id="dept" name="edit" />
                            <div class="dept-wrap">
                                <div id="dept-title">
                                    <span class="material-symbols-outlined"> edit_square </span>
                                    <p>부서 설정</p>
                                </div>
                                <div class="dept-list">
                                    <div class="dept-item">
                                        <input type="radio" id="deptNo1" name="deptNo" />
                                        <p class="deptNo">1</p>
                                        <label for="deptNo1" class="show-team">
                                            <span class="material-symbols-outlined"> bookmark </span>
                                            <p class="deptName">영업부</p>
                                        </label>
                                        <span class="material-symbols-outlined remove-btn"> do_not_disturb_on </span>
                                    </div>
                                    <div class="dept-item">
                                        <input type="radio" id="deptNo2" name="deptNo" />
                                        <p class="deptNo">1</p>
                                        <label for="deptNo2" class="show-team">
                                            <span class="material-symbols-outlined"> bookmark </span>
                                            <p class="deptName">영업부</p>
                                        </label>
                                        <span class="material-symbols-outlined remove-btn"> do_not_disturb_on </span>
                                    </div>
                                    <div class="dept-item">
                                        <input type="radio" id="deptNo3" name="deptNo" />
                                        <p class="deptNo">1</p>
                                        <label for="deptNo3" class="show-team">
                                            <span class="material-symbols-outlined"> bookmark </span>
                                            <p class="deptName">영업부</p>
                                        </label>
                                        <span class="material-symbols-outlined remove-btn"> do_not_disturb_on </span>
                                    </div>
                                    <div class="dept-item">
                                        <input type="radio" id="deptNo4" name="deptNo" />
                                        <p class="deptNo">1</p>
                                        <label for="deptNo4" class="show-team">
                                            <span class="material-symbols-outlined"> bookmark </span>
                                            <p class="deptName">영업부</p>
                                        </label>
                                        <span class="material-symbols-outlined remove-btn"> do_not_disturb_on </span>
                                    </div>
                                    <div class="dept-item">
                                        <input type="radio" id="deptNo5" name="deptNo" />
                                        <p class="deptNo">1</p>
                                        <label for="deptNo5" class="show-team">
                                            <span class="material-symbols-outlined"> bookmark </span>
                                            <p class="deptName">영업부</p>
                                        </label>
                                        <span class="material-symbols-outlined remove-btn"> do_not_disturb_on </span>
                                    </div>
                                </div>
                                <div class="dept-insert">
                                    <input type="text" />
                                    <input type="button" value="추 가" />
                                </div>
                            </div>
                            <div class="team-wrap">
                                <div id="team-title">
                                    <span class="material-symbols-outlined"> edit_square </span>
                                    <p>팀 설정</p>
                                </div>
                                <div class="team-list">
                                    <div class="team-item">
                                        <p class="teamNo">1</p>
                                        <p class="deptNo">1</p>
                                        <div>
                                            <span class="material-symbols-outlined"> label </span>
                                            <p class="teamName">영업 1팀</p>
                                        </div>
                                        <span class="material-symbols-outlined remove-btn"> do_not_disturb_on </span>
                                    </div>
                                    <div class="team-item">
                                        <p class="teamNo">1</p>
                                        <p class="deptNo">1</p>
                                        <div>
                                            <span class="material-symbols-outlined"> label </span>
                                            <p class="teamName">영업 1팀</p>
                                        </div>
                                        <span class="material-symbols-outlined remove-btn"> do_not_disturb_on </span>
                                    </div>
                                    <div class="team-item">
                                        <p class="teamNo">1</p>
                                        <p class="deptNo">1</p>
                                        <div>
                                            <span class="material-symbols-outlined"> label </span>
                                            <p class="teamName">영업 1팀</p>
                                        </div>
                                        <span class="material-symbols-outlined remove-btn"> do_not_disturb_on </span>
                                    </div>
                                    <div class="team-item">
                                        <p class="teamNo">1</p>
                                        <p class="deptNo">1</p>
                                        <div>
                                            <span class="material-symbols-outlined"> label </span>
                                            <p class="teamName">영업 1팀</p>
                                        </div>
                                        <span class="material-symbols-outlined remove-btn"> do_not_disturb_on </span>
                                    </div>
                                    <div class="team-item">
                                        <p class="teamNo">1</p>
                                        <p class="deptNo">1</p>
                                        <div>
                                            <span class="material-symbols-outlined"> label </span>
                                            <p class="teamName">영업 1팀</p>
                                        </div>
                                        <span class="material-symbols-outlined remove-btn"> do_not_disturb_on </span>
                                    </div>
                                    <div class="team-item">
                                        <p class="teamNo">1</p>
                                        <p class="deptNo">1</p>
                                        <div>
                                            <span class="material-symbols-outlined"> label </span>
                                            <p class="teamName">영업 1팀</p>
                                        </div>
                                        <span class="material-symbols-outlined remove-btn"> do_not_disturb_on </span>
                                    </div>
                                    <div class="team-item">
                                        <p class="teamNo">1</p>
                                        <p class="deptNo">1</p>
                                        <div>
                                            <span class="material-symbols-outlined"> label </span>
                                            <p class="teamName">영업 1팀</p>
                                        </div>
                                        <span class="material-symbols-outlined remove-btn"> do_not_disturb_on </span>
                                    </div>
                                    <div class="team-item">
                                        <p class="teamNo">1</p>
                                        <p class="deptNo">1</p>
                                        <div>
                                            <span class="material-symbols-outlined"> label </span>
                                            <p class="teamName">영업 1팀</p>
                                        </div>
                                        <span class="material-symbols-outlined remove-btn"> do_not_disturb_on </span>
                                    </div>
                                    <div class="team-item">
                                        <p class="teamNo">1</p>
                                        <p class="deptNo">1</p>
                                        <div>
                                            <span class="material-symbols-outlined"> label </span>
                                            <p class="teamName">영업 1팀</p>
                                        </div>
                                        <span class="material-symbols-outlined remove-btn"> do_not_disturb_on </span>
                                    </div>
                                    <div class="team-item">
                                        <p class="teamNo">1</p>
                                        <p class="deptNo">1</p>
                                        <div>
                                            <span class="material-symbols-outlined"> label </span>
                                            <p class="teamName">영업 1팀</p>
                                        </div>
                                        <span class="material-symbols-outlined remove-btn"> do_not_disturb_on </span>
                                    </div>
                                </div>
                                <div class="team-insert">
                                    <input type="text" />
                                    <input type="button" value="추 가" />
                                </div>
                            </div>
                        </div>
                        <div class="edit-position">
                            <input type="radio" id="position" name="edit" />
                            <div class="position-wrap">
                                <div id="position-title">
                                    <span class="material-symbols-outlined"> edit_square </span>
                                    <p>직급 설정</p>
                                </div>
                                <div class="position-list">
                                    <div class="position-item">
                                        <p class="positionNo">1</p>
                                        <div>
                                            <span class="material-symbols-outlined"> assignment_ind </span>
                                            <p class="positionName">부 장</p>
                                        </div>
                                        <span class="material-symbols-outlined remove-btn"> do_not_disturb_on </span>
                                    </div>
                                    <div class="position-item">
                                        <p class="positionNo">1</p>
                                        <div>
                                            <span class="material-symbols-outlined"> assignment_ind </span>
                                            <p class="positionName">부 장</p>
                                        </div>
                                        <span class="material-symbols-outlined remove-btn"> do_not_disturb_on </span>
                                    </div>
                                    <div class="position-item">
                                        <p class="positionNo">1</p>
                                        <div>
                                            <span class="material-symbols-outlined"> assignment_ind </span>
                                            <p class="positionName">부 장</p>
                                        </div>
                                        <span class="material-symbols-outlined remove-btn"> do_not_disturb_on </span>
                                    </div>
                                    <div class="position-item">
                                        <p class="positionNo">1</p>
                                        <div>
                                            <span class="material-symbols-outlined"> assignment_ind </span>
                                            <p class="positionName">부 장</p>
                                        </div>
                                        <span class="material-symbols-outlined remove-btn"> do_not_disturb_on </span>
                                    </div>
                                    <div class="position-item">
                                        <p class="positionNo">1</p>
                                        <div>
                                            <span class="material-symbols-outlined"> assignment_ind </span>
                                            <p class="positionName">부 장</p>
                                        </div>
                                        <span class="material-symbols-outlined remove-btn"> do_not_disturb_on </span>
                                    </div>
                                </div>
                                <div class="position-insert">
                                    <input type="text" />
                                    <input type="button" value="추 가" />
                                </div>
                            </div>
                        </div>
                    </article>
                </section>
            </div>
        </main>
    </body>
</html>
