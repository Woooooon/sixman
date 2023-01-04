const panels = document.querySelectorAll('.m-inner');
const outer = document.querySelector('#m-outer');
const listPanel = document.querySelector('#m-list-panel');
const chatListPanel = document.querySelector('#m-chatList-panel');
const optionPanel = document.querySelector('#m-option-panel');
const chatPanel = document.querySelector('#m-chat-panel');
const chatMain = document.querySelector('#m-chat-panel .ml-main');
const createPanel = document.querySelector('#m-create-panel');
const pofilePanel = document.querySelector('#m-profile-panel');
const optionInner = document.querySelector('#option-inner');

function closeAll() {
    if(chatSocket){
        chatSocket.close();
        chatSocket = null;
        closeChat();
        socket.close();
        connectSC();
    }
    panels.forEach(element => {
        element.style.display = "none";
    });
}

function closeChat() {
    const httpRequest = new XMLHttpRequest();
    httpRequest.open('post', '/sixman/closeChat');
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send();
}

const msgBtn = document.querySelector('#msg');
msgBtn.addEventListener('click', ()=>{

    if(msgBtn.classList.contains('open')){
        msgBtn.classList.remove('open');
        outer.style.right = '-400px';
    }else{
        msgBtn.classList.add('open');
        outer.style.right = '0';
    }

});

function titleEdit(no) {
    const titleEditBtn = document.querySelector('#edit-btn');
    const titleDoneBtn = document.querySelector('#done-btn');
    const titleInput = document.querySelector('#title-input');
    titleEditBtn.addEventListener('click', ()=>{
        titleDoneBtn.style.display = "block";
        titleEditBtn.style.display = "none";

        const value = titleInput.value;
        titleInput.value = "";
        titleInput.placeholder = value;

        titleInput.readOnly = false;
        titleInput.focus();
    });
    titleDoneBtn.addEventListener('click', ()=>{
        titleEditBtn.style.display = "block";
        titleDoneBtn.style.display = "none";

        let value = titleInput.placeholder;
        if(titleInput.value!=''){
            value = titleInput.value;
            titleEditAjax(value, no);
        }

        titleInput.placeholder = '';
        titleInput.value = value;
        titleInput.readOnly = true;

    });
}

function titleEditAjax(value, no) {
    const httpRequest = new XMLHttpRequest();
    httpRequest.open('post', '/sixman/changeName');
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`value=${value}&no=${no}`);
}

//맴버리스트열기
function openList() {
    closeAll();

    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                    const result = httpRequest.response;
                    const bookMarkMember = result.bookMarkMember;
                    const teamMember = result.teamMember;
                    const memberAll = result.memberAll;

                    const bookMarkBox = document.querySelector('#m-list-panel #ml-bookmark .ml-list');
                    const teamBox = document.querySelector('#m-list-panel #ml-team .ml-list');
                    const allBox = document.querySelector('#m-list-panel #ml-all .ml-list');

                    let text = '';
                    for(let vo of bookMarkMember){
                        text +=
                        `
                        <div class="ml-list-item">
                            <img src="/sixman/resources/img/profile/${vo.fileName}" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                            <div>${vo.name} <p>${vo.positionName}</p></div>
                            <label class="material-symbols-outlined"> grade <input type="checkbox" onchange="bookMark('${vo.no}',this)" checked></label>
                        </div>
                        `;
                    };
                    bookMarkBox.innerHTML = text;

                    text = '';
                    for(let vo of teamMember){
                        let checked = '';
                        if(vo.bookmark=='Y'){
                            checked = "checked";
                        }
                        text +=
                        `
                        <div class="ml-list-item">
                            <img src="/sixman/resources/img/profile/${vo.fileName}" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                            <div>${vo.name} <p>${vo.positionName}</p></div>
                            <label class="material-symbols-outlined"> grade <input type="checkbox" onchange="bookMark('${vo.no}',this)" ${checked}></label>
                        </div>
                        `;
                    };
                    teamBox.innerHTML = text;

                    text = '';
                    for(let vo of memberAll){
                        let checked = '';
                        if(vo.bookmark=='Y'){
                            checked = "checked";
                        }
                        text +=
                        `
                        <div class="ml-list-item">
                            <img src="/sixman/resources/img/profile/${vo.fileName}" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                            <div>${vo.name} <p>${vo.positionName}</p></div>
                            <label class="material-symbols-outlined"> grade <input type="checkbox" onchange="bookMark('${vo.no}',this)" ${checked}></label>
                        </div>
                        `;
                    };
                    allBox.innerHTML = text;

                } else {

                }
        }
    };

    httpRequest.open('post', '/sixman/memberPage');
    httpRequest.responseType = "json";
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send();

    listPanel.style.display = "block";
}

