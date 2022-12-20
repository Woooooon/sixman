function download(no, tableName) {
    const form = document.createElement('form'); // 폼객체 생성

    const objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
    objs.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
    objs.setAttribute('name', 'no'); // 객체이름
    objs.setAttribute('value', no); //객체값

    const objs2 = document.createElement('input'); // 값이 들어있는 녀석의 형식
    objs2.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
    objs2.setAttribute('name', 'tableName'); // 객체이름
    objs2.setAttribute('value', tableName); //객체값

    form.appendChild(objs);
    form.appendChild(objs2);
    form.setAttribute('method', 'post'); //get,post 가능
    form.setAttribute('action', "/sixman/download"); //보내는 url
    document.body.appendChild(form);
    form.submit(); 
    form.remove();
}

function deleteFile(object, no, tableName) {
    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {

                } else {
                alert('Request Error!');
                }
        }
    };

    httpRequest.open('post', '/sixman/delete');
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`no=${no}&tableName=${tableName}`);

    object.closest(".file-item").remove();
}