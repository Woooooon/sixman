checkBoxToggleEvent('.selectAll', '.selectOne');

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
    const none_check = document.querySelectorAll('.selectOne:not(:checked)');
    const is_check = document.querySelectorAll('.selectOne:checked');

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

//선택된것 삭제
document.querySelector('#delete').addEventListener('click', () => {
    const selectBox = document.querySelectorAll('.card-item:has(input:checked)');
    let addressArray = [];

    selectBox.forEach((box) => {
        const selectAddressNum = box.querySelector('input[type="checkbox"]').value;
        addressArray.push(selectAddressNum);
    });

    if (selectBox.length < 1) return;
    popup.confirmPop('삭제하시겠습니까?', '삭제된 주소를 복원시키시려면 휴지통에서 복원시키실 수 있습니다.', () => {
        $.ajax({
            url: '/sixman/address/bin/delete',
            method: 'POST',
            traditional: true,
            data: {
                no: addressArray,
            },
            dataType: 'text',
            success: (msg) => {
                popup.alertPop('성공', msg);

                selectBox.forEach((selectBox) => {
                    selectBox.remove();
                });
            },
            error: function (error) {
                console.log('error: ' + error);
            },
        });
    });
});

//선택된것 복원
document.querySelector('#restore').addEventListener('click', () => {
    const selectBox = document.querySelectorAll('.card-item:has(input:checked)');
    let addressArray = [];

    selectBox.forEach((box) => {
        const selectAddressNum = box.querySelector('input[type="checkbox"]').value;
        addressArray.push(selectAddressNum);
    });

    if (selectBox.length < 1) return;
    popup.confirmPop('복원하시겠습니까?', '복원시키시면 내 주소록에서 찾아 볼 수 있습니다.', () => {
        $.ajax({
            url: '/sixman/address/bin/restore',
            method: 'POST',
            traditional: true,
            data: {
                no: addressArray,
            },
            dataType: 'text',
            success: (msg) => {
                popup.alertPop('성공', msg);

                selectBox.forEach((selectBox) => {
                    selectBox.remove();
                });
            },
            error: function (error) {
                console.log('error: ' + error);
            },
        });
    });
});
