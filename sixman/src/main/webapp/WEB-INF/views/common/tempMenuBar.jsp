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
    <link rel="stylesheet" href="${path}/resources/css/tempMain.css">
    <link rel="stylesheet" href="${path}/resources/css/reset.css">
    <link rel="stylesheet" href="${path}/resources/css/chat.css">
    <script defer src="${path}/resources/js/main/main.js"></script>
    <script defer src="${path}/resources/js/main/chat.js"></script>
    <script src="${path}/resources/js/file/file.js"></script>
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
            <li><a>전자문서</a></li>
            <li><a>조직도</a></li>
            <li><a>일정</a></li>
            <li><a>급여</a></li>
            <li><a href="/sixman/main">일반페이지 전환</a></li>
        </ul>
        <section id="menu-footer">
            <a href="/sixman/logout" class="material-symbols-outlined">logout</a>
            <div id="foot-logo" onclick="location.href='${path}/admin/employee/list'"></div>
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
                        <span class="material-symbols-outlined" onclick="searchMemberList('m-list-panel')"> search </span>
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

                        </div>
                    </article>
                    <article id="ml-team" class="ml-list-box">
                        <label class="ml-list-title">
                            <p>부서원</p>
                            <span class="material-symbols-outlined"> expand_more </span>
                            <input type="checkbox">
                        </label>
                        <div class="ml-list">

                        </div>
                    </article>
                    <article id="ml-all" class="ml-list-box">
                        <label class="ml-list-title">
                            <p>전체사원</p>
                            <span class="material-symbols-outlined"> expand_more </span>
                            <input type="checkbox" checked>
                        </label>
                        <div class="ml-list">

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
                            <span class="material-symbols-outlined" onclick="searchChatList()"> search </span>
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

                        </div>
                        <div>
                            <span class="material-symbols-outlined"> attach_file </span>
                            파일보관함
                        </div>
                        <div class="file-box">

                        </div>
                    </div>
                    <div id="option-footer">
                        <span class="material-symbols-outlined">logout</span>
                    </div>
                </div>
            </section>

            <section id="m-chat-member-panel" class="m-inner">
                <div id="member-inner">
                    <div id="option-header">
                        <span class="material-symbols-outlined" onclick="closeChatMember()"> chevron_left </span>
                        <div>Members</div>
                    </div>
                    <div id="member-inner-box">

                    </div>
                </div>
            </section>

            <section id="m-file-panel" class="m-inner">
                <div id="file-inner">
                    <div id="file-header">
                        <span class="material-symbols-outlined" onclick="closeFilePanel()"> close </span>
                    </div>
                    <div id="file-inner-box">
                        <div></div>
                    </div>
                    <div id="file-footer">
                        <div class="btn">다운로드</div>
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
                    <div class="chat-item right">
                        <div class="chat-msg"><img src="" alt=""></div>
                        <div class="chat-info">
                            <div class="chat-count">2</div>
                            <div class="chat-date">23-01-05 10:01</div>
                        </div>
                    </div>
                </article>
                <article class="ml-footer">
                    <label for="chat-file" class="material-symbols-outlined"> attach_file </label>
                    <input id="chat-input" type="text">
                    <span class="material-symbols-outlined" onclick="chat();"> arrow_forward </span>
                    <input id="chat-file" type="file" onchange="readURL(this)">
                </article>
                <div id="chat-file-box">
                    <span class="material-symbols-outlined" onclick="closeFileBox()"> close </span>
                    <div id="preview"></div>
                </div>
            </section>

            <section id="m-create-panel" class="m-inner">
                <article class="ml-header">
                    <div>
                        <span class="material-symbols-outlined" onclick="openChat()"> chevron_left </span>
                        <div>Create</div>
                        <div id="ml-search">
                            <input type="text" placeholder="이름검색">
                            <span class="material-symbols-outlined" onclick="searchMemberList('m-create-panel')"> search </span>
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

                        </div>
                    </article>
                    <article id="ml-team" class="ml-list-box">
                        <label class="ml-list-title">
                            <p>부서원</p>
                            <span class="material-symbols-outlined"> expand_more </span>
                            <input type="checkbox">
                        </label>
                        <div class="ml-list">

                        </div>
                    </article>
                    <article id="ml-all" class="ml-list-box">
                        <label class="ml-list-title">
                            <p>전체사원</p>
                            <span class="material-symbols-outlined"> expand_more </span>
                            <input type="checkbox" checked>
                        </label>
                        <div class="ml-list">

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

            </section>

        </div>
    </aside>
