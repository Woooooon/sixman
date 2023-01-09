var ctx = document.getElementById('myChart').getContext('2d');
var chart = new Chart(ctx, {
    // 만들기 원하는 차트의 유형
    type: 'doughnut',

    // 데이터 집합을 위한 데이터
    data: {
        labels: ['영업부', '마케팅부', '인사부', '관리부', '물류부'],
        datasets: [
            {
                backgroundColor: [
                    'rgb(255, 99, 132)',
                    'rgb(54, 162, 235)',
                    'rgb(255, 206, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(153, 102, 255)',
                    'rgb(255, 159, 64)',
                    'rgb(255, 99, 132)',
                    'rgb(54, 162, 235)',
                    'rgb(255, 206, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(153, 102, 255)',
                    'rgb(255, 159, 64)',
                ],
                data: [1, 2, 3, 4, 5],
            },
        ],
    },

    // 설정은 여기서 하세요
    options: {
        legend: {
            display: false,
        },
    },
});

// loadCompanyMap();

// function loadCompanyMap() {
//     var mapContainer = document.getElementById('map'), // 지도를 표시할 div
//         mapOption = {
//             center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
//             level: 3, // 지도의 확대 레벨
//         };

//     // 지도를 생성합니다
//     var map = new kakao.maps.Map(mapContainer, mapOption);

//     // 주소-좌표 변환 객체를 생성합니다
//     var geocoder = new kakao.maps.services.Geocoder();

//     // 주소로 좌표를 검색합니다
//     geocoder.addressSearch(document.querySelector('#address').value, function (result, status) {
//         // 정상적으로 검색이 완료됐으면
//         if (status === kakao.maps.services.Status.OK) {
//             var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

//             // 결과값으로 받은 위치를 마커로 표시합니다
//             var marker = new kakao.maps.Marker({
//                 map: map,
//                 position: coords,
//             });

//             // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
//             map.setCenter(coords);
//         }
//     });
// }

// $('#address_kakao').click(function () {
//     var mapContainer = document.getElementById('map'), // 지도를 표시할 div
//         mapOption = {
//             center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
//             level: 3, // 지도의 확대 레벨
//         };
//     // 버튼을 click했을때
//     //카카오지도
//     new daum.Postcode({
//         oncomplete: function (data) {
//             document.getElementById('address').value = data.address; // 주소 넣기
//             // 지도를 생성합니다
//             var map = new kakao.maps.Map(mapContainer, mapOption);

//             // 주소-좌표 변환 객체를 생성합니다
//             var geocoder = new kakao.maps.services.Geocoder();

//             // 주소로 좌표를 검색합니다
//             geocoder.addressSearch($('#address').val(), function (result, status) {
//                 // 정상적으로 검색이 완료됐으면
//                 if (status === kakao.maps.services.Status.OK) {
//                     var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

//                     // 결과값으로 받은 위치를 마커로 표시합니다
//                     var marker = new kakao.maps.Marker({
//                         map: map,
//                         position: coords,
//                     });

//                     // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
//                     map.setCenter(coords);
//                 }
//             });
//         },
//     }).open();
// });

// //subList 함수 호출
// subDeptList();
// const teamListBox = document.querySelector('.team-list');

// //로드시 기존 deptlist에 subList 불러오는 이벤트 주입
// function subDeptList() {
//     const deptRadioBtn = document.querySelectorAll('input[name=deptNo');

//     deptRadioBtn.forEach((checked) => {
//         checked.addEventListener('change', () => {
//             previewSubDeptListAjax(checked);
//         });
//     });
// }

// //클릭시 sublist보는 함수 호출
// function previewSubDeptListAjax(checked) {
//     const teamInput = document.querySelector('#newTeamName');
//     teamInput.readOnly = false;
//     teamListBox.innerHTML = '';
//     const no = checked.parentElement.querySelector('p[class="deptNo"]').innerHTML;
//     const deptNo = document.querySelector('#deptNo');
//     deptNo.value = no;

//     $.ajax({
//         url: '/sixman/dept/sublist',
//         method: 'POST',
//         data: {
//             no: no,
//         },
//         success: (teamList) => {
//             teamList.forEach((element) => {
//                 const item = document.createElement('div');
//                 item.setAttribute('class', 'team-item');
//                 item.innerHTML =
//                     '<p class="teamNo">' +
//                     element.teamNo +
//                     '</p>' +
//                     '<div>' +
//                     '<span class="material-symbols-outlined"> label </span>' +
//                     '<p class="teamName">' +
//                     element.teamName +
//                     '</p>' +
//                     '</div>' +
//                     '<span class="material-symbols-outlined remove-team"> do_not_disturb_on </span>';
//                 const removeBtn = item.querySelector('.remove-team');

//                 removeBtn.addEventListener('click', () => {
//                     removeTeamAjax(removeBtn);
//                 });

//                 teamListBox.append(item);
//             });
//         },
//         error: (error) => {
//             console.log(error);
//         },
//     });
// }

