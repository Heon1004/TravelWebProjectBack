function openloginModal(){
    document.getElementById("login-modal-con").style.display = "block";
}
 function closeloginModal(){
  document.getElementById("login-modal-con").style.display = "none";
}

function openregisterModal(){
  document.getElementById("register-modal-con").style.display = "block";
}
function closeregisterModal(){
document.getElementById("register-modal-con").style.display = "none";
}

function openforgotModal(){
  document.getElementById("forgot-modal-con").style.display = "block";
}
function closeforgotModal(){
document.getElementById("forgot-modal-con").style.display = "none";
}

document.getElementById('register-link').addEventListener('click', function () {
  document.getElementById('login-modal-con').style.display = 'none';
  document.getElementById('register-modal-con').style.display = 'block';
});
document.getElementById('forgot-link').addEventListener('click', function () {
  document.getElementById('login-modal-con').style.display = 'none';
  document.getElementById('forgot-modal-con').style.display = 'block';
});

document.getElementById('login-link').addEventListener('click', function () {
  document.getElementById('register-modal-con').style.display = 'none';
  document.getElementById('login-modal-con').style.display = 'block';
});

var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var adminExp = "admin";
var pwExp = /.{8,25}$/;
function checkEmail(form){
	var email = document.getElementById('regEmail1').value;
	var pw = document.getElementById('regPw1').value;
	var rePw = document.getElementById('reEnter1').value;
	
	if(regExp.test(email) && email.indexOf(adminExp) == -1){
		if(pwExp.test(pw) && pwExp.test(rePw)){
			if(pw == rePw){
				form.submit();
			}else{
				alert('もう一度パスワードを確認してください。');
			}
		}else{
			alert('パスワードは8文字以上です。');
		}
	}else{
		alert('emailが正しくありません。adminは使用できません。');
	}
}

function reCheckEmail(form){
	var email = document.getElementById('regEmail2').value;
	var pw = document.getElementById('regEmail2').value;
	var rePw = document.getElementById('reEnter2').value;
	if(regExp.test(email) && email.indexOf(adminExp) == -1){
		if(pwExp.test(pw) && pwExp.test(rePw)){
			if(pw == rePw){
				form.submit();
			}else{
				alert('もう一度パスワードを確認してください。');
			}
		}else{
			alert('パスワードは8文字以上です。');
		}
	}else{
		alert('emailが正しくありません。adminは使用できません。');
	}
}

function loginCheck(form){
	var email = document.getElementById('loginEmail').value;
	var pw = document.getElementById('loginPw').value;
	if(regExp.test(email)){
		if(pwExp.test(pw)){
			form.submit();
		}else{
			alert('パスワードは8文字以上です。');
		}
	}else{
		alert('メールが正しくありません。');
	}
}
