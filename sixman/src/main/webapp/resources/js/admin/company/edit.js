loadCompanyMap();

function loadCompanyMap() {
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3, // 지도의 확대 레벨
        };

    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    // 주소로 좌표를 검색합니다
    geocoder.addressSearch(document.querySelector('#address').value, function (result, status) {
        // 정상적으로 검색이 완료됐으면
        if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords,
            });

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        }
    });
}

$('#address_kakao').click(function () {
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3, // 지도의 확대 레벨
        };
    // 버튼을 click했을때
    //카카오지도
    new daum.Postcode({
        oncomplete: function (data) {
            document.getElementById('address').value = data.address; // 주소 넣기
            // 지도를 생성합니다
            var map = new kakao.maps.Map(mapContainer, mapOption);

            // 주소-좌표 변환 객체를 생성합니다
            var geocoder = new kakao.maps.services.Geocoder();

            // 주소로 좌표를 검색합니다
            geocoder.addressSearch($('#address').val(), function (result, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 결과값으로 받은 위치를 마커로 표시합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords,
                    });

                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                    map.setCenter(coords);
                }
            });
        },
    }).open();
});

// $('select[name="deptNo"]').on('change', () => {
//     $('select[name="teamNo"]').html('');
//     if ($('select[name="deptNo"]').val() != 1) {
//         $.ajax({
//             url: '/sixman/dept/sublist',
//             method: 'POST',
//             data: {
//                 no: $('select[name="deptNo"]').val(),
//             },
//             success: (teamList) => {
//                 teamList.forEach((element) => {
//                     const option = document.createElement('option');
//                     option.setAttribute('value', element.teamNo);
//                     option.innerHTML = element.teamName;
//                     $('select[name="teamNo"]').append(option);
//                 });
//             },
//             error: (teamList) => {
//                 console.log('hi');
//             },
//         });
//     }
// });

const form = document.querySelector('#form');
const companyName = document.querySelector('input[name="name"]');
const license = document.querySelector('input[name="license"]');
const phone = document.querySelector('input[name="phone"]');
const address = document.querySelector('input[name="address"]');

const phoneRegex = /^\d{2,3}\d{3,4}\d{4}$/;
const numRegex = /^[0-9]+$/;

form.onsubmit = () => {
    if (companyName.value == '') {
        nullCheck(companyName);
    }

    if (license.value == '') {
        nullCheck(license);
    }

    const checkcompanyName = companyName.classList.contains('error');
    const checkPhone = phone.classList.contains('error');
    const checkLicense = license.classList.contains('error');

    if (checkcompanyName) {
        return false;
    }

    if (checkPhone) {
        return false;
    }

    if (checkLicense) {
        return false;
    }

    return true;
};

companyName.addEventListener('blur', () => {
    nullCheck(companyName);
});

license.addEventListener('blur', () => {
    doubleMatch(license, numRegex, '제시한 형식에 맞게 작성하세요');
});

phone.addEventListener('blur', () => {
    match(phone, phoneRegex, '제시한 형식에 맞게 작성하세요');
});

function nullCheck(elem) {
    const errors = elem.parentElement.querySelectorAll('p');
    errors.forEach((error) => {
        error.remove();
        elem.classList.remove('error');
    });

    if (elem.value == '') {
        const errorMsg = document.createElement('p');
        errorMsg.innerText = '필수입력 항목입니다.';
        elem.parentElement.append(errorMsg);
        elem.classList.add('error');
        return;
    }
}

function doubleMatch(elem, regex, messege) {
    const errors = elem.parentElement.querySelectorAll('p');
    errors.forEach((error) => {
        error.remove();
    });

    if (elem.value == '') {
        const errorMsg = document.createElement('p');
        errorMsg.innerText = '필수입력 항목입니다.';
        elem.parentElement.append(errorMsg);
        elem.classList.add('error');
        return;
    }

    match(elem, regex, messege);
}

function match(elem, regx, messege) {
    elem.classList.remove('error');

    const value = elem.value;

    if (value != '') {
        if (!regx.test(value)) {
            const errorMsg = document.createElement('p');
            errorMsg.innerText = messege;
            elem.parentElement.append(errorMsg);
            elem.classList.add('error');
            return;
        }
    }
    const errors = elem.parentElement.querySelectorAll('p');
    errors.forEach((error) => {
        error.remove();
    });
}

fileView();
//파일미리보기
function fileView() {
    const fileDOM = document.querySelector('#companyLogo');
    const preview = document.querySelector('#img-box');

    fileDOM.addEventListener('change', () => {
        const reader = new FileReader();
        reader.onload = ({ target }) => {
            preview.src = target.result;
        };
        reader.readAsDataURL(fileDOM.files[0]);
    });
}
