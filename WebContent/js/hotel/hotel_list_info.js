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