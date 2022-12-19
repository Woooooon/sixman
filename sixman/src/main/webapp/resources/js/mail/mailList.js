const categoryBtns = document.querySelectorAll('.category-btn');
const caBtn1 = categoryBtns[0];
const caBtn2 = categoryBtns[1];
const caBox1 = document.querySelector('#category-box');
const caBox2 = document.querySelector('#category-box2');

if(caBtn1!=null) caBtn1.addEventListener('click', ()=>{openTogle(caBtn1,caBox1)});
if(caBtn2!=null) caBtn2.addEventListener('click', ()=>{openTogle(caBtn2,caBox2)});

function openTogle(caBtn2,caBox2) {
    if(!caBtn2.className.includes('click-able')) return;

    if(caBox2.style.display=='none'){
        caBox2.style.display = 'block';
        caBtn2.classList.add('checked');
    }else{
        caBox2.style.display = 'none';
        caBtn2.classList.remove('checked');
    }
}

// 
// 

const mainCheck = document.querySelector('.first-item input[type=checkbox]');
const btnArr = document.querySelectorAll('#checkbox-box > *');

mainCheck.addEventListener('change',()=>{
    const checkArr = document.querySelectorAll('#list-item-box input[type=checkbox]');
    console.log(mainCheck.checked);    
    if(mainCheck.checked){
        checkArr.forEach(element => {
            element.checked = true;
            btnArr.forEach(element => {
                element.classList.add('click-able');
            });
        });
    }else{
        checkArr.forEach(element => {
            element.checked = false;
            btnArr.forEach(element => {
                element.classList.remove('click-able');
            });
        });
    }
});

let cPage = '';
let cSearch = '';
let cListTpye = '';
let cCategoryNo = '';

// AJAX
function mailAjax(page, search, listTpye, categoryNo) {
    if(typeof listTpye == 'undefined') {listTpye = '';}
    if(typeof categoryNo == 'undefined') {categoryNo = '';}
    if(typeof search == 'undefined') {search = '';}

    cPage = page;
    cCategoryNo = categoryNo;
    cListTpye = listTpye;
    cSearch = search;

    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                    var result = httpRequest.response;

                    console.log(result);
                    const pv = result.pv;
                    const list = result.list;
                    const category =  result.category;

                    const listItemBox = document.querySelector('#list-item-box');
                    while ( listItemBox.hasChildNodes() ){
                        listItemBox.removeChild( listItemBox.firstChild );       
                    }

                    for(let i = 0; i < list.length; i++){
                        const div = document.createElement('div');
                        const vo = list[i];
                        div.classList.add('list-item');
                        // div.onclick = ()=>{
                        //     location.href = `/sixman/mail/detail?no=${vo.no}`
                        // }

                        let text = "";
                        text += `<input type="checkbox" value=${vo.no}>`;
                        if(vo.sendUserMail != vo.rMail || vo.checkYn=='Y'){
                            div.classList.add('read');
                            text += `<span class="material-symbols-outlined"> drafts </span>`;
                        }else{
                            text += `<span class="material-symbols-outlined"> mail </span>`;
                        }
                        text += `<p>${vo.sendUserName}</p>`;
                        text += `<p onclick="location.href = '/sixman/mail/detail?no=${vo.no}'">${vo.title}</p>`;
                        text += `<p>${vo.sendTime}</p>`;

                        div.innerHTML = text;
                        listItemBox.append(div);

                        div.querySelector('input[type=checkbox]').addEventListener('change',()=>{
                            let boolean = false;
                            const checkArr = document.querySelectorAll('#list-item-box input[type=checkbox]');
                            checkArr.forEach(element => {
                                if(element.checked) {
                                    boolean = true;
                                }
                            });
                    
                            if(boolean){
                                btnArr.forEach(element => {
                                    element.classList.add('click-able');
                                });
                            }else{
                                btnArr.forEach(element => {
                                    mainCheck.checked = false;
                                    element.classList.remove('click-able');
                                });
                            }
                        });
                    }

                    // 페이지
                    const pageBox = document.querySelector('.page-box');

                    let backPage = pv.currentPage-1;
                    let nextPage = pv.currentPage+1;
                    if(pv.currentPage==1){backPage = 1}
                    if(pv.currentPage==pv.maxPage){nextPage = pv.maxPage}
    
                    let text2 = "";
                    text2 += `<span class="material-symbols-outlined" onclick="mailAjax(1, ${search}, ${listTpye}, ${categoryNo})"> keyboard_double_arrow_left </span>`;
                    text2 += `<span class="material-symbols-outlined" onclick="mailAjax(${backPage}, ${search}, ${listTpye}, ${categoryNo})"> chevron_left </span>`;
    
                    for(let i = pv.startPage; i <= pv.endPage; i++){
                        let currentClass = ""
                        if(i==pv.currentPage) {
                            currentClass = " checked-p-btn";
                        }
    
                        text2 += `<div class="page-btn${currentClass}" onclick="mailAjax(${i}, ${search}, ${listTpye}, ${categoryNo})">${i}</div>`;
                    }
    
                    text2 += `<span class="material-symbols-outlined" onclick="mailAjax(${nextPage}, ${search}, ${listTpye}, ${categoryNo})"> chevron_right </span>`;
                    text2 += `<span class="material-symbols-outlined" onclick="mailAjax(${pv.maxPage}, ${search}, ${listTpye}, ${categoryNo})"> keyboard_double_arrow_right </span>`;
    
                    pageBox.innerHTML = text2;
                    
                    // 검색어
                    document.querySelector("#search-input").value = search;

                    // 카테고리
                    const categoryList = document.querySelector('#category-list');

                    let text = '<div class="category-item cate-checked">전체 메일</div>';
                    for(item in category){
                        text += `<div class="category-item" onclick="mailAjax(${page}, ${search}, ${listTpye}, ${item.no})" >${item.name}</div>`;
                    }
                    text += '<div class="category-item"><span class="material-symbols-outlined"> add </span>추가</div>';

                    categoryList.innerHTML = text;

                } else {
                alert('Request Error!');
                }
        }
    };

    httpRequest.open('post', '/sixman/mail/list');
    httpRequest.responseType = "json";
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`page=${page}&search=${search}&listTpye=${listTpye}&categoryNo=${categoryNo}`);
}

function getChecked() {
    const itemBox = document.querySelector('#list-item-box');
    const checkBoxs = itemBox.querySelectorAll('input[type=checkbox]');
    let arr = [];

    checkBoxs.forEach(element => {
        if(element.checked){arr.push(element.value)};
    });
    return arr;
}

function deleteAjax() {
    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                    
                    popup.alertPop("삭제하기", "메일을 삭제 완료 하였습니다.");
                    mailAjax(cPage, cSearch, cListTpye, cCategoryNo);

                } else {
                alert('Request Error!');
                }
        }
    };

    httpRequest.open('post', '/sixman/mail/delete');
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`no=${getChecked()}`);
}

function search() {
    const text = document.querySelector('#search-input').value;
    mailAjax(cPage, text, cListTpye, cCategoryNo);
}