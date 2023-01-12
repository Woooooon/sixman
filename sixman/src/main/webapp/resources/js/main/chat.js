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
const chatMemberPanel = document.querySelector('#m-chat-member-panel');
const memberInner = document.querySelector('#member-inner');

optionPanel.addEventListener('click', (e)=>{
    if (e.target !== e.currentTarget) return;
    closeOption();
});
chatMemberPanel.addEventListener('click', (e)=>{
    if (e.target !== e.currentTarget) return;
    closeChatMember();
});

function closeAll() {
    if(chatSocket){
        closeSearchBar();

        chatSocket.close();
        chatSocket = null;

        socket.close();
        connectSC();

        closeChat();
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
        closeAll();
    }else{
        msgBtn.classList.add('open');
        outer.style.right = '0';
        setTimeout(() => {
            openChatAjax();
            chatListPanel.style.display = "block";
        }, 200);
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
                            <img src="/sixman/resources/img/profile/${vo.fileName}" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'" onclick="openProfile(${vo.no})">
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
                            <img src="/sixman/resources/img/profile/${vo.fileName}" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'" onclick="openProfile(${vo.no})">
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
                            <img src="/sixman/resources/img/profile/${vo.fileName}" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'" onclick="openProfile(${vo.no})">
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

function chatAjax(formData, beforeMsg, msg, afterMsg) {
    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                    const result = httpRequest.response;
                    console.log(result);
                    if(result.changeName){
                        const fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/gi;
                        if(result.changeName.match(fileForm)){
                            chatSocket.send(beforeMsg + result.fileNo + ":" + result.changeName + afterMsg + "#Y");
                        }else{
                            chatSocket.send(beforeMsg + result.fileNo + ":" + result.originName + afterMsg + "#Y");
                        }
                    }

                    chatSocket.send(beforeMsg + msg + afterMsg + "#N");
                } else {

                }
        }
    };
    httpRequest.open('post', '/sixman/chat');
    httpRequest.responseType = "json";
    httpRequest.send(formData);
}

// openChatAjax();
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

                        let fixed = '';
                        if(vo.fixYn=="Y"){
                            fixed = '<span class="material-symbols-outlined"> push_pin </span>';
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
                                        <p>${vo.name}${fixed}</p>
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
                                        <p>${members[0].name}${fixed}</p>
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
    setTimeout(() => {
        openChatAjax();
        chatListPanel.style.display = "block";
    }, 200);
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

function joinAndCreate(no) {
    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {

                    const rno = httpRequest.responseText;
                    joinChat(rno);

                }
        }
    }
    httpRequest.open('post', '/sixman/createChat');
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`no=${no}`);
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
    createChatRoom(no);
}

