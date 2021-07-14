$(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
      $('.top-btn-con').fadeIn(500);
    } else {
      $('.top-btn-con').fadeOut('fast');
    }
  });

$('.top-btn-con').click(function (e) {
  e.preventDefault();
  $('html, body').animate({scrollTop: 0}, 200);
});

$('#login-modal-con').click(function(e){
  if( !$('#login-modal-con').has(e.target).length ) {
    $('#login-modal-con').css("display","none");
    $('#login-modal-con').hide();
  }
});

$('#register-modal-con').click(function(e){
  if( !$('#register-modal-con').has(e.target).length ) {
    $('#register-modal-con').css("display","none");
    $('#register-modal-con').hide();
  }
});

$('#forgot-modal-con').click(function(e){
  if( !$('#forgot-modal-con').has(e.target).length ) {
    $('#forgot-modal-con').css("display","none");
    $('#forgot-modal-con').hide();
  }
});
//dorp-down-menu
$(document).ready(function(){
    // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
    $(".drop-item>button").click(function(){
        var submenu = $(this).next("ul");
        // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
        if( submenu.is(":visible") ){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
    });
});