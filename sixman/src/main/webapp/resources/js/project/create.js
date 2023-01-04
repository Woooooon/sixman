//create 팀 메뉴바

//오늘 날짜 이전 선택 못하게하기
const today = new Date().toISOString().split("T")[0];
document.querySelector('#startDate').setAttribute("min", today);

//오늘 날짜 이후 60일 하려했는데 안됨..
// const endline = new Date().toISOString.split("T")[0];
// document.querySelector('#endDate').setAttribute("max", endline + 60);
 
//---------------------------------------------------------------
//팀 목록 select 박스 보이게하기
const selects = document.querySelectorAll('.select');
const memberbox = document.querySelector('.team-member-box');

// selects.forEach(function (element, index, array) {
//     const value = element.querySelector('.selected-option');
//     const option = element.querySelector('select');
//     const opts = option.querySelectorAll('option');

//     element.addEventListener('click', (e)=>{
//         e.stopPropagation();
//         if(option.classList.contains('hide')){
//             option.classList.remove('hide');
//             option.classList.add('show');
//             opts.forEach(optsItem=>{
//                 const innerValue = optsItem.innerHTML;
//                 optsItem.addEventListener('click', (e)=>{
//                     e.stopImmediatePropagation();
//                     value.innerHTML = innerValue;
//                     option.classList.add('hide');
//                     option.classList.remove('show');
//                     if(index===array.length-1){
//                         createMemberBox();
//                     }
//                 });
//             });
//         }else{
//             option.classList.add('hide');
//             option.classList.remove('show');
//         }
//     })
// });

//담당자, 직급, 이름 선택시 memberbox 에 생성되는 div값
function createMemberBox() {
    const divbox = document.createElement('div');
    divbox.classList.add('member');

    let text = "";

    for(let i = 0; i < selects.length; i++){
        const item = selects[i];
        const v = item.querySelector('.selected-option');
        const leader = item.querySelector('input[type=hidden]');
        leader.value = v.innerHTML;
        text += `<input type='text' value="${v.innerHTML}" name='prjmem'>`;
        text += `<input type='hidden' value="${v.innerHTML}" name='memberNo'>`
        if(i!=selects.length-1){
            text += '';
        }
    }

    text += `<span class='material-symbols-outlined'> close </span>`;
    divbox.innerHTML = text;

    divbox.querySelector('span').addEventListener('click', ()=>{
        divbox.remove();
    })

    memberbox.append(divbox);
}

//팀 목록 조회하기
$('select[name="deptNo"]').on('change', () => {
    $('select[name="teamNo"]').html('');
    if ($('select[name="deptNo"]').val() != 1) {
        $.ajax({
            url: '/sixman/dept/sublist',
            method: 'POST',
            data: {
                no: $('select[name="deptNo"]').val(),
            },
            success: (teamList) => {
                console.log('팀 조회 성공');
                teamList.forEach((element) => {
                    const option = document.createElement('option');
                    console.log("옵션 생성 성공");
                    option.setAttribute('value', element.teamNo);
                    option.innerHTML = element.teamName;
                    $('select[name="teamNo"]').append(option);
                });
                memberListAjax();
            },
            error: (teamList) => {
                console.log('팀 조회 에러');
            },
        });
    }
});

//멤버 목록 조회하기
$('select[name="teamNo"]').on('change', () => {
    $('select[name="memberNo"]').html('');
    if ($('select[name="memberNo"]').val() != 1) {
        $.ajax({
            url: '/sixman/project/memberlist',
            method: 'POST',
            data: {
                no: $('select[name="teamNo"]').val(),
            },
            success: (teamList) => {
                console.log('멤버 조회 성공');
                teamList.forEach((element) => {
                    const option = document.createElement('option');
                    console.log("멤버 옵션 생성 성공");
                    option.setAttribute('value', element.no);
                    option.innerHTML = element.name;
                    $('select[name="memberNo"]').append(option);

                });
            },
            error: (teamList) => {
                console.log('멤버 조회 에러');
            },
        });
    }
});


//팀에 속해 있는 멤버 목록 조회하기
function memberListAjax(){
    $('select[name="memberNo"]').html('');
    const teamNo = $('select[name="teamNo"]').val();
    const deptNo = $('select[name="deptNo"]').val();
    let no = teamNo;

    no = teamNo != null ? teamNo : deptNo 
    console.log("팀 번호 : "+teamNo);
    console.log("=====");
    console.log("부서 번호 : "+deptNo);
    $.ajax({
        url: '/sixman/project/memberlist',
        method: 'POST',
        data: {
            no: no
        },
        success: (teamList) => {
            console.log('멤버 조회 성공');
            teamList.forEach((element) => {
                const option = document.createElement('option');
                console.log("멤버 옵션 생성 성공");
                option.setAttribute('value', element.no);
                option.innerHTML = element.name;
                $('select[name="memberNo"]').append(option);

            });
        },
        error: (teamList) => {
            console.log('멤버 옵션 조회 에러');
        },
    });
}

