$(function(){
	$("#eb_stprice").keyup(function(){
		 // 입력 값 알아내기
	    var _this = this;
	    numberFormat(_this);
	    
	})
})

// 콤마 찍기
function comma(str) {
  str = String(str);
  return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

// 콤마 풀기
function uncomma(str) {
  str = String(str);
  return str.replace(/[^\d]+/g, '');
}

function numberFormat(obj) {
  obj.value = comma(uncomma(obj.value));
}


/*var han;
var flag = true; // 단위 판별 플래그

*//**
* 숫자로 된 문자열을 입력받아 숫자에 해당하는 한글명을 리턴한다.
* @Param : 숫자로된 문자열
* @Return : 숫자에 해당하는 한글명
*//*
function numToHan2(val){
	switch(Number(val)){
		case 1 : han = "일"; break;
		case 2 : han = "이"; break;
		case 3 : han = "삼"; break;
		case 4 : han = "사"; break;
		case 5 : han = "오"; break;
		case 6 : han = "육"; break;
		case 7 : han = "칠"; break;
		case 8 : han = "팔"; break;
		case 9 : han = "구"; break;
		case 0 : han = ""; break;
	}
	return han;
}

*//**
* 숫자의 인덱스를 입력받아 단위에 해당하는 한글명을 리턴한다.
* @Param : 숫자의 인덱스
* @Return : 인덱스에 해당하는 단위
*//*
function danwiToHan(val){
	 일 단위는 Skip 
	if (val == 0){
		return "";
	}
	var namerji = val % 5;

	switch(namerji){
		case 0: // 나머지가 '0'이면 만, 억, 조 중에 하나이다.
			if (val / 4 == 1){
				han = "만";
				flag = false;
			}
			else if (val / 4 == 2){
				han = "억";
				flag = false;
			}
			else if (val / 4 == 3){
				han = "조";
				flag = false;
			}
			break;
		case 2: // 나머지가 '1'이면 십단위이다.
			han = "십"; flag = true;
			break;
		case 3: // 나머지가 '2'이면 백단위이다.
			han = "백"; flag = true;
			break;
		case 4: // 나머지가 '3'이면 천단위이다.
			han = "천"; flag = true;
			break;
	}
	return han;
}


function numToHan(){
	var str = "";
	var num = $("#sb_stprice").val();
	var digit = new Array();
	var j = num.length - 1;
	alert(j);

	if (num.length > 20){ // 단위가 천조를 넘을 경우
		alert("금액이 너무 큽니다.");
		return;
	}

	for (var i = 0; i < num.length; i ++){
		digit[j] = num.charAt(i); // 숫자를 거꾸로 담는다.(배열에 reverse()라는 function이 이 역할을 한다.)
		str += numToHan2(digit[j]);

------------------------------------------------------------------
 숫자가 0이 아닐 경우 단위 무조건 판별 
 숫자가 0인 경우 인덱스가 4로 나누어 떨어지는 경우(만, 억, 조) 중 
 하나만 선택할 수 있도록 flag를 둔다. 
 잘 이해가 안되면 flag를 빼고 1억을 쳐보셈... ^^; 
------------------------------------------------------------------
		if (digit[j] != "0" || (j % 4 == 0) && flag && digit[j] != ","){
			str += danwiToHan(j);
		}
		j --;
	}

if (str != ""){
	$("#money_change").html(str + " 원정");
}
else{
	$("#money_change").html("");
}
}*/

