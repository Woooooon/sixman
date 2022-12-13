const removeMember = document.querySelector('.remove-emp');
const selectCencle = document.querySelector('.removeBtn');
// const selectMember = document.querySelectorAll('.list-item');

// console.log(selectMember);
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

removeMember.addEventListener('click', () => {
    const checkBox = document.querySelectorAll('.list-item:has(input:checked)');
    checkBox.forEach((selectBox) => {
        selectBox.remove();
    });
});

selectCencle.addEventListener('click', () => {
    const selectMember = document.querySelector('.select-employee-list');
    selectMember.remove();
});
