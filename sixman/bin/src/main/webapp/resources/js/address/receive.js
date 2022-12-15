const deleteAllBtn = document.querySelector('.deleteAllBtn');

//전체석택
checkBoxToggleEvent('.selectAll', '.selectOne');
checkBoxToggleEvent('.selectBoxAll', '.selectBoxOne');
checkBoxToggleEvent('.selectBoxAll2', '.selectBox2');
checkBoxToggleEvent('.selectBoxAll3', '.selectBox3');

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
deleteAllBtn.addEventListener('click', () => {
    const selectBox = document.querySelectorAll('.receive-address .card-container:has(input:checked)');
    selectBox.forEach((selectBox) => {
        selectBox.parentNode.parentNode.remove();
    });
});
