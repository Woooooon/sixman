const progress = document.querySelector('.progress-bar');
const valueinput = document.querySelector('.valueinput');
const maxIntput = document.querySelector('.maxinput');

let finalValue = 0;
let max = 0;

function changeGuage(){
    progress.style.width = `${(finalValue / max) * 100}%`;
    progress.innerText = `${Math.ceil((finalValue / max) * 100)}%`;
}

valueinput.addEventListener("keyup", function() {
    finalValue = parseInt(valueinput.value, 10);
    console.log("finalValue" + finalValue);
    changeGuage();
});

maxIntput.addEventListener("keyup", function() {
    max = parseInt(maxIntput.value, 10);
    console.log("max" + max);
    changeGuage();
});