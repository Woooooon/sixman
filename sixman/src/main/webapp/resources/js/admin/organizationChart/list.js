memberSelectController();
function memberSelectController() {
    const memberDept = document.querySelectorAll('.list-item select[name="deptNo"]');
    memberDept.forEach((target) => {
        const team = target.parentElement.querySelector('select[name="teamNo"]');
        target.addEventListener('change', () => {
            team.innerHTML = '';
            if (target.value != 1) {
                $.ajax({
                    url: '/sixman/dept/sublist',
                    method: 'POST',
                    data: {
                        no: target.value,
                    },
                    dataType: 'json',
                    success: (teamList) => {
                        teamList.forEach((element) => {
                            const option = document.createElement('option');
                            option.setAttribute('value', element.teamNo);
                            option.innerHTML = element.teamName;
                            team.append(option);
                        });
                    },
                    error: () => {
                        popup.alertPop('실패', '부서목록을 조회하지 못하였습니다.');
                    },
                });
            }
        });
    });
}
memberUpdate();

function memberUpdate() {
    const updateBtn = document.querySelectorAll('.update');
    updateBtn.forEach((target) => {
        target.addEventListener('click', () => {
            const memberNo = target.parentElement.querySelector('input[type="checkbox"]').value;
            const memberDept = target.parentElement.querySelector('select[name="deptNo"]').value;
            const memberTeam = target.parentElement.querySelector('select[name="teamNo"]').value;
            const memberLevel = target.parentElement.querySelector('select[name="authorizeList"]').value;
            const memberPosition = target.parentElement.querySelector('select[name="positionNo"]').value;
            $.ajax({
                url: '/sixman/admin/member/update',
                method: 'POST',
                data: {
                    no: memberNo,
                    positionNo: memberPosition,
                    deptNo: memberDept,
                    teamNo: memberTeam,
                    authorizeNo: memberLevel,
                },
                dataType: 'text',
                success: (msg) => {
                    popup.alertPop('성공', msg);
                },
                error: (error) => {
                    popup.alertPop('실패', '수정을 실패했습니다.');
                },
            }); //ajas
        }); //event
    }); //foreach
} //function
const removeMember = document.querySelector('.remove-emp');
const selectCencle = document.querySelector('.removeBtn');

selectMemberOne();
checkBoxToggleEvent('.selectAll', '.selectOne');

//개별선택
function selectMemberOne() {
    const selectMemberBox = document.querySelectorAll('.selectOne');
    const selectMemberAll = document.querySelector('.selectAll');
    const memberInfoList = document.querySelector('.sep');
    selectMemberBox.forEach((target) => {
        const div = selectMember(selectMemberAll, target);
        target.addEventListener('change', () => {
            if (target.checked) {
                memberInfoList.after(div);
            } else {
                div.remove();
            }
        });
    });
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
        selectAll.setAttribute('checked', 'checked');
        selectAll.checked = true;
    } else {
        selectAll.removeAttribute('checked', 'checked');
        selectAll.checked = false;
    }
}

function selectMember(selectAll, checkbox) {
    const div = document.createElement('div');
    const parentElem = checkbox.closest('div');
    const name = parentElem.querySelector('a[name="memberName"]').innerHTML;
    const position = parentElem.querySelector('select[name="positionNo"]');
    const positionName = position.options[position.selectedIndex].text;
    const dept = parentElem.querySelector('select[name="deptNo"]');
    const deptName = dept.options[dept.selectedIndex].text;
    const team = parentElem.querySelector('select[name="teamNo"]');

    function teamName() {
        const teamOption = team.querySelector('option');
        if (teamOption != null) {
            const teamName = team.options[team.selectedIndex].text;
            return teamName;
        }
        return '';
    }

    function imgName() {
        const imgName = parentElem.querySelector('p[name="imgName"]').innerHTML;
        if (imgName != '') {
            return '<img src="/sixman/resources/img/profile/' + imgName + '" art="" />';
        }
        return '<img src="/sixman/resources/img/defaultProfilePic.png" alt="" />';
    }

    div.classList.add('select-employee-list');
    div.innerHTML =
        '<div class="select-employee-box">' +
        '<div class="select-employee-pic">' +
        imgName() +
        '</div>' +
        '<div class="info-box">' +
        '<div class="select-dept-info">' +
        '<p>' +
        deptName +
        '</p>' +
        '<p>' +
        teamName() +
        '</p>' +
        '</div>' +
        '<div class="select-employee-info">' +
        '<p>' +
        name +
        '</p>' +
        '<p>' +
        positionName +
        '</p>' +
        '</div>' +
        '</div>' +
        '</div>' +
        '<span class="material-symbols-outlined removeBtn">person_remove</span>';

    div.querySelector('.removeBtn').addEventListener('click', () => {
        checkbox.checked = false;
        selectAll.checked = false;
        div.remove();
    });

    return div;
}

