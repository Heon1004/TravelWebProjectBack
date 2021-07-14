function keepChecked(value){
    var id = "review-item" + value;
    
    if(document.getElementById(id).className == "review-item active"){
      //replace関数が適用されない。
      document.getElementById(id).className = "review-item";
    }else{
      document.getElementById(id).className += " active";
    }
  }  
  
  //ブラウザが開いたら実行される
  window.onload = function() {
  
    let today = new Date();
    let endDay = today;
  
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