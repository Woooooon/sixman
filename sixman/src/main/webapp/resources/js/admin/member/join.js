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
checkBoxToggleEvent('.all_check', '.check_list');

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

                attBox.append(div);
            }
        });
    } else {
        popup.alertPop('안내', '첨부자료는 10개까지 등록 가능합니다.');
    }
});

function checkAllToggle(all_selector, check_selector) {
    const selectAll = document.querySelector(all_selector);
    const checkBox = document.querySelectorAll(check_selector);
    const is_check = selectAll.checked;

    if (is_check === true) {
        checkBox.forEach((checkbox) => {
            if (checkbox.disabled !== true) {
                checkbox.setAttribute('checked', 'checked');
                checkbox.checked = true;
            }
        });
    } else {
        checkBox.forEach((checkbox) => {
            checkbox.removeAttribute('checked', 'checked');
            checkbox.checked = false;
        });
    }
}

function checkBoxToggleEvent(all_selector, check_selector) {
    const selectAll = document.querySelector(all_selector);

    selectAll.addEventListener('change', function () {
        checkAllToggle(all_selector, check_selector);
    });

    const checkBox = document.querySelectorAll(check_selector);
    checkBox.forEach((el_check, idx) => {
        el_check.addEventListener('change', function () {
            checkBoxToggle(all_selector, check_selector);
        });
    });
}
addProFile();
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
                });

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
                });

                parentElem.append(div);
            }
        });
        fileView();
    });
}

document.getElementById('address_kakao').addEventListener('click', function () {
    //주소입력칸을 클릭하면
    //카카오 지도 발생
    new daum.Postcode({
        oncomplete: function (data) {
            document.getElementById('address').value = data.address; // 주소 넣기
        },
    }).open();
});

$(function () {
    $('#jstree').jstree();

    $('#jstree').on('changed.jstree', function (e, data) {
        console.log(data.selected);
    });

    $('button').on('click', function () {
        $('#jstree').jstree(true).select_node('child_node_1');
        $('#jstree').jstree('select_node', 'child_node_1');
        $.jstree.reference('#jstree').select_node('child_node_1');
    });
});

$('#jstree').on('open_node.jstree', function (e, data) {
    var icon = $('#' + data.node.id)
        .find('i.jstree-icon.jstree-themeicon')
        .first();
    icon.removeClass('fa-folder').addClass('fa-folder-open');
});

// bind customize icon change function in jsTree close_node event.
$('#jstree').on('close_node.jstree', function (e, data) {
    var icon = $('#' + data.node.id)
        .find('i.jstree-icon.jstree-themeicon')
        .first();
    icon.removeClass('fa-folder-open').addClass('fa-folder');
});

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
