firstAjax(1);

const searchBtn = document.querySelector("#search-btn");
searchBtn.addEventListener('click', ()=>{
    const keyword = document.querySelector("#search-input").value;
    firstAjax(1, keyword);
});

function firstAjax(page, keyword) {
    if(typeof keyword == 'undefined') {keyword = '';}
    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                var result = httpRequest.response;
                const pv = result.pv;
                const listCount = result.listCount;

                const listBox = document.querySelector('.list-box');

                let text = "<div class='first-item'> <p>문서번호</p> <p>기안양식</p> <p>제목</p> <p>기안일</p> <p>결재상태</p> </div>";

                for(let i = 0; i < result.list.length; i++){
                    const dvo = result.list[i];
                    let importantClass = "";
                    
                    importantClass = `>${i+1+(pv.currentPage - 1) * 10}<`;
                    
                //     text += `<div class='list-item' onclick="location.href='/sixman/document/detail?no=${dvo.no}'"> <p>${dvo.type}</p> <p>${dvo.title}</p><p">${dvo.enrollDate}</p> <p>${dvo.state}</p> </div>`
                // 
                }
                listBox.innerText = text;

                const pageBox = document.querySelector('.page-box');

                let backPage = pv.currentPage-1;
                let nextPage = pv.currentPage+1;
                if(pv.currentPage==1){backPage = 1}
                if(pv.currentPage==pv.maxPage){nextPage = pv.maxPage}

                let text2 = "";
                text2 += `<span class="material-symbols-outlined" onclick="firstAjax(1,${keyword})"> keyboard_double_arrow_left </span>`;
                text2 += `<span class="material-symbols-outlined" onclick="firstAjax(${backPage},${keyword})"> chevron_left </span>`;

                for(let i = pv.startPage; i <= pv.endPage; i++){
                    let currentClass = ""
                    if(i==pv.currentPage) {
                        currentClass = " checked-p-btn";
                    }

                    text2 += `<div class="page-btn${currentClass}" onclick="firstAjax(${i},${keyword})">${i}</div>`;
                }

                text2 += `<span class="material-symbols-outlined" onclick="firstAjax(${nextPage},${keyword})"> chevron_right </span>`;
                text2 += `<span class="material-symbols-outlined" onclick="firstAjax(${pv.maxPage},${keyword})"> keyboard_double_arrow_right </span>`;

                pageBox.innerText = text2;

                document.querySelector("#list-count").innerText = listCount;
                document.querySelector("#search-input").value = keyword;

                } 
        }
    };

    httpRequest.open('post', '/sixman/document/first');
    httpRequest.responseType = "json";
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`page=${page}&keyword=${keyword}`);
}