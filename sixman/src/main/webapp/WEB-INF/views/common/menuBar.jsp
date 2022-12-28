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
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
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
        </div>
    </div>
    <aside id="main-aside">
        <ul id="menu-list">
            <li><a>공지사항</a></li>
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
        {icon: "event_note", title: "공지사항"},
        {title: "공지사항", url: "${path}/notice/list"}
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
        {title: "프로젝트", url: "${path}/project/allprj"},
        {title: "프로젝트 생성", url: "${path}/project/create"}
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
        connectSC();
    }

    // 웹소켓
    var socket = null;

    function connectSC() {
        socket = new SockJS("${path}/alarmSocket");

        
        socket.onmessage = onMessage;
        socket.onopen = onOpen;
        socket.onclose = onClose;

        console.log(socket);
    }

    function onMessage(m) {
        const data = m.data;
        const curMember = '${loginMember.no}';

        const datas = data.split('#');
        const type = datas[0];
        const msg = datas[1];

        console.log(data);

        let f = null;
        switch (type) {
            case 'MAIL':
                f = ()=>{location.href='';}
                break;
            case 'DOCUMENT':
                f = ()=>{location.href='';}
                break;
            case 'ADRESS':
                f = ()=>{location.href='';}
                break;
            case 'SCHEDULE':
                f = ()=>{location.href='';}
                break;
        }

        const today = new Date();

        const div = document.createElement('div');
        div.classList.add('alarm-item');

        const item = 
        '<div><div class="item-header"><div>['+type+']</div><div>'+today.toLocaleTimeString()+'</div></div><div class="item-title">'+msg+'</div></div><span class="t-btn material-symbols-outlined"> close </span>'
        div.innerHTML = item;

        div.addEventListener('click', ()=>{
            checkAjax(vo.no, vo.type);
            f();
        });

        const box = document.querySelector('#alarm-box #inner-box');
        box.prepend(div);
    }

    function onOpen(params) {
            
    }

    function onClose(params) {
            
    }

    function sendMsg(name, title, type, sender) {

        let msg = ``;
        switch (type) {
            case 'MAIL':
                msg = name + '(이)가 메일을 보냈습니다. "' + title + '"';
                break;
            case 'DOCUMENT':
                msg = name + '(이)가 결재를 요청하였습니다. "' + title + '"';
                break;
            case 'ADRESS':
                msg = name + '(이)가 주소록을 공유하였습니다. "' + title + '"';
                break;
            case 'SCHEDULE':
                msg = name + '(이)가 일정을 공유하였습니다. "' + title + '"';
                break;
        }
        
        socket.send('${loginMember.no}#'+ type + '#' + msg + '#' + sender);
    }
</script>
</html>