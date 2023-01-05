const selectEmpImg = document.querySelector('#emp-img');
const selectEmpName = document.querySelector('#emp-name');
const selectEmpPosition = document.querySelector('#emp-position');
const selectEmpEmail = document.querySelector('#emp-email');
const selectEmpTeam = document.querySelector('#emp-team');
const selectEmpDept = document.querySelector('#emp-dept');

//부모에게 객체 배열 전달
const pushBtn = document.querySelector('#push');
pushBtn.addEventListener('click', ()=>{
    let memberArr = [];
    const checkedMember = document.querySelectorAll('.selectOne:checked');

    checkedMember.forEach((target)=>{
        let memberObj = {};
        const parentElem = target.closest('div');
        const no = target.value;
        const name = parentElem.querySelector('.list-name').innerHTML;
        const position = parentElem.querySelector('.list-position').innerHTML;
        const dept = parentElem.querySelector('.list-dept').innerHTML;
        const team = parentElem.querySelector('.list-team').innerHTML;
        const email = parentElem.querySelector('.list-email').innerHTML;
        
        memberObj.no = no;
        memberObj.name = name;
        memberObj.position = position;
        memberObj.dept = dept;
        memberObj.team = team;
        memberObj.email = email;
        
        memberArr.push(memberObj);
    });

    window.opener.childValue(memberArr);
    window.close();
});



function selectMember(radio) {
    // const div = document.createElement('div');
    const parentElem = radio.closest('div');
    const name = parentElem.querySelector('.list-name').innerHTML;
    const position = parentElem.querySelector('.list-position').innerHTML;
    const dept = parentElem.querySelector('.list-dept').innerHTML;
    const team = parentElem.querySelector('.list-team').innerHTML;
    const email = parentElem.querySelector('.list-email').innerHTML;

    function imgName() {
        const imgName = parentElem.querySelector('.list-file').innerHTML;
        if (imgName != '') {
            return '/sixman/resources/img/profile/' + imgName;
        }
        return '/sixman/resources/img/defaultProfilePic.png';
    }
    selectEmpImg.setAttribute('src', imgName());
    selectEmpName.innerHTML = name;
    selectEmpPosition.innerHTML = position;
    selectEmpDept.innerHTML = dept;
    selectEmpTeam.innerHTML = team;
    selectEmpEmail.setAttribute('href', '/sixman/mail/write?email=' + email);
}


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
