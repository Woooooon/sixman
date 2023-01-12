class Popup {
    constructor() {
        this.timer = 200;

        this.section = document.createElement('section');
        this.section.classList.add('popup-mini-section');
        this.miniSection = document.createElement('section');
        this.miniSection.classList.add('popup-mini-section');

        this.itemBox = document.createElement('div');
        this.itemBox.classList.add('popup-item');

    }

    createYesBtn() {
        this.yesBtn = document.createElement('div');
        this.yesBtn.id = 'yesBtn';
        this.yesBtn.classList.add('btn');
        this.yesBtn.innerText = '확인';

        this.yesBtn.addEventListener('click', () => {
            this.close();
        });
    }

    createNoBtn() {
        this.noBtn = document.createElement('div');
        this.noBtn.id = 'noBtn';
        this.noBtn.classList.add('c-btn');
        this.noBtn.innerText = '취소';

        this.noBtn.addEventListener('click', () => {
            this.close();
        });
    }

    createBtnBox() {
        this.btnBox = document.createElement('div');
        this.btnBox.classList.add('popup-btn-box');
    }

    alertPop(title, text, callback) {
        if (text == null || text.trim() == '') return;

        this.itemBox.innerHTML =
            '<span class="material-symbols-outlined"> task_alt </span>' + `<div class='popup-title'>${title}</div>` + `<div class='popup-text'>${text}</div>`;
        this.createYesBtn();
        this.createBtnBox();
        this.btnBox.append(this.yesBtn);
        this.itemBox.append(this.btnBox);

        if (callback) {
            this.yesBtn.addEventListener('click', () => {
                setTimeout(() => {
                    callback();
                }, this.timer);
            });
        }

        this.open();
    }

    warningPop(title, text, callback, mini) {
        if (text == null || text.trim() == '') return;

        this.itemBox.innerHTML =
            '<span class="material-symbols-outlined" id="red"> error_circle_rounded </span>' +
            `<div class='popup-title'>${title}</div>` +
            `<div class='popup-text'>${text}</div>`;

        this.createYesBtn();
        this.createBtnBox();
        this.btnBox.append(this.yesBtn);
        
        if (callback) {
            this.yesBtn.addEventListener('click', () => {
                setTimeout(() => {
                    callback();
                }, this.timer);
            });
        }

        this.itemBox.append(this.btnBox);

        this.open(mini);
    }

    confirmPop(title, text, callback, color, mini) {
        if (text == null || text.trim() == '') return;
        if (callback == null || typeof callback != 'function') return;

        this.itemBox.innerHTML =
            '<span class="material-symbols-outlined"> error_circle_rounded </span>' +
            `<div class='popup-title'>${title}</div>` +
            `<div class='popup-text'>${text}</div>`;

        if (color) {
            this.itemBox.querySelector('span').id = 'red';
        }

        this.createYesBtn();
        this.createNoBtn();
        this.createBtnBox();

        this.yesBtn.addEventListener('click', () => {
            setTimeout(() => {
                callback();
            }, this.timer);
        });

        this.btnBox.append(this.yesBtn);
        this.btnBox.append(this.noBtn);
        this.itemBox.append(this.btnBox);
        this.open(mini);
    }

    open(mini) {
        let w = '600px';
        let h = '300px';
        if(mini){
            w = '230px';
            h = '120px';
        }
        if (mini) {
            this.miniSection.append(this.itemBox);
        }else{
            this.section.append(this.itemBox);
        }
        this.itemBox.animate(
            [
                {
                    // 초기상태
                    opacity: 0,
                    width: w,
                    height: '0',
                },
                {
                    // 마지막상태
                    opacity: 1,
                    width: w,
                    height: h,
                },
            ],
            {
                // 옵션
                duration: this.timer,
                fill: 'forwards',
            }
        );
        if (mini) {
            document.querySelector('body').append(this.miniSection);
        }else{
            document.querySelector('body').append(this.section);
        }
    }

    close() {
        this.itemBox.animate(
            [
                {
                    // // 마지막상태
                    // opacity: 1,
                    // width: '600px',
                    // height: '300px',
                },
                {
                    // 마지막상태
                    opacity: 0,
                    width: '600px',
                    height: '0',
                },
            ],
            {
                // 옵션
                duration: this.timer,
                fill: 'forwards',
            }
        );

        setTimeout(() => {
            this.section.remove();
            this.miniSection.remove();
        }, this.timer);
    }
}

const popup = new Popup();

function alarmAjax() {
    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
            if (httpRequest.status === 200) {
                const result = httpRequest.response;
                // console.log(result);
                const itemCount = document.querySelector('#alarm-count');
                const count = result.length;

                if (count == null || count == 0) {
                    itemCount.style.display = 'none';
                } else {
                    itemCount.innerHTML = count;
                }

                const box = document.querySelector('#alarm-box #inner-box');
                while (box.firstChild) {
                    box.removeChild(box.firstChild);
                }


                for (vo of result) {
                    let msg = ``;
                    let f = null;
                    switch (vo.type) {
                        case 'MAIL':
                            msg = `${vo.senderName}(이)가 메일을 보냈습니다. "${vo.title}"`;
                            f = () => {
                                location.href = '/sixman/mail/detail?no=' + vo.no;
                            };
                            break;
                        case 'DOCUMENT':
                            msg = `${vo.senderName}(이)가 결재를 요청하였습니다. "${vo.title}"`;
                            f = () => {
                                location.href = '/sixman/document/first';
                            };
                            break;
                        case 'ADDRESS':
                            msg = `${vo.senderName}(이)가 주소록을 공유하였습니다. "${vo.title}"`;
                            f = () => {
                                location.href = '/sixman/address/recive';
                            };
                            break;
                        case 'SCHEDULE':
                            msg = `${vo.senderName}(이)가 일정을 공유하였습니다. "${vo.title}"`;
                            f = () => {
                                location.href = '';
                            };
                            break;
                    }
                    const div = document.createElement('div');
                    div.classList.add('alarm-item');
                    const item = `            
                    <div class="item-div">
                        <div class="item-header">
                            <div>[${vo.type}]</div>
                            <div>${vo.enrollDate}</div>
                        </div>
                        <div class="item-title">${msg}</div>
                    </div>
                    <span class="t-btn material-symbols-outlined"> close </span>
                    `;
                    div.innerHTML = item;

                    div.querySelector('.item-div').addEventListener('click', () => {
                        checkAjax(vo.no, vo.type);
                        f();
                    });

                    div.querySelector('span').addEventListener('click', () => {
                        div.remove();
                        checkAjax(vo.no, vo.type);
                    });

                    box.append(div);
                }
                
            }else {
                // alert('Request Error!');
            }
        }
    };

    httpRequest.open('post', '/sixman/alarm');
    httpRequest.responseType = 'json';
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send();
}

function checkAjax(no, type) {
    console.log(no, type);
    const httpRequest = new XMLHttpRequest();
    httpRequest.onreadystatechange = () => {
        if (httpRequest.readyState === XMLHttpRequest.DONE) {
            if (httpRequest.status === 200) {
                const itemCount = document.querySelector('#alarm-count');
                const count = parseInt(itemCount.innerText);

                if (count == null || count == 0) {
                    itemCount.style.display = 'none';
                } else {
                    itemCount.innerText = count - 1;
                }
            } else {
                // alert('Request Error!');
            }
        }
    };

    httpRequest.open('post', '/sixman/alarm/check');
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
    httpRequest.send(`no=${no}&type=${type}`);
}
