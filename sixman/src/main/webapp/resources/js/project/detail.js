// progress bar 수치 입력시 변경
const progress = document.querySelector('.progress-bar');
const valueinput = document.querySelector('.valueinput');
const maxIntput = document.querySelector('.maxinput');

let finalValue = 0;
let max = 100;

function changeGuage(){
    progress.style.width = `${(finalValue / max) * 100}%`;
    progress.innerText = `${Math.ceil((finalValue / max) * 100)}%`;
}

valueinput.addEventListener("keyup", function() {
    finalValue = parseInt(valueinput.value, 10);
    console.log("finalValue" + finalValue);
    changeGuage();
});

// 상태 토글

const ing = document.querySelector('.ing');
const delay = document.querySelector('.delay');
const complete = document.querySelector('.complete');

function btnchange(color, element) {
    if(element.classList.contains('backgray')){
        element.classList.remove('backgray');
        element.classList.add(color);
        console.log(123);
    } else{
        element.classList.remove(color);
        element.classList.add('backgray');
    }
}

ing.addEventListener('click', ()=>{btnchange('backgreen', ing);});

delay.addEventListener('click', ()=>{btnchange('backred', delay);});

complete.addEventListener('click', ()=>{btnchange('backblue', complete);});


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














