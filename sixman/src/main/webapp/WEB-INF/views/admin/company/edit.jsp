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

        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    </head>
    <body>
        <%@include file="/WEB-INF/views/common/tempMenuBar.jsp" %>

        <main id="main-page" class="main-box">
            <div class="main-box-2">
                <form action="/sixman/admin/company/edit" method="POST" enctype="multipart/form-data" id="form" class="box">
                    <div class="edit-title">
                        <span class="material-symbols-outlined">settings</span>
                        <p>기업 설정</p>
                    </div>
                    <div class="company-edit-wrap">
                        <label for="companyLogo">
                            <span class="material-symbols-outlined">add</span>
                        </label>
                        <div id="previewLogo">
                            <input type="file" id="companyLogo" name="companyLogo" />
                            <c:if test="${not empty company.logoName}">
                                <img src="/sixman/resources/img/logo/${company.logoName}" name="companyLogo" id="img-box" />
                            </c:if>
                            <c:if test="${empty company.logoName}">
                                <img src="/sixman/resources/img/defaultCompany.png" alt="150X50" name="companyLogo" id="img-box" />
                            </c:if>
                        </div>
                        <div class="company-Info">
                            <div id="essential-info">
                                <div class="info-item" id="company-name-edit">
                                    <label>* 기 업 명</label>
                                    <input type="text" name="name" value="${company.name}" />
                                </div>
                                <div class="info-item">
                                    <label>* 사업자 번호</label>
                                    <input type="text" name="license" placeholder="'-' 제외한 숫자만 입력하세요." value="${company.license}" />
                                </div>
                            </div>
                            <div class="info-item" id="company-phone-edit">
                                <label> 연 락 처</label>
                                <input type="text" name="phone" placeholder="'-' 제외한 숫자만 입력하세요." value="${company.phone}" />
                            </div>
                            <div class="info-item address-info">
                                <label> 주 소</label>
                                <input type="text" id="address" name="address" value="${company.address}" readonly />
                                <button type="button" id="address_kakao">검 색</button>
                            </div>
                        </div>
                        <div class="company-app">
                            <div id="map"></div>
                            <div id="submit">
                                <input type="submit" value="등 록" />
                            </div>
                        </div>
                    </div>
                </form>
                <aside class="infoList">
                    <div class="box" id="dept">
                        <div class="edit-title">
                            <span class="material-symbols-outlined"> inventory_2 </span>
                            <p>부서 설정</p>
                        </div>
                        <div class="dept-wrap">
                            <div class="dept-list">
                                <div>
                                    <c:forEach items="${deptList}" var="i">
                                        <div class="dept-item">
                                            <input type="radio" id="deptNo${i.deptNo}" name="deptNo" />
                                            <p class="deptNo">${i.deptNo}</p>
                                            <label for="deptNo${i.deptNo}" class="show-team">
                                                <span class="material-symbols-outlined"> bookmark </span>
                                                <p class="deptName">${i.deptName}</p>
                                            </label>
                                            <span class="material-symbols-outlined remove-dept"> do_not_disturb_on </span>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="dept-insert">
                                <input type="text" id="newDeptName" />
                                <input type="button" value="추 가" id="insertDept" />
                            </div>
                        </div>
                    </div>
                    <div class="box" id="team">
                        <div class="edit-title">
                            <span class="material-symbols-outlined"> inbox </span>
                            <p>팀 설정</p>
                        </div>
                        <div class="team-wrap">
                            <div class="team-list"><div></div></div>
                            <div class="team-insert">
                                <input type="text" id="newTeamName" readonly />
                                <input type="text" id="deptNo" />
                                <input type="button" value="추 가" id="insertTeam" />
                            </div>
                        </div>
                    </div>
                    <div class="box" id="position">
                        <div class="edit-title">
                            <span class="material-symbols-outlined"> assignment_ind </span>
                            <p>직급 설정</p>
                        </div>
                        <div class="position-wrap">
                            <div class="position-list">
                                <div>
                                    <c:forEach items="${positionList}" var="i">
                                        <c:if test="${i.no ne 1}">
                                            <div class="position-item">
                                                <p class="positionNo">${i.no}</p>
                                                <div>
                                                    <span class="material-symbols-outlined"> assignment_ind </span>
                                                    <p class="positionName">${i.position}</p>
                                                </div>
                                                <span class="material-symbols-outlined remove-position"> do_not_disturb_on </span>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="position-insert">
                                <input type="text" id="newPositionName" />
                                <input type="button" value="추 가" id="insertPosition" />
                            </div>
                        </div>
                    </div>
                </aside>
            </div>
        </main>
    </body>
</html>
