<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="footer, links, icons" />

<title>Distributed Footer</title>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<style>
.footer-distributed {
	background-color: black;
	box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.12);
	box-sizing: border-box;
	width: 100%;
	height:200px;
	left: 0;
	bottom: 0;
	text-align: left;
	font: normal 16px sans-serif;
	padding: 10px 50px;
	margin-top:-50px;
	
}

.footer-distributed .footer-left p {
	color: #d1d1d1;
	font-size: 14px;
	margin: 0;
}

/* Footer links */
.footer-distributed p.footer-links {
	font-size: 15px;
	font-weight: bold;
	color: white;
	margin: 0 0 10px;
	padding: 0;
}

.footer-distributed p.footer-links a {
	display: inline-block;
	line-height: 1.8;
	text-decoration: none;
	color: inherit;
}

.footer-left .footer-links a:hover {
	color: #F03C02;
	transition-duration: 0.5s;
}

.footer-distributed .footer-right {
	float: right;
	margin-top: 6px;
	max-width: 180px;
}

.footer-distributed .footer-right a {
	display: inline-block;
	width: 35px;
	height: 35px;
	background-color: black;
	border-radius: 2px;
	font-size: 20px;
	color: white;
	text-align: center;
	line-height: 35px;
	margin-left: 3px;
	transition: 0.5s;
}

.footer-distributed .footer-right a:hover {
    color: #F03C02;
}

/* If you don't want the footer to be responsive, remove these media queries */
@media ( max-width : 500px) {
	.footer-distributed .footer-left, .footer-distributed .footer-right {
		text-align: center;
	}
	.footer-distributed .footer-right {
		float: none;
		margin: 0 auto 20px;
	}
	.footer-distributed .footer-left p.footer-links {
		line-height: 1.8;
	}
}
</style>
</head>

<body>
	<!-- The content of your page would go here. -->

	<footer class="footer-distributed"
		style="padding-bottom: 20px; padding-top: 90px;">

		<div class="footer-right">

			<a href="https://en-gb.facebook.com/login/"><i class="fa fa-facebook"></i></a> 
			<a href="https://twitter.com/login?lang=en"><i class="fa fa-twitter"></i></a> 
			<a href="https://www.linkedin.com/uas/login"><i class="fa fa-linkedin"></i></a>
			<a href="https://www.instagram.com/accounts/login/"><i class="fa fa-instagram"></i></a>

		</div>

		<div class="footer-left">

			<p class="footer-links">
			    <a href="./main.nhn" class="right-menu">HOME</a> ·
				<a href="./intro.nhn">개요</a> · 
				<a href="./common_product_list_img.nhn">일반물품</a> · 
				<a href="./special_product_list.nhn">특별물품</a> · 
				<a href="./special_auction_list.nhn">경매장</a> ·
				<a href="./review_list.nhn">후기</a> · 
				<a href="./notice_list.nhn">고객센터</a>
			</p>

			<p>EasyAuction. &copy; 2018</p>
		</div>

	</footer>

</body>

</html>
