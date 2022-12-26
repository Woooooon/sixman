function selectAll(selectAll)  {
        const checkboxes 
         = document.getElementsByName('dddd');
        checkboxes.forEach((checkbox) => {
            checkbox.checked = selectAll.checked;
        })
}

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



