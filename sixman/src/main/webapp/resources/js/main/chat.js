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

    const value = titleInput.placeholder;
    titleInput.placeholder = '';
    titleInput.value = value;
    titleInput.readOnly = true;
});

//맴버리스트열기
function openList() {
    closeAll();
    listPanel.style.display = "block";
}

//채팅리스트열기
function openChat() {
    closeAll();
    chatListPanel.style.display = "block";
}

//제작페이지 이동
function openCreate() {
    closeAll();
    createPanel.style.display = "block";
}

//채팅방만들기
function createChat() {
    openChat();
}

//채팅조인
function joinChat() {
    closeAll();
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