// //부서 삭제
// removeDept();
// function removeDept() {
//     const removeBtn = document.querySelectorAll('.remove-dept');
//     removeBtn.forEach((elem) => {
//         removeDeptAjax(elem);
//     });
// }
// //부서 제거 ajax
// function removeDeptAjax(elem) {
//     const teamInput = document.querySelector('#newTeamName');
//     const parentDiv = elem.parentElement;
//     const no = parentDiv.querySelector('p[class=deptNo]').innerHTML;

//     elem.addEventListener('click', () => {
//         popup.confirmPop('주의', '부서를 폐부 하시면 하위 조직도 지워집니다.', () => {
//             $.ajax({
//                 url: '/sixman/dept/delete',
//                 method: 'POST',
//                 data: {
//                     no: no,
//                 },
//                 dataType: 'text',
//                 success: (msg) => {
//                     popup.alertPop('성공', msg);
//                     parentDiv.remove();
//                     teamListBox.innerHTML = '';
//                 },
//                 error: (error) => {
//                     console.log(error);
//                 },
//             }); //ajax
//         }); //confirm
//     }); //event
// } //function

// //팀제거 ajax
// function removeTeamAjax(elem) {
//     const parentDiv = elem.parentElement;
//     const no = parentDiv.querySelector('p[class=teamNo]').innerHTML;

//     elem.addEventListener('click', () => {
//         popup.confirmPop('주의', '팀을 삭제하시겠습니까?.', () => {
//             $.ajax({
//                 url: '/sixman/team/delete',
//                 method: 'POST',
//                 data: {
//                     no: no,
//                 },
//                 dataType: 'text',
//                 success: (msg) => {
//                     popup.alertPop('성공', msg);
//                     parentDiv.remove();
//                 },
//                 error: (error) => {
//                     console.log(error);
//                 },
//             }); //ajax
//         }); //confirm
//     }); //event
// } //function

// //직급 제거
// removePosition();
// function removePosition() {
//     const removeBtn = document.querySelectorAll('.remove-position');
//     removeBtn.forEach((elem) => {
//         removePositionAjax(elem);
//     });
// }

// //직급 제거 ajax
// function removePositionAjax(elem) {
//     const parentDiv = elem.parentElement;
//     const no = parentDiv.querySelector('p[class=positionNo]').innerHTML;

//     elem.addEventListener('click', () => {
//         popup.confirmPop('주의', '해당 직급을 삭제하시면 직급 당사자들은 사원 직급으로 지정 됩니다.', () => {
//             $.ajax({
//                 url: '/sixman/position/delete',
//                 method: 'POST',
//                 data: {
//                     no: no,
//                 },
//                 dataType: 'text',
//                 success: (msg) => {
//                     popup.alertPop('성공', msg);
//                     parentDiv.remove();
//                 },
//                 error: (error) => {
//                     console.log(error);
//                 },
//             }); //ajax
//         }); //confirm
//     }); //event
// } //function

// //부서 추가
// $('#insertDept').click(() => {
//     const deptName = $('#newDeptName').val();

//     popup.confirmPop('제안', '새로운 부서를 창설하시겠습니까?', () => {
//         $.ajax({
//             url: '/sixman/dept/insert',
//             method: 'POST',
//             data: {
//                 name: deptName,
//             },
//             success: (dept) => {
//                 const div = document.createElement('div');
//                 div.setAttribute('class', 'dept-item');
//                 div.innerHTML =
//                     '<input type="radio" class="newRadio" id="deptNo' +
//                     dept.deptNo +
//                     '" name="deptNo" />' +
//                     '<p class="deptNo">' +
//                     dept.deptNo +
//                     '</p>' +
//                     '<label for="deptNo' +
//                     dept.deptNo +
//                     '" class="show-team">' +
//                     '<span class="material-symbols-outlined"> bookmark </span>' +
//                     '<p class="deptName">' +
//                     dept.deptName +
//                     '</p>' +
//                     '</label>' +
//                     '<span class="material-symbols-outlined remove-dept"> do_not_disturb_on </span>';

//                 const radioBtn = div.querySelector('.newRadio');
//                 console.log(radioBtn);
//                 radioBtn.addEventListener('change', () => {
//                     previewSubDeptListAjax(radioBtn);
//                 });

//                 const removeBtn = div.querySelector('.remove-dept');
//                 removeBtn.addEventListener('click', () => {
//                     removeDeptAjax(removeBtn);
//                 });

//                 $('.dept-list').append(div);
//                 $('#newDeptName').val('');
//             },
//             error: (error) => {
//                 console.log(error);
//             },
//         }); //ajax
//     }); //confirm
// }); //event

// //팀 추가
// $('#insertTeam').click(() => {
//     const temaName = $('#newTeamName').val();
//     const deptNo = $('#deptNo').val();

//     popup.confirmPop('제안', '새로운 부서를 창설하시겠습니까?', () => {
//         $.ajax({
//             url: '/sixman/team/insert',
//             method: 'POST',
//             data: {
//                 deptNo: deptNo,
//                 name: temaName,
//             },
//             success: (team) => {
//                 const item = document.createElement('div');
//                 item.setAttribute('class', 'team-item');
//                 item.innerHTML =
//                     '<p class="teamNo">' +
//                     team.teamNo +
//                     '</p>' +
//                     '<div>' +
//                     '<span class="material-symbols-outlined"> label </span>' +
//                     '<p class="teamName">' +
//                     team.teamName +
//                     '</p>' +
//                     '</div>' +
//                     '<span class="material-symbols-outlined remove-team"> do_not_disturb_on </span>';

