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
    panels.forEach(element => {
        element.style.display = "none";
    });
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

function titleEdit() {
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
        }

        titleInput.placeholder = '';
        titleInput.value = value;
        titleInput.readOnly = true;

    });
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

                    const bookMarkBox = document.querySelector('#m-list-panel #ml-bookmark .ml-list-item');
                    const teamBox = document.querySelector('#m-list-panel #ml-team .ml-list-item');
                    const allBox = document.querySelector('#m-list-panel #ml-all .ml-list-item');

                    let text = '';
                    for(let vo of bookMarkMember){
                        text +=
                        `
                        <div class="ml-list-item">
                            <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                            <div>닉네임 <p>직급</p></div>
                            <label class="material-symbols-outlined"> grade <input type="checkbox"></label>
                        </div>
                        `;
                    };
                    bookMarkBox.innerHTML = text;

                    text = '';
                    for(let vo of teamMember){
                        text +=
                        `
                        <div class="ml-list-item">
                            <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                            <div>닉네임 <p>직급</p></div>
                            <label class="material-symbols-outlined"> grade <input type="checkbox"></label>
                        </div>
                        `;
                    };
                    teamBox.innerHTML = text;

                    text = '';
                    for(let vo of memberAll){
                        text +=
                        `
                        <div class="ml-list-item">
                            <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                            <div>닉네임 <p>직급</p></div>
                            <label class="material-symbols-outlined"> grade <input type="checkbox"></label>
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
    // httpRequest.send();

    listPanel.style.display = "block";
}

openChat();
//채팅리스트열기
function openChat() {
    closeAll();

    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                    const result = httpRequest.response;
                    
                    let text = '';
                    
                    for(let vo of result){
                        const members = vo.members;
                        if(members==null){break;}
                        const memberCount = members.length;
                        if(memberCount>1){
                            let img = '';
                            for (let index = 0; index < members.length; index++) {
                                const element = members[index];
                                img += `<img src="${element.이미지링크}" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">`;
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
                                        <div>${vo.notReadCount}</div>
                                    </div>
                                </div>
                            </div>
                            `;
                        }else{
                            text +=
                            `
                            <div class="mc-list-item" onclick="joinChat(${vo.chatRoomNo})">
                                <img src="${vo.members[0].이미지링크}" onerror="this.style.visibility='hidden'">
                                <div>
                                    <div class="mc-list-item-header">
                                        <p>${vo.members[0].name}</p>
                                        <p>${vo.lastMsgTime}</p>
                                    </div>
                                    <div class="mc-list-item-main">
                                        <div>${vo.lastMsg}</div>
                                        <div>${vo.notReadCount}</div>
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

                    const bookMarkBox = document.querySelector('#m-create-panel #ml-bookmark .ml-list-item');
                    const teamBox = document.querySelector('#m-create-panel #ml-team .ml-list-item');
                    const allBox = document.querySelector('#m-create-panel #ml-all .ml-list-item');

                    let text = '';
                    for(let vo of bookMarkMember){
                        text +=
                        `
                        <div class="ml-list-item">
                            <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                            <div>닉네임 <p>직급</p></div>
                            <input type="checkbox">
                        </div>
                        `;
                    };
                    bookMarkBox.innerHTML = text;

                    text = '';
                    for(let vo of teamMember){
                        text +=
                        `
                        <div class="ml-list-item">
                            <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                            <div>닉네임 <p>직급</p></div>
                            <input type="checkbox">
                        </div>
                        `;
                    };
                    teamBox.innerHTML = text;

                    text = '';
                    for(let vo of memberAll){
                        text +=
                        `
                        <div class="ml-list-item">
                            <img src="" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">
                            <div>닉네임 <p>직급</p></div>
                            <input type="checkbox" value=${vo.no}>
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
    // httpRequest.send();

    createEvent();
    createPanel.style.display = "block";
}

//채팅방만들기
function createChat() {
    openChat();
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

    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                    const result = httpRequest.response;
                    const chats = result.chats;

                    let text = '';
                    
                    let name = '';
                    let writeTime = '';
                    for (let index = 0; index < chats.length; index++) {
                        const chat = chats[index];

                        let right = '';
                        if(chat.isMe == 'Y'){
                            right = "right";
                        }

                        let arrow = '';
                        if(name != chat.memberName){
                            text += `<div class="chat-name ${right}">${chat.memberName}</div>`;
                            arrow = `<div class="chat-arrow-${right}"></div>`;
                            name = chat.memberName;
                        }

                        let time = '';
                        if(writeTime != chat.writeTime){
                            time = `<div class="chat-date">${chat.writeTime}</div>`;
                            writeTime = chat.writeTime;
                        }

                        let count = '';
                        if(chat.nonCount-1>0){
                            count = `<div class="chat-count">${chat.nonCount-1}</div>`;
                        }

                        text += 
                        `
                        <div class="chat-item ${right}">
                            <div class="chat-msg">
                                ${arrow}
                                ${chat.content}
                            </div>
                            <div class="chat-info">
                                ${count}
                                ${time}
                            </div>
                        </div>
                        `
                    }

                    const chatBox = document.querySelector('#m-chat-panel .ml-main');
                    chatBox.innerHTML = text;

                    const optionBox = document.querySelector('#m-option-panel #option-box');
                    const optionBtns = optionBox.querySelectorAll('input[type=checkbox]');  
                    optionBtns[0].checked = (result.fixYn == 'Y') ? true : false;
                    optionBtns[0].checked = (result.alarmYn == 'Y') ? true : false;

                    const members = result.members;
                    const memberCount = members.length;

                    let img = '';
                    if(memberCount>1){
                        img += `<span class="chat-img-box">`;
                        for (let index = 0; index < members.length; index++) {
                            const element = members[index];
                            img += `<img src="${element.이미지링크}" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">`;
                            if(index == 3){break;}
                        }
                        img += `</span>`;
                    }else{
                        img = `<img src="${members[0].이미지링크}" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'" onclick="openProfile(${members[0].no})">`;
                    }

                    const chatTitle  = document.querySelector('#chat-title');
                    chatTitle.innerHTML =
                    `
                    <span class="material-symbols-outlined" onclick="openChat()"> chevron_left </span>
                    ${img}
                    <input id="title-input" type="text" value="${name}" readonly>
                    <span id="done-btn" class="material-symbols-outlined"> done </span>
                    <span id="edit-btn" class="material-symbols-outlined"> _edit </span>
                    `;

                    titleEdit();

                } else {
                    console.log("채팅 리스트 에이젝스 실패");
                }
        }
    };

    httpRequest.open('post', '/sixman/chatRoom');
    httpRequest.responseType = "json";
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`no=${no}`);

    chatPanel.style.display = "block";
    chatMain.scrollTop = chatMain.scrollHeight; 
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

function openProfile() {
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
    const memberBox =  document.querySelector('#chat-member-list');
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