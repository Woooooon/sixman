const addCateBtn = document.querySelector('input[type="button"]');
const removeCate = document.querySelectorAll('#remove');
const submit = document.querySelector('#cateSet');
const box = document.querySelector('.sortation-list');
const deleteSubmit = document.querySelector('#delete');

let deleteList = [];
let createList = [];

addCateBtn.addEventListener('click', () => {
    const addCateName = document.querySelector('#cateName').value;
    if (addCateName == '') {
        return;
    }

    const item = document.createElement('ul');

    item.innerHTML =
        '<div class="sortation-item">' +
        '<div class="toggleBtn">' +
        '<span class="material-symbols-outlined"> diversity_2 </span>' +
        '</div>' +
        addCateName +
        '</div>' +
        '<span class="material-symbols-outlined" id="remove">delete </span>';

    item.querySelector('#remove').addEventListener('click', () => {
        item.remove();
        for (let index = 0; index < createList.length; index++) {
            if (createList[index] === addCateName) {
                createList.splice(index, 1);
                index--;
            }
        }
    });

    createList.push(addCateName);
    document.querySelector('#cateName').value = '';
    box.append(item);
});

removeCate.forEach((removeBtn) => {
    removeBtn.addEventListener('click', () => {
        const parentElem = removeBtn.previousElementSibling;
        console.log(parentElem);

        const cateNo = parentElem.querySelector('input[type="checkbox"]').value;
        popup.confirmPop('주의', '카테고리 삭제 시 하위 주소록은 기본 카테고리로 이동합니다.', () => {
            deleteList.push(cateNo);
            parentElem.parentElement.remove();
            console.log(deleteList);
        }, true, true);
    });
});

submit.addEventListener('click', () => {
    deleteSubmit.value = deleteList.toString(',');

    if (deleteSubmit.value == '' && createList.length == 0) return;
    console.log(createList);

    popup.confirmPop('완료', '수정을 완료합니다.', () => {
        $.ajax({
            url: '/sixman/address/category',
            method: 'POST',
            traditional: true,
            data: {
                deleteNo: deleteSubmit.value,
                createNo: createList,
            },
            dataType: 'text',
            success: (msg) => {
                // popup.alertPop('성공', msg);

                opener.document.location.href = '/sixman/address';
                window.close();
            },
            error: function (error) {
                console.warn('error: ' + error);
            },
        });
    }, false, true);
});
