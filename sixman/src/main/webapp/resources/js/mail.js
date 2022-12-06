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
emailInput.addEventListener('keyup',()=>{
    const inputMail = document.createElement('input');
    inputMail.setAttribute('type','email');
    inputMail.setAttribute('name','email');

    // 이어서

});