function createChatRoom(no) {
    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                    const result = httpRequest.response;
                    const chats = result.chats;

                    const chatBox = document.querySelector('#m-chat-panel .ml-main');
                    chatBox.innerHTML = '';

                    const containnerBox = document.querySelector('#m-option-panel #containner-box');
                    const fileBox = containnerBox.querySelectorAll('.file-box');
                    const imgBox = fileBox[0];
                    const nonImgBox = fileBox[1];  
                    
                    imgBox.innerHTML = '';
                    nonImgBox.innerHTML = '';
                    
                    let name = '';
                    let writeTime = '';
                    for (let index = 0; index < chats.length; index++) {
                        let text = '';
                        const chat = chats[index];

                        const div = document.createElement('div');
                        div.classList.add('chat-item');
                        const div3 = document.createElement('div');
                        div3.classList.add('chat-item');
                        const div2 = document.createElement('div');
                        div2.classList.add('chat-name');

                        let right = '';
                        if(chat.isMe == 'Y'){
                            div.classList.add('right');
                            div2.classList.add('right');
                            div3.classList.add('right');
                            right = "right";
                        }

                        let arrow = '';
                        if(name != chat.memberName){
                            div2.innerHTML = chat.memberName;
                            chatBox.append(div2);
                            arrow = `<div class="chat-arrow-${right}"></div>`;
                        }
                        name = chat.memberName;

                        const chatTime = chat.writeTime.substring(2, 16);
                        let time = `<div class="chat-date">${chatTime}</div>`;
                        if(writeTime == chatTime){
                            const dates = document.querySelectorAll('.chat-date');
                            if(dates!=null && dates.length != 0){
                                dates[dates.length-1].remove();
                            }
                        }
                        writeTime = chatTime;

                        let count = '';
                        if(chat.nonCount>0){
                            count = `<div class="chat-count" date="${chat.writeTime}">${chat.nonCount}</div>`;
                        }

                        if(chat.fileName!=null && typeof(chat.fileName)!=undefined){
                            const fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/gi;
                            let file = '';
                            let fileDiv = document.createElement('div');
                            if(chat.fileName.match(fileForm)){
                                file = `<img onclick="openFile(${chat.fileNo}, this.cloneNode(true))" src=/sixman/resources/chat/${chat.fileName}>`;
                                fileDiv.innerHTML = file;
                                imgBox.append(fileDiv);
                            }else{
                                file = `<div class="file-div" onclick="openFile(${chat.fileNo}, this.cloneNode(true))"><span class="material-symbols-outlined"> upload_file </span><span>${chat.originName}</span></div>`;
                                nonImgBox.innerHTML += file;
                            }
                            text =
                                `
                                <div class="chat-msg">
                                    ${arrow}
                                    ${file}
                                </div>
                                <div class="chat-info">
                                    ${count}
                                </div>
                                `;
                            div.innerHTML = text;
                            
                            chatBox.append(div);

                            text =
                                `
                                <div class="chat-msg">
                                    ${chat.content}
                                </div>
                                <div class="chat-info">
                                    ${count}
                                    ${time}
                                </div>
                                `;
                            div3.innerHTML = text;
                            chatBox.append(div3);

                        }else{ 
                            text = 
                                `
                                <div class="chat-msg">
                                    ${arrow}
                                    ${chat.content}
                                </div>
                                <div class="chat-info">
                                    ${count}
                                    ${time}
                                </div>
                                `;
                            div.innerHTML = text;
                            chatBox.append(div);
                        }
                    }

                    const outBtn = document.querySelector('#option-footer span');
                    outBtn.onclick = ()=>{outChat(result.chatRoomNo)};
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
                        if(optionBtns[1].checked){
                            setAlarm(no, 'Y');
                        }else{
                            setAlarm(no, 'N');
                        }
                    }

                    const members = result.members;
                    const memberCount = members.length;
                    const memberInnerBox = document.querySelector('#member-inner-box');

                    let img = '';
                    let memberText = '';
                    let roomName = result.name;
                    if(memberCount>1){
                        img += `<span class="chat-img-box" onclick="openChatMember()">`;
                        for (let index = 0; index < members.length; index++) {
                            const element = members[index];
                            if(index < 4){
                                img += `<img src="/sixman/resources/img/profile/${element.fileName}" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'">`;
                            }

                            memberText +=
                            `
                            <div class="ml-list-item">
                                <img src="/sixman/resources/img/profile/${element.fileName}" onerror="this.src='/sixman/resources/img/defaultProfilePic.png'" onclick="openProfile(${element.no})">
                                <div>${element.name} <p>${element.positionName}</p></div>
                            </div>
                            `;
                        }
                        memberInnerBox.innerHTML = memberText;
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

                    joinChatSocket();
                    socket.close();
                    connectSC();

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

function setSearch() {
    searchInput.onkeyup = (e)=>{
        if(e.keyCode != 13){
            return;
        }
        search();
    };
    searchInput.onchange = null;
}

function search() {
    if(searchInput.value==null||searchInput.value==''){
        return;
    }

    const msgs = document.querySelectorAll('.chat-msg');
    const findMsgs = [];

    for (let index = msgs.length-1; index >= 0; index--) {
        const element = msgs[index];
        const text = element.innerText;

        if(text.includes(searchInput.value)){
            findMsgs.push(element);
        }
    }

    console.log(findMsgs);

    if(findMsgs.length==0){
        return;
    }

    const firstElement = findMsgs[0];
    selectRange(firstElement);
    chatMain.scrollTop = firstElement.offsetTop - 400;

    let i = 1;
    searchInput.onkeyup = (e)=>{
        if(e.keyCode != 13){
            return;
        }
        
        if(i >= findMsgs.length){return;}

        const nextElement = findMsgs[i];
        selectRange(nextElement);
        chatMain.scrollTop = nextElement.offsetTop - 400;

        i++;
    };

    searchInput.onchange = ()=>{setSearch();}
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
    closeSearchBar();
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

function openChatMember() {
    chatMemberPanel.style.display = "flex";
    closeSearchBar();
    setTimeout(() => {
        memberInner.style.left = "0";
    }, 10);
}

function closeChatMember() {
    memberInner.style.left = "-100%";
    setTimeout(() => {
        chatMemberPanel.style.display = "none";
    }, 400);
}

const filePanel = document.querySelector('#m-file-panel');
function openFile(no, element){
    filePanel.style.display = 'flex';

    const fileInnerBox = document.querySelector('#file-inner-box');

    fileInnerBox.innerHTML = "";
    fileInnerBox.append(element);

    const downloadBtn = document.querySelector('#file-footer div');
    downloadBtn.onclick = ()=>{
        download(no, "CHAT");
    };
}

function closeFilePanel(){
    filePanel.style.display = 'none';
}

function openProfile(no) {
    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
            if (httpRequest.status === 200) {

                const result = httpRequest.response;

                let checked = "";
                if(result.bookmark == 'Y'){
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
                    <div><p>${result.deptName}</p> <div>${result.teamName}</div></div>
                    <div><p>${result.name}</p> <div>${result.positionName}</div></div>
                </div>
                <div>
                    <span class="material-symbols-outlined" onclick="location.href='/sixman/mail/write?email=${result.email}'"> mail </span>
                    <span class="material-symbols-outlined"> group_add </span>
                    <span class="material-symbols-outlined" onclick="createChatRoom(${result.no})"> forum </span>
                </div>
                `

                pofilePanel.innerHTML = text;

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
const chatSearchBtn = document.querySelector('#search-btn');
chatSearchBtn.addEventListener('click', ()=>{
    if(searchBar.classList.contains('open')){
        searchBar.classList.remove('open');
        searchBar.style.display = "none";
    }else{
        searchBar.classList.add('open');
        searchBar.style.display = "flex";
        setSearch();
    }
});

function closeSearchBar() {
    searchBar.classList.remove('open');
    searchBar.style.display = "none";
}

const fileBox = document.querySelector('#chat-file-box');
function readURL(input) {
    if (input.files && input.files[0]) {
        const fileName = input.value;
        const fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/gi;
        if(!fileName.match(fileForm)){
            document.getElementById('preview').innerHTML = `<span class="material-symbols-outlined"> upload_file </span><span> ${fileName.substring(fileName.lastIndexOf('\\')+1)} </span>`;
            fileBox.style.display = 'flex';
            return;
        }

        var reader = new FileReader();
        reader.onload = function(e) {
            const img = document.createElement('img');
            img.src = e.target.result;
            document.getElementById('preview').innerHTML = '';
            document.getElementById('preview').append(img);
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
    httpRequest.open('post', '/sixman/bookMark');
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`no=${no}&bookMark=${mark}`);
}

function outChat(no) {
    popup.confirmPop("나가기", "정말로 채팅방을 나가시겠습니까?", ()=>{

        const httpRequest = new XMLHttpRequest();
        httpRequest.onreadystatechange = () => {
            if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {

                    openChat();

                }
            }
        };
        httpRequest.open('post', '/sixman/outChat');
        httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
        httpRequest.send(`no=${no}`);

    });
}