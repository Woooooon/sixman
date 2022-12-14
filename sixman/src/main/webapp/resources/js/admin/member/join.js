$('select[name="deptNo"]').on('change', () => {
    $('select[name="teamNo"]').html('');
    if ($('select[name="deptNo"]').val() != 1) {
        $.ajax({
            url: '/sixman/dept/sublist',
            method: 'POST',
            data: {
                no: $('select[name="deptNo"]').val(),
            },
            success: (teamList) => {
                teamList.forEach((element) => {
                    const option = document.createElement('option');
                    option.setAttribute('value', element.teamNo);
                    option.innerHTML = element.teamName;
                    $('select[name="teamNo"]').append(option);
                });
            },
            error: (teamList) => {
                console.log('hi');
            },
        });
    }
});

const profileBtn = document.querySelector('#add-pic');
const profileBox = document.querySelector('#profile-pic');
const resumeBtn = document.querySelector('#add-resume');
const resumeBox = document.querySelector('#resume');
const accountBtn = document.querySelector('#add-account');
const accountBox = document.querySelector('#copy-account');
const attBtn = document.querySelector('#add-attfile');
const attBox = document.querySelector('.att-filelist');
const attFileDelete = document.querySelector('#remove-attfile');

const form = document.querySelector('#form');

const id = document.querySelector('input[name="id"]');
const username = document.querySelector('input[name="name"]');
const phone = document.querySelector('input[name="phone"]');
const account = document.querySelector('input[name="account"]');
const birthday = document.querySelector('input[name="birthday"]');
const email = document.querySelector('input[name="email"]');

const idRegex = /^[a-z|A-Z|0-9|]+$/;
const nameRegex = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|]+$/;
const phoneRegex = /^\d{2,3}\d{3,4}\d{4}$/;
const emailRegex = /^[a-zA-z0-9._+-]+@[a-zA-z0-9-]+\.[a-zA-z0-9.]+$/;
const accountRegex = /^[0-9]+$/;
const birthRegex = /^\d{2}\d{2}\d{2}$/;

id.addEventListener('blur', () => {
    doubleMatch(id, idRegex, '영문, 숫자만 작성하세요.');
});

username.addEventListener('blur', () => {
    doubleMatch(username, nameRegex, '한글 또는 영어만 작성하세요.');
});

phone.addEventListener('blur', () => {
    match(phone, phoneRegex, '제시한 형식에 맞게 작성하세요');
});

account.addEventListener('blur', () => {
    match(account, accountRegex, '제시한 형식에 맞게 작성하세요');
});

birthday.addEventListener('blur', () => {
    match(birthday, birthRegex, '제시한 형식에 맞게 작성하세요.');
});

email.addEventListener('blur', () => {
    match(email, emailRegex, '메일형식에 맞추어 작성하세요.');
});

function doubleMatch(elem, regex, messege) {
    const errors = elem.parentElement.querySelectorAll('p');
    errors.forEach((error) => {
        error.remove();
    });

    if (elem.value == '') {
        const errorMsg = document.createElement('p');
        errorMsg.innerText = '필수입력 항목입니다.';
        elem.parentElement.append(errorMsg);
        elem.classList.add('error');
        return;
    }

    match(elem, regex, messege);
}

function match(elem, regx, messege) {
    elem.classList.remove('error');

    const value = elem.value;

    if (value != '') {
        if (!regx.test(value)) {
            const errorMsg = document.createElement('p');
            errorMsg.innerText = messege;
            elem.parentElement.append(errorMsg);
            elem.classList.add('error');
            return;
        }
    }
    const errors = elem.parentElement.querySelectorAll('p');
    errors.forEach((error) => {
        error.remove();
    });
}

