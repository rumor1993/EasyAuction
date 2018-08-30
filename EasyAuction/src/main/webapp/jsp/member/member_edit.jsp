<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="./resources/js/jquery-3.3.1.js"></script>
<script src="./resources/js/member/edit.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
<script>
/*비밀번호 수정*/
function checkPass2(){
	  var pw1 = em_pass.value;
	  var pw2 = em_pass2.value;
	  if(pw1!=pw2 && pw2.length == 4){
	   document.getElementById('checkPwd2').style.color = "blue";
	   document.getElementById('checkPwd2').innerHTML = " 암호가 확인 되었습니다."; 
	  }else if (pw1 == pw2){
	   document.getElementById('checkPwd2').style.color = "red";
	   document.getElementById('checkPwd2').innerHTML = " 기존 비밀번호와 같습니다."; 
	  }
}
</script>
<title>정보수정 페이지</title>
</head>
<body>
	<div id="join_wrap">
		<h2 class="join_title">회원정보 수정</h2>
		<form name="f" method="post" action="member_edit_ok.nhn" onsubmit="return check()">
			<table id="join_table">
			 <tr>
			  <th>회원 아이디</th>
			  <td>
			   ${id}
	 	  	  </td>
	 	  	 </tr>
	 	  	<tr>
		 	   <th>현재 비밀번호</th>
		 	   <td>
		 	    <input type="password" name="em_pass" id="em_pass" size="20"
		 	    	class="input_button" placeholder="4자리의 비밀번호를 입력" maxlength="4" value="${editm.em_pass}">
		 	   </td>
		 	</tr>
		 	<tr>
		 	   <th>새로운 비밀번호</th>
		 	   <td>
		 	    <input type="password" name="em_pass2" id="em_pass2" size="20"
		 	    	class="input_button" onkeyup="checkPass2()"
		 	   placeholder="4자리의 비밀번호를 입력" maxlength="4"><span id="checkPwd2"> 새로운 비밀번호를 입력해주세요.</span>
		 	   </td>
		 	</tr>
		 	  <tr>
		 	   <th>이름</th>
		 	   <td>
		 	    <input name="em_name" id="em_name" size="20" class="input_box" value="${editm.em_name}"readonly>
		 	   </td>
		 	  </tr>
		 	  <tr>
		 	   <th>주민등록번호</th>
		 	   <td>
		 	    <input name="em_resid1" id="em_resid1" maxlength="6" 
		 	    size="8" class="input_box" placeholder="앞  6자리" value="${editm.em_resid1}"readonly>
		 	    - <input type="password" name="em_resid2" id="em_resid2" maxlength="7" 
		 	    size="8" class="input_box" placeholder="뒤  7자리" value="${editm.em_resid2}"readonly>
		 	   </td>
		 	  </tr>
		 	  <tr>
		 	   <th>성별</th>
		 	   <td>${editm.em_gender}
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
		 	   			maxlength="4"	class="input_box" value="${em_phone2}">
		 	   	-<input name="em_phone3" id="em_phone3" size="4"
		 	   			maxlength="4"	class="input_box" value="${em_phone3}">
		 	   </td>
		 	   <tr>
		 	    <th>전자우편</th>
		 	    <td>
		 	     <input name="em_mailid" id="em_mailid" size="10"
		 	     		class="input_box" value="${em_mailid}" >
		 	     @<input name="em_maildomain" id="em_maildomain" size="10"
		 	     		 class="input_box" value="${em_maildomain}">
		 	     		 
		 	    	 <select name="mail_list" id="mail_list" onchange="domain_list()">
				 	      <option value="">=이메일선택=</option>
				 	      <c:forEach var="t" items="${em_maildomain}" begin="0" end="16">
								<option value="${t}" selected>${t}</option>
							</c:forEach>
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
		 	    <input type="text" name="em_post" id="em_post" size="8" value="${editm.em_post}"
		 	    	   readonly class="input_box"onclick="goPopup()">
				<input type="button" onclick="goPopup()" value="우편번호 찾기"><br>
				<input type="text" id="em_address1" name="em_address1" size="30" value="${editm.em_address1}" readonly>
				<input type="text" id="em_address2" name="em_address2" value="${editm.em_address2}">
		 	   </td>
		 	  </tr>
		 	  <tr>
		 	   <th>자기소개</th>
		 	   <td><textarea name="em_intro" class="em_intro" rows="5" cols="51">${editm.em_intro}</textarea></td>
		 	  </tr>
		 	  <tr>
		 	   <th>환불계좌</th>
		 	   <td>
		 	    <input name="em_account" id="em_account" size="15" class="input_box" value="${editm.em_account}">
		 	    <select name="em_bank" id="em_bank">
		 	    			<c:forEach var="t" items="${editm.em_bank}" begin="0" end="16">
								<option value="${t}" selected>${t}</option>
							</c:forEach>
		 	    		<option value="">=은행선택=</option>
				 	      <option value="우리">우리</option>
				 	      <option value="신한">신한</option>
				 	      <option value="국민">국민</option>
				 	      <option value="하나">하나</option>
				 	      <option value="농협">농협</option>
		 	    </select>
		 	   </td>
		 	  </tr>
		 	</table>
		 	<div id="join_menu">
		 	 <input type="submit" value="수정" class="input_button">
		 	 <input type="button" value="수정 취소" class="input_button"
		 	 		onClick="history.back()">
		 	 <input type="button" value="회원탈퇴" class="input_button"
		 	 		onClick="location='member_del.nhn'">
		 	</div>   
		 </form>
		</div>
</body>
</html>