checkBoxToggleEvent('.selectAll', '.cardCheck');

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
    const none_check = document.querySelectorAll('.cardCheck:not(:checked)');
    const is_check = document.querySelectorAll('.cardCheck:checked');

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

//전체선택된것 삭제
document.querySelector('.delete').addEventListener('click', () => {
    const modifyBox = document.querySelectorAll('.card-item:has(input:not(:checked))');

    const selectBox = document.querySelectorAll('.card-item:has(input:checked)');
    const reciveNo = document.querySelector('#reciveInfo').value;

    let modifyNumList = '';

    for (let index = 0; index < modifyBox.length; index++) {
        modifyNumList += modifyBox[index].querySelector('input[type="checkbox"]').value;

        if (index != modifyBox.length - 1) {
            modifyNumList += ',';
        }
    }

    if (selectBox.length < 1) return;
    popup.confirmPop('주의', '삭제하시겠습니까?', () => {
        $.ajax({
            url: '/sixman/address/recive/detail/delete',
            method: 'POST',
            traditional: true,
            data: {
                no: reciveNo,
                modifySendAddress: modifyNumList,
            },
            dataType: 'text',
            success: (msg) => {
                selectBox.forEach((selectBox) => {
                    selectBox.remove();
                });
                popup.alertPop('성공', msg, () => {
                    if (modifyBox.length < 1) {
                        location.href = '/sixman/address/recive';
                    }
                });
            },
            error: function (error) {
                console.log('error: ' + error);
            },
        });
    });
});

//전체선택된것 주소록 추가
document.querySelector('.insert').addEventListener('click', () => {
    const modifyBox = document.querySelectorAll('.card-item:has(input:not(:checked))');

    const selectBox = document.querySelectorAll('.card-item:has(input:checked)');
    const reciveNo = document.querySelector('#reciveInfo').value;

    let modifyNumList = '';

    for (let index = 0; index < modifyBox.length; index++) {
        modifyNumList += modifyBox[index].querySelector('input[type="checkbox"]').value;

        if (index != modifyBox.length - 1) {
            modifyNumList += ',';
        }
    }

    let insertNumList = '';
    for (let index = 0; index < selectBox.length; index++) {
        insertNumList += selectBox[index].querySelector('input[type="checkbox"]').value;

        if (index != selectBox.length - 1) {
            insertNumList += ',';
        }
    }

    if (selectBox.length < 1) return;
    popup.confirmPop('추가하시겠습니까?', '추가 된 주소는 내 주소록에 추가 됩니다.', () => {
        $.ajax({
            url: '/sixman/address/recive/detail/insert',
            method: 'POST',
            traditional: true,
            data: {
                no: reciveNo,
                modifySendAddress: modifyNumList,
                insertNum: insertNumList,
            },
            dataType: 'text',
            success: (msg) => {
                selectBox.forEach((selectBox) => {
                    selectBox.remove();
                });
                popup.alertPop('성공', msg, () => {
                    if (modifyBox.length < 1) {
                        location.href = '/sixman/address/recive';
                    }
                });
            },
            error: function (error) {
                console.log('error: ' + error);
            },
        });
    });
});
