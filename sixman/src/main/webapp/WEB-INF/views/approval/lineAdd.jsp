<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="/sixman/resources/css/approval/lineAdd.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<title>Insert title here</title>
</head>
<body>
    <form action="">
        <div id="main">
            <div id="header">
                <div>결재선 등록</div>
                <div id="create-btn" class="btn" onclick="openWindowPop()">멤버 추가</div>
            </div>
            <div id="main-box">
                <div>
                    <div class="header-item">
                        <div>우선순위</div>
                        <div>부서</div>
                        <div>이름</div>
                        <div>직책</div>
                        <div>타입</div>
                        <div></div>
                    </div>
                </div>
                <div id="item-box">

                </div>
            </div>
            <div id="footer">
                <div class="btn" onclick="submit()">저장하기</div>
            </div>
        </div>
    </form>
</body>
<script>
    function openWindowPop() {
    window.open('/sixman/employee/popup', '조직도 팝업', 'top=0, left=8000, width=800, height=500, status=no, menubar=no, toolbar=no, resizable=no');
    }

    const itemBox = document.querySelector('#item-box');
    //자식창에서 멤버 객체 배열 받은 함수
    function childValue(memberArr) {  
        console.log(memberArr);
        memberArr.forEach(element => {
            const items = document.querySelectorAll('.item');
            if(items.length==5){
                alert();
                return;
            }
            const lastItme = items[items.length-1];
            let lastNo = "0";
            if(lastItme){
                lastNo = lastItme.querySelector('.count').value;
                lastItme.querySelector('.type').innerText = "검토";
            }

            text = 
                `
                <div class="item">
                    <input type="hidden" name="aMan" value="`+element.no+`">
                    <input class="count" type="text" name="pri" readonly value="`+(parseInt(lastNo)+1)+`">
                    <div>`+element.team+`</div>
                    <div>`+element.name+`</div>
                    <div>`+element.position+`</div>
                    <div class="type">결재</div>
                    <div>  
                        <div>
                            <span class="material-symbols-outlined" onclick="up(this)"> expand_less </span>
                            <span class="material-symbols-outlined" onclick="down(this)"> expand_more </span>
                        </div>
                        <span class="material-symbols-outlined" onclick="deleteNode(this)"> close </span>
                    </div>
                </div>
                `;

            itemBox.innerHTML += text;

        });
    }

    function up(obj) {
        const items = document.querySelectorAll('.item');
        const item = obj.closest('.item');

        const index = Array.prototype.indexOf.call(items, item);

        if(index == 0) return;

        const changeNode = items[index-1];
        
        const count = changeNode.querySelector('.count').value;
        const type = changeNode.querySelector('.type').innerText;
        
        changeNode.querySelector('.count').value = item.querySelector('.count').value;
        changeNode.querySelector('.type').innerText = item.querySelector('.type').innerText;
        
        item.querySelector('.count').value = count;
        item.querySelector('.type').innerText = type;

        changeNode.before(item);
    }

    function down(obj) {
        const items = document.querySelectorAll('.item');
        const item = obj.closest('.item');

        const index = Array.prototype.indexOf.call(items, item);

        if(index == items.length-1) return;

        const changeNode = items[index+1];
        
        const count = changeNode.querySelector('.count').value;
        const type = changeNode.querySelector('.type').innerText;
        
        changeNode.querySelector('.count').value = item.querySelector('.count').value;
        changeNode.querySelector('.type').innerText = item.querySelector('.type').innerText;
        
        item.querySelector('.count').value = count;
        item.querySelector('.type').innerText = type;

        changeNode.after(item);
    }

    function deleteNode(obj) {
        const item = obj.closest('.item');
        item.remove();
        const items = document.querySelectorAll('.item');
        const lastItme = items[items.length-1];
        lastItme.querySelector('.type').innerText = '결재';
    }

    function submit() {

        const formData = [];

        const items = document.querySelectorAll('.item');
        items.forEach(element => {
            const temp = {
                "appMan" : element.querySelector('input[name=aMan]').value,
                "pri" : element.querySelector('input[name=pri]').value
            };
            formData.push(temp);
        });

        console.log(JSON.stringify(formData));
        const httpRequest = new XMLHttpRequest();
        httpRequest.onreadystatechange = () => {
            if (httpRequest.readyState === XMLHttpRequest.DONE) {
                    if (httpRequest.status === 200) {
                        location.href = '/sixman/approval/lineList';
                    } else {

                    }
            }
        };
        httpRequest.open('post', '/sixman/approval/lineAdd');
        httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
        httpRequest.send(`json=`+JSON.stringify(formData));
    }
</script>
</html>