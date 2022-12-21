let date = new Date();

const renderWeeks = () => {
    const viewMonth = date.getMonth();

    document.querySelector('.week').textContent = `${viewMonth + 1}월`

};