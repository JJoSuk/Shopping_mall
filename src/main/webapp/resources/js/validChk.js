/**
 * 유효성 검사 
 */
function inputChk(){
	if(document.joinForm.id.value.length == 0){
		alert("아이디를 입력하세요!!");
		joinForm.id.focus();
		return;
	}
	if(document.joinForm.pw.value.length == 0){
		alert("비밀번호를 입력하세요!!");
		joinForm.pw.focus();
		return;
	}
	if(document.joinForm.pw.value != document.joinForm.pwConfirm.value){
		alert("비밀번호가 일치하지 않습니다!!");
		joinForm.pwConfirm.focus();
		return;
	}
	if(document.joinForm.name.value == 0){
		alert("이름을 입력하세요!!");
		joinForm.name.focus();
		return;
	}
	if(document.joinForm.tel.value == 0){
		alert("전화번호를 입력하세요!!");
		joinForm.tel.focus();
		return;
	}
	if(document.joinForm.email.value == 0){
		alert("이메일을 입력하세요!!");
		joinForm.email.focus();
		return;
	}
	if(document.joinForm.addr.value == 0){
		alert("주소를 입력하세요!!");
		joinForm.addr.focus();
		return;
	}
	
	document.joinForm.submit();
}