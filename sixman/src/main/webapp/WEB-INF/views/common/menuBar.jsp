<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var = "path" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>육남상사</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,200,1,0" />    
    <link rel="stylesheet" href="${path}/resources/css/main.css">
    <link rel="stylesheet" href="${path}/resources/css/reset.css">
    <script src="${path}/resources/js/main/main.js"></script>
</head>
<body>

	<header id="main-header">
        <section id="logo"></section>
        <section id="event-msg-box"></section>
        <section id="my-menu">
            <article id="alarm" class="center">
                <span class="material-symbols-outlined"> notifications </span>
                <div id="alarm-count"></div>
            </article>
            <article id="msg" class="center">
                <span class="material-symbols-outlined"> sms </span>
            </article>
            <article id="my-img" class="center">
                <span class="material-symbols-outlined"> person </span>
            </article>
        </section>
    </header>
    <div id="alarm-box">
        <div id="inner-box">

            <!-- <div class="alarm-item">
                <div>
                    <div class="item-header">
                        <div>[카테고리]</div>
                        <div>2022:00:00:00</div>
                    </div>
                    <div class="item-title">ooo님이 보낸메일 "제목 제sadfasdf목 제목"</div>
                </div>
                <span class="t-btn material-symbols-outlined"> close </span>
            </div>

            <div class="alarm-item">
                <div>
                    <div class="item-header">
                        <div>[카테고리]</div>
                        <div>2022:00:00:00</div>
                    </div>
                    <div class="item-title">ooo님이 보낸메일 "제목 제sadfasdf목 제목"</div>
                </div>
                <span class="t-btn material-symbols-outlined"> close </span>
            </div> -->

        </div>
    </div>
    <aside id="main-aside">
        <ul id="menu-list">
            <li><a>근태관리</a></li>
            <li><a>프로젝트</a></li>
            <li><a>전자문서</a></li>
            <li><a>메일함</a></li>
            <li><a>조직도</a></li>
            <li><a>주소록</a></li>
            <li><a>일정</a></li>
            <li><a>급여</a></li>
        </ul>
        <section id="menu-footer">
            <a href="" class="material-symbols-outlined">logout</a>
            <div id="foot-logo"></div>
        </section>
    </aside>
    <aside id="side-menu">
        <section id="side-main">
        </section>
        <section id="side-list">
        </section>
    </aside>
	
</body>
<script>
    const menuMap = new Map();

    menuMap.set("공지사항", [
        {icon: "approval", title: "공지사항"},
        {title: "", url: ""}
    ]);

    menuMap.set("근태관리", [
        {icon: "approval", title: "근태관리"},
        {title: "", url: ""},
        {title: "", url: ""},
        {title: "", url: ""},
        {title: "", url: ""}
    ]);

    menuMap.set("프로젝트", [
        {icon: "groups", title: "프로젝트"},
        {title: "", url: ""},
        {title: "", url: ""},
        {title: "", url: ""}
    ]);

    menuMap.set("전자문서", [
        {icon: "home_storage", title: "전자문서"},
        {title: "", url: ""},
        {title: "", url: ""},
        {title: "", url: ""}
    ]);

    menuMap.set("메일함", [
        {icon: "mail", title: "메일함"},
        {title: "메일작성", url: "${path}/mail/write"},
        {title: "전체메일함", url: "${path}/mail/list"},
        {title: "받은메일함", url: "${path}/mail/list?listType=받은메일함"},
        {title: "보낸메일함", url: "${path}/mail/list?listType=보낸메일함"},
        {title: "임시보관함", url: "${path}/mail/list?listType=임시보관함"},
        {title: "휴지통", url: "${path}/mail/list?listType=휴지통"}
    ]);

    menuMap.set("조직도", [
        {icon: "account_tree", title: "조직도"},
        {title: "", url: ""},
        {title: "", url: ""},
        {title: "", url: ""}
    ]);

    menuMap.set("주소록", [
        {icon: "contacts", title: "주소록"},
        {title: "", url: ""},
        {title: "", url: ""},
        {title: "", url: ""}
    ]);

    menuMap.set("일정", [
        {icon: "calendar_month", title: "일정"},
        {title: "일정", url: "${path}/schedule/calendar"},
        {title: "주간일정", url: ""},
    ]);

    menuMap.set("급여", [
        {icon: "calculate", title: "급여"},
        {title: "", url: ""},
        {title: "", url: ""},
        {title: "", url: ""}
    ]);

    const menuListBox = document.querySelector('#menu-list');
    const sideMenu = document.querySelector('#side-menu');
    const liArr = menuListBox.querySelectorAll('li');

    liArr.forEach(element => {
        element.addEventListener("mouseover", ()=>{
            const a = element.querySelector('a');
            const key = a.innerText
            setSideList(menuMap.get(key));
            sideMenu.style.left = '250px';
        });
        element.addEventListener("mouseout", ()=>{
            sideMenu.style.left = '0';
        });
    });

    sideMenu.addEventListener("mouseover", ()=>{
        sideMenu.style.left = '250px';
    });
    sideMenu.addEventListener("mouseout", ()=>{
        sideMenu.style.left = '0';
    });

    function setSideList(params) {
        const sideListBox = document.querySelector('#side-list');
        const sideMainBox = document.querySelector('#side-main');

        sideMainBox.innerHTML = '<span class="material-symbols-outlined">'+params[0].icon+'</span> <div id="side-title">'+params[0].title+'</div>';

        let liList = "";
        for(let i = 1; i < params.length; i++){
            const item = params[i];
            if(item.subList == null){
                liList += "<li><a href='"+item.url+"'>"+item.title+"</a></li>";
            }else{
                let sub = "";
                for(let j = 0; j < item.subList.length; j++){
                    const item2 = item.subList[j];
                    sub += "<li><a href='"+item2.url+"'>"+item2.title+"</a></li>";
                }
                liList += "<li><a>"+item.title+"</a><ul>"+sub+"</ul></li>";
            }
        }
        sideListBox.innerHTML = "<ul>"+liList+"</ul>"
    }

    // 알람스크롤
    const alarm = document.querySelector('#alarm-box');
    const alarmBtn = document.querySelector('#alarm');

    alarmBtn.addEventListener('mouseover', ()=>{
        alarm.animate([
            {},{
                top:"50px",
            }],{
                duration: 300,
                fill: "forwards"
        });
    })

    alarm.addEventListener('mouseleave', ()=>{
        alarm.animate([
            {},{
                top:"-500px",
            }],{
                duration: 300,
                fill: "forwards"
        });
    })

    const alarmItems = document.querySelectorAll('.alarm-item');
    alarmItems.forEach(element => {
        element.querySelector('span').addEventListener('click', ()=>{
            element.remove();
        });
    });

    window.onload = ()=>{
        alarmAjax();
    }
</script>
</html>