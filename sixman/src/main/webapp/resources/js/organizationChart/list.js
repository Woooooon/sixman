const selectEmpImg = document.querySelector('#emp-img');
const selectEmpName = document.querySelector('#emp-name');
const selectEmpPosition = document.querySelector('#emp-position');
const selectEmpEmail = document.querySelector('#emp-email');
const selectEmpTeam = document.querySelector('#emp-team');
const selectEmpDept = document.querySelector('#emp-dept');

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

// //newbie slide
// const slides = document.querySelector('.newbie-list');
// const slide = document.querySelectorAll('.newbie-box');
// let currentIdx = 0,
//     slideCount = slide.length,
//     slideWidth = 140.469,
//     slideMargin = 30;
// const prev = document.querySelector('#prev');
// const next = document.querySelector('#next');

// makeClone();
// function makeClone() {
//     slide.forEach((target) => {
//         const cloneSlide = target.cloneNode(true);
//         cloneSlide.classList.add('clone');
//         slides.appendChild(cloneSlide);
//     });
//     slide.forEach((target) => {
//         const cloneSlide = target.cloneNode(true);
//         cloneSlide.classList.add('clone');
//         slides.prepend(cloneSlide);
//     });

//     updateWidth();
//     setInitialPos();
//     setTimeout(() => {
//         slides.classList.add('animated');
//     }, 100);
// }

// function updateWidth() {
//     const currentSlides = document.querySelectorAll('.newbie-box');
//     const newSlideCount = currentSlides.length;

//     const newWidth = (slideWidth + slideMargin) * newSlideCount - slideMargin + 'px';
//     slides.style.width = newWidth;
// }

// function setInitialPos() {
//     const initialTranslatValue = -(slideWidth + slideMargin) * slideCount;
//     slides.style.transform = 'translateX(' + initialTranslatValue + 'px)';
// }

// next.addEventListener('click', () => {
//     moveSlide(currentIdx + 1);
// });

// prev.addEventListener('click', () => {
//     moveSlide(currentIdx - 1);
// });

// function moveSlide(num) {
//     slides.style.left = -num * (slideWidth + slideMargin) + 'px';
//     currentIdx = num;
//     if (currentIdx == slideCount || currentIdx == -slideCount) {
//         setTimeout(() => {
//             slides.classList.remove('animated');
//             slides.style.left = '0px';
//             currentIdx = 0;
//         }, 400);
//         setTimeout(() => {
//             slides.classList.add('animated');
//         }, 500);
//     }
// }
