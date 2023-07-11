function checkAll() {
	let isChecked = document.getElementById("checkAll").checked; // true or false 리턴

	let chks = document.getElementsByName('chk');

	for (let i = 0; i < chks.length; i++) {
		chks[i].checked = isChecked;
	}
}

function prodDel() {
	let chks = document.getElementsByName('chk');

	let prodNumStr = "";
	let separator = false;

	for (let i = 0; i < chks.length; i++) {
		if (chks[i].checked) {
			if (separator) {
				prodNumStr = prodNumStr + '/';
			}

			prodNumStr = prodNumStr + chks[i].value;
			separator = true;
		}
	}


	if (!prodNumStr) { // null은 거짓
		alert("삭제할 상품을 체크하세요!!");
		return;
	}
	// 삭제할 상품명을 예를 들어 '7/9' 와 같이 문자열로 묶어서 input에 저장
	document.cartForm.delProdNums.value = prodNumStr;

	console.log("prodNumStr : " + prodNumStr);

	let res = confirm("삭제 하시겠습니까?");
	if (res) {
		document.cartForm.submit();
	}
}
function usePoint(obj, point, price) {
	let elem = document.getElementById("point");
	let tot_amount = document.getElementById("cartTotPrice");
	
	if(obj.checked){
		elem.value = point;
																// 천단위 정규표현식
		tot_amount.innerText = (price - point).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";  
	}else{
		elem.value = "";  
		tot_amount.innerText = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";  
	}
}

function removeChar(e){
	e.target.value = e.target.value.replace(/[^0-9]/g,'');
}

// 지불방법 선택
function selPayment(){
	let pms = document.getElementsByName("payment");
	
	for(let i=0;i<pms.length;i++){
		if(pms[i].checked){
			document.getElementById(pms[i].value).style.display="block";
		}else{
			document.getElementById(pms[i].value).style.display="none";
		}
	}
}