//전체선택된것 삭제
removeMember.addEventListener('click', () => {
    popup.confirmPop('제안', '선택된 사원을 퇴사 처리하시겠습니까?', () => {
        const checkBox = document.querySelectorAll('.list-item:has(input:checked)');
        let memberArray = [];
        checkBox.forEach((box) => {
            const selectMemberNum = box.querySelector('input[type="checkbox"]').value;
            memberArray.push(selectMemberNum);
        });
        console.log(memberArray);
        $.ajax({
            url: '/sixman/admin/member/delete',
            method: 'POST',
            traditional: true,
            data: {
                no: memberArray,
            },
            dataType: 'text',
            success: (msg) => {
                popup.alertPop('성공', msg);

                checkBox.forEach((selectBox) => {
                    selectBox.remove();
                });
            },
            error: function (request, status, error) {
                console.log('code: ' + request.status);
                console.log('message: ' + request.responseText);
                console.log('error: ' + error);
            },
        });
    });
});

// div select박스
// document.querySelector('.select').addEventListener('click', onClickSelect);
// function onClickSelect(e) {
//     const isActive = e.currentTarget.className.indexOf('active') !== -1;
//     if (isActive) {
//         e.currentTarget.className = 'select';
//     } else {
//         e.currentTarget.className = 'select active';
//     }
// }
// function onClickOption(e) {
//     const selectedValue = e.currentTarget.innerHTML;
//     document.querySelector('.text').innerHTML = selectedValue;
// }

// var optionList = document.querySelectorAll('.option');
// for (var i = 0; i < optionList.length; i++) {
//     var option = optionList[i];
//     option.addEventListener('click', onClickOption);
// }

//jstree
$(function () {
    $('#jstree').jstree();

    $('#jstree').on('changed.jstree', function (e, data) {
        console.log(data.selected);
    });

    $('button').on('click', function () {
        $('#jstree').jstree(true).select_node('child_node_1');
        $('#jstree').jstree('select_node', 'child_node_1');
        $.jstree.reference('#jstree').select_node('child_node_1');
    });
});

$('#jstree').on('open_node.jstree', function (e, data) {
    var icon = $('#' + data.node.id)
        .find('i.jstree-icon.jstree-themeicon')
        .first();
    icon.removeClass('fa-folder').addClass('fa-folder-open');
});

// bind customize icon change function in jsTree close_node event.
$('#jstree').on('close_node.jstree', function (e, data) {
    var icon = $('#' + data.node.id)
        .find('i.jstree-icon.jstree-themeicon')
        .first();
    icon.removeClass('fa-folder-open').addClass('fa-folder');
});

//newbie slide
const slides = document.querySelector('.newbie-list');
const slide = document.querySelectorAll('.newbie-box');
let currentIdx = 0,
    slideCount = slide.length,
    slideWidth = 140.469,
    slideMargin = 30;
const prev = document.querySelector('#prev');
const next = document.querySelector('#next');

makeClone();
function makeClone() {
    slide.forEach((target) => {
        const cloneSlide = target.cloneNode(true);
        cloneSlide.classList.add('clone');
        slides.appendChild(cloneSlide);
    });
    slide.forEach((target) => {
        const cloneSlide = target.cloneNode(true);
        cloneSlide.classList.add('clone');
        slides.prepend(cloneSlide);
    });

    updateWidth();
    setInitialPos();
    setTimeout(() => {
        slides.classList.add('animated');
    }, 100);
}

function updateWidth() {
    const currentSlides = document.querySelectorAll('.newbie-box');
    const newSlideCount = currentSlides.length;

    const newWidth = (slideWidth + slideMargin) * newSlideCount - slideMargin + 'px';
    slides.style.width = newWidth;
}

function setInitialPos() {
    const initialTranslatValue = -(slideWidth + slideMargin) * slideCount;
    slides.style.transform = 'translateX(' + initialTranslatValue + 'px)';
}

next.addEventListener('click', () => {
    moveSlide(currentIdx + 1);
});

prev.addEventListener('click', () => {
    moveSlide(currentIdx - 1);
});

function moveSlide(num) {
    slides.style.left = -num * (slideWidth + slideMargin) + 'px';
    currentIdx = num;
    if (currentIdx == slideCount || currentIdx == -slideCount) {
        setTimeout(() => {
            slides.classList.remove('animated');
            slides.style.left = '0px';
            currentIdx = 0;
        }, 400);
        setTimeout(() => {
            slides.classList.add('animated');
        }, 500);
    }
}
