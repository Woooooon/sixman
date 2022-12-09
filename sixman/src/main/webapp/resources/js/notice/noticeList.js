noticeListAjax(1);

const searchBtn = document.querySelector("#search-btn");
searchBtn.addEventListener('click', ()=>{
    const keyword = document.querySelector("#search-input").value;
    noticeListAjax(1, keyword);
});

function noticeListAjax(page, keyword) {
    if(typeof keyword == 'undefined') {keyword = '';}
    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                var result = httpRequest.response;

                const listBox = document.querySelector('.list-box');

                let text = "<div class='first-item'> <p>번호</p> <p>제목</p> <p>작성일자</p> <p>조회수</p> </div>";

                for(let i = 0; i < result.list.length; i++){
                    const vo = result.list[i];
                    let importantClass = "";
                    if(vo.inportantYn=="Y"){
                        importantClass = " class='important'>중요<";
                    }else{
                        importantClass = `>${i+1}<`;
                    }
                    text += `<div class='list-item' onclick="location.href='/sixman/notice/detail?no=${vo.no}'"> <p${importantClass}/p> <p>${vo.title}</p> <p>${vo.enrollDate}</p> <p>${vo.view}</p> </div>`
                }
                listBox.innerHTML = text;

                const pv = result.pv;

                const pageBox = document.querySelector('.page-box');

                let backPage = pv.currentPage-1;
                let nextPage = pv.currentPage+1;
                if(pv.currentPage==1){backPage = 1}
                if(pv.currentPage==pv.maxPage){nextPage = pv.maxPage}

                let text2 = "";
                text2 += `<span class="material-symbols-outlined" onclick="noticeListAjax(1,${keyword})"> keyboard_double_arrow_left </span>`;
                text2 += `<span class="material-symbols-outlined" onclick="noticeListAjax(${backPage},${keyword})"> chevron_left </span>`;

                for(let i = pv.startPage; i <= pv.endPage; i++){
                    let currentClass = ""
                    if(i==pv.currentPage) {
                        currentClass = " checked-p-btn";
                    }

                    text2 += `<div class="page-btn${currentClass}" onclick="noticeListAjax(${i},${keyword})">${i}</div>`;
                }

                text2 += `<span class="material-symbols-outlined" onclick="noticeListAjax(${nextPage},${keyword})"> chevron_right </span>`;
                text2 += `<span class="material-symbols-outlined" onclick="noticeListAjax(${pv.maxPage},${keyword})"> keyboard_double_arrow_right </span>`;

                pageBox.innerHTML = text2;
                
                document.querySelector("#search-input").value = keyword;

                } else {
                alert('Request Error!');
                }
        }
    };

    httpRequest.open('post', '/sixman/notice/list');
    httpRequest.responseType = "json";
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`page=${page}&keyword=${keyword}`);
}