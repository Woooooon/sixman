const modal = document.querySelector('.share-modal');
const share = document.querySelectorAll('.share');
const closeBtn = document.querySelector('#close-modal');
const deleteBtn = document.querySelector('.delete');

closeBtn.addEventListener('click', () => {
    modal.classList.add('close');
});

share.forEach((elem) => {
    elem.addEventListener('click', () => {
        modal.classList.remove('close');
    });
});
