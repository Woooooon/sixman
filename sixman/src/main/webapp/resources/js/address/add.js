//jstree
$(function () {
    $('#jstree').jstree();

    $('#jstree').on('changed.jstree', function (e, data) {
        console.log(data.selected);
    });

    $('button').on('click', function () {
        $('#jstree').jstree(true).select_node('child_node_1');
        $('#jstree').jstree('select_node', 'child_node_1');
        $.jstree.reference('#jstree').select_node('child_node_1');
    });
});

$('#jstree').on('open_node.jstree', function (e, data) {
    var icon = $('#' + data.node.id)
        .find('i.jstree-icon.jstree-themeicon')
        .first();
    icon.removeClass('fa-folder').addClass('fa-folder-open');
});

// bind customize icon change function in jsTree close_node event.
$('#jstree').on('close_node.jstree', function (e, data) {
    var icon = $('#' + data.node.id)
        .find('i.jstree-icon.jstree-themeicon')
        .first();
    icon.removeClass('fa-folder-open').addClass('fa-folder');
});

document.getElementById('address_kakao').addEventListener('click', function () {
    //주소입력칸을 클릭하면
    //카카오 지도 발생
    new daum.Postcode({
        oncomplete: function (data) {
            document.getElementById('address').value = data.address; // 주소 넣기
        },
    }).open();
});

const fileDOM = document.querySelector('#pic-add');
const preview = document.querySelector('.image-box');

fileDOM.addEventListener('change', () => {
    const reader = new FileReader();
    reader.onload = ({ target }) => {
        preview.src = target.result;
    };
    reader.readAsDataURL(fileDOM.files[0]);
});
