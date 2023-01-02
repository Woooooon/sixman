<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var = "path" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>육남상사</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="${path}/resources/css/main.css">
    <link rel="stylesheet" href="${path}/resources/css/reset.css">
    <link rel="stylesheet" href="${path}/resources/css/chat.css">
    <script defer src="${path}/resources/js/main/main.js"></script>
    <script defer src="${path}/resources/js/main/chat.js"></script>
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
            <div id="foot-logo" onclick="location.href='${path}/main'"></div>
        </section>
    </aside>
    <aside id="side-menu">
        <section id="side-main">
        </section>
        <section id="side-list">
        </section>
    </aside>
	<aside id="m-outer">
        <div id="m-outer-box">

            <section id="m-list-panel" class="m-inner">

                <article class="ml-header">
                    <div>Member</div>
                    <div id="ml-search">
                        <input type="text" placeholder="이름검색">
                        <span class="material-symbols-outlined"> search </span>
                    </div>
                </article>
                <article class="ml-main">
                    <article id="ml-bookmark" class="ml-list-box">
                        <label class="ml-list-title">
                            <p>즐겨찾기</p>
                            <span class="material-symbols-outlined"> expand_more </span>
                            <input type="checkbox">
                        </label>
                        <div class="ml-list">
                            <div class="ml-list-item">
                                <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                                <div>닉네임 <p>직급</p></div>
                                <label class="material-symbols-outlined"> grade <input type="checkbox"></label>
                            </div>
                            <div class="ml-list-item">
                                <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                                <div>닉네임 <p>직급</p></div>
                                <label class="material-symbols-outlined"> grade <input type="checkbox"></label>
                            </div>
                            <div class="ml-list-item">
                                <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                                <div>닉네임 <p>직급</p></div>
                                <label class="material-symbols-outlined"> grade <input type="checkbox"></label>
                            </div>
                        </div>
                    </article>
                    <article id="ml-team" class="ml-list-box">
                        <label class="ml-list-title">
                            <p>부서원</p>
                            <span class="material-symbols-outlined"> expand_more </span>
                            <input type="checkbox">
                        </label>
                        <div class="ml-list">
                            <div class="ml-list-item">
                                <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                                <div>닉네임 <p>직급</p></div>
                                <label class="material-symbols-outlined"> grade <input type="checkbox"></label>
                            </div>
                            <div class="ml-list-item">
                                <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                                <div>닉네임 <p>직급</p></div>
                                <label class="material-symbols-outlined"> grade <input type="checkbox"></label>
                            </div>
                            <div class="ml-list-item">
                                <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                                <div>닉네임 <p>직급</p></div>
                                <label class="material-symbols-outlined"> grade <input type="checkbox"></label>
                            </div>
                        </div>
                    </article>
                    <article id="ml-all" class="ml-list-box">
                        <label class="ml-list-title">
                            <p>전체사원</p>
                            <span class="material-symbols-outlined"> expand_more </span>
                            <input type="checkbox" checked>
                        </label>
                        <div class="ml-list">
                            <div class="ml-list-item">
                                <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                                <div>닉네임 <p>직급</p></div>
                                <label class="material-symbols-outlined"> grade <input type="checkbox"></label>
                            </div>
                            <div class="ml-list-item">
                                <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                                <div>닉네임 <p>직급</p></div>
                                <label class="material-symbols-outlined"> grade <input type="checkbox"></label>
                            </div>
                            <div class="ml-list-item">
                                <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                                <div>닉네임 <p>직급</p></div>
                                <label class="material-symbols-outlined"> grade <input type="checkbox"></label>
                            </div>
                        </div>
                    </article>
                </article>
                <article class="ml-footer">
                    <div class="ml-f-item" onclick="openList()">
                        <span class="material-symbols-outlined"> group </span>
                    </div>
                    <div class="ml-f-item" onclick="openChat()">
                        <span class="material-symbols-outlined"> forum </span>
                    </div>
                </article>

            </section>

            <section id="m-chatList-panel" class="m-inner">
                <article class="ml-header">
                    <div>Chat</div>
                    <div id="ml-menu-box">
                        <div id="ml-search">
                            <input type="text" placeholder="검색">
                            <span class="material-symbols-outlined"> search </span>
                        </div>
                        <span onclick="openCreate()" class="material-symbols-outlined"> add </span>
                    </div>
                </article>
                <article class="ml-main">
        
                </article>
                <article class="ml-footer">
                    <div class="ml-f-item" onclick="openList()">
                        <span class="material-symbols-outlined"> group </span>
                    </div>
                    <div class="ml-f-item" onclick="openChat()">
                        <span class="material-symbols-outlined"> forum </span>
                    </div>
                </article>
            </section>

            <section id="m-option-panel" class="m-inner">
                <div id="option-inner">
                    <div id="option-header">
                        <span class="material-symbols-outlined" onclick="closeOption()"> chevron_left </span>
                        <div>Setting</div>
                    </div>
                    <div id="option-box">
                        <label><input type="checkbox">상단고정</label>
                        <label><input type="checkbox">알림여부</label>
                    </div>
                    <div id="containner-box">
                        <div class=>
                            <span class="material-symbols-outlined"> photo_library </span>
                            사진보관함
                        </div>
                        <div class="file-box">
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>
                            <div></div>

                        </div>
                        <div>
                            <span class="material-symbols-outlined"> attach_file </span>
                            파일보관함
                        </div>
                        <div class="file-box">

                        </div>
                    </div>
                </div>
            </section>

            <section id="m-chat-panel" class="m-inner">
                <article class="ml-header">
                    <div id="chat-title">

                    </div>
                    <div id="chat-menu">
                        <span id="search-btn" class="material-symbols-outlined"> search </span>
                        <span class="material-symbols-outlined" onclick="openOption()"> menu </span>
                    </div>
                </article>
                <div id="search-box">
                    <span class="material-symbols-outlined"> search </span>
                    <input type="text">
                    <span class="material-symbols-outlined" onclick="search()"> arrow_right_alt </span>
                </div>
                <article class="ml-main">

                </article>
                <article class="ml-footer">
                    <label for="chat-file" class="material-symbols-outlined"> attach_file </label>
                    <input type="text">
                    <span class="material-symbols-outlined"> arrow_forward </span>
                    <input id="chat-file" type="file" onchange="readURL(this)">
                </article>
                <div id="chat-file-box">
                    <span class="material-symbols-outlined" onclick="closeFileBox()"> close </span>
                    <img id="preview"/>
                </div>
            </section>

            <section id="m-create-panel" class="m-inner">
                <article class="ml-header">
                    <div>
                        <span class="material-symbols-outlined" onclick="openChat()"> chevron_left </span>
                        <div>Create</div>
                        <div id="ml-search">
                            <input type="text" placeholder="이름검색">
                            <span class="material-symbols-outlined"> search </span>
                        </div>
                    </div>
                    <div id="chat-member-list">
                        
                    </div>
                </article>
                <article class="ml-main">
                    <article id="ml-bookmark" class="ml-list-box">
                        <label class="ml-list-title">
                            <p>즐겨찾기</p>
                            <span class="material-symbols-outlined"> expand_more </span>
                            <input type="checkbox">
                        </label>
                        <div class="ml-list">
                            <div class="ml-list-item">
                                <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                                <div>닉네임 <p>직급</p></div>
                                <input type="checkbox">
                            </div>
                            <div class="ml-list-item">
                                <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                                <div>닉네임 <p>직급</p></div>
                                <input type="checkbox">
                            </div>
                            <div class="ml-list-item">
                                <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                                <div>닉네임 <p>직급</p></div>
                                <input type="checkbox">
                            </div>
                        </div>
                    </article>
                    <article id="ml-team" class="ml-list-box">
                        <label class="ml-list-title">
                            <p>부서원</p>
                            <span class="material-symbols-outlined"> expand_more </span>
                            <input type="checkbox">
                        </label>
                        <div class="ml-list">
                            <div class="ml-list-item">
                                <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                                <div>닉네임 <p>직급</p></div>
                                <input type="checkbox">
                            </div>
                            <div class="ml-list-item">
                                <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                                <div>닉네임 <p>직급</p></div>
                                <input type="checkbox">
                            </div>
                            <div class="ml-list-item">
                                <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                                <div>닉네임 <p>직급</p></div>
                                <input type="checkbox">
                            </div>
                        </div>
                    </article>
                    <article id="ml-all" class="ml-list-box">
                        <label class="ml-list-title">
                            <p>전체사원</p>
                            <span class="material-symbols-outlined"> expand_more </span>
                            <input type="checkbox" checked>
                        </label>
                        <div class="ml-list">
                            <div class="ml-list-item">
                                <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                                <div>닉네임 <p>직급</p></div>
                                <input type="checkbox">
                            </div>
                            <div class="ml-list-item">
                                <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                                <div>닉네임 <p>직급</p></div>
                                <input type="checkbox">
                            </div>
                            <div class="ml-list-item">
                                <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                                <div>닉네임 <p>직급</p></div>
                                <input type="checkbox">
                            </div>
                        </div>
                    </article>
                </article>
                <article class="ml-footer">
                    <div class="ml-f-item" onclick="createChat()">
                        <span>만들기</span>
                        <span class="material-symbols-outlined"> arrow_forward </span>
                    </div>
                </article>
            </section>

            <section id="m-profile-panel" class="m-inner">
                <div>
                    <label class="material-symbols-outlined"> grade <input type="checkbox"></label>
                    <span class="material-symbols-outlined" onclick="closeProfile()"> close </span>
                </div>
                <div>
                    <img src="" alt="">
                    <div><p>부서</p> <div>팀</div></div>
                    <div><p>name</p> <div>직급</div></div>
                </div>
                <div>
                    <span class="material-symbols-outlined"> mail </span>
                    <span class="material-symbols-outlined"> group_add </span>
                    <span class="material-symbols-outlined"> forum </span>
                </div>
            </section>

        </div>
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
        {title: "근태현황", url: "${path}/attendance/calender"},
        {title: "일별근무시간", url: "${path}/attendance/board?page=1"},
        {title: "관리자페이지 ", url: "${path}/attendance/admin"}
    ]);

    menuMap.set("프로젝트", [
        {icon: "groups", title: "프로젝트"},
        {title: "프로젝트", url: "${path}/project/allprj"},
        {title: "프로젝트 생성", url: "${path}/project/create"}
    ]);

    menuMap.set("전자문서", [
        {icon: "home_storage", title: "전자문서"},
        {title: "기안문서함", url: "${path}/document/first"},
        {title: "결재문서함", url: "${path}/document/payment"},
        {title: "참조문서함", url: "${path}/document/reference"},
        {title: "임시보관함", url: "${path}/document/keep"}
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
        {title: "조직도", url: "${path}/employee/list"}
    ]);

    menuMap.set("주소록", [
        {icon: "contacts", title: "주소록"},
        {title: "내 주소록", url: "${path}/sixman/address"},
        {title: "주소록 추가", url: "${path}/sixman/add"},
        {title: "주소록 받아오기", url: "${path}/sixman/receive"}
    ]);

    menuMap.set("일정", [
        {icon: "calendar_month", title: "일정"},
        {title: "일정", url: "${path}/schedule/calendar"},
        {title: "주간일정", url: "${path}/schedule/weeks"}
    ]);

    menuMap.set("급여", [
        {icon: "calculate", title: "급여"},
        {title: "급여관리", url: "${path}/salary/salary"}
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

    alarmBtn.addEventListener('click', ()=>{
        if(alarm.classList.contains('down-alarm')){
            alarm.classList.remove('down-alarm');
            alarm.style.top = "-500px";
        }else{
            alarm.classList.add('down-alarm');
            alarm.style.top = "50px";
        }
    })

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

        // console.log(socket);
    }

    function onMessage(m) {
        const data = m.data;
        const curMember = '${loginMember.no}';

        const datas = data.split('#');
        const type = datas[0];
        const msg = datas[1];
        const no = datas[2];

        // console.log(data);

        let f = null;
        switch (type) {
            case 'MAIL':
                f = ()=>{location.href='/sixman/mail/detail?no=';}
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
        '<div class="item-div"><div class="item-header"><div>['+type+']</div><div>'+today.toLocaleTimeString()+'</div></div><div class="item-title">'+msg+'</div></div><span class="t-btn material-symbols-outlined"> close </span>'
        div.innerHTML = item;

        div.querySelector('.item-div').addEventListener('click', ()=>{
            checkAjax(no, type);
            f();
        });

        div.querySelector('span').addEventListener('click', ()=>{
            div.remove();
            checkAjax(no, type);
        });

        const itemCount = document.querySelector('#alarm-count');

        itemCount.style.display = 'flex';
        if(itemCount.innerText=='' ||itemCount.innerText == null){
            itemCount.innerText = 1;
        }else{
            itemCount.innerText = parseInt(itemCount.innerText) + 1;
        }

        const box = document.querySelector('#alarm-box #inner-box');
        box.prepend(div);

        notify(type, msg);
    }

    function onOpen(params) {
            
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

    function getNotificationPermission() {
        // 브라우저 지원 여부 체크
        if (!("Notification" in window)) {
            alert("데스크톱 알림을 지원하지 않는 브라우저입니다.");
        }
        // 데스크탑 알림 권한 요청
        Notification.requestPermission(function (result) {
            // 권한 거절
            if(result == 'denied') {
                popup.alertPop("알림을 차단하셨습니다.", "브라우저의 사이트 설정에서 변경하실 수 있습니다.");
                return false;
            }
        });
    }

    function notify(title, msg) {
        var options = {
            body: msg
        }
        
        // 데스크탑 알림 요청
        var notification = new Notification(title, options);
        
        // 3초뒤 알람 닫기
        setTimeout(function(){
            notification.close();
        }, 3000);
    }


</script>
</html>