//create 팀 메뉴바

//오늘 날짜 이전 선택 못하게하기
const today = new Date().toISOString().split("T")[0];
document.querySelector('#startDate').setAttribute("min", today);

//오늘 날짜 이후 60일 하려했는데 안됨..
const endline = new Date().toISOString.split("T")[0];
document.querySelector('#endDate').setAttribute("max", endline + 60);


//팀 목록 div 형식 option
function onClickSelect(e) {
    const isActive = e.currentTarget.className.indexOf('active') !== -1;
    if (isActive) {
        e.currentTarget.className = 'select';
    } else {
        e.currentTarget.className = 'select active';
    }
}

document.querySelector('.select').addEventListener('click', onClickSelect);

function onClickOption(e) {
    const selectedValue = e.currentTarget.innerHTML;
    document.querySelector('.text').innerHTML = selectedValue;
}

var optionList = document.querySelectorAll('.option');
for (var i = 0; i < optionList.length; i++) {
    var option = optionList[i];
    option.addEventListener('click', onClickOption);
}


// 사이드바 달력
let date = new Date();

const renderCalender = () =>{
    const viewYear  = date.getFullYear();
    const viewMonth = date.getMonth();

    document.querySelector('.year-month').textContent = `${viewYear}년 ${viewMonth + 1}월`;

    console.log(viewYear);

    const prevLast = new Date(viewYear, viewMonth , 0);
    const thisLast = new Date(viewYear, viewMonth + 1 , 0);

    console.log('prevLast : ' + prevLast);
    console.log('thisLast : ' + thisLast);

    const PLDate = prevLast.getDate();
    const PLDay = prevLast.getDay();

    console.log('PLDate : ' + PLDate);
    console.log('PLDay : ' + PLDay);

    const TLDate = thisLast.getDate();
    const TLDay = thisLast.getDay();

    console.log('TLDate : ' + TLDate);
    console.log('TLDay : ' + TLDay);

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
    console.log('----------------');    
    console.log(prevDates);
    console.log('----------------');
    console.log(thisDates);
    console.log('----------------');
    console.log(nextDates);
    console.log('----------------');

    const dates = prevDates.concat(thisDates, nextDates);
    const firstDateIndex = dates.indexOf(1);
    const lastDateIndex = dates.lastIndexOf(TLDate);

    console.log(dates);
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

