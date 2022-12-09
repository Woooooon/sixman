noticeListAjax(1);

function noticeListAjax(page, keyword) {
    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                var result = httpRequest.response;

                console.log(result);

                const listBox = document.querySelector('.list-box');

                let text = "<div class='first-item'> <p>번호</p> <p>제목</p> <p>작성일자</p> <p>조회수</p> </div>";

                for(let i = 0; i < result.list.length; i++){
                    const vo = result.list[i];
                    let importantClass
                    if(vo.inportantYn=="Y"){
                        importantClass = "class='important'>중요<";
                    }else{
                        importantClass = `>${i+1}<`;
                    }
                    text += `<div class='list-item'> <p${importantClass}/p> <p>${vo.title}</p> <p>${vo.enrollDate}</p> <p>${vo.view}</p> </div>`
                }
                console.log(listBox);
                listBox.innerHTML = text;

                const pageBox = document.querySelector('.page-box');
                let text2 = "";
                text2 += "<span class='material-symbols-outlined'> keyboard_double_arrow_left </span>";
                text2 += "<span class='material-symbols-outlined'> chevron_left </span>";
                text2 += "<span class='material-symbols-outlined'> chevron_right </span>";
                text2 += "<span class='material-symbols-outlined'> keyboard_double_arrow_right </span>";
                

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