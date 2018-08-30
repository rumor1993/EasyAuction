<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<title>회원 정보 변경</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/mypage/mypage_info.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style>


.table-responsive tr td{
width: 650px;
height: 40px
} 
.table-responsive tr td input{
 	height:40px;
 	
}
input, select{
border: 0px;
height: 100%
}

#infotable td{
padding-left: 10px;
} 

</style>
<script>
$(document).ready(function(){
	
	$('#em_bank').val('${memberinfo.em_bank}');
	$('#em_pass').focus();
	
})

function check(event){
	if($('#em_phone').val()==''){
	 event.preventDefault();
		alert('전화번호를 다시 입력해 주세요.');
		$('#em_phone').focus();
		return false;
	}
	
	if($('#em_email').val()==''){
		 event.preventDefault();
		alert('이메일을 다시 입력해 주세요.');
		$('#em_email').focus();
		return false;
	}
	
	if($('#em_post').val()==''){
		 event.preventDefault();
		alert('우편번호를 다시 입력해 주세요.');
		$('#em_post').focus();
		return false;
	}
	
	if($('#em_address1').val()=='' && $('#em_address2').val()==''){
		 event.preventDefault();
		alert('주소를 다시 입력해 주세요.');
		$('#em_address1').focus();
		return false;
	}
	
	if($('#em_intro').val()==''){
		 event.preventDefault();
		alert('자기소개를 다시 입력해 주세요.');
		$('#em_intro').focus();
		return false;
	}
	
	if($('#em_account').val()==''){
		 event.preventDefault();
		alert('계좌번호를 다시 입력해 주세요.');
		$('#em_account').focus();
		return false;
	}
	
	if($('#em_bank').val()==''){
		 event.preventDefault();
		alert('은행을 다시 선택해주세요.');
		$('#em_bank').focus();
		return false;
	}
}
</script>
<style>
.review-title{opacity:0.9;background:black;height:50px;
		margin:0px 0px 30px 0px;padding:30px 70px;z-index:1}
.review-title-addr{font-size:30pt;float:right !important;margin-right:35%;z-index:100;color:white;}
.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
.fa-home{color:white;font-size:15pt;}
.submitbtn{width:80px;background-color:#F03C02;color:white;margin-left:-10px;}
</style>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<%@ include file="/jsp/mypage/mypage_header.jsp" %>
<form method="post" action="info_update.nhn" onsubmit="check(event);"
	style="margin-left: 5%;">
	<table border=1 id="infotable" class="table-responsive">
	<tbody>
		<tr>
			<td colspan=2 style="font-weight: bolder;">MY INFO</td>
		</tr>
		<tr>
			<td style="font-style: italic;"> 아이디</td>
			<td><input type="text" value="${memberinfo.em_id}" id="em_id" name="em_id" readonly="readonly"></td>
		</tr>
		<tr>
			<td style="font-style: italic;"> #비밀번호</td>
			<td><input type="password" placeholder="비밀번호를 입력해주세요."  id="em_pass" name="em_pass" ></td>
		</tr>
		<tr>
			<td style="font-style: italic;"> 이름</td>
			<td><input type="text" value="${memberinfo.em_name}" id="em_name" name="em_name" readonly="readonly"></td>
		</tr>
		<tr>
			<td style="font-style: italic;"> 주민번호</td>
			<td><input type="text" value="${memberinfo.em_resid1}  -  ${memberinfo.em_resid2}" id="em_resid" name="em_resid" readonly="readonly">
		</tr>
		<tr>
			<td style="font-style: italic;"> 성별</td>
			<td><input type="text" value="${memberinfo.em_gender}" id="em_gender" name="em_gender" readonly="readonly"></td>
		</tr>
		<tr>
			<td style="font-style: italic;"> #전화번호</td>
			<td><input type="text" value="${memberinfo.em_phone1}" id="em_phone1" name="em_phone1" style="width: 30px">&nbsp;-
			<input type="text" value="${memberinfo.em_phone2}" id="em_phone2" name="em_phone2"style="width: 35px">&nbsp;-
			<input type="text" value="${memberinfo.em_phone3}" id="em_phone3" name="em_phone3"style="width: 35px">
			</td>
		</tr>
		<tr>
			<td style="font-style: italic;"> #이메일</td>
			<td><input type="text" value="${memberinfo.em_email}" id="em_email" name="em_email"></td>
		</tr>
		<tr>
			<td style="font-style: italic;"> #우편번호</td>
			<td><input type="text" value="${memberinfo.em_post}" id="em_post" name="em_post"></td>
		</tr>
		<tr>
			<td style="font-style: italic;"> #주소</td>
			<td><input type="text" value="${memberinfo.em_address1}" style="width: 500px" id="em_address1" name="em_address1"><br>
			<input type="text" value="${memberinfo.em_address2}" style="width: 500px" placeholder="상세주소를 입력해주세요." id="em_address2" name="em_address2"></td>
		</tr>
		
		<tr>
			<td style="font-style: italic;"> #자기소개</td>
			<td><input type="text" value="${memberinfo.em_intro}" id="em_intro" name="em_intro"></td>
		</tr>
		<tr>
			<td style="font-style: italic;"> #계좌번호</td>
			<td><input type="text" value="${memberinfo.em_account}" id="em_account" name="em_account" ></td>
		</tr>	
		<tr>
			<td style="font-style: italic;"> #은행</td>
			<td><select name="em_bank" id="em_bank">
				 	      <option value="우리">우리</option>
				 	      <option value="신한">신한</option>
				 	      <option value="국민">국민</option>
				 	      <option value="하나">하나</option>
				 	      <option value="농협">농협</option>
		 	    </select></td>
		</tr>
		<tr>
			<td style="font-style: italic;"> 취소횟수</td>
			<td><input type="text" value="${memberinfo.em_count}" id="em_count" name="em_count" readonly="readonly"></td>
		</tr>
		<tr>
			<td colspan=2><input type="submit" value="수정" class="submitbtn"></td>
		</tr>
		</tbody>
	</table>
	</form>
	<br><br><br><br>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>