function chatAjax(room, msg) {
    const httpRequest = new XMLHttpRequest();
    httpRequest.open('post', '/sixman/chat');
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`room=${room}&msg=${msg}`);
}

openChatAjax();
function openChatAjax() {
    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                    const result = httpRequest.response;
                    
                    let text = '';
                    
                    for(let vo of result){
                        const members = vo.members;
                        if(members.length==0){continue}
                        if(members==null){break;}
                        const memberCount = members.length;

                        if(!vo.lastMsgTime){vo.lastMsgTime = '';}
                        if(!vo.lastMsg){vo.lastMsg = '';}
                        let notReadCount = '';
                        if(vo.notReadCount){
                            notReadCount = `<div>${vo.notReadCount}</div>`;
                        }

                        if(memberCount>1){
                            let img = '';
                            for (let index = 0; index < members.length; index++) {
                                const element = members[index];
                                img += `<img src="/sixman/resources/img/profile/${element.fileName}" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">`;
                                if(index == 3){break;}
                            }
                            text +=
                            `
                            <div class="mc-list-item" onclick="joinChat(${vo.chatRoomNo})">
                                <span class="chat-img-box">
                                    ${img}
                                </span>
                                <div>
                                    <div class="mc-list-item-header">
                                        <p>${vo.name}</p>
                                        <p>${vo.lastMsgTime}</p>
                                    </div>
                                    <div class="mc-list-item-main">
                                        <div>${vo.lastMsg}</div>
                                        ${notReadCount}
                                    </div>
                                </div>
                            </div>
                            `;
                        }else{
                            text +=
                            `
                            <div class="mc-list-item" onclick="joinChat(${vo.chatRoomNo})">
                                <img src="/sixman/resources/img/profile/${members[0].fileName}" onerror="this.style.visibility='hidden'">
                                <div>
                                    <div class="mc-list-item-header">
                                        <p>${members[0].name}</p>
                                        <p>${vo.lastMsgTime}</p>
                                    </div>
                                    <div class="mc-list-item-main">
                                        <div>${vo.lastMsg}</div>
                                        ${notReadCount}
                                    </div>
                                </div>
                            </div>
                            `;
                        }
                    }

                    const chatListBox = document.querySelector('#m-chatList-panel .ml-main');
                    chatListBox.innerHTML = text;

                } else {
                    console.log("채팅 리스트 에이젝스 실패");
                }
        }
    };

    httpRequest.open('post', '/sixman/chatPage');
    httpRequest.responseType = "json";
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send();
}
//채팅리스트열기
function openChat() {
    closeAll();
    openChatAjax();
    chatListPanel.style.display = "block";
}

//제작페이지 이동
function openCreate() {
    closeAll();

    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                    const result = httpRequest.response;
                    const bookMarkMember = result.bookMarkMember;
                    const teamMember = result.teamMember;
                    const memberAll = result.memberAll;

                    const bookMarkBox = document.querySelector('#m-create-panel #ml-bookmark .ml-list');
                    const teamBox = document.querySelector('#m-create-panel #ml-team .ml-list');
                    const allBox = document.querySelector('#m-create-panel #ml-all .ml-list');

                    let text = '';
                    for(let vo of bookMarkMember){
                        text +=
                        `
                        <div class="ml-list-item">
                            <img src="/sixman/resources/img/profile/${vo.fileName}" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                            <div>${vo.name} <p>${vo.positionName}</p></div>
                            <input type="checkbox" name="member" value="${vo.no}">
                        </div>
                        `;
                    };
                    bookMarkBox.innerHTML = text;

                    text = '';
                    for(let vo of teamMember){
                        text +=
                        `
                        <div class="ml-list-item">
                            <img src="/sixman/resources/img/profile/${vo.fileName}" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                            <div>${vo.name} <p>${vo.positionName}</p></div>
                            <input type="checkbox" name="member" value="${vo.no}">
                        </div>
                        `;
                    };
                    teamBox.innerHTML = text;

                    text = '';
                    for(let vo of memberAll){
                        text +=
                        `
                        <div class="ml-list-item">
                            <img src="/sixman/resources/img/profile/${vo.fileName}" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                            <div>${vo.name} <p>${vo.positionName}</p></div>
                            <input type="checkbox" name="member" value="${vo.no}">
                        </div>
                        `;
                    };
                    allBox.innerHTML = text;

                    createEvent();
                } else {

                }
        }
    };

    httpRequest.open('post', '/sixman/memberPage');
    httpRequest.responseType = "json";
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send();

    createPanel.style.display = "block";
}