</body>
<script>
    const menuMap = new Map();

    menuMap.set("공지사항", [
        {icon: "event_note", title: "공지사항"},
        {title: "공지사항", url: "${path}/notice/list"},
        {title: "공지사항 작성", url: "${path}/admin/notice/write"}
    ]);

    menuMap.set("근태관리", [
        {icon: "approval", title: "근태관리"},
        {title: "근태관리 ", url: "${path}/attendance/admin?page=1&name="}
    ]);

    menuMap.set("전자문서", [
        {icon: "home_storage", title: "전자문서"},
        {title: "문서관리", url: ""},
        {title: "양식관리", url: ""},
    ]);

    menuMap.set("조직도", [
        {icon: "account_tree", title: "조직도"},
        {title: "조직도", url: "${path}/admin/employee/list"},
        {title: "사원등록", url: "${path}/admin/member/join"}
    ]);

    menuMap.set("일정", [
        {icon: "calendar_month", title: "일정"},
        {title: "일정관리", url: ""},
        {title: "전체일정등록", url: ""}
    ]);

    menuMap.set("급여", [
        {icon: "calculate", title: "급여"},
        {title: "급여관리", url: "${path}/salary/salaryAdmin"}
    ]);

    const menuListBox = document.querySelector('#menu-list');
    const sideMenu = document.querySelector('#side-menu');
    const liArr = menuListBox.querySelectorAll('li');

    liArr.forEach(element => {
        element.addEventListener("mouseover", ()=>{
            const a = element.querySelector('a');
            const key = a.innerText;
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
    }

    function onMessage(m) {
        const data = m.data;

        const datas = data.split('#');
        const type = datas[0];
        const msg = datas[1];
        
        if(type=='CHAT'){
            notify(type, msg);
            return;
        }

        alarmAjax();

        notify(type, msg);
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
            case 'CHAT':
                msg = name + ' : ' + title;
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
        
        // 5초뒤 알람 닫기
        setTimeout(function(){
            notification.close();
        }, 5000);
    }

    //채팅
    var chatSocket = null;

    function joinChatSocket() {
        chatSocket = new SockJS("${path}/chatSocket");

        chatSocket.onmessage = chatOnMessage;
    }

    //메세지받아라
    let fileSrc = '';
    function chatOnMessage(m) {
        const data = m.data;

        if(data.substring(0,5)=='#####'){
            chatCountDown(data.substring(5));
            return;
        }

        const datas = data.split('#');
        const no = datas[0];
        const name = datas[1];
        const room = datas[2];
        const msg = datas[3];
        const sysdate = datas[4];
        const isfile = datas[5];
        const count = datas[6];

        if(no=='${loginMember.no}'){
            chatInHTML(name, msg, 'right', sysdate, count, isfile);
        }else{
            chatInHTML(name, msg, null, sysdate, count, isfile);
        }

    }

    function chatCountDown(date) {
        const counts = document.querySelectorAll('.chat-count');
        const beforeDate = new Date(date);
        counts.forEach(element => {
            const eDate = new Date(element.getAttribute("date"));

            if(eDate > beforeDate){
                if(parseInt(element.innerHTML) - 1 > 0){
                element.innerHTML = parseInt(element.innerHTML) - 1;
                }else{
                    element.innerHTML = '';
                }
            }
        });
        
    }
    const chatInput = document.querySelector('#chat-input');
    chatInput.addEventListener("keyup", (e)=>{
        if(e.keyCode == 13){
            chat();
        }
    });

    function chat() {
        const chatInput = document.querySelector('#chat-input');
        const room = chatInput.name;
        const msg = chatInput.value;
        const sysdate = getSysdate();

        const file = document.querySelector('#chat-file').files[0];
        
        let formData = new FormData();
        if(file!=null&&typeof(file)!=undefined){
            formData.append('file', file);
            closeFileBox();
        }
        formData.append('room', room);
        formData.append('msg', msg);
        
        const beforeMsg = '${loginMember.no}#${loginMember.name}' + '#' + room + '#';
        const afterMsg = '#' + sysdate;
        
        chatAjax(formData, beforeMsg, msg, afterMsg);
        
        sendMsg('${loginMember.name}', '"'+msg+'" '+sysdate, 'CHAT', room);
        chatInput.value = '';
    }

    function getSysdate() {
        let today = new Date();   

        var year = (today.getFullYear());
        var month = ('0' + (today.getMonth() + 1)).slice(-2);
        var day = ('0' + today.getDate()).slice(-2);
        
        var dateString = year + '-' + month  + '-' + day;

        var hours = ('0' + today.getHours()).slice(-2); 
        var minutes = ('0' + today.getMinutes()).slice(-2);
        var seconds = ('0' + today.getSeconds()).slice(-2);
        
        var timeString = hours + ':' + minutes + ':' + seconds;
        
        //23-01-03 11:09
        const sysdate = dateString+' '+timeString;
        
        return sysdate;
    }
    
    function chatInHTML(name, msg, right, sysdate, lastCount, isfile) {
        const names = document.querySelectorAll('.chat-name');
        const chatBox = document.querySelector('#m-chat-panel .ml-main');
        let lastName = '';
        if(names!=null && names.length != 0){
            lastName = names[names.length-1].innerText;
        }

        const dates = document.querySelectorAll('.chat-date');
        let lastDate = '';
        if(dates!=null && dates.length != 0){
            lastDate = dates[dates.length-1].innerText;
        }

        const div = document.createElement('div');
        div.classList.add('chat-item');
        const div2 = document.createElement('div');
        div2.classList.add('chat-name');

        if(right){
            div.classList.add('right');
            div2.classList.add('right');
            right = "right";
        }

        let arrow = '';

        if(lastName != name){
            div2.innerHTML = name;
            chatBox.append(div2);
            arrow = '<div class="chat-arrow-'+right+'"></div>';
        }

        const chatTime = sysdate.substring(2, 16);
        let time = '<div class="chat-date">'+chatTime+'</div>';
        if(lastDate == chatTime){
            if(dates!=null && dates.length != 0){
                dates[dates.length-1].remove();
            }
        }

        let count = '';
        if(lastCount>0){
            count = '<div class="chat-count" date="'+sysdate+'">'+lastCount+'</div>';
        }

        if(isfile=="Y"){
            const fileString = msg.split(":");
            const fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/gi;
            let file = '';
            if(fileString[1].match(fileForm)){
                file = '<img onclick="openFile('+fileString[0]+', this.cloneNode(true))" src=/sixman/resources/chat/'+fileString[1]+'>';
            }else{
                file = '<div class="file-div" onclick="openFile('+fileString[0]+', this.cloneNode(true))"><span class="material-symbols-outlined"> upload_file </span><span>'+fileString[1]+'</span></div>';
            }
            div.innerHTML = '<div class="chat-msg">' + arrow + file + '</div><div class="chat-info">' + count + time + '</div>';
        }else{
            div.innerHTML = '<div class="chat-msg">' + arrow + msg + '</div><div class="chat-info">' + count + time + '</div>';
        }
        
        chatBox.append(div);  
        const chatMain = document.querySelector('#m-chat-panel .ml-main');
        chatMain.scrollTop = chatMain.scrollHeight;
    }

    function searchChatList() {
        //m-list-panel
        const input = document.querySelector('#m-chatList-panel #ml-search input');
        const text = input.value;
    
        const items = document.querySelectorAll('.mc-list-item');
        items.forEach(element => {
            const elementText = element.querySelector('.mc-list-item-header p').innerText;
            if(elementText.includes(text)){
                element.style.display = "flex";
            }else{
                element.style.display = "none";
            }
        });
    }


    function searchMemberList(panelName) {
        //m-list-panel
        const input = document.querySelector('#'+panelName+' #ml-search input');
        const text = input.value;
    
        const items = document.querySelectorAll('.ml-list-item');
        items.forEach(element => {
            const elementText = element.querySelector('div').innerText;
            if(elementText.includes(text)){
                element.style.display = "flex";
            }else{
                element.style.display = "none";
            }
        });

        const bookMarkBox = document.querySelector('#'+panelName+' #ml-bookmark .ml-list-title input');
        const teamBox = document.querySelector('#'+panelName+' #ml-team .ml-list-title input');
        const allBox = document.querySelector('#'+panelName+' #ml-all .ml-list-title input');

        if (bookMarkBox) {
            bookMarkBox.checked = true;
            teamBox.checked = true;
            allBox.checked = false;
        }
    }
</script>
</html>