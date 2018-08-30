<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>로그인 | 이지옥션</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="./resources/js/jquery-3.3.1.js"></script>
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="./resources/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/css/member/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/css/member/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/css/member/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/css/member/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/css/member/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/css/member/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/css/member/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/css/member/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/css/member/util.css">
	<link rel="stylesheet" type="text/css" href="./resources/css/member/main.css">
<!--===============================================================================================-->
</head>
<style>
.wrap-input100 {
    width: 100%;
    position: relative;
    background-color: #fff;
    border: 1px solid #f5450dcf;
    border-radius: 2px;
}
.login100-form-btn {
    font-family: Raleway-Bold;
    font-size: 16px;
    color: #f5450dcf;
    line-height: 1.2;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 0 20px;
    min-width: 150px;
    height: 55px;
    background-color: white;
    border-radius: 25px;
    -webkit-transition: all 0.4s;
    -o-transition: all 0.4s;
    -moz-transition: all 0.4s;
    transition: all 0.4s;
    border: 1px solid #f5450dcf;
}
</style>
<jsp:include page="../main/header.jsp"/>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
			<div class="tabHead">
				<a href="./member_id_find.nhn" class="tabHeadbtn01">아이디 찾기</a> | 
				<a href="./member_pwd_find.nhn" class="tabHeadbtn02">비밀번호 찾기</a>
			</div>
			<br><br>
				<form class="flex-w"
					method="post" action="member_id_ok.nhn">
					<span class="login100-form-title p-b-32">
						ID find
					</span>

					<span class="txt1 p-b-11">
						이름(실명)
					</span>
					<div class="wrap-input100 validate-input m-b-36" data-validate = "Username is required">
						<input type="text" name="em_name" id="em_name"class="input100" placeholder="Name" required/>
						<span class="focus-input100"></span>
					</div>

					<span class="txt1 p-b-11">
						이메일
					</span>
					<div class="wrap-input100 validate-input m-b-36" data-validate = "Usermail is required">
						<input type="text" name="em_email" id="em_email" class="input100" placeholder="xxxxxxxx@xxxxxx.xxx">
						<span class="focus-input100"></span>
					</div>
					
					<span class="txt1 p-b-11">
						휴대전화
					</span>
					<div class="wrap-input100 validate-input m-b-36" data-validate = "Userphone is required">
						<input type="text" name="em_phone" id="em_phone"class="input100" placeholder="010-XXXX-xxxx" required/>
						<span class="focus-input100"></span>
					</div>
					
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							아이디 찾기!
						</button>
					</div>
				</form>
				<br><br>
				<div>
					<a href="./member_agree.nhn" class="txt3"> 회원가입 | </a> 
					<a href="./member_login.nhn" class="txt3"> 로그인 | </a> 
					<a href="./main.nhn" class="txt3"> 메인으로 가기 </a>
				</div>
			</div>
		</div>
	</div>
	<div id="dropDownSelect1"></div>
	<jsp:include page="../main/footer.jsp"/>
</body>
<!--===============================================================================================-->
	<script src="./resources/js/member/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="./resources/js/member/popper.js"></script>
	<script src="./resources/js/member/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="./resources/js/member/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="./resources/js/member/moment.min.js"></script>
	<script src="./resources/js/member/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="./resources/js/member/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="./resources/js/member/main.js"></script>
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-23581568-13');
	</script>
</html>