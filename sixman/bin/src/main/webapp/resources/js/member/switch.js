const form = document.querySelector('form');
const pwd = document.querySelector('#pwd');
const pwd2 = document.querySelector('#pwdCheck');
console.log(form);
console.log(pwd);
console.log(pwd2);
form.addEventListener('submit', (e) => {
    const pwdValue = pwd.value;
    const pwdValue2 = pwd2.value;
    console.log('pwdValue :' + pwdValue);
    console.log('pwdValue2 :' + pwdValue2);
    if (pwdValue != pwdValue2) {
        console.log('pwdValue != pwdValue2 :' + pwdValue != pwdValue2);
        e.preventDefault;
        return false;
    }
});
