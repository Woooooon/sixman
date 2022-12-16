const categoryBtns = document.querySelectorAll('.category-btn');
const caBtn1 = categoryBtns[0];
const caBtn2 = categoryBtns[1];
const caBox1 = document.querySelector('#category-box');
const caBox2 = document.querySelector('#category-box2');

caBtn1.addEventListener('click', ()=>{openTogle(caBtn1,caBox1)});
caBtn2.addEventListener('click', ()=>{openTogle(caBtn2,caBox2)});

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
const checkArr = document.querySelectorAll('.list-item input[type=checkbox]');
const btnArr = document.querySelectorAll('#checkbox-box > *');

mainCheck.addEventListener('change',()=>{
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

checkArr.forEach(element => {
    element.addEventListener('change',()=>{
        let boolean = false;
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
                element.classList.remove('click-able');
            });
        }
    });
});


// AJAX
function mailAjax(page, search, listTpye, categoryNo) {
    console.log(11);
    if(typeof listTpye == 'undefined') {listTpye = '';}
    if(typeof categoryNo == 'undefined') {categoryNo = '';}
    if(typeof search == 'undefined') {search = '';}
    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                    var result = httpRequest.response;
                    const pv = result.pv;
                    const list = result.list;

                    console.log(result);

                    const listBox = document.querySelector('.list-box');
                    for(let i = 0; i < list.length; i++){
                        const div = document.createElement('div');
                        const vo = list[i];
                        div.classList.add('list-item');
                        div.onclick = ()=>{
                            location.href = `/sixman/mail/detail?no=${vo.no}`
                        }

                        let text = "";
                        text += `<input type="checkbox">`;
                        if(vo.checkYn == null || vo.checkYn=='Y'){
                            div.classList.add('read');
                            text += `<span class="material-symbols-outlined"> drafts </span>`;
                        }else{
                            text += `<span class="material-symbols-outlined"> mail </span>`;
                        }
                        text += `<p>김부장</p>`;
                        text += `<p>${vo.title}</p>`;
                        text += `<p>${vo.sendTime}</p>`;

                        div.innerHTML = text;
                        listBox.append(div);
                    }

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
                    
                    document.querySelector("#search-input").value = keyword;

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