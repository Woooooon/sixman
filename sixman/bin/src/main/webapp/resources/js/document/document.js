function selectAll(selectAll)  {
        const checkboxes 
         = document.getElementsByName('dddd');
        checkboxes.forEach((checkbox) => {
            checkbox.checked = selectAll.checked;
        })
}