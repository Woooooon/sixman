const prjtype = document.querySelectorAll('.prjtype');
const my = document.querySelector('.my');
const all = document.querySelector('.all');
const myprj = document.querySelector('.myprj');
const allprj = document.querySelector('.prj-all-box');

$(prjtype).ready(function(){
    $(my).click(function(){
      $(myprj).toggle(500);
    });
  });

$(prjtype).ready(function(){
    $(all).click(function(){
      $(allprj).toggle(500);
    });
  });

  //const statusbtn = document.querySelectorAll('.status');

  // statusbtn.addEventListener('click' , ()=>{

  //     if(statusbtn.className == 'ing'){
  //         statusbtn.className = 'Delay';
  //     }

  // });

  //상태 버튼 클릭시 변경
  // $(statusbtn).click(function(){
  //   // $(this).toggleClass('ing delay');
    
  //   if($(this).hasClass('ing')){
  //     $(this).addClass('delay').removeClass('ing');
  //     $(this).text("지연중");
  //   }else if ($(this).hasClass('delay')){
  //     $(this).addClass('complete').removeClass('delay');
  //     $(this).text("완료");
  //   } else if($(this).hasClass('complete')){
  //     $(this).addClass('ing').removeClass('complete');
  //     $(this).text("진행중");
  //   } else if($(this).hasClass('done')){
  //     $(this).addClass('ing').removeClass('done');
  //     $(this).text("진행중");
  //   }
  // });
favorite();

function favorite(){
  const divfavorite = document.querySelectorAll('.favorite');
  divfavorite.forEach(box => {
    
    const like = box.querySelector('.normal');
    const no = box.querySelector('input[type="checkbox"]').value;

    like.addEventListener('click', () =>{
      if($(like).hasClass('normal')){
        $(like).addClass('like').removeClass('normal');
          
        $.ajax({
            url : "/sixman/project/insertfavorite",
            method : "post",
            data : {
              no : no,
            }, success : function(){
              popup.alertPop('즐겨찾기 추가', "성공");
            }, error : function() {
              popup.alertPop('즐겨찾기 추가 실패');
            }
          })
  
      }else {
        $(like).addClass('normal').removeClass('like');
  
          $.ajax({
            url : "/sixman/project/deletefavorite",
            method : "post",
            data : {
              no : no,
            }, success : function(){
              popup.alertPop('즐겨찾기 제거', "성공");
            }, error : function() {
              popup.alertPop('즐겨찾기 제거 실패');
            }
          })
  
      }
    })

  })
  // 즐겨찾기 버튼 클릭시 색상 변경

}



//체크박스 체크 되어있는지
// function ischecked(){

//   //체크박스 검색
//   const checkbox = document.getElementById('check_favorite');

//   const is_checked = checkbox.checked;
  
//   //true, false 나옴
//   console.log(is_checked);

//   const likestatus = document.querySelectorAll('input[id="check_favorite"]');
  
//   $(likestatus).on('click', () => {
  
//     $.ajax({
//       url : "sixman/project/insertfavorite",
//       method : "post",
//       data : {
//         //no : no
//       }, success : function(){
//         alert('즐겨찾기 성공')
//       }, error : function() {
//         alert('즐겨찾기 실패');
//       }
//     })
//   });

// }

//checked = like , unchecked = normal

// progress 수치 받아오면 그만큼 게이지올리기 아직 복사만 해옴
progress();

function progress(){

  const progress = document.querySelectorAll('.progressBar');
  
  let max = 100;
  progress.forEach(box => {
 
    const guage = box.querySelector('.guage');
    const bbox = box.querySelector('input[type="hidden"]').value;
 
    changeGuage();
    
    function changeGuage(){
      guage.style.width = `${(bbox / max) * 100}%`;
      guage.innerText = `${Math.ceil((bbox / max) * 100)}%`;
    }

  })


}


