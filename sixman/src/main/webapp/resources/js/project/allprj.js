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

  const statusbtn = document.querySelectorAll('.status');

  // statusbtn.addEventListener('click' , ()=>{

  //     if(statusbtn.className == 'ing'){
  //         statusbtn.className = 'Delay';
  //     }

  // });

  //상태 버튼 클릭시 변경
  $(statusbtn).click(function(){
    // $(this).toggleClass('ing delay');
    
    if($(this).hasClass('ing')){
      $(this).addClass('delay').removeClass('ing');
      $(this).text("지연중");
    }else if ($(this).hasClass('delay')){
      $(this).addClass('complete').removeClass('delay');
      $(this).text("완료");
    } else if($(this).hasClass('complete')){
      $(this).addClass('ing').removeClass('complete');
      $(this).text("진행중");
    } else if($(this).hasClass('done')){
      $(this).addClass('ing').removeClass('done');
      $(this).text("진행중");
    }

  });


// 즐겨찾기 버튼 클릭시 색상 변경
const like = document.querySelectorAll('.normal');

$(like).click(function(){
  if($(this).hasClass('normal')){
    $(this).addClass('like').removeClass('normal');
  }else {
    $(this).addClass('normal').removeClass('like');
  }
});