var selectTab = document.getElementById("selecttab");
selectTab.addEventListener("change",function(){
    var val = selectTab.options[selectTab.selectedIndex].value;
    if(val[0] == 1){
        document.getElementById("search-date").style.display = 'none';
        document.getElementById("search-number").style.display = 'block';
    }else{
        document.getElementById("search-date").style.display = 'block';
        document.getElementById("search-number").style.display = 'none';
    }
})
function openreviewModal(){
    document.getElementById("review-modal-con").style.display = "block";
  }
  function closereviewModal(){
  document.getElementById("review-modal-con").style.display = "none";
  }

$(document).ready(function(){
    // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
    $(".side-item>button").click(function(){
        var submenu = $(this).next("ul");
        // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
        if( submenu.is(":visible") ){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
    });
});

$(function(){
    $(window).scroll(function(){  //스크롤하면 아래 코드 실행
           var num = $(this).scrollTop();  // 스크롤값
           if( num > 150 ){  // 스크롤을 150이상 했을 때
              $(".side-bar-con").css("position","fixed");
              $(".side-bar-con").css("top","0");
              $(".side-bar-con").css("margin-top","20px");
           }else{
               $(".side-bar-con").css("position","relative");
               $(".side-bar-con").css("margin-top","0");
           }
      });
    });

$('#review-modal-con').click(function(e){
    if( !$('#review-modal-con').has(e.target).length ) {
        $('#review-modal-con').hide();
    }
});