const form = document.querySelector('form');
const pwd = document.querySelector('#pwd');
const pwd2 = document.querySelector('#pwdCheck');

form.onsubmit = () => {
    const errorMsg = document.querySelector('#p1-comment');
    const errorMsg2 = document.querySelector('#p2-comment');
    const pwdValue = pwd.value;
    const pwdValue2 = pwd2.value;

    pwd.classList.remove('error');
    pwd2.classList.remove('error');

    if (pwdValue == '') {
        pwd.classList.add('error');
        errorMsg.innerText = '비밀번호를 작성하세요.';
        return false;
    }

    if (pwdValue2 == '') {
        pwd2.classList.add('error');
        errorMsg2.innerText = '비밀번호 확인을 작성하세요.';
        return false;
    }

    if (pwdValue != pwdValue2) {
        pwd.classList.add('error');
        pwd2.classList.add('error');
        errorMsg.innerText = '비밀번호가 일치하지 않습니다.';
        errorMsg2.innerText = '비밀번호가 일치하지 않습니다.';
        return false;
    }

    return true;
};