//채팅방만들기
function createChat() {
    const panel = document.querySelector('#m-create-panel .ml-main');
    const members = panel.querySelectorAll('input[name=member]');
    const memberNo = [];
    members.forEach(element => {
        if(element.checked){
            memberNo.push(element.value);
        }
    });

    const httpRequest = new XMLHttpRequest();
    httpRequest.open('post', '/sixman/createChat');
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`no=${memberNo}`);

    setTimeout(() => {
        openChat();
    }, 500);
}

const fileBoxBtn = document.querySelectorAll('#containner-box div:not(.file-box)');
fileBoxBtn.forEach(element => {
    element.addEventListener('click', ()=>{
        if(element.classList.contains('checked')){
            element.classList.remove('checked')
        }else{
            element.classList.add('checked')
        }
    });
});

//채팅조인
function joinChat(no) {
    closeAll();
    joinChatSocket();
    socket.close();
    connectSC();
    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                    const result = httpRequest.response;
                    const chats = result.chats;

                    const chatBox = document.querySelector('#m-chat-panel .ml-main');
                    chatBox.innerHTML = '';
                    
                    let name = '';
                    let writeTime = '';
                    for (let index = 0; index < chats.length; index++) {
                        let text = '';
                        const chat = chats[index];

                        const div = document.createElement('div');
                        div.classList.add('chat-item');
                        const div2 = document.createElement('div');
                        div2.classList.add('chat-name');

                        let right = '';
                        if(chat.isMe == 'Y'){
                            div.classList.add('right');
                            div2.classList.add('right');
                            right = "right";
                        }

                        let arrow = '';
                        if(name != chat.memberName){
                            div2.innerHTML = chat.memberName;
                            chatBox.append(div2);
                            arrow = `<div class="chat-arrow-${right}"></div>`;
                        }
                        name = chat.memberName;

                        let time = `<div class="chat-date">${chat.writeTime}</div>`;
                        if(writeTime == chat.writeTime){
                            const dates = document.querySelectorAll('.chat-date');
                            if(dates!=null && dates.length != 0){
                                dates[dates.length-1].remove();
                            }
                        }
                        writeTime = chat.writeTime;

                        let count = '';
                        if(chat.nonCount>0){
                            count = `<div class="chat-count">${chat.nonCount}</div>`;
                        }

                        text += 
                        `
                        <div class="chat-msg">
                            ${arrow}
                            ${chat.content}
                        </div>
                        <div class="chat-info">
                            ${count}
                            ${time}
                        </div>
                        `

                        div.innerHTML = text;
                        chatBox.append(div);
                    }

                    const optionBox = document.querySelector('#m-option-panel #option-box');
                    const optionBtns = optionBox.querySelectorAll('input[type=checkbox]');  
                    optionBtns[0].checked = (result.fixYn == 'Y') ? true : false;
                    optionBtns[1].checked = (result.alarmYn == 'Y') ? true : false;

                    optionBtns[0].onchange = ()=>{
                        const no = result.chatRoomNo;
                        if(optionBtns[0].checked){
                            setFix(no, 'Y');
                        }else{
                            setFix(no, 'N');
                        }
                    }

                    optionBtns[1].onchange = ()=>{
                        const no = result.chatRoomNo;
                        if(optionBtns[0].checked){
                            setAlarm(no, 'Y');
                        }else{
                            setAlarm(no, 'N');
                        }
                    }

                    const members = result.members;
                    const memberCount = members.length;

                    let img = '';
                    let roomName = result.name;
                    if(memberCount>1){
                        img += `<span class="chat-img-box">`;
                        for (let index = 0; index < members.length; index++) {
                            const element = members[index];
                            img += `<img src="/sixman/resources/img/profile/${element.fileName}" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">`;
                            if(index == 3){break;}
                        }
                        img += `</span>`;
                    }else{
                        roomName = members[0].name;
                        img = `<img src="/sixman/resources/img/profile/${members[0].fileName}" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'" onclick="openProfile(${members[0].no})">`;
                    }

                    const chatTitle  = document.querySelector('#chat-title');
                    chatTitle.innerHTML =
                    `
                    <span class="material-symbols-outlined" onclick="openChat()"> chevron_left </span>
                    ${img}
                    <input id="title-input" type="text" value="${roomName}" readonly>
                    <span id="done-btn" class="material-symbols-outlined"> done </span>
                    <span id="edit-btn" class="material-symbols-outlined"> _edit </span>
                    `;

                    const chatInput = document.querySelector('#chat-input');
                    chatInput.name = result.chatRoomNo;

                    titleEdit(result.chatRoomNo);

                    chatPanel.style.display = "block";
                    chatMain.scrollTop = chatMain.scrollHeight;

                } else {
                    console.log("채팅 리스트 에이젝스 실패");
                }
        }
    };

    httpRequest.open('post', '/sixman/chatRoom');
    httpRequest.responseType = "json";
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`no=${no}`);
}

