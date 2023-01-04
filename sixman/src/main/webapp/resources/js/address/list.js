const openPop = document.querySelector('input[name="sender"]');

openPop.addEventListener('click', () => {
    openWindowPop('/sixman/employee/popup', '조직도 팝업');
});
function openWindowPop(url, name) {
    var options = 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no';
    window.open(url, name, options);
}

const modal = document.querySelector('.share-modal');
const share = document.querySelectorAll('.share');
const closeBtn = document.querySelector('#close-modal');
const deleteBtn = document.querySelector('.delete');
console.log(deleteBtn);
closeBtn.addEventListener('click', () => {
    modal.classList.add('close');
});

share.forEach((elem) => {
    elem.addEventListener('click', () => {
        modal.classList.remove('close');
    });
});

checkBoxToggleEvent('.selectAll', '.cardCheck');
selectCardOne();

//개별선택
function selectCardOne() {
    const selectCard = document.querySelectorAll('.cardCheck');
    const selectCardAll = document.querySelector('.selectAll');
    const cardInfoList = document.querySelector('.list-sortation');
    selectCard.forEach((target) => {
        const div = shareCard(selectCardAll, target);
        target.addEventListener('change', () => {
            if (target.checked) {
                cardInfoList.after(div);
            } else {
                div.remove();
            }
        });
    });
}

function shareCard(selectAll, checkbox) {
    const div = document.createElement('div');
    const parentElem = checkbox.closest('div');
    const sortation = parentElem.querySelector('.card-sortation p').innerText;
    const company = parentElem.querySelector('#card-company').innerText;
    const name = parentElem.querySelector('#card-name').innerText;
    const phone = parentElem.querySelector('#card-phone').innerText;
    const email = parentElem.querySelector('#card-email').innerText;

    div.classList.add('list-item');
    div.innerHTML =
        '<span class="material-symbols-outlined removeBtn">cancel_schedule_send</span>' +
        '<p>' +
        sortation +
        '</p>' +
        '<p>' +
        company +
        '</p>' +
        '<p>' +
        name +
        '</p>' +
        '<p>' +
        phone +
        '</p>' +
        '<p>' +
        email +
        '</p>';

    div.querySelector('.removeBtn').addEventListener('click', () => {
        checkbox.checked = false;
        selectAll.checked = false;
        div.remove();
    });

    return div;
}

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
deleteBtn.addEventListener('click', () => {
    const selectBox = document.querySelectorAll('.card-item:has(input:checked)');
    let addressArray = [];

    selectBox.forEach((box) => {
        const selectAddressNum = box.querySelector('input[type="checkbox"]').value;
        addressArray.push(selectAddressNum);
    });

    if (selectBox.length < 1) return;
    popup.confirmPop('삭제하시겠습니까?', '삭제된 주소를 복원시키시려면 휴지통에서 복원시키실 수 있습니다.', () => {
        $.ajax({
            url: '/sixman/address/delete',
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
