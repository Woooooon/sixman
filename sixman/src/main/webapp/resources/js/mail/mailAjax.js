let cPage = null;
let cSearch = null;
let cListTpye = null;
let cCategoryNo = null;
let cFilter = null;

// AJAX
function mailAjax(page, search, listTpye, categoryNo, filter) {
    if(typeof listTpye == 'undefined') {listTpye = null;}
    if(typeof categoryNo == 'undefined') {categoryNo = null;}
    if(typeof search == 'undefined') {search = null;}
    if(typeof filter == 'undefined') {filter = null;}

    cPage = page;
    cCategoryNo = categoryNo;
    cListTpye = listTpye;
    cSearch = search;
    cFilter = filter;

    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                    var result = httpRequest.response;

                    // console.log(result);
                    const pv = result.pv;
                    const list = result.list;
                    const category =  result.categoryList;

                    const listItemBox = document.querySelector('#list-item-box');
                    while ( listItemBox.hasChildNodes() ){
                        listItemBox.removeChild( listItemBox.firstChild );       
                    }

                    for(let i = 0; i < list.length; i++){
                        const div = document.createElement('div');
                        const vo = list[i];
                        div.classList.add('list-item');

                        let text = "";
                        text += `<input type="checkbox" value=${vo.mailNo}>`;

                        if(vo.isSender == 'Y'){
                            div.classList.add('read');
                            text += `<span class="material-symbols-outlined read"> forward_to_inbox </span>`;
                        }else if(vo.checkYn == 'Y'){
                            div.classList.add('read');
                            text += `<span class="material-symbols-outlined read"> drafts </span>`;
                        }else{
                            text += `<span class="material-symbols-outlined"> mail </span>`;
                        }

                        let save = '';
                        if(vo.saveYn == 'Y'){
                            save = '&save=true'
                        }

                        text += `<p>${vo.userName}</p>`;
                        text += `<p onclick="location.href = '/sixman/mail/detail?no=${vo.mailNo+save}'">${vo.title}</p>`;
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
                    text2 += `<span class="material-symbols-outlined" onclick="mailAjax(1, '${search}', '${listTpye}', ${categoryNo}, '${filter}')"> keyboard_double_arrow_left </span>`;
                    text2 += `<span class="material-symbols-outlined" onclick="mailAjax(${backPage}, '${search}', '${listTpye}', ${categoryNo}, '${filter}')"> chevron_left </span>`;
    
                    for(let i = pv.startPage; i <= pv.endPage; i++){
                        let currentClass = ""
                        if(i==pv.currentPage) {
                            currentClass = " checked-p-btn";
                        }
    
                        text2 += `<div class="page-btn${currentClass}" onclick="mailAjax(${i}, '${search}', '${listTpye}', ${categoryNo}, '${filter}')">${i}</div>`;
                    }
    
                    text2 += `<span class="material-symbols-outlined" onclick="mailAjax(${nextPage}, '${search}', '${listTpye}', ${categoryNo}, '${filter}')"> chevron_right </span>`;
                    text2 += `<span class="material-symbols-outlined" onclick="mailAjax(${pv.maxPage}, '${search}', '${listTpye}', ${categoryNo}, '${filter}')"> keyboard_double_arrow_right </span>`;
    
                    pageBox.innerHTML = text2;
                    
                    // 검색어
                    document.querySelector("#search-input").value = search;

                    // 카테고리
                    const categoryList = document.querySelector('#category-list');

                    let text = `<div class="category-item" onclick="mailAjax(${page}, null, '${listTpye}')">전체 메일</div>`;

                    for(item of category){
                        text += `<div no="${item.NO}" class="category-item" onclick="mailAjax(${page}, '${search}', '${listTpye}', ${item.NO})" >${item.NAME}</div>`;
                    }
                    text += '<div class="category-item create-btn"><span class="material-symbols-outlined"> add </span>추가</div>';

                    categoryList.innerHTML = text;

                    categoryList.querySelector('.create-btn').addEventListener('click', createCategoryModal);
                    const itemList = categoryList.querySelectorAll('.category-item');
                    let hasNo = false;
                    for(let i = 0; i < itemList.length; i++){
                        const element = itemList[i];
                        if(element.getAttribute("no")==categoryNo){
                            element.classList.add('cate-checked');
                            hasNo = true;
                            break;
                        }
                    }

                    if(!hasNo){
                        categoryList.querySelector('.category-item').classList.add('cate-checked');
                    }

                    const categoryItem = document.querySelector('#category-box .category-items');
                    let text3 = ``;

                    for(item of category){
                        text3 += `<label>${item.NAME}<input name="category" type="radio" value="${item.NO}"><span class='material-symbols-outlined'> close </span></label>`;
                    }

                    categoryItem.innerHTML = text3;

                    //필터
                    const filterBox = document.querySelector('#filter-box');
                    if(filterBox!=null){
                        const labels = filterBox.querySelectorAll('label');
                        labels.forEach(element => {
                            const fValue = element.querySelector('input').value;

                            element.onclick = ()=>{
                                mailAjax(page, search, listTpye, categoryNo, fValue);
                            }
                        });
                    }
                    //카운팅
                    const nonCount = result.nonListCount;
                    const listCount = result.listCount;

                    const listCountP = document.querySelector('#mail-list-count');
                    listCountP.innerHTML = listCount;

                    const nonCountP = document.querySelector('#mail-non-count');
                    if(nonCountP!=null){
                        nonCountP.innerHTML = nonCount;
                    }


                } else {

                }
        }
    };

    httpRequest.open('post', '/sixman/mail/list');
    httpRequest.responseType = "json";
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`page=${page}&search=${search}&listTpye=${listTpye}&categoryNo=${categoryNo}&filter=${filter}`);
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

