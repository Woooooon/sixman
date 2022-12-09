<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="<c:url value='/resources/css/admin/member/join.css'/>" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
        <script defer src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    </head>
    <body>
        <%@include file="/WEB-INF/views/common/menuBar.jsp" %>
        <main id="main-page" class="main-box">
            <div id="main-box-2">
                <aside id="dept-wrap" class="box">
                    <div id="jstree">
                        <ul>
                            <li>
                                Root node 1
                                <ul>
                                    <li id="child_node_1">Child node 1</li>
                                    <li>Child node 2</li>
                                </ul>
                            </li>
                            <li>Root node 2</li>
                        </ul>
                    </div>
                    <button>demo button</button>
                </aside>
                <section id="member-wrap">
                    <form action="">
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
                                            <img alt="프로필사진" src="<c:url value='/resources/img/cat.png'/>" />
                                        </div>
                                        <div id="dept" class="write">
                                            <label for="">부 서</label>
                                            <select name="dept_no" id="dept">
                                                <option value="1">영업부</option>
                                                <option value="2">인사부</option>
                                                <option value="3">관리부</option>
                                                <option value="4">마케팅부</option>
                                            </select>
                                        </div>
                                        <div id="position" class="write">
                                            <label for="">직 급</label>
                                            <select name="" id="">
                                                <option value="1">사 원</option>
                                                <option value="2">대 리</option>
                                                <option value="3">과 장</option>
                                                <option value="4">차 장</option>
                                                <option value="5">부 장</option>
                                            </select>
                                        </div>
                                        <div id="birth" class="write">
                                            <label for="">생년월일</label>
                                            <input type="text" />
                                        </div>
                                        <div id="email" class="write">
                                            <label for="">E-MAIL</label>
                                            <input type="text" />
                                        </div>
                                    </div>
                                    <div class="right-info">
                                        <div id="id" class="write">
                                            <label for="">사 번</label>
                                            <input type="text" />
                                        </div>
                                        <div id="name" class="write">
                                            <label for="">성 명</label>
                                            <input type="text" />
                                        </div>
                                        <div id="phone" class="write">
                                            <label for="">연락처</label>
                                            <input type="text" />
                                        </div>
                                        <div id="authorize" class="write">
                                            <label for="">권 한</label>
                                            <select name="" id="dept">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                            </select>
                                        </div>
                                        <div id="team" class="write">
                                            <label for="">팀</label>
                                            <select name="" id="">
                                                <option value="1">영업 1팀</option>
                                                <option value="2">영업 2팀</option>
                                                <option value="3">영업 3팀</option>
                                            </select>
                                        </div>
                                        <div id="bank" class="write">
                                            <label for="">계좌번호</label>
                                            <select name="" id="">
                                                <option value="1">신 한</option>
                                                <option value="2">기 업</option>
                                                <option value="3">하 나</option>
                                                <option value="4">농 협</option>
                                                <option value="5">국 민</option>
                                                <option value="5">카카오</option>
                                            </select>
                                            <input type="text" />
                                        </div>
                                    </div>
                                </div>
                                <div id="address" class="write">
                                    <label for="">주 소</label>
                                    <input type="text" />
                                    <button type="button">검 색</button>
                                </div>
                                <div id="submit">
                                    <input type="submit" value="사원 등록" />
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
                                        <input type="file" />
                                        <button type="button" class="plus">
                                            <span class="material-symbols-outlined">add</span>
                                            추 가
                                        </button>
                                    </div>
                                    <div class="filelist">
                                        <div id="file-info">
                                            <span class="material-symbols-outlined">image</span>
                                            <label for="">장화.png</label>
                                            <button type="button" class="remove">
                                                <span class="material-symbols-outlined">remove</span>
                                                삭 제
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div id="resume">
                                    <div class="addfile">
                                        <span>이력서</span>
                                        <input type="file" />
                                        <button type="button" class="plus">
                                            <span class="material-symbols-outlined">add</span>
                                            추 가
                                        </button>
                                    </div>
                                    <div class="filelist">
                                        <div id="file-info">
                                            <span class="material-symbols-outlined"> description</span>
                                            <label for="">이력서.pdf</label>
                                            <button type="button" class="remove">
                                                <span class="material-symbols-outlined">remove</span>
                                                삭 제
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div id="copy-account">
                                    <div class="addfile">
                                        <span>통장사본</span>
                                        <input type="file" />
                                        <button type="button" class="plus">
                                            <span class="material-symbols-outlined">add</span>
                                            추 가
                                        </button>
                                    </div>
                                    <div class="filelist">
                                        <div id="file-info">
                                            <span class="material-symbols-outlined">image</span>
                                            <label for="">신한은행사본.png</label>
                                            <button type="button" class="remove">
                                                <span class="material-symbols-outlined">remove</span>
                                                삭 제
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="attachment-file" class="box">
                                <div class="title">
                                    <h2>첨부파일</h2>
                                    <input type="file" />
                                    <div id="controller">
                                        <span class="material-symbols-outlined">add_circle</span>
                                        <span class="material-symbols-outlined">delete</span>
                                    </div>
                                </div>
                                <div class="filelist">
                                    <div id="file-info">
                                        <div class="checked">
                                            <input type="checkbox" />
                                            <span class="material-symbols-outlined">image</span>
                                        </div>
                                        <label for="">장화.png</label>
                                        <button type="button" class="remove">
                                            <span class="material-symbols-outlined">remove</span>
                                            삭 제
                                        </button>
                                    </div>
                                    <div id="file-info">
                                        <div class="checked">
                                            <input type="checkbox" />
                                            <span class="material-symbols-outlined">image</span>
                                        </div>
                                        <label for="">장화.png</label>
                                        <button type="button" class="remove">
                                            <span class="material-symbols-outlined">remove</span>
                                            삭 제
                                        </button>
                                    </div>
                                    <div id="file-info">
                                        <div class="checked">
                                            <input type="checkbox" />
                                            <span class="material-symbols-outlined">image</span>
                                        </div>
                                        <label for="">장화.png</label>
                                        <button type="button" class="remove">
                                            <span class="material-symbols-outlined">remove</span>
                                            삭 제
                                        </button>
                                    </div>
                                    <div id="file-info">
                                        <div class="checked">
                                            <input type="checkbox" />
                                            <span class="material-symbols-outlined">image</span>
                                        </div>
                                        <label for="">장화.png</label>
                                        <button type="button" class="remove">
                                            <span class="material-symbols-outlined">remove</span>
                                            삭 제
                                        </button>
                                    </div>
                                    <div id="file-info">
                                        <div class="checked">
                                            <input type="checkbox" />
                                            <span class="material-symbols-outlined">image</span>
                                        </div>
                                        <label for="">장화.png</label>
                                        <button type="button" class="remove">
                                            <span class="material-symbols-outlined">remove</span>
                                            삭 제
                                        </button>
                                    </div>
                                    <div id="file-info">
                                        <div class="checked">
                                            <input type="checkbox" />
                                            <span class="material-symbols-outlined">image</span>
                                        </div>
                                        <label for="">장화.png</label>
                                        <button type="button" class="remove">
                                            <span class="material-symbols-outlined">remove</span>
                                            삭 제
                                        </button>
                                    </div>
                                    <div id="file-info">
                                        <div class="checked">
                                            <input type="checkbox" />
                                            <span class="material-symbols-outlined">image</span>
                                        </div>
                                        <label for="">장화.png</label>
                                        <button type="button" class="remove">
                                            <span class="material-symbols-outlined">remove</span>
                                            삭 제
                                        </button>
                                    </div>
                                    <div id="file-info">
                                        <div class="checked">
                                            <input type="checkbox" />
                                            <span class="material-symbols-outlined">image</span>
                                        </div>
                                        <label for="">장화.png</label>
                                        <button type="button" class="remove">
                                            <span class="material-symbols-outlined">remove</span>
                                            삭 제
                                        </button>
                                    </div>
                                    <div id="file-info">
                                        <div class="checked">
                                            <input type="checkbox" />
                                            <span class="material-symbols-outlined">image</span>
                                        </div>
                                        <label for="">장화.png</label>
                                        <button type="button" class="remove">
                                            <span class="material-symbols-outlined">remove</span>
                                            삭 제
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </form>
                </section>
            </div>
        </main>
        <script>
            $(function () {
                $('#jstree').jstree();

                $('#jstree').on('changed.jstree', function (e, data) {
                    console.log(data.selected);
                });

                $('button').on('click', function () {
                    $('#jstree').jstree(true).select_node('child_node_1');
                    $('#jstree').jstree('select_node', 'child_node_1');
                    $.jstree.reference('#jstree').select_node('child_node_1');
                });
            });
        </script>
    </body>
</html>