//                 const removeBtn = item.querySelector('.remove-team');

//                 removeBtn.addEventListener('click', () => {
//                     removeTeamAjax(removeBtn);
//                 });

//                 teamListBox.append(item);
//                 $('#newTeamName').val('');
//             },
//             error: (error) => {
//                 console.log(error);
//             },
//         }); //ajax
//     }); //confirm
// }); //event

// //직급 추가
// $('#insertPosition').click(() => {
//     const positionName = $('#newPositionName').val();

//     popup.confirmPop('제안', '새로운 [' + positionName + '] 직급을 추가 하시겠습니까?', () => {
//         $.ajax({
//             url: '/sixman/position/insert',
//             method: 'POST',
//             data: {
//                 name: positionName,
//             },
//             success: (position) => {
//                 const item = document.createElement('div');
//                 item.setAttribute('class', 'position-item');
//                 item.innerHTML =
//                     '<p class="positionNo">' +
//                     position.no +
//                     '</p>' +
//                     '<div>' +
//                     '<span class="material-symbols-outlined"> assignment_ind </span>' +
//                     '<p class="positionName">' +
//                     position.position +
//                     '</p>' +
//                     '</div>' +
//                     '<span class="material-symbols-outlined remove-position"> do_not_disturb_on </span>';

//                 const removeBtn = item.querySelector('.remove-position');

//                 removeBtn.addEventListener('click', () => {
//                     removePositionAjax(removeBtn);
//                 });

//                 document.querySelector('.position-list').append(item);
//                 $('#newPositionName').val('');
//             },
//             error: (error) => {
//                 console.log(error);
//             },
//         }); //ajax
//     }); //confirm
// });

// const form = document.querySelector('#form');
// const companyName = document.querySelector('input[name="name"]');
// const license = document.querySelector('input[name="license"]');
// const phone = document.querySelector('input[name="phone"]');
// const address = document.querySelector('input[name="address"]');

// const phoneRegex = /^\d{2,3}\d{3,4}\d{4}$/;
// const numRegex = /^[0-9]+$/;

// form.onsubmit = () => {
//     if (companyName.value == '') {
//         nullCheck(companyName);
//     }

//     if (license.value == '') {
//         nullCheck(license);
//     }

//     const checkcompanyName = companyName.classList.contains('error');
//     const checkPhone = phone.classList.contains('error');
//     const checkLicense = license.classList.contains('error');

//     if (checkcompanyName) {
//         return false;
//     }

//     if (checkPhone) {
//         return false;
//     }

//     if (checkLicense) {
//         return false;
//     }

//     return true;
// };

// companyName.addEventListener('blur', () => {
//     nullCheck(companyName);
// });

// license.addEventListener('blur', () => {
//     doubleMatch(license, numRegex, '제시한 형식에 맞게 작성하세요');
// });

// phone.addEventListener('blur', () => {
//     match(phone, phoneRegex, '제시한 형식에 맞게 작성하세요');
// });

// function nullCheck(elem) {
//     const errors = elem.parentElement.querySelectorAll('p');
//     errors.forEach((error) => {
//         error.remove();
//         elem.classList.remove('error');
//     });

//     if (elem.value == '') {
//         const errorMsg = document.createElement('p');
//         errorMsg.innerText = '필수입력 항목입니다.';
//         elem.parentElement.append(errorMsg);
//         elem.classList.add('error');
//         return;
//     }
// }

// function doubleMatch(elem, regex, messege) {
//     const errors = elem.parentElement.querySelectorAll('p');
//     errors.forEach((error) => {
//         error.remove();
//     });

//     if (elem.value == '') {
//         const errorMsg = document.createElement('p');
//         errorMsg.innerText = '필수입력 항목입니다.';
//         elem.parentElement.append(errorMsg);
//         elem.classList.add('error');
//         return;
//     }

//     match(elem, regex, messege);
// }

// function match(elem, regx, messege) {
//     elem.classList.remove('error');

//     const value = elem.value;

//     if (value != '') {
//         if (!regx.test(value)) {
//             const errorMsg = document.createElement('p');
//             errorMsg.innerText = messege;
//             elem.parentElement.append(errorMsg);
//             elem.classList.add('error');
//             return;
//         }
//     }
//     const errors = elem.parentElement.querySelectorAll('p');
//     errors.forEach((error) => {
//         error.remove();
//     });
// }

// fileView();
// //파일미리보기
// function fileView() {
//     const fileDOM = document.querySelector('#companyLogo');
//     const preview = document.querySelector('#img-box');

//     fileDOM.addEventListener('change', () => {
//         const reader = new FileReader();
//         reader.onload = ({ target }) => {
//             preview.src = target.result;
//         };
//         reader.readAsDataURL(fileDOM.files[0]);
//     });
// }
