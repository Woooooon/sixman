// progress bar 수치 입력시 변경
const progress = document.querySelector('.progress-bar');
const valueinput = document.querySelector('.valueinput');
const maxIntput = document.querySelector('.maxinput');

let finalValue = valueinput.value;
let max = 100;
changeGuage()

function changeGuage(){
    progress.style.width = `${(finalValue / max) * 100}%`;
    progress.innerText = `${Math.ceil((finalValue / max) * 100)}%`;
}

valueinput.addEventListener("keyup", function() {
    
    const onlynumber = $(valueinput).val(replace(/^[0-9]*$/));

    if(!onlynumber){
        alert('숫자만 입력 가능합니다.');
    }
      
    finalValue = parseInt(valueinput.value, 10);
    console.log("finalValue" + finalValue);
    if(valueinput.value < 101){
        popup.alertPop('100이상 입력 불가함.');
    }
    changeGuage();
});


// 상태 토글
// const ing = document.querySelector('.ing');
// const delay = document.querySelector('.delay');
// const complete = document.querySelector('.complete');

// function btnchange(color, element) {
//     if(element.classList.contains('backgray')){
//         element.classList.remove('backgray');
//         element.classList.add(color);
//     } else{
//         element.classList.remove(color);
//         element.classList.add('backgray');
//     }
// }

// if(ing.addEventListener('click', ()=>{btnchange('backgreen', ing);})){
//    delay.classList.remove('backred');
//    delay.classList.add('backgray')
//    complete.classList.remove('backblue');
// }else if (delay.addEventListener('click', ()=>{btnchange('backred', delay);})){
//     ing.classList.remove('backgreen');
//     ing.classList.add('backgray');
//     complete.classList.remove('backblue');
//     complete.classList.add('backgray')
// }else if (complete.addEventListener('click', ()=>{btnchange('backblue', complete);})){
//     ing.classList.remove('backgreen');
//     ing.classList.add('backgray');
//     delay.classList.remove('backred');
//     delay.classList.add('backgray')
// }

// ing.addEventListener('click', ()=>{btnchange('backgreen', ing);});

// delay.addEventListener('click', ()=>{btnchange('backred', delay);});

// complete.addEventListener('click', ()=>{btnchange('backblue', complete);});


// 모달

const modal = document.getElementById("modal");

function modalOn() {
    modal.style.display = "flex"
}

function isModalOn() {
    return modal.style.display === "flex"
}
function modalOff() {
    modal.style.display = "none"
}
const btnModal = document.getElementById("btn-modal")
btnModal.addEventListener("click", e => {
    modalOn()
})
const closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
    modalOff()
})
modal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal-overlay")) {
        modalOff()
    }
})
window.addEventListener("keyup", e => {
    if(isModalOn() && e.key === "Escape") {
        modalOff()
    }
})

function addcheckbox(){
    const addbtn = document.querySelector("#addbtn");
    const checkbox = document.querySelector(".checkbox-add");

    addbtn.addEventListener('click', (e)=>{
        console.log("1");
        let text = "";

        text += `<label>`;
        const todobox = document.createElement('input');
        const todoname = document.createElement('input');
        todobox.classList.add('todocheck');
        todoname.classList.add('todoname');

        todobox.setAttribute("type", "checkbox");
        todobox.setAttribute("value", "test");
        todoname.setAttribute("type", "text");
        todoname.setAttribute("name", "todoname");
        text += `</label>`;
        checkbox.append(todobox);
        checkbox.append(todoname);

    })
}














