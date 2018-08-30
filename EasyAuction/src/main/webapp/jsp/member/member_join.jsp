<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="./resources/js/jquery-3.3.1.js"></script>
<script src="./resources/js/member/join.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link href="./resources/css/member/join3.css" rel="stylesheet">
<script>
function goPopup(){
    new daum.Postcode({
        oncomplete: function(data) {
        	var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('em_post').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('em_address1').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('em_address2').focus();
        }
    }).open();
} //goPopup() end
</script>
<script>
function domain_list() {
	$("#em_maildomain").val('hhhh');
	/* 리스트에서 직접입력을 선택했을때 */
	if ($("#mail_list").val() == "0") // 직접입력
	{
		// @뒤의 도메인입력란을 공백처리
		$("#em_maildomain").val("");

		// @뒤의 도메인입력란을 쓰기 가능
		$("#em_maildomain").attr("readOnly", false);

		// 도메인입력란으로 입력대기 상태
		$("#em_maildomain").focus();
	} else { // 리스트 목록을 선택했을 때
		$("#em_maildomain").val($("#mail_list").val());
		$("#em_maildomain").attr("readOnly", true);
	}
}
</script>
<title>회원가입 페이지</title>
<style>
	#abc{margin-top:-80px;margin-bottom:-150px;width:100%;}
.review-title{opacity:0.9;background:black;height:50px;
		margin:-40px 0px 30px 0px;padding:30px 70px;z-index:1}
.review-title-addr{font-size:30pt;float:right;margin-right:35%;z-index:100;color:white;}
.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
.fa-home{color:white;font-size:15pt;}
.nbutton2{
    width: 200px;
    height: 30px;
    padding-left: 10px;
    font-size: 18px;
    color: #f5450dcf;
    border: 1px solid #f5450dcf;
    border-radius: 3px;
    background-color: white;
    cursor: pointer;
    vertical-align: middle;
}
</style>
<jsp:include page="../main/header.jsp"/>
</head>
<body>
<hr>
	<div id="join_wrap">
	<div class="review-title">
		<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;SignUp > &nbsp;Join Page </span>
		<span class="review-title-addr" style="font-family: 'Pacifico', cursive;">SignUp Join</span>
	</div>
	<div id="abc">
		<form name="f" id="myform" method="post" action="member_join_ok.nhn" onsubmit="return check2()" 
			style="border:0px!important">
			<table id="join_table">
			 <tr>
			  <th>회원 아이디</th>
			  <td>
			   <input name="em_id" id="em_id" size="20" class="input_box1" placeholder="ID">
			   <input type="button" value="아이디 중복체크"  onclick="id_check()" class="nbutton2">
	 	  			<div id="idcheck"></div>
	 	  	  </td>
	 	  	 </tr>
	 	  	<tr>
		 	   <th>비밀번호</th>
		 	   <td>
		 	    <input type="password" name="em_pass" id="em_pass" size="20"
		 	    	class="input_box1" placeholder="4자리의 비밀번호를 입력" maxlength="4">
		 	   </td>
		 	</tr>
		 	<tr>
		 	   <th>비밀번호 확인</th>
		 	   <td>
		 	    <input type="password" name="em_pass2" id="em_pass2" size="20"
		 	    	class="input_box1" onkeyup="checkPass()" maxlength="4"><span id="checkPwd"> 동일한 암호를 입력하세요.</span>
		 	   </td>
		 	</tr>
		 	  <tr>
		 	   <th>이름</th>
		 	   <td>
		 	    <input name="em_name" id="em_name" size="20" class="input_box1">
		 	   </td>
		 	  </tr>
		 	  <tr>
		 	   <th>주민등록번호</th>
		 	   <td>
		 	    <input name="em_resid1" id="em_resid1" maxlength="6" 
		 	    size="8" class="input_box1" placeholder="앞  6자리">
		 	    - <input type="password" name="em_resid2" id="em_resid2" maxlength="7" 
		 	    size="8" class="input_box1" placeholder="뒤  7자리">
		 	   </td>
		 	  </tr>
		 	  <tr>
		 	   <th>성별</th>
		 	   <td><input type="radio" name="em_gender" id="em_gender1" class="em_gender1" value="남자"> 남자
		 	  	   <input type="radio" name="em_gender" id="em_gender2" class="em_gender2" value="여자"> 여자
		 	   </td>
		 	  </tr>
		 	  <tr>
		 	   <th>휴대전화번호</th>
		 	   <td>
		 	   <select name="em_phone1">
		 	   			<option value="010">010</option>
		 	   			<option value="019">019</option>
		 	   	</select>
		 	   	-<input name="em_phone2" id="em_phone2" size="4"
		 	   			maxlength="4"	class="input_box1">
		 	   	-<input name="em_phone3" id="em_phone3" size="4"
		 	   			maxlength="4"	class="input_box1">
		 	   </td>
		 	   <tr>
		 	    <th>전자우편</th>
		 	    <td>
		 	     <input name="em_mailid" id="em_mailid" size="10"
		 	     		class="input_box1">
		 	     @<input name="em_maildomain" id="em_maildomain" size="10"
		 	     		 class="input_box1">
		 	     		 
		 	    	 <select name="mail_list" id="mail_list" onchange="domain_list()" style="width:160px !important">
				 	      <option value="">=이메일선택=</option>
				 	      <option value="naver.com">naver.com</option>
				 	      <option value="daum.net">daum.net</option>
				 	      <option value="nate.com">nate.com</option>
				 	      <option value="hotmail.com">hotmail.com</option>
				 	      <option value="gmail.com">gmail.com</option>
				 	      <option value="0">직접입력</option>
		 	     	 </select>
		 	    </td>
		 	   </tr>
		 	   <tr>
		 	    <th>주소</th>
		 	    <td>
		 	    <input type="text" name="em_post" id="em_post" size="8" 
		 	    	   class="input_box1" placeholder="우편번호" onclick="goPopup()" style="width:100px !important">
				<input type="button" onclick="goPopup()" value="우편번호 찾기"  class="nbutton2"><br>
				<input type="text" class="input_box1" id="em_address1" name="em_address1" placeholder="주소"  style="width:250px !important">
				<input type="text" class="input_box1" id="em_address2" name="em_address2" placeholder="상세주소">
		 	   </td>
		 	  </tr>
		 	  <tr>
		 	   <th>자기소개</th>
		 	   <td><textarea name="em_intro"  class="em_intro" rows="5" cols="200"></textarea></td>
		 	  </tr>
		 	  <tr>
		 	   <th>환불계좌</th>
		 	   <td>
		 	    <input name="em_account" id="em_account" size="15" class="input_box1">
		 	    <select name="em_bank" id="em_bank"  style="width:120px !important" style="text-align:center !important">
		 	    		<option value="">=은행선택=</option>
				 	      <option value="우리">우리</option>
				 	      <option value="신한">신한</option>
				 	      <option value="국민">국민</option>
				 	      <option value="하나">하나</option>
				 	      <option value="농협">농협</option>
		 	    </select>
		 	   </td>
		 	  </tr>
		 	</table><br><br>
		 	<div id="join_menu">
		 	 <input type="submit" value="회원가입" class="nbutton5">&nbsp;
		 	 <input type="reset" value="가입취소" class="nbutton6" onclick="$('#em_id').focus();">
		 	 &nbsp;
		 	 <a href="member_login.nhn"><input type="button" value="로그인" class="nbutton7"></a>
		 	</div>   
		 </form>
		 </div>
		 </div>
		 <hr>
		 <jsp:include page="../main/footer.jsp"/>
</body>

	</html>