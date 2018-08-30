<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="./resources/js/jquery-3.3.1.js"></script>
<script>   //버튼클릭 스크립트
$(document).ready(function(){
  /*  $('#1').on('click', function(){
      location.href="./member_join.nhn";
   }); */
   $('.nbutton4').on('click', function(){
	   location.href="./main.nhn"
   });
});
</script>
<script>

	function check2() {
		if (!($("input[name='req']").is(":checked"))) {
			alert('약관에 먼저 동의하세요.')
			$("input[name='req']").focus();
			return false;
		} else {
			location.href="./member_join.nhn";
		}
	}
</script>
<style>
.nbutton3, .nbutton4 {
	width: 200px;
	height: 30px;
	padding-left: 10px;
	font-size: 18px;
	color: #f5450dcf;
	border: 1px solid #f5450dcf;
	border-radius: 3px;
	background-color: white;
	cursor:pointer;
}
body{
text-align:center}
	b{
 font-size:20px;
 font-family: 돋음;
 font-weight:bolder;
 color: #f5450dcf;
}
hr{
 border-color: #f5450dcf;
 border-width: 4px;
 width:100%;
}
.abc{
	text-align:center;
	font-size:25px
}
.kkk1{
	margin-left:10%;
	width:25%
}
.join-form{width:100%;}
.review-title{opacity:0.9;background:black;height:50px;
		margin:-40px 0px 50px 0px;padding:30px 70px;z-index:1}
.review-title-addr{font-size:30pt;float:right;margin-right:35%;z-index:100;color:white;}
.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
.fa-home{color:white;font-size:15pt;}
.agree-title{margin-left:100px;}
.buttons12{margin-top:30px;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>약관동의 | 이지옥션</title>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<br><br>
	<div class="review-title">
		<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;SignUp > &nbsp;Agree Page </span>
		<span class="review-title-addr" style="font-family: 'Pacifico', cursive;">SignUp Agree</span>
	</div>
<hr>
	<form action="member_join.nhn" name="form" method="post" class="join-form">
		<table width="100%" height="60%">
			<tr height="15%" style="padding-left:10%">
				<td >
				<h3><strong>이지옥션 이용 동의</strong></h3>
				이지옥션 서비스 이용을 위해서는 아래 약관에 동의해 주세요.
				</td>
			</tr>
			<tr style="border-top-style='solid'">
				<td height="60%" align="center">
					<br>
					<p align="left">
						<span style="padding-left:15%"> <b class="agree-title">이지옥션 약관동의</b></span>
					</p> <br> 
					<textarea class="kkk1" rows="15" cols="150" readonly style="resize:none">
가. 수집하는 개인정보의 항목첫째, 회사는 회원가 입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
회원가입
- 이름, 생년월일, 성별, 아이디, 비밀번호, 별명, 연락처(메일주소, 휴대폰 번호 중 선택), 가입인증정보
만14세 미만 아동 회원가입 
- 이름, 생년월일, 성별, 법정대리인 정보, 아이디, 비밀번호, 연락처 (메일주소, 휴대폰 번호 중 선택), 가입인증정보
단체아이디 회원가입 
- 단체아이디, 회사명, 대표자명, 대표 전화번호, 대표 이메일 주소, 단체주소, 관리자 아이디, 관리자 연락처, 관리자 부서/직위
- 선택항목 : 대표 홈페이지, 대표 팩스번호
둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록


   </textarea>
   <textarea class="kkk1" rows="15" cols="100" readonly style="resize:none">
셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며, 이러한 경우 별도의 동의를 받습니다. 
   넷째, 성인컨텐츠, 유료/게임 등 일부 서비스 이용시 관련 법률 준수를 위해 본인인증이 필요한 경우, 아래와 같은 정보들이 수집될 수 있습니다. 
- 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대폰 번호(선택), 아이핀 번호(아이핀 이용시), 내/외국인 정보
다섯째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다. 
- 신용카드 결제시 : 카드사명, 카드번호 등
- 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등
- 계좌이체시 : 은행명, 계좌번호 등
- 상품권 이용시 : 상품권 번호
나. 개인정보 수집방법회사는 다음과 같은 방법으로 개인정보를 수집합니다. 
- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청
- 협력회사로부터의 제공 
- 생성정보 수집 툴을 통한 수집
   </textarea>
				</td>
			</tr>
		</table>
	</form>
	<div class="abc">
   <input type="checkbox" id="req" name="req">개인정보 수집 및 이용에 동의합니다.</div><br><br>	
	<hr>
	<div class="buttons12">
		<button id="3" class="nbutton3" onclick="check2()">동의하고 회원가입</button>
      	<button id="4" class="nbutton4" onclick="main()">취소 메인페이지로</button>
      </div>
      <br><br><br><br>
      <br><br><br><br>
      <jsp:include page="../main/footer.jsp"/>
</body>
</html>