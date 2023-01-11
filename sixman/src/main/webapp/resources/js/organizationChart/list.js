const selectEmpImg = document.querySelector('#emp-img');
const selectEmpName = document.querySelector('#emp-name');
const selectEmpPosition = document.querySelector('#emp-position');
const selectEmpEmail = document.querySelector('#emp-email');
const selectEmpTeam = document.querySelector('#emp-team');
const selectEmpDept = document.querySelector('#emp-dept');
const selectEmpAddress = document.querySelector('#emp-add');
//개별선택
selectMemberOne();
function selectMemberOne() {
    const selectMemberBox = document.querySelectorAll('input[name="memberInfo"]');

    selectMemberBox.forEach((target) => {
        target.addEventListener('change', () => {
            selectMember(target);
        });
    });
}

function selectMember(radio) {
    // const div = document.createElement('div');
    const parentElem = radio.closest('div');
    const name = parentElem.querySelector('.list-name').innerHTML;
    const position = parentElem.querySelector('.list-position').innerHTML;
    const dept = parentElem.querySelector('.list-dept').innerHTML;
    const team = parentElem.querySelector('.list-team').innerHTML;
    const email = parentElem.querySelector('.list-email').innerHTML;
    const phone = parentElem.querySelector('.list-phone').value;

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
    selectEmpAddress.setAttribute('href', '/sixman/address/add?email=' + email + '&name=' + name + '&position=' + position + '&phone=' + phone);
}
