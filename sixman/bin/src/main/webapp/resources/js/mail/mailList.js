const categoryBtns = document.querySelectorAll('.category-btn');
const caBtn1 = categoryBtns[0];
const caBtn2 = categoryBtns[1];
const caBox1 = document.querySelector('#category-box');
const caBox2 = document.querySelector('#category-box2');

if(caBtn1!=null) caBtn1.addEventListener('click', (e)=>{
    e.stopPropagation();
    openTogle(e,caBtn1,caBox1);
});
if(caBtn2!=null) caBtn2.addEventListener('click', (e)=>{
    e.stopPropagation();
    openTogle(e,caBtn2,caBox2);
});

function openTogle(e,caBtn2,caBox2) {
    e.stopPropagation();
    if(!caBtn2.className.includes('click-able')) return;

    if(caBox2.style.display=='none'){
        caBox2.style.display = 'block';
        caBtn2.classList.add('checked');
    }else{
        caBox2.style.display = 'none';
        caBtn2.classList.remove('checked');
    }
}

// 
// 

const mainCheck = document.querySelector('.first-item input[type=checkbox]');
const btnArr = document.querySelectorAll('#checkbox-box > *');

if(mainCheck!=null){
    mainCheck.addEventListener('change',()=>{
        const checkArr = document.querySelectorAll('#list-item-box input[type=checkbox]');
        // console.log(mainCheck.checked);    
        if(mainCheck.checked){
            checkArr.forEach(element => {
                element.checked = true;
                btnArr.forEach(element => {
                    element.classList.add('click-able');
                });
            });
        }else{
            checkArr.forEach(element => {
                element.checked = false;
                btnArr.forEach(element => {
                    element.classList.remove('click-able');
                });
            });
        }
    });
}