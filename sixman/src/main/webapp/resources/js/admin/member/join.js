const profileBtn = document.querySelector('#add-pic');
const profileBox = document.querySelector('#profile-pic');
const resumeBtn = document.querySelector('#add-resume');
const resumeBox = document.querySelector('#resume');
const accountBtn = document.querySelector('#add-account');
const accountBox = document.querySelector('#copy-account');
const attBtn = document.querySelector('#add-attfile');
const attBox = document.querySelector('.att-filelist');
const attFileDelete = document.querySelector('#remove-attfile');

addFile(profileBtn, profileBox, 'pic-wrap', 'image', 'picFile');
addFile(resumeBtn, resumeBox, 'resume-wrap', 'draft', 'resumeFile');
addFile(accountBtn, accountBox, 'account-wrap', 'image', 'accountFile');
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
        inputFile.setAttribute('name', 'attfile');
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

function addFile(elem, parentElem, className, fileKind, fileName) {
    elem.addEventListener('click', () => {
        const inputFile = document.createElement('input');
        inputFile.setAttribute('type', 'file');
        inputFile.setAttribute('name', fileName);
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
