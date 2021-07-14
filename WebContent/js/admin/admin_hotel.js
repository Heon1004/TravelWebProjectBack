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
/*side-nav*/
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

function openTap(event, tabName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tap-content");
    for (i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tab-link");
    for (i = 0; i < tablinks.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    event.currentTarget.className += " active";
}

function filecheck(){
  var imgFile = $('#imgfile').val();
  var fileForm = /(.*?)\.(jpg|jpeg|png)$/; //pdf,bmp,gifもできる
  var maxSize = 5 * 1024 * 1024;
  var fileSize;
  
  if(imgFile != "" && imgFile != null) {
    fileSize = document.getElementById("imgfile").files[0].size;
      if(!imgFile.match(fileForm)) {
        alert("写真だけ添付可能です");
          return document.getElementById("imgfile").value = "";
      } else if(fileSize == maxSize) {
        alert("ファイルサイズは5mbまでです。");
          return document.getElementById("imgfile").value = "";
      }
  }
}
//img Preview
function readURL(input) {
  if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
          $('#imgPreview').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
  }
}

// 등록 이미지 삭제 ( input file reset )
function resetInputFile($input, $preview) {
  var agent = navigator.userAgent.toLowerCase();
  if((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1)) {
      // ie 일때
      $input.replaceWith($input.clone(true));
      $preview.empty();
  } else {
      //other
      $input.val("");
      $preview.empty();
  }       
}

$(".btn-imgdelete").click(function(event) {
  var $input = $(".inp-img");
  var $preview = $('#img-preview');
  resetInputFile($input, $preview);
});

var sel_files = [];

	$(document).ready(function() {
		$("#imgfile").on("change", handleImgsFilesSelect);
	});

	function handleImgsFilesSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			sel_files.push(f);
			var reader = new FileReader();
			reader.onload = function(e){
				var img_html = "<img src=\""+e.target.result+"\" />";
				$(".img-preview").append(img_html);
			}
			reader.readAsDataURL(f);
		});
	}

  window.onload = function() {

    let today = new Date();
    let endDay = today;
  
    //ブラウザで時刻差が9時間あるため足す
    today.setHours(today.getHours()+9);
    today = today.toISOString().slice(0, 10);
    endDay.setDate(endDay.getDate()+7);
    endDay = endDay.toISOString().slice(0, 10);
    //チェックイン日付を設定
    start = document.getElementById("start-date");
    start.value = today;
  
    //チェックアウト日付を設定
    end = document.getElementById("end-date");
    end.value = endDay;
  }