function searchTap(event, tabName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tab-content");
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

//htmlでtab-contentにstyle="display: block;" && none を設定しないと最初に内容の全部が出てくる
function hotelTap(event, tabName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("hotel-tab-content");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("hotel-tab-link");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(tabName).style.display = "block";
  event.currentTarget.className += " active";
}

function keepChecked(value){
  var id = "review-item" + value;
  
  if(document.getElementById(id).className == "review-item active"){
    //replace関数が適用されない。
    document.getElementById(id).className = "review-item";
  }else{
    document.getElementById(id).className += " active";
  }
} 
//jQueryの$(document).ready(function()をJSで
// document.addEventListener("DOMContentLoaded", function(){
//   // alert("aaa");
//   });
  
  
//ブラウザが開いたら実行される
var today = new Date();
var endDay = today;
window.onload = function() {

  //ブラウザで時刻差が9時間あるため足す
  today.setHours(today.getHours()+9);
  today = today.toISOString().slice(0, 10);
  endDay.setDate(endDay.getDate()+1);
  endDay = endDay.toISOString().slice(0, 10);
  //チェックイン日付を設定
  start = document.getElementById("start-date");
  start.value = today;

  //チェックアウト日付を設定
  end = document.getElementById("end-date");
  end.value = endDay;
  start.setAttribute("min", start.value);
  end.setAttribute("min", end.value);
}

function setairDate(){

  //チェックイン日付を設定
  start = document.getElementById("start-date-air");
  start.value = today;
  start.setAttribute("min", start.value);
  
  //チェックアウト日付を設定
  end = document.getElementById("end-date-air");
  end.value = endDay;
  end.setAttribute("min", end.value);
}

function rentDate(){

  start = document.getElementById("start-date-rentcar");
  start.value = today;
  start.setAttribute("min", start.value);

  end = document.getElementById("end-date-rentcar");
  end.value = endDay;
  end.setAttribute("min", end.value);
}

function guestCount(id){
  var guest = ['guest-room','guest-adult','guest-child'];
  var check = ['Room','Adult','Child']
  var add = 'add';
  var remove = 'remove';
  for(var i=0; i<guest.length; i++){
    if(id === remove+check[i]){
      var num = document.getElementById(guest[i]).value;
      if(num > 0){
        var result = parseInt(num)-1;
        document.getElementById(guest[i]).value = result;
      }
    }else if(id === add+check[i]){
      var num = document.getElementById(guest[i]).value;
      var result = parseInt(num)+1;
      document.getElementById(guest[i]).value = result;
    }
  }
}


/* 日数を数える */
// var sdt = new Date('string_Date1');
// var edt = new Date('string_Date2');
// var dateDiff = Math.ceil((edt.getTime()-sdt.getTime())/(1000*3600*24));
// ex) dateDiff = (차이일수를 정수로 반환)