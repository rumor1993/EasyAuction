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
<style>
.limiter{height:86%;}
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

.login-frame{margin:-180px 0px 0px 0px;}

</style>
</head>
<jsp:include page="../main/header.jsp"/>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55 login-frame">
				<form class="login100-form validate-form flex-sb flex-w"
					method="post" action="member_login_ok.nhn" onsubmit="return check()">
					<span class="login100-form-title p-b-32">
						Account Login
					</span>

					<span class="txt1 p-b-11">
						User ID
					</span>
					<div class="wrap-input100 validate-input m-b-36" data-validate = "Username is required">
						<c:if test="${empty saveid}">
					  	  <input type="text" name="em_id" id="em_id" class="input100" placeholder="아이디"> </c:if>
						  <c:if test="${!empty saveid}">
						  <input type="text" name="em_id" id="em_id" class="input100" value="${saveid}"> </c:if>
						<span class="focus-input100"></span>
					</div>

					<span class="txt1 p-b-11">
						Password
					</span>
					<div class="wrap-input100 validate-input m-b-12" data-validate = "Password is required">
						<span class="btn-show-pass">
							<i class="fa fa-eye"></i>
						</span>
						<input type="password" name="em_pass" id="em_pass" class="input100" placeholder="비밀번호">
						<span class="focus-input100"></span>
					</div>

					<div class="flex-sb-m w-full p-b-48">
						<div class="contact100-form-checkbox">
							<!-- <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me"> -->
							<c:if test="${empty saveid}">
					  	   <input type="checkbox" name="saveid" id="saveid" class="input-checkbox10"> Remember me</c:if>
					  	   
					  	  	<c:if test="${!empty saveid}">
					  	   <input type="checkbox" name="saveid" id="saveid" class="input-checkbox10" checked> Remember me</c:if>
						</div>
						<div>
							<a href="./member_id_find.nhn" class="txt3">
								Forgot ID? |
							</a>
							<a href="./member_pwd_find.nhn" class="txt3">
								Forgot Password?
							</a>
						</div>
					</div>
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Login
						</button>
					</div>
				</form>
				<br><br>
				<div>
					<a href="./member_agree.nhn" class="txt3"> 회원가입 | </a> 
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