form.onsubmit = () => {
    const checkId = id.classList.contains('error');
    const checkPhone = phone.classList.contains('error');
    const checkName = username.classList.contains('error');
    const checkAccount = account.classList.contains('error');
    const checkBirthday = birthday.classList.contains('error');
    const checkEmail = email.classList.contains('error');

    if (username.value == '' || id.value == '') {
        doubleMatch(id, idRegex, '영문, 숫자만 작성하세요.');
        doubleMatch(username, nameRegex, '한글 또는 영어만 작성하세요.');
        return false;
    }

    if (checkId) {
        return false;
    }

    if (checkPhone) {
        return false;
    }

    if (checkName) {
        return false;
    }

    if (checkAccount) {
        return false;
    }

    if (checkBirthday) {
        return false;
    }

    if (checkEmail) {
        return false;
    }

    return true;
};

// addFile(profileBtn, profileBox, 'pic-wrap', 'image', 'picFile', 'pic-add');
addFile(resumeBtn, resumeBox, 'resume-wrap', 'draft', 'resumeFile', 'resume-add');
addFile(accountBtn, accountBox, 'account-wrap', 'image', 'accountFile', 'account-add');
addProFile();

attFileDelete.addEventListener('click', () => {
    const checkBox = document.querySelectorAll('.att-wrap:has(input:checked)');
    checkBox.forEach((selectBox) => {
        selectBox.previousElementSibling.remove();
        selectBox.remove();
    });
});

attBtn.addEventListener('click', () => {
    const attWrap = document.querySelectorAll('.att-wrap');
    const inputFile = document.createElement('input');
    if (attWrap.length < 10) {
        inputFile.setAttribute('type', 'file');
        inputFile.setAttribute('name', 'evidenceFile');
        inputFile.style.display = 'none';

        attBox.append(inputFile);

        inputFile.click();

        inputFile.addEventListener('change', () => {
            if (inputFile.value != null) {
                const div = document.createElement('div');
                div.classList.add('att-wrap');
                div.innerHTML =
                    '<div id="file-info">' +
                    '<div class="checked">' +
                    '<input type="checkbox" class="check_list"/>' +
                    '<span class="material-symbols-outlined">draft</span>' +
                    '</div>' +
                    '<label for="">' +
                    inputFile.value.substring(inputFile.value.lastIndexOf('\\') + 1) +
                    '</label>' +
                    '<button type="button" class="remove">' +
                    '<span id="remove-file" class="material-symbols-outlined">remove</span>삭 제' +
                    '</button>' +
                    '</div>';

                div.querySelector('.remove').addEventListener('click', () => {
                    div.remove();
                    inputFile.remove();
                });

                const checkBox = div.querySelector('.check_list');
                checkBox.addEventListener('change', function () {
                    checkBoxToggle('.all_check', '.check_list');
                });

                attBox.append(div);
            }
        });
    } else {
        popup.alertPop('안내', '첨부자료는 10개까지 등록 가능합니다.');
    }
});

function addProFile() {
    profileBtn.addEventListener('click', () => {
        const defaulltPic = document.querySelector('.image-box');
        console.log(defaulltPic);
        const inputFile = document.createElement('input');
        inputFile.setAttribute('type', 'file');
        inputFile.setAttribute('name', 'picFile');
        inputFile.setAttribute('id', 'pic-add');
        inputFile.style.display = 'none';

        profileBox.append(inputFile);

        inputFile.click();

        inputFile.addEventListener('change', () => {
            if (inputFile.value != null) {
                const div = document.createElement('div');
                div.classList.add('pic-wrap');
                div.innerHTML =
                    '<div id="file-info">' +
                    '<span class="material-symbols-outlined">image</span>' +
                    '<label for="">' +
                    inputFile.value.substring(inputFile.value.lastIndexOf('\\') + 1) +
                    '</label>' +
                    '<button type="button" class="remove">' +
                    '<span id="remove-file" class="material-symbols-outlined">remove</span>삭 제' +
                    '</button>' +
                    '</div>';

                profileBtn.style.display = 'none';
                div.querySelector('.remove').addEventListener('click', () => {
                    defaulltPic.setAttribute('src', '/sixman/resources/img/defaultProfilePic.png');
                    div.remove();
                    inputFile.remove();
                    profileBtn.style.display = 'flex';
                    profileBox.querySelector('span').classList.remove('fileInThis');
                });
                profileBox.querySelector('span').classList.add('fileInThis');
                profileBox.append(div);
            }
        });
        fileView();
    });
}