const searchInput = document.querySelector('#search-box input');
function search() {
    const msgs = document.querySelectorAll('.chat-msg');
    for (let index = msgs.length-1; index >= 0; index--) {
        const element = msgs[index];
        const text = element.innerHTML;

        if(searchInput.value==null||searchInput.value==''){
            break;
        }

        if(text.includes(searchInput.value)){
            chatMain.scrollTop = text.scrollHeight; 
            selectRange(element);
            break;
        }
        chatMain.scrollTop = chatMain.scrollHeight; 
    }
}

function selectRange(obj) {
    if (window.getSelection) {
        var selected = window.getSelection();
            selected.selectAllChildren(obj);
        //console.log(selected.toString());
    } else if (document.body.createTextRange) {
        var range = document.body.createTextRange();
            range.moveToElementText(obj);
            range.select();
        //alert(range.htmlText);
    }
};

function openOption() {
    optionPanel.style.display = "flex";
    setTimeout(() => {
        optionInner.style.right = "0";
    }, 10);
}

function closeOption() {
    optionInner.style.right = "-100%";
    setTimeout(() => {
        optionPanel.style.display = "none";
    }, 400);
}

function openProfile(no) {

    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {

                    const result = httpRequest.response;

                    let checked = "";
                    if(result.bookMark == 'Y'){
                        checked = "checked";
                    }

                    let text = 
                    `
                    <div>
                        <label class="material-symbols-outlined"> grade <input type="checkbox" onchange="bookMark('${result.no}',this)" ${checked}></label>
                        <span class="material-symbols-outlined" onclick="closeProfile()"> close </span>
                    </div>
                    <div>
                        <img src="/sixman/resources/img/profile/${result.fileName}">
                        <div><p>${result.authorizeName}</p> <div>${result.teamName}</div></div>
                        <div><p>${result.name}</p> <div>${result.positionName}</div></div>
                    </div>
                    <div>
                        <span class="material-symbols-outlined" onclick="/sixman/mail/write?email=${result.email}"> mail </span>
                        <span class="material-symbols-outlined"> group_add </span>
                        <span class="material-symbols-outlined"> forum </span>
                    </div>
                    `

                    pofilePanel.innerHTML = text;

                } else {
                    console.log("채팅 리스트 에이젝스 실패");
                }
        }
    };

    httpRequest.open('post', '/sixman/profile');
    httpRequest.responseType = "json";
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`no=${no}`);

    pofilePanel.style.display = "block";
}

function closeProfile() {
    pofilePanel.style.display = "none";
}

const searchBar = document.querySelector('#search-box');
const searchBtn = document.querySelector('#search-btn');
searchBtn.addEventListener('click', ()=>{
    if(searchBar.classList.contains('open')){
        searchBar.classList.remove('open');
        searchBar.style.display = "none";
    }else{
        searchBar.classList.add('open');
        searchBar.style.display = "flex";
    }
});

const fileBox = document.querySelector('#chat-file-box');
function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        document.getElementById('preview').src = e.target.result;
      };
      reader.readAsDataURL(input.files[0]);
      fileBox.style.display = 'flex';
    } else {
      document.getElementById('preview').src = "";
    }
}

const fileInput = document.querySelector('#chat-file');
function closeFileBox() {
    fileInput.value = '';
    fileBox.style.display = "none";
}

function createEvent() {
    const items =  document.querySelectorAll('#m-create-panel .ml-list-item');
    console.log(items);
    const memberBox =  document.querySelector('#chat-member-list');
    memberBox.innerHTML = "";
    items.forEach(element => {
        const input = element.querySelector('input[type=checkbox]');

        const span = document.createElement('span');
        span.classList.add('member-item');
        span.innerHTML = element.querySelector('div').innerHTML;
        const span2 = document.createElement('span');
        span2.classList.add('material-symbols-outlined');
        span2.innerHTML = 'close';
        span2.addEventListener('click', ()=>{
            span.remove();
            input.checked = false;
        });
        span.append(span2);

        input.addEventListener('change', ()=>{
            if(input.checked){
                memberBox.append(span);
            }else{
                span.remove();
            }
        });
    });
}

function setFix(no, fix) {
    const httpRequest = new XMLHttpRequest();
    httpRequest.open('post', '/sixman/setFix');
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`no=${no}&fix=${fix}`);
}

function setAlarm(no, alarm) {
    const httpRequest = new XMLHttpRequest();
    httpRequest.open('post', '/sixman/setAlarm');
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`no=${no}&alarm=${alarm}`);
}

function bookMark(no, obj) {
    let mark = 'N';
    if(obj.checked){
        mark = 'Y';
    }
    const httpRequest = new XMLHttpRequest();
    httpRequest.open('post', '/sixman/setAlarm');
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`no=${no}&bookMark=${mark}`);
}