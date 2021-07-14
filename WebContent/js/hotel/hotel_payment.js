$(function(){
    $(window).scroll(function(){  //스크롤하면 아래 코드 실행
           var num = $(this).scrollTop();  // 스크롤값
           if( num > 150 ){  // 스크롤을 150이상 했을 때
              $(".side-bar").css("position","fixed");
              $(".side-bar").css("top","0");
              $(".side-bar").css("margin-top","20px");
           }else{
               $(".side-bar").css("position","relative");
               $(".side-bar").css("margin-top","0");
           }
      });
    });