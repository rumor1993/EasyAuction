var checkconfirm = false; // 아이디 중복 체크 확인 안한 경우
var checkid = '';

function check2() {
	if ($.trim($("#em_id").val()) == "") {
		alert("회원아이디를 입력하세요!");
		$("#em_id").val("").focus();
		return false;
	}
	if (checkconfirm == false || checkid != $("#em_id").val()) {
		alert("아이디 중복체크하세요!");
		return false;
	}
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
	if ($.trim($("#em_pass").val()) != $.trim($("#em_pass2").val())) {
		// !=같지않다 연산, 비번이 다를 경우
		alert("비번이 다릅니다!");
		$("#em_pass").val("");
		$("#em_pass2").val("");
		$("#em_pass").val("").focus();
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
	if ($("#em_resid1").val().length != 6) {
		alert("주민등록번호 앞자리 6자리를 입력하세요!");
		$("#em_resid1").val("").focus();
		return false;
	}
	
	 /*숫자가 아닌 것을 입력한 경우 */
	if(isNaN($('#em_resid2').val())){
		alert('주민등록번호는 숫자를 입력하세요.');
		 $("#em_resid2").val("").focus();
		return false;
	}
	if ($("#em_resid2").val().length != 7) {
		alert("주민등록번호 앞자리 6자리를 입력하세요!");
		$("#em_resid2").val("").focus();
		return false;
	}
	
    if($('.em_gender1').is(':checked') == false && 
			$('.em_gender2').is(':checked') == false){
		alert('남자, 여자 중에서 선택하세요.')
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

//아이디 중복확인
function id_check() {
	var msg = "";
	var em_id = $('#em_id').val();
	var pattern = /^[a-z]{1}[a-z0-9_]{3,12}$/;
	if (pattern.test($.trim(em_id))) {
		$.ajax({
			type : "POST",
			url : "./member_idcheck.nhn",
			cache : false,
			data : {
				"em_id" : em_id
			},
			success : function(result) {
				if (result == 1) {// 중복 아이디가 있으면
					msg = "아이디 중복";
					showMessage(msg, 'red')
					$('#em_id').val('');
					$('#em_id').focus('');
				} else { // 중복아이디가 없으면
					msg = "아이디 사용가능";
					showMessage(msg, 'blue');
					checkid = em_id;
					checkconfirm = true;
				}
			}
		})
	} else {
		msg = "영어 소문자로 시작하는 영문자 + 숫자 4~12자리만 사용 가능";
		showMessage(msg, 'red');
		$('#join_id').val('');
		$('#join_id').focus('');
	}
}

function showMessage(msg, color){
	$('#idcheck').text(msg);
	$('#idcheck').css('color', color);
}

/*비밀번호 일치*/
function checkPass(){
	  var pw1 = em_pass.value;
	  var pw2 = em_pass2.value;
	  if(pw1!=pw2){
	   document.getElementById('checkPwd').style.color = "red";
	   document.getElementById('checkPwd').innerHTML = " 동일한 암호를 입력하세요."; 
	  }else{
	   document.getElementById('checkPwd').style.color = "blue";
	   document.getElementById('checkPwd').innerHTML = " 암호가 확인 되었습니다."; 
	  }
}

