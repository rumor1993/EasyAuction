<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="resources/js/mypage/mypage_main.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/mypage/mypage_main.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Doppio+One" rel="stylesheet">
<style>
.review-title{opacity:0.9;background:black;height:110px;
		margin:0px 0px 50px 0px;padding:30px 70px;z-index:1}
.review-title-addr{font-size:30pt;float:right;margin-right:35%;z-index:100;color:white;}
.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
.fa-home{color:white;font-size:15pt;}
	.profile-body{padding:0px 100px;}
	.two-color{border: 1px solid #F03C02;border-radius: 3px;color: #F03C02;}
	.addpoint{background-color:#F03C02;border-radius:3px;color:white !important;}
	.minuspoint{background-color:#5C4AC7;border-radius:3px;color:white !important;}
</style>
</head>
<body>
	<div id="all">
	<div class="review-title">
		<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;MyPage > &nbsp;Main Page </span>
		<span class="review-title-addr" style="font-family: 'Pacifico', cursive;">MyPage</span>
	</div>
	<div class="profile-body">
	<div id="one" style="margin-top: 10px;">
		<input type="image" src="./resources/images/mypage/man.png"id="img1">
	</div>
	<div style="display: inline-block;margin-left:120px;">
	<p><br><h4>&nbsp;${id} 님</h4> <br><a href="./mypage_info.nhn" style="color: black; text-decoration: none;font-family: '굴림'; font-size:small;">[회원정보변경]</a>
	</p>
	</div>
	<div id="space" style="border-left:1px solid #ddd; width: 5px; height: 70px; display: inline-block;"></div>
	<div id="point" style="display: inline-block; ">
		<div style="font-weight: bold;">포인트</div>
		<div style="margin-bottom: 10px;margin-top: 10px; font-weight: bolder;">
		<img src="./resources/images/mypage/coin.png"> ${point}원 
		<input type="button" value="포인트 충전" onclick="popupAction();" class="addpoint" id="addpoint" style="font-weight: normal;"/>
		<input type="button" value="반환" onclick="popupAction2();" class="minuspoint" id="addpoint" style="font-weight: normal;"/>
		</div>
	</div>
		<div id="three">
			<button class="two two-color" onclick="location.href='./mypage_order.nhn'">주문조회</button>
			<button class="two two-color" onclick="location.href='./mypage_sale.nhn'">판매조회</button>
			<button class="two two-color" id="up" onclick="location.href='./mypage_pointlist.nhn'">포인트</button>
			<button class="two two-color" onclick="location.href='./mypage_like.nhn'">좋아요</button>
			<button class="two two-color" onclick="location.href='./mypage_review.nhn'">후기</button>
		</div>
		</div>
		</div>
</body>
</html>