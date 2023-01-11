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

//부서목록 ajax
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
            error: (error) => {
                popup.alertPop('실패', '팀 목록을 조회하지 못하였습니다.');
            },
        });
    }
});

//기존 파일 삭제
function deleteFile() {
    const removeBtn = document.querySelectorAll('.remove');
    const defaulltPic = document.querySelector('.image-box');

    removeBtn.forEach((target) => {
        const parentElem = target.parentElement;
        const inputBox = parentElem.previousElementSibling;

        target.addEventListener('click', () => {
            popup.confirmPop('주의', '저장된 파일을 삭제하시겠습니까?', () => {
                if (parentElem.classList.contains('profileInfo')) {
                    defaulltPic.setAttribute('src', '/sixman/resources/img/defaultProfilePic.png');
                    profileBtn.innerHTML = '<span class="material-symbols-outlined">add</span>추 가';
                    parentElem.remove();
                    inputBox.checked = true;
                }
                if (parentElem.classList.contains('resumeInfo')) {
                    resumeBtn.innerHTML = '<span class="material-symbols-outlined">add</span>추 가';
                    parentElem.remove();
                    inputBox.checked = true;
                }
                if (parentElem.classList.contains('accountInfo')) {
                    accountBtn.innerHTML = '<span class="material-symbols-outlined">add</span>추 가';
                    parentElem.remove();
                    inputBox.checked = true;
                }
                if (parentElem.classList.contains('file-info')) {
                    parentElem.parentElement.previousElementSibling.checked = true;
                    parentElem.closest('.att-wrap').remove();
                }
            });
        });
    });
}

deleteFile();

//패턴 매치 test
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

//member delete
document.querySelector('#deleteBtn').addEventListener('click', () => {
    const searchParams = new URLSearchParams(location.search);

    let no = [];
    no.push(searchParams.get('no'));

    popup.confirmPop('주의', '퇴사 처리 하시겠습니까 ?', () => {
        $.ajax({
            url: '/sixman/admin/member/delete',
            method: 'POST',
            traditional: true,
            data: {
                no: no,
            },
            dataType: 'text',
            success: (msg) => {
                popup.alertPop('성공', msg);
                location.href = '/sixman/admin/employee/list';
            },
            error: function (error) {
                popup.alertPop('실패', '삭제에 실패하였습니다.');
            },
        });
    });
});

//submit event
document.querySelector('#submitBtn').addEventListener('click', () => {
    popup.confirmPop('제안', '수정 하시겠습니까 ?', () => {
        const checkId = id.classList.contains('error');
        const checkPhone = phone.classList.contains('error');
        const checkName = username.classList.contains('error');
        const checkAccount = account.classList.contains('error');
        const checkBirthday = birthday.classList.contains('error');
        const checkEmail = email.classList.contains('error');

        if (username.value == '') {
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

        return form.submit();
    });
});

addFile(resumeBtn, resumeBox, 'resume-wrap', 'draft', 'resumeFile', 'resume-add', 'resumeInfo', '.resumeInfo', 'input[name="resumeNo"]');
addFile(accountBtn, accountBox, 'account-wrap', 'image', 'accountFile', 'account-add', 'accountInfo', '.accountInfo', 'input[name="accountNo"]');
addProFile();

//첨부 파일 선택 제거
attFileDelete.addEventListener('click', () => {
    const checkBox = document.querySelectorAll('.att-wrap:has(input:checked)');
    if (checkBox.length == 0) return;
    popup.confirmPop('제안', '선택 된 모든 파일을 지우시겠습니까 ?', () => {
        checkBox.forEach((selectBox) => {
            selectBox.previousElementSibling.setAttribute('checked', 'checked');
            selectBox.remove();
        });
    });
});

//첨부파일 추가
attBtn.addEventListener('click', () => {
    const attWrap = document.querySelectorAll('.att-wrap');
    const inputFile = document.createElement('input');

    console.log(attWrap);

    if (attWrap.length == 10) {
        popup.alertPop('안내', '첨부자료는 10개까지 등록 가능합니다.');
        return;
    }

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
                '<div class="file-info">' +
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

            div.querySelector('.check_list').addEventListener('change', function () {
                checkBoxToggle('.all_check', '.check_list');
            });

            attBox.append(div);
        }
    });
});

//프로필 사진 추가
function addProFile() {
    const saveData = document.querySelector('.profileInfo');
    const checkInput = document.querySelector('input[name="profileNo"]');

    profileBtn.addEventListener('click', () => {
        const defaulltPic = document.querySelector('.image-box');
        const inputFile = document.createElement('input');
        const beforInputFile = document.querySelector('#pic-add');

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
                    '<div class="file-info" class="profileInfo">' +
                    '<span class="material-symbols-outlined">image</span>' +
                    '<label for="">' +
                    inputFile.value.substring(inputFile.value.lastIndexOf('\\') + 1) +
                    '</label>' +
                    '<button type="button" class="remove">' +
                    '<span id="remove-file" class="material-symbols-outlined">remove</span>삭 제' +
                    '</button>' +
                    '</div>';

                div.querySelector('.remove').addEventListener('click', () => {
                    defaulltPic.setAttribute('src', '/sixman/resources/img/defaultProfilePic.png');
                    div.remove();
                    inputFile.remove();
                    profileBtn.innerHTML = '<span class="material-symbols-outlined">add</span>추 가';
                });

                if (beforInputFile != undefined) {
                    beforInputFile.remove();
                }

                profileBox.append(div);
                profileBtn.innerHTML = '<span class="material-symbols-outlined">add</span>변 경';
                checkInput.checked = true;

                if (saveData != null) {
                    saveData.remove();
                }
            }
        });
        fileView();
    });
}

function addFile(elem, parentElem, className, fileKind, fileName, fileId, divClass, saveDataWrap, checkbox) {
    elem.addEventListener('click', () => {
        const saveData = document.querySelector(saveDataWrap);
        const inputFile = document.createElement('input');
        const beforInputFile = document.querySelector(fileId);
        const checkInput = document.querySelector(checkbox);

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
                    '<div class="file-info" class=' +
                    divClass +
                    '>' +
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

                elem.innerHTML = '<span class="material-symbols-outlined">add</span>변 경';
                div.querySelector('.remove').addEventListener('click', () => {
                    div.remove();
                    inputFile.remove();
                    elem.innerHTML = '<span class="material-symbols-outlined">add</span>추 가';
                });

                if (beforInputFile != undefined) {
                    beforInputFile.remove();
                }
                parentElem.append(div);
                if (saveData != null) {
                    checkInput.checked = true;
                    saveData.remove();
                }
            }
        });
    });
}

//카카오지도
document.getElementById('address_kakao').addEventListener('click', function () {
    //주소입력칸을 클릭하면
    //카카오 지도 발생
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
//전체선택
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
