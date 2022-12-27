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

  