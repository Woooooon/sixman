//create 팀 메뉴바

//오늘 날짜 이전 선택 못하게하기
const today = new Date().toISOString().split("T")[0];
document.querySelector('#startDate').setAttribute("min", today);

//오늘 날짜 이후 60일 하려했는데 안됨..
// const endline = new Date().toISOString.split("T")[0];
// document.querySelector('#endDate').setAttribute("max", endline + 60);
 
//---------------------------------------------------------------

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
    $('select[name="leader"]').html('');
    if ($('select[name="leader"]').val() != 1) {
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
                    $('select[name="leader"]').append(option);

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
    $('select[name="leader"]').html('');
    const teamNo = $('select[name="teamNo"]').val();
    const deptNo = $('select[name="deptNo"]').val();

    let no = teamNo != null ? teamNo : deptNo;
    
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
                option.setAttribute('leader', element.no);
                option.innerHTML = element.name + ' ' + element.positionName;
                $('select[name="leader"]').append(option);

            });
        },
        error: (teamList) => {
            console.log('멤버 옵션 조회 에러');
        },
    });
}

//팀 목록 select 박스 보이게하기
const selects = document.querySelectorAll('.select');
const memberbox = document.querySelector('.team-member-box');

selects.forEach(function (element, index, array) {
    const value = element.querySelector('.selected-option');
    const option = element.querySelector('select');
    const opts = option.querySelectorAll('option');

    element.addEventListener('click', (e)=>{
        e.stopPropagation();
        if(option.classList.contains('hide')){
            option.classList.remove('hide');
            option.classList.add('show');
            opts.forEach(optsItem=>{
                const innerValue = optsItem.innerHTML;
                optsItem.addEventListener('click', (e)=>{
                    e.stopImmediatePropagation();
                    value.innerHTML = innerValue;
                    option.classList.add('hide');
                    option.classList.remove('show');
                    if(index===array.length-1){
                        createMemberBox();
                    }
                });
            });
        }else{
            option.classList.add('hide');
            option.classList.remove('show');
        }
    })
});

// 조직도 popup
const openPop = document.querySelector('.plusmem');

//자식창 오픈
openPop.addEventListener('click', ()=>{
    openWindowPop();
});

function openWindowPop(){
    window.open('/sixman/employee/popup', '조직도 팝업', 'top=0, left=8000, height=500, status=no, toolbar=no, resizable=no');
}

//자식창에서 멤버 객체 배열 받은 함수
function childValue(memberArr){
    createMemberBox();
    for(let i = 0; i < memberArr.length; i++){
        const memb = memberArr[i];
        console.log(memb);
    }
    
}

//담당자, 직급, 이름 선택시 memberbox 에 생성되는 div값
function createMemberBox() {
    const divbox = document.createElement('div');
    divbox.classList.add('member');

    let text = "";

    for(let i = 0; i < selects.length; i++){
        const item = selects[i];
        if(i!=selects.length-1){
            text += '';
        }
    }

    const list = document.querySelector('.list-name');
    text += `<input type='text' value="${list.innerHTML}" name='prjmem'>`;
    text += `<input type='hidden' value="${list.innerHTML}" name='memberNo'>`

    text += `<span class='material-symbols-outlined'> close </span>`;
    divbox.innerHTML = text;

    divbox.querySelector('span').addEventListener('click', ()=>{
        divbox.remove();
    })

    memberbox.append(divbox);
}

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




