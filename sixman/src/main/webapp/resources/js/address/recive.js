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

const deleteAllBtn = document.querySelector('.deleteAllBtn');
//전체선택된것 삭제
deleteAllBtn.addEventListener('click', () => {
    const selectBox = document.querySelectorAll('.card-item:has(input:checked)');
    let reciveAddress = [];

    selectBox.forEach((box) => {
        const selectAddressNum = box.querySelector('input[type="checkbox"]').value;
        reciveAddress.push(selectAddressNum);
    });

    if (selectBox.length < 1) return;
    popup.confirmPop('삭제하시겠습니까?', '선택 한 항목들이 삭제 됩니다.', () => {
        $.ajax({
            url: '/sixman/address/recive/delete',
            method: 'POST',
            traditional: true,
            data: {
                no: reciveAddress,
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

const reciveAllBtn = document.querySelector('.reciveAllBtn');
//전체선택된것 추가
reciveAllBtn.addEventListener('click', () => {
    const selectBox = document.querySelectorAll('.card-item:has(input:checked)');
    let reciveAddress = [];
    let addressInfo = {};

    selectBox.forEach((box) => {
        const selectAddressNum = box.querySelector('input[type="checkbox"]').value;
        const selectrReciveAddressNum = box.querySelector('input[type="text"]').value;
        addressInfo = {
            no: selectAddressNum,
            addressNo: selectrReciveAddressNum,
        };
        reciveAddress.push(addressInfo);
    });

    if (selectBox.length < 1) return;
    popup.confirmPop('내 주소록에 추가 하시겠습니까?', '선택 한 항목들이 주소록에 추가 됩니다.', () => {
        $.ajax({
            url: '/sixman/address/recive/all',
            method: 'POST',
            traditional: true,
            data: {
                target: JSON.stringify(reciveAddress),
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

//날짜 스타일 변경
changeDate();
function changeDate() {
    const date = document.querySelectorAll('.card-date');
    date.forEach((element) => {
        element.innerText = elapsedTime(element.innerText);
    });
}

function elapsedTime(date) {
    const start = new Date(date);
    const end = new Date();
    console.log('start : ' + start);

    console.log('end : ' + end);

    const diff = (end - start) / 1000;
    console.log('diff' + diff);
    const times = [
        { name: '년', milliSeconds: 60 * 60 * 24 * 365 },
        { name: '개월', milliSeconds: 60 * 60 * 24 * 30 },
        { name: '일', milliSeconds: 60 * 60 * 24 },
        { name: '시간', milliSeconds: 60 * 60 },
        { name: '분', milliSeconds: 60 },
    ];

    for (const value of times) {
        const betweenTime = Math.floor(diff / value.milliSeconds);

        if (betweenTime > 0) {
            return `${betweenTime}${value.name} 전`;
        }
    }
    return '방금 전';
}
