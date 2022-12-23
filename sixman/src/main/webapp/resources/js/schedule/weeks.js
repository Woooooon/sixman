let date = new Date();

const renderWeeks = () => {
    const viewMonth = date.getMonth();
    console.log(viewMonth);

    document.querySelector('.month-week').textContent = `${viewMonth + 1}월 x째주`;


};

renderWeeks();

const prevMonth = () =>{
    date.setMonth(date.getMonth() - 1);
    renderWeeks();
};

const nextMonth = () =>{
    date.setMonth(date.getMonth() + 1);
    renderWeeks();
};
