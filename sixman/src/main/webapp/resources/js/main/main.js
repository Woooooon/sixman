class Popup{

    constructor(){
        this.timer = 200;

        this.section = document.createElement('section');
        this.section.classList.add('popup-section');

        this.itemBox = document.createElement('div');
        this.itemBox.classList.add('popup-item');
    }

    createYesBtn(){
        this.yesBtn = document.createElement('div');
        this.yesBtn.id = 'yesBtn';
        this.yesBtn.classList.add('btn');
        this.yesBtn.innerText = '확인';
        
        this.yesBtn.addEventListener('click', ()=>{this.close();});
    }

    createNoBtn(){
        this.noBtn = document.createElement('div');
        this.noBtn.id = 'noBtn';
        this.noBtn.classList.add('c-btn');
        this.noBtn.innerText = '취소';

        this.noBtn.addEventListener('click', ()=>{this.close();});
    }

    createBtnBox(){
        this.btnBox = document.createElement('div');
        this.btnBox.classList.add('popup-btn-box');
    }

    alertPop(title, text) {
        if(text == null || text.trim() == "") return;

        this.itemBox.innerHTML = '<span class="material-symbols-outlined"> task_alt </span>'
                                +`<div class='popup-title'>${title}</div>`
                                +`<div class='popup-text'>${text}</div>`;
        this.createYesBtn();
        this.createBtnBox();
        this.btnBox.append(this.yesBtn);
        this.itemBox.append(this.btnBox);
        this.open();
    }

    confirmPop(title, text, callback){
        if(text == null || text.trim() == "") return;
        if(callback == null ||  typeof callback != 'function') return;

        this.itemBox.innerHTML = '<span class="material-symbols-outlined"> error_circle_rounded </span>'
                                +`<div class='popup-title'>${title}</div>`
                                +`<div class='popup-text'>${text}</div>`;

        this.createYesBtn();
        this.createNoBtn();
        this.createBtnBox();
        
        this.yesBtn.addEventListener('click', ()=>{
            setTimeout(() => {
                callback();
            }, this.timer);
        });

        this.btnBox.append(this.yesBtn);
        this.btnBox.append(this.noBtn);
        this.itemBox.append(this.btnBox);
        this.open();
    }

    open(){
        this.section.append(this.itemBox);
        this.itemBox.animate(
            [{
                // 초기상태
                opacity: 0,
                width: '0',
                height: '0'
            },
            {
                // 마지막상태
                opacity: 1,
                width: '600px',
                height: '300px'
            }],
            {
                // 옵션
                duration: this.timer,
                fill: "forwards",
            });
        document.querySelector('body').append(this.section);
    }

    close(){
        this.itemBox.animate(
            [{
                // 마지막상태
                opacity: 1,
                width: '600px',
                height: '300px'
            },
            {
                // 마지막상태
                opacity: 0,
                width: '0',
                height: '0'
            }],
            {
                // 옵션
                duration: this.timer,
                fill: "forwards"
            });

        setTimeout(() => {
            this.section.remove(); 
        }, this.timer);
    }
}

const popup = new Popup;