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

selects.forEach(function (element, index, array) {
    const value = element.querySelector('.selected-option');
    const option = element.querySelector('ul');
    const opts = option.querySelectorAll('li');

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

