function dounload(no) {
    var form = document.createElement('form'); // 폼객체 생성
    var objs;
    objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
    objs.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
    objs.setAttribute('name', 'no'); // 객체이름
    objs.setAttribute('value', no); //객체값
    form.appendChild(objs);
    form.setAttribute('method', 'post'); //get,post 가능
    form.setAttribute('action', "/sixman/download"); //보내는 url
    document.body.appendChild(form);
    form.submit(); 
    form.remove();
}