// selects.forEach(element => {
//     const value = element.querySelector('.selected-option');
//     const option = element.querySelector('ul');
//     const opts = element.querySelectorAll('li');

//     element.addEventListener('click', ()=>{
        
//         if(option.classList.contains('hide')){
//             option.classList.remove('hide');
//             option.classList.add('show');
//             selectOpt(opts, value, option);
//         }else{
//             option.classList.add('hide');
//             option.classList.remove('show');
//         }
        
//         const divbox = document.createElement('div');
//         divbox.classList.add('member');
//         divbox.innerHTML = `<p>${value.value}</p>`
//                          +"<span class='material-symbols-outlined'> close </span>";

//         divbox.querySelector('span').addEventListener('click', ()=>{
//             divbox.remove();
//             value.remove();
//         })

//         memberbox.append(divbox);
//     })
// });

// if(inputFile.value!=null){
//     const div = document.createElement('div');
//     div.classList.add('file-item');
//     div.innerHTML = `<p>${inputFile.value.substring(inputFile.value.lastIndexOf('\\')+1)}</p>`
//                 +"<span class='material-symbols-outlined'> close </span>";

//     div.querySelector('span').addEventListener('click', ()=>{
//         div.remove();
//         inputFile.remove();
//     });

//     fileBox.append(div);
// }


//인원 선택 하면 team-member-box 로 넘기기
// const team = document.querySelector('#teamvalue').value;
// const reader = document.querySelector('#readervalue').value;
// const member = document.querySelector('#membervalue').value;

// console.log(team);
// console.log(reader);
// console.log(member);

//-----------------------------------------------

// 사이드바 달력
let date = new Date();

const renderCalender = () =>{
    const viewYear  = date.getFullYear();
    const viewMonth = date.getMonth();

    document.querySelector('.year-month').innerHTML = `${viewYear}년 ${viewMonth + 1}월`;

    const prevLast = new Date(viewYear, viewMonth , 0);
    const thisLast = new Date(viewYear, viewMonth + 1 , 0);

    const PLDate = prevLast.getDate();
    const PLDay = prevLast.getDay();

    const TLDate = thisLast.getDate();
    const TLDay = thisLast.getDay();

    const prevDates = [];
    const thisDates = [...Array(TLDate + 1).keys()].slice(1);
    const nextDates = [];

    if(PLDay !== 6) {
        for(let i = 0; i < PLDay + 1; i++) {
            prevDates.unshift(PLDate - i);
        }
    }

    for(let i = 1; i < 7 - TLDay; i++) {
        nextDates.push(i);
    }

    const dates = prevDates.concat(thisDates, nextDates);
    const firstDateIndex = dates.indexOf(1);
    const lastDateIndex = dates.lastIndexOf(TLDate);

    dates.forEach((date, i) => {
        const condition = i >= firstDateIndex && i < lastDateIndex + 1
                          ? 'this'
                          : 'other';
        dates[i] = `<div class="date"><span class=${condition}>${date}</span></div>`;
    });

    document.querySelector('.dates').innerHTML = dates.join('');

    const today = new Date();
    if(viewMonth === today.getMonth() && viewYear === today.getFullYear()){
        for(let date of document.querySelectorAll('.this')) {
            if(+date.innerText === today.getDate()) {
                date.classList.add('today');
                break;
            }
        }
    }
};

renderCalender();

const prevMonth = () =>{
    date.setMonth(date.getMonth() - 1);
    renderCalender();
};

const nextMonth = () =>{
    date.setMonth(date.getMonth() + 1);
    renderCalender();
};

const goToday = () => {
    date = new Date();
    renderCalender();
};

// 파일 추가

const fileBtn = document.querySelector('#file-btn');
const fileBox = document.querySelector('#file-box');

fileBtn.addEventListener('click',()=>{
    const inputFile = document.createElement('input');
    inputFile.setAttribute('type','file');
    inputFile.setAttribute('name','file');
    inputFile.style.display = 'none';

    fileBox.append(inputFile);

    inputFile.click();

    inputFile.addEventListener('change',()=>{

        if(inputFile.value!=null){
            const div = document.createElement('div');
            div.classList.add('file-item');
            div.innerHTML = `<p>${inputFile.value.substring(inputFile.value.lastIndexOf('\\')+1)}</p>`
                        +"<span class='material-symbols-outlined'> close </span>";

            div.querySelector('span').addEventListener('click', ()=>{
                div.remove();
                inputFile.remove();
            });

            fileBox.append(div);
        }

    });

});


//현재 모든 부서, 직급, 멤버 정보 다 받았음 화면에
//이걸 가지고 부서를 클릭 했을 때, 해당 부서에 있는 멤버 전체를 확인한 후
//멤버 부서 == 현재 클릭한 부서인 인원의 직급들만 출력
//이름도 마찬가지로 멤버 부서 == 선택 부서 , 멤버 직급 == 선택 직급 이면
//위의 2가지 정보가 일치하는 멤버의 이름을 이름 칸에 appendChild





