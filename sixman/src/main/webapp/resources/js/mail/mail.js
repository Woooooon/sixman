const fileBtn = document.querySelector('#file-btn');
const fileBox = document.querySelector('#file-box');

fileBtn.addEventListener('click',()=>{
    const inputFile = document.createElement('input');
    inputFile.setAttribute('type','file');
    inputFile.setAttribute('name','file');
    inputFile.style.display = 'none';

    fileBox.append(inputFile);

    inputFile.click();

    inputFile.addEventListener('change',()=>{

        if(inputFile.value!=null){
            const div = document.createElement('div');
            div.classList.add('file-item');
            div.innerHTML = `<p>${inputFile.value.substring(inputFile.value.lastIndexOf('\\')+1)}</p>`
                        +"<span class='material-symbols-outlined'> close </span>";

            div.querySelector('span').addEventListener('click', ()=>{
                div.remove();
                inputFile.remove();
            });

            fileBox.append(div);
        }

    });

});

function validateEmail(email) {
    var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    return re.test(email);
}

const emailInput = document.querySelector('#email-input');
emailInput.addEventListener('blur', createMailItem);
emailInput.addEventListener('keyup', (event)=>{

    emailInput.removeEventListener('blur', createMailItem);
    if(event.keyCode == 13) createMailItem();
    setTimeout(function(){
        emailInput.addEventListener('blur', createMailItem);
      }, 10)

});

function createMailItem(params) {
    const inputMail = document.createElement('input');
    inputMail.setAttribute('type','email');
    inputMail.setAttribute('name','sender');

    const email = emailInput.value;
    if(validateEmail(email)){
        inputMail.value = email
        emailInput.value = '';
    }else{
        if(email==''){return}
        popup.warningPop("EMAIL", "이메일 형식을 확인해주세요");
        return;
    }

    const span = document.createElement('span');
    span.classList.add('t-btn');
    span.classList.add('material-symbols-outlined');
    span.innerHTML = 'close';

    const div = document.createElement('div');
    div.classList.add('members-item');
    div.append(inputMail, span);

    span.addEventListener('click', ()=>{
        div.remove();
    });

    document.querySelector('#members').append(div);
}