function addFile(elem, parentElem, className, fileKind, fileName, fileId) {
    elem.addEventListener('click', () => {
        const inputFile = document.createElement('input');
        inputFile.setAttribute('type', 'file');
        inputFile.setAttribute('name', fileName);
        inputFile.setAttribute('id', fileId);
        inputFile.style.display = 'none';

        parentElem.append(inputFile);

        inputFile.click();

        inputFile.addEventListener('change', () => {
            if (inputFile.value != null) {
                const div = document.createElement('div');
                div.classList.add(className);
                div.innerHTML =
                    '<div id="file-info">' +
                    '<span class="material-symbols-outlined">' +
                    fileKind +
                    '</span>' +
                    '<label for="">' +
                    inputFile.value.substring(inputFile.value.lastIndexOf('\\') + 1) +
                    '</label>' +
                    '<button type="button" class="remove">' +
                    '<span id="remove-file" class="material-symbols-outlined">remove</span>삭 제' +
                    '</button>' +
                    '</div>';

                elem.style.display = 'none';
                div.querySelector('.remove').addEventListener('click', () => {
                    div.remove();
                    inputFile.remove();
                    elem.style.display = 'flex';
                    parentElem.querySelector('span').classList.remove('fileInThis');
                });

                parentElem.querySelector('span').classList.add('fileInThis');
                parentElem.append(div);
            }
        });
        fileView();
    });
}

//카카오주소
document.getElementById('address_kakao').addEventListener('click', function () {
    //주소입력칸을 클릭하면
    //카카오 주소 발생
    new daum.Postcode({
        oncomplete: function (data) {
            document.getElementById('address').value = data.address; // 주소 넣기
        },
    }).open();
});

//파일미리보기
function fileView() {
    const fileDOM = document.querySelector('#pic-add');
    const preview = document.querySelector('.image-box');

    fileDOM.addEventListener('change', () => {
        const reader = new FileReader();
        reader.onload = ({ target }) => {
            preview.src = target.result;
        };
        reader.readAsDataURL(fileDOM.files[0]);
    });
}

checkBoxToggleEvent('.all_check', '.check_list');

//전체석택
function checkBoxToggleEvent(all_selector, check_selector) {
    const selectAll = document.querySelector(all_selector);

    selectAll.addEventListener('change', function () {
        checkAllToggle(all_selector);
    });

    const checkBox = document.querySelectorAll(check_selector);
    checkBox.forEach((el_check) => {
        el_check.addEventListener('change', function () {
            checkBoxToggle(all_selector, check_selector);
        });
    });
}

function checkAllToggle(all_selector) {
    const selectAll = document.querySelector(all_selector);
    const none_check = document.querySelectorAll('.check_list:not(:checked)');
    const is_check = document.querySelectorAll('.check_list:checked');

    const is_Allcheck = selectAll.checked;
    if (is_Allcheck === true) {
        none_check.forEach((check) => {
            check.click();
        });
    } else {
        is_check.forEach((check) => {
            check.click();
        });
    }
}

function checkBoxToggle(all_selector, check_selector) {
    const selectAll = document.querySelector(all_selector);
    const checkbox_ln = document.querySelectorAll(check_selector + ':enabled').length;
    const check_ln = document.querySelectorAll(check_selector + ':checked:enabled').length;
    if (checkbox_ln === check_ln) {
        selectAll.checked = true;
    } else {
        selectAll.checked = false;
    }
}