function deleteAjax(doAjax, no) {
    if(no==null){
        no = getChecked();
    }
    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                    
                    popup.alertPop("삭제하기", "메일을 삭제 완료 하였습니다.");
                    if(!doAjax || doAjax == null){
                        mailAjax(cPage, cSearch, cListTpye, cCategoryNo, cFilter);
                    }else{
                        location.href = '/sixman/mail/list';
                    }

                } else {

                }
        }
    };

    httpRequest.open('post', '/sixman/mail/delete');
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`no=${no}`);
}

function getCategoryList() {
    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                    const category = httpRequest.response;
                    
                    const categoryItem = document.querySelector('#category-box .category-items');
                    let text = ``;

                    for(item of category){
                        text += `<label>${item.NAME}<input name="category" type="radio" value="${item.NO}"><span class='material-symbols-outlined'> close </span></label>`;
                    }

                    categoryItem.innerHTML = text;

                } else {
                
                }
        }
    };

    httpRequest.open('post', '/sixman/mail/getCategoryList');
    httpRequest.responseType = "json";
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send();
}

function search() {
    const text = document.querySelector('#search-input').value;
    mailAjax(cPage, text, cListTpye, cCategoryNo, cFilter);
}

function createCategoryModal(doAjax) {
    const div = document.createElement('div');
    div.id = 'category-modal-box';
    div.innerHTML = `	<div id="modal-main-box" class="box">
                            <div>
                                <div>추가하실 카테고리를 입력하세요.</div>
                                <span class="material-symbols-outlined"> close </span>
                            </div>
                            <div>
                                <input type="text">
                                <button class="btn">추가</button>
                            </div>
                        </div>`;

    const close = div.querySelector('span');
    close.addEventListener('click', ()=>{div.remove();});

    const btn = div.querySelector('button');

    btn.addEventListener('click', ()=>{
        createCategoryAjax(doAjax);
        div.remove();
    })

    const body = document.querySelector('body');
    // console.log(body);
    body.append(div);
    
}

const createBtns = document.querySelectorAll('.create-btn');
createBtns.forEach(element => {
    element.addEventListener('click', createCategoryModal);
});

function createCategoryAjax(doAjax) {
    const modalBox = document.querySelector('#category-modal-box');
    const category = modalBox.querySelector('input').value;
    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                    
                    popup.alertPop("추가하기", "카테고리가 추가되었습니다.");

                    if(!doAjax || doAjax == null){
                        mailAjax(cPage, cSearch, cListTpye, cCategoryNo, cFilter);
                    }else{
                        location.reload();
                    }

                } else {

                }
        }
    };

    httpRequest.open('post', '/sixman/mail/createCategory');
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`category=${category}`);
}

function restoreAjax() {
    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                    
                    popup.alertPop("복구하기", "메일들이 복구가 완료되었습니다.");
                    mailAjax(cPage, cSearch, cListTpye, cCategoryNo, cFilter);

                } else {

                }
        }
    };

    httpRequest.open('post', '/sixman/mail/restore');
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`no=${getChecked()}`);
}

function realDelete() {
    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                    
                    popup.alertPop("비우기", "휴지통을 비웠습니다.");
                    mailAjax(cPage, cSearch, cListTpye, cCategoryNo, cFilter);

                } else {

                }
        }
    };

    httpRequest.open('post', '/sixman/mail/realDelete');
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`no=${getChecked()}`);
}

function updateRead() {
    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {

                    mailAjax(cPage, cSearch, cListTpye, cCategoryNo, cFilter);

                } else {

                }
        }
    };

    httpRequest.open('post', '/sixman/mail/updateRead');
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`no=${getChecked()}`);
}

function changeCategory(doAjax, no) {
    if(no==null){
        no = getChecked();
    }
    const categoryItem = document.querySelector('#category-box .category-items');
    const radios = categoryItem.querySelectorAll('input[type=radio]');
    let category = 0;
    for(let i = 0; i < radios.length; i++){
        if(radios[i].checked){
            category = radios[i].value;
            
            break;
        }
    }
    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {

                    popup.alertPop("변경하기", "카테고리 변경이 완료되었습니다.");
                    if(!doAjax || doAjax == null){
                        mailAjax(cPage, cSearch, cListTpye, cCategoryNo, cFilter);
                    }

                } else {

                }
        }
    };

    httpRequest.open('post', '/sixman/mail/changeCategory');
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`no=${no}&category=${category}`);
}