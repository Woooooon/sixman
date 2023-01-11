document.getElementById('address_kakao').addEventListener('click', function () {
    //주소입력칸을 클릭하면
    //카카오 지도 발생
    new daum.Postcode({
        oncomplete: function (data) {
            document.getElementById('address').value = data.address; // 주소 넣기
        },
    }).open();
});

const fileDOM = document.querySelector('#pic-add');
const preview = document.querySelector('.image-box');

fileDOM.addEventListener('change', () => {
    const reader = new FileReader();
    reader.onload = ({ target }) => {
        preview.src = target.result;
    };
    reader.readAsDataURL(fileDOM.files[0]);
});

const form = document.querySelector('#form');

const company = document.querySelector('input[name="company"]');
const username = document.querySelector('input[name="name"]');
const phone = document.querySelector('input[name="phone"]');
const position = document.querySelector('input[name="position"]');
const email = document.querySelector('input[name="email"]');

const idRegex = /^[a-z|A-Z|0-9|]+$/;
const nameRegex = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|]+$/;
const phoneRegex = /^\d{2,3}\d{3,4}\d{4}$/;
const emailRegex = /^[a-zA-z0-9._+-]+@[a-zA-z0-9-]+\.[a-zA-z0-9.]+$/;
const accountRegex = /^[0-9]+$/;
const birthRegex = /^\d{2}\d{2}\d{2}$/;

company.addEventListener('blur', () => {
    company.classList.remove('error');
    if (company.value == '') {
        company.classList.add('error');
    }
});

username.addEventListener('blur', () => {
    doubleMatch(username, nameRegex);
});

phone.addEventListener('blur', () => {
    doubleMatch(phone, phoneRegex);
});

position.addEventListener('blur', () => {
    match(position, nameRegex);
});

email.addEventListener('blur', () => {
    match(email, emailRegex);
});

function doubleMatch(elem, regex) {
    elem.classList.remove('error');

    if (elem.value == '') {
        elem.classList.add('error');
        return;
    }

    match(elem, regex);
}

function match(elem, regx) {
    elem.classList.remove('error');

    const value = elem.value;

    if (value != '') {
        if (!regx.test(value)) {
            elem.classList.add('error');
            return;
        }
    }
}

form.onsubmit = () => {
    const checkCompany = company.classList.contains('error');
    const checkPhone = phone.classList.contains('error');
    const checkName = username.classList.contains('error');
    const checkPosition = position.classList.contains('error');
    const checkEmail = email.classList.contains('error');

    if (company.value == '' || username.value == '' || phone.value == '') {
        popup.warningPop('안내', '필수 입력 사항을 입력하세요.');
        return false;
    }

    if (checkCompany) {
        return false;
    }

    if (checkPhone) {
        return false;
    }

    if (checkName) {
        return false;
    }

    if (checkPosition) {
        return false;
    }

    if (checkEmail) {
        return false;
    }

    return true;
};
