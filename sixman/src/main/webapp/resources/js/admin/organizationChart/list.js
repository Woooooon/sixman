const removeMember = document.querySelector('.remove-emp');
const selectCencle = document.querySelector('.removeBtn');

//전체석택
checkBoxToggleEvent('.selectAll', '.selectOne');

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
    checkBox.forEach((el_check) => {
        el_check.addEventListener('change', function () {
            checkBoxToggle(all_selector, check_selector);
        });
    });
}

//전체선택된것 삭제
removeMember.addEventListener('click', () => {
    const checkBox = document.querySelectorAll('.list-item:has(input:checked)');
    checkBox.forEach((selectBox) => {
        selectBox.remove();
    });
});

// div select박스
document.querySelector('.select').addEventListener('click', onClickSelect);
function onClickSelect(e) {
    const isActive = e.currentTarget.className.indexOf('active') !== -1;
    if (isActive) {
        e.currentTarget.className = 'select';
    } else {
        e.currentTarget.className = 'select active';
    }
}
function onClickOption(e) {
    const selectedValue = e.currentTarget.innerHTML;
    document.querySelector('.text').innerHTML = selectedValue;
}

var optionList = document.querySelectorAll('.option');
for (var i = 0; i < optionList.length; i++) {
    var option = optionList[i];
    option.addEventListener('click', onClickOption);
}

//jstree
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

addSelectMember();
//checkbox 클릭시 선택된 사원목록에 appand
function addSelectMember() {
    const selectOne = document.querySelectorAll('.selectOne');
    selectOne.forEach((elem) => {
        elem.addEventListener('click', () => {
            const parentElem = document.querySelector('.sep');
            const div = document.createElement('div');
            if ((elem.checked = true)) {
                div.classList.add('select-employee-list');
                div.innerHTML =
                    '<div class="select-employee-box">' +
                    '<div class="select-employee-pic">' +
                    '<img src="/sixman/resources/img/jang.jpg" alt="" />' +
                    '</div>' +
                    '<div class="info-box">' +
                    '<div class="select-dept-info">' +
                    '<p>영업부</p>' +
                    '<p>영업 2팀</p>' +
                    '</div>' +
                    '<div class="select-employee-info">' +
                    '<p>구기석</p>' +
                    '<p>부장</p>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '<span class="material-symbols-outlined removeBtn">person_remove</span>';

                div.querySelector('.removeBtn').addEventListener('click', () => {
                    div.remove();
                });
                parentElem.after(div);
            } else {
                div.remove();
            }
        });
    });
}
