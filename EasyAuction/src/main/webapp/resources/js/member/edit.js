var checkconfirm = false; // 아이디 중복 체크 확인 안한 경우
var checkid = '';

function check() {
	
	if ($.trim($("#em_pass").val()) == "") {
		alert("회원비번을 입력하세요!");
		$("#em_pass").val("").focus();
		return false;
	}
	if ($.trim($("#em_pass2").val()) == "") {
		alert("회원비번을 입력하세요!");
		$("#em_pass2").val("").focus();
		return false;
	}
	if ($.trim($("#em_name").val()) == "") {
		alert("회원이름을 입력하세요!");
		$("#em_name").val("").focus();
		return false;
	}
	if ($.trim($("#em_resid1").val()) == "") {
		alert("주민등록번호 앞자리를 입력하세요!");
		$("#em_resid1").val("").focus();
		return false;
	}
	 /*숫자가 아닌 것을 입력한 경우*/ 
	if(isNaN($('#em_resid1').val())){
		alert('주민등록번호는 숫자를 입력하세요.');
		 $("#em_resid1").val("").focus();
		return false;
	}
	 /*숫자가 아닌 것을 입력한 경우 */
	if(isNaN($('#em_resid2').val())){
		alert('주민등록번호는 숫자를 입력하세요.');
		 $("#em_resid2").val("").focus();
		return false;
	}
   
    if ($.trim($("#em_phone2").val()) == "") {
		alert("휴대폰 번호를 입력하세요");
		$("#em_phone2").val("").focus();
		return false;
	}
    if ($.trim($("#em_phone3").val()) == "") {
		alert("휴대폰 번호를 입력하세요");
		$("#em_phone3").val("").focus();
		return false;
	}
    if(isNaN($('#em_phone2').val())){
		alert('휴대폰 번호는 숫자를 입력하세요.');
		 $("#em_phone2").val("").focus();
		return false;
	}
    if(isNaN($('#em_phone3').val())){
		alert('휴대폰 번호는 숫자를 입력하세요.');
		 $("#em_phone3").val("").focus();
		return false;
	}
    if ($.trim($("#em_mailid").val()) == "") {
		alert("이메일 아이디를 입력하세요");
		$("#em_mailid").val("").focus();
		return false;
	}
    if ($.trim($("#em_maildomain").val()) == "") {
		alert("이메일 주소를 입력하세요");
		$("#em_maildomain").val("").focus();
		return false;
	}
    if ($.trim($("#em_post").val()) == "") {
		alert("우편번호를 검색하세요");
		$("#em_address1").val("").focus();
		return false;
	}
    if ($.trim($("#em_address1").val()) == "") {
		alert("주소를 입력하세요");
		$("#em_address1").val("").focus();
		return false;
	}
    if ($.trim($("#em_address2").val()) == "") {
		alert("상세주소를 입력하세요");
		return false;
	}
    if ($.trim($("#em_account").val()) == "") {
		alert("환불계좌를 입력하세요");
		$("#em_address2").val("").focus();
		return false;
	}
    if ($.trim($("#em_bank").val()) == "") {
		alert("은행을 선택하세요");
		$("#em_bank").val("").focus();
		return false;
	}
}

