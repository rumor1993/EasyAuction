<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dokdo" rel="stylesheet">
<style>

body {
	margin: 0;
	font-family: Arial;
}

/*| ======================== |*/
/*| ======= Button1 ======== |*/
/*| ======= start   ======== |*/
/*| ======================== |*/

.button1 {
  display: inline-block;
  border-radius: 4px;
  background-color: #28A745;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 28px;
  padding: 9px;
  width: 70px;
  height: 25px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 6px;
}

.button1 span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  top: -17px;
  transition: 0.5s;
}

.button1 span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button1:hover span {
  padding-right: 25px;
}

.button1:hover span:after {
  opacity: 1;
  right: 0;
}

.button1_align {
  top: -20px;
}

/*| ======================= |*/
/*| ======= Button1 ======= |*/
/*| ======= end     ======= |*/
/*| ======================= |*/

/*| ======================== |*/
/*| ======= Button2 ======== |*/
/*| ======= start   ======== |*/
/*| ======================== |*/

.button2 {
  display: inline-block;
  border-radius: 4px;
  background-color: #f4511e;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 28px;
  padding: 9px;
  width: 70px;
  height: 25px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 1px;
}

.button2 span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  top: -17px;
  transition: 0.5s;
}

.button2 span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button2:hover span {
  padding-right: 25px;
}

.button2:hover span:after {
  opacity: 1;
  right: 0;
}

.button2_align {
  top: -20px;
}

/*| ======================= |*/
/*| ======= Button2 ======= |*/
/*| ======= end     ======= |*/
/*| ======================= |*/

/*| ======================== |*/
/*| ======= Button3 ======== |*/
/*| ======= start   ======== |*/
/*| ======================== |*/

.button3 {
  display: inline-block;
  border-radius: 4px;
  background-color: #1e90ff;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 28px;
  padding: 9px;
  width: 70px;
  height: 25px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 8px;
}

.button3 span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  top: -17px;
  transition: 0.5s;
}

.button3 span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button3:hover span {
  padding-right: 25px;
}

.button3:hover span:after {
  opacity: 1;
  right: 0;
}

.button3_align {
  top: -20px;
}

/*| ======================= |*/
/*| ======= Button3 ======= |*/
/*| ======= end     ======= |*/
/*| ======================= |*/

.header {
	z-index: 100;
	height: 140px;
	overflow: hidden;
	background-color: white;
	padding: 60px 80px 50px 80px;
	box-sizing: border-box;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

.header div {
	align: center;
}

/*| ============================ |*/
/*| ======= Mail / User ======== |*/
/*| =======    start    ======== |*/
/*| ============================ |*/

div.dropdown1 {
	position: absolute;
	right:150px;
	color:white;
}

div.dropdown3 {
	position: absolute;
	right: 200px;
	color:#F03C02;
}

div.dropdown2 {
	position: absolute;
	right: 80px;
	color:#F03C02;
}

div.dropdown4 {
	position: absolute;
	right: 110px;
	color:#F03C02;
}

.dropdown1:hover .dropdown-content1 {
	display: block;
}

.dropdown2:hover .dropdown-content2 {
	display: block;
	z-line:100;
}

.dropdown3:hover .dropdown-content3 {
	display: block;
}

div.mail-contnet {
    height: 71px;
}

.dropdown-content1 {
	display: none;
	position: absolute;
	background-color: black;
	min-width: 100px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

span.hover {
    font-size: 10px;
}

.dropdown-content2 {
	display: none;
	position: absolute;
	background-color: black;
	min-width: 100px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content2 a:hover {
	border-left: 0;
}

.dropdown-content3 {
	display: none;
	position: absolute;
	background-color: black;
	min-width: 100px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content3 a:hover {
	border-left: 0;
}

.mail-contnet h5 {
	font-size: 15px;
	margin-top: 0px;
	margin-bottom: 10px;
	font-size: 15px;
	text-align: left;
}

.mail-contnet span {
	text-align: left;
}

.mail-contnet time {
	font-align: left;
}

.end-title {
    color: #f1f1f1;
}

hr {
	margin-top: 0px;
	border: 0;
	height: 1px;
	background-image: linear-gradient(to right, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));
}

.header div.dropdown1 {
	float: left;
	color: black;
	text-align: center;
	padding: 10px;
	text-decoration: none;
	font-size: 15px;
	line-height: 20px;
	top: 20px;
	bottom: 20px;
}

.header div.dropdown1:hover {
	color: white;
	transition: 0.3s;
}

.header div.dropdown2 {
	float: left;
	color: black;
	text-align: center;
	padding: 10px;
	text-decoration: none;
	font-size: 15px;
	line-height: 20px;
	top: 20px;
	bottom: 20px;
}

.header div.dropdown2:hover {
	color: white;
	transition: 0.3s;
}

.header div.dropdown4 {
	float: left;
	color: black;
	text-align: center;
	padding: 10px;
	text-decoration: none;
	font-size: 15px;
	line-height: 20px;
	top: 20px;
	bottom: 20px;
}

.header div.dropdown4:hover {
	color: white;
	transition: 0.3s;
}

.header div.dropdown3 {
	float: left;
	color: black;
	text-align: center;
	padding: 10px;
	text-decoration: none;
	font-size: 15px;
	line-height: 20px;
	top: 20px;
	bottom: 20px;
	height:0px;
}

.header div.dropdown3:hover {
	color: white;
	transition: 0.3s;
}

.header a.mail-text:hover {
    color: #F03C02;
    border-top: 0;
    border-bottom: 0;
    transition: 0.3s;
}

.header a.profile:hover {
    color: white;
    border-top: 0;
    border-bottom: 0;
    transition: 0.3s;
}

.header a.logout:hover {
    color: white;
    border-top: 0;
    border-bottom: 0;
    transition: 0.3s;
}

.header a.right-menu {
   color: black;
   font-weight:bolder;
}

/*| ============================ |*/
/*| ======= Mail / User ======== |*/
/*| =======    start    ======== |*/
/*| ============================ |*/

/*| ====================== |*/
/*| ======= scroll ======= |*/
/*| ======= start  ======= |*/
/*| ====================== |*/

.scrollBlind {
    height: 200px;
    overflow-y: scroll;
}

.alarmBlind {
    height: 150px;
    overflow-y: scroll;
}

/*| ====================== |*/
/*| ======= scroll ======= |*/
/*| ======= end    ======= |*/
/*| ====================== |*/

/*| ====================== |*/
/*| ======= close  ======= |*/
/*| ======= button ======= |*/
/*| ======= start  ======= |*/
/*| ====================== |*/

.close-button {
  height: 50px;
  width: 50px;
  position: relative;
  box-sizing: border-box;
  line-height: 50px;
  display: inline-block;
  magin-left: 13px;
}
.close-button:before, .close-button:after {
  transform: rotate(-45deg);
  content: '';
  position: absolute;
  top: 50%;
  left: 50%;
  margin-top: -2px;
  margin-left: -14px;
  display: block;
  height: 3px;
  width: 22px;
  background-color: black;
  transition: all 0.25s ease-out;
}
.close-button:after {
  transform: rotate(-135deg);
}
.close-button:hover:before, .close-button:hover:after {
  transform: rotate(0deg);
}

.header a.close-button:hover {
  border-top: 0;
  border-bottom: 0;
}

/*| ====================== |*/
/*| ======= close  ======= |*/
/*| ======= button ======= |*/
/*| ======= end    ======= |*/
/*| ====================== |*/

span.hover {
    font-size: 10px;
}

.dropdown-content2 {
	display: none;
	position: absolute;
	background-color: black;
	min-width: 280px;
	margin-top:-18px;
	margin-left:-265px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content2 a:hover {
	border-left: 0;
}

.dropdown-content3 {
	display: none;
	position: absolute;
	background-color: black;
	min-width: 300px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content3 a:hover {
	border-left: 0;
}

.mail-contnet h5 {
	font-size: 15px;
	margin-top: 0px;
	margin-bottom: 10px;
	font-size: 15px;
	text-align: left;
}

.mail-contnet span {
	text-align: left;
}

.mail-contnet time {
	font-align: left;
	float: right;
}

.drop-title {
    color: white;
}

hr {
	margin-top: 0px;
	border: 0;
	height: 1px;
	background-image: linear-gradient(to right, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));
}

.header a {
	float: left;
	color: #F03C02;
	text-align: center;
	text-decoration: none;
	line-height: 50px;
	transition: 0.5s;
	top: 10px;
	bottom: 20px;
}

.header div.dropdown1 {
	float: left;
	color: #F03C02;
	text-align: center;
	padding:0px;
	text-decoration: none;
	font-size: 13px;
	line-height: 20px;
	top: 20px;
	bottom: 20px;
}

.header div.dropdown1:hover {
	color: #F03C02;
	transition: 0.3s;
}

.header div.dropdown2 {
	float: left;
	color: #F03C02;
	text-align: center;
	padding: 10px;
	text-decoration: none;
	font-size: 13px;
	line-height: 50px;
	top: 10px;
	bottom: 20px;
}

.header div.dropdown2:hover {
	color: #F03C02;
	transition: 0.3s;
}

.header div.dropdown4 {
	float: left;
	color: #F03C02;
	text-align: center;
	padding: 10px;
	text-decoration: none;
	font-size: 13px;
	line-height: 50px;
	top: 10px;
	bottom: 20px;
}

.header div.dropdown4:hover {
	color: #F03C02;
	transition: 0.3s;
}

.header div.dropdown3 {
	float: left;
	color: #F03C02;
	text-align: center;
	padding: 10px;
	text-decoration: none;
	font-size: 13px;
	line-height: 20px;
	top: 20px;
	bottom: 20px;
	left:10px;
}

.header div.dropdown3:hover {
	color: #F03C02;
	transition: 0.3s;
}

.header a.logo {
	font-size: 40px;
	font-weight: bold;
	background-color: white;
	color: black;
	margin-top:-10px;
	margin-bottom:-30px;
}

.header a.logo:hover {
	color: black;
	border-bottom: none;
	border-top: none;
	border-left: 0px;
}

.header a:hover {
	color: #F03C02;
}

/*| ====================== |*/
/*| ======= mail  ======== |*/
/*| ======= pulse ======== |*/
/*| ======= action ======= |*/
/*| ====================== |*/

.pulse {
  position: absolute;
  display: block;
  top: 5px;
  right: -4px;
  left: 25px;
  width: 10px;
  height: 10px;
  background: #ef5350;
  z-index: 10;
  box-shadow: 0 0 0 rgba(239,83,80, 0.4);;
  border-radius: 70px;
  cursor: pointer;
  animation: pulse 2s infinite;
}

@-webkit-keyframes pulse {
  0% {
    -webkit-box-shadow: 0 0 0 0 rgba(239,83,80, 0.4);
  }
  70% {
      -webkit-box-shadow: 0 0 0 10px rgba(239,83,80, 0);
  }
  100% {
      -webkit-box-shadow: 0 0 0 0 rgba(239,83,80, 0);
  }
}
@keyframes pulse {
  0% {
    -moz-box-shadow: 0 0 0 0 rgba(239,83,80, 0.4);
    box-shadow: 0 0 0 0 rgba(239,83,80, 0.4);
  }
  70% {
      -moz-box-shadow: 0 0 0 10px rgba(239,83,80, 0);
      box-shadow: 0 0 0 10px rgba(239,83,80, 0);
  }
  100% {
      -moz-box-shadow: 0 0 0 0 rgba(239,83,80, 0);
      box-box-shadow: 0 0 0 0 rgba(239,83,80, 0);
  }
}

/*| ====================== |*/
/*| ======= pulse ======== |*/
/*| ======= action ======= |*/
/*| ======= end   ======== |*/
/*| ====================== |*/

.header-right {
	float: right;
}

@media screen and (max-width: 500px) {
	.header a {
		float: none;
		display: block;
		text-align: left;
		text-size: 10px;
	}
	.header-right {
		float: none;
	}
}

.button1, .button2{vertical-align:middle}
.toggle-img{width:30px; height:30px;margin:40px 110px 0px 0px;}
.menu-box{font-weight:bolder !important;font-size:17px !important;transition: 0.5s;}
.dropdown-menubar{background:black;text-align:center;color:white;display:none;}
.down-menu{font-size:13pt;font-weight:350;padding:5px;transition: 0.5s;}
.down-menu:hover{background:#F03C02;color:white;}
.dropdown2{float:left;}
.logo{padding:10px;}
.sign-in{margin-left:-5px;margin-right:8px;padding: 0px 0px 0px 15px;}
.mail-content{padding:0px 0px 2px 0px;text-weight:bolder;}
.mail-desc{color:white;padding:0px 0px 0px 10px;font-size:11pt;}
.mail-desc:hover{color:#F03C02;}
.right-menu{padding:0px 10px;}
</style>
<style>
/* Extra small devices (phones, 550px and down) */
@media only screen and (max-width: 550px) {
    .header a {float: none;display: inline-block;text-align: left;}
    .toggle-img{display:block;}
    .menu-box{display:none;}
    .dropdown-menubar{display:none;}
}
/* Small devices (portrait tablets and large phones, 550px and up) */
@media only screen and (min-width: 550px) {
	.toggle-img{display:none;}
	.dropdown-menubar{display:none;}
}
</style>
<script src="./resources/js/jquery-3.3.1.js"></script>
<script>
	$(document).ready(function(){
		var state = true;
		$(window).resize(function(){
			if(window.innerWidth > 550){
				$(".dropdown-menubar").css("display", "none");
				$(".toggle-img").css("display", "none");
				$(".toggle-img").css("margin-top", "40px");
				$(".dropdown1").css("margin-top", "-10px");
				$(".dropdown2").css("margin-top", "-10px");
				$(".dropdown4").css("margin-top", "-10px");
			} else if(window.innerWidth <= 550) {
				$(".toggle-img").css("display", "block");
			}
		});
		
		$(".toggle-img").click(function(){
			if(state){
				$(".dropdown-menubar").css("display", "block");
				$(".toggle-img").css("margin-top", "230px");
				$(".dropdown1").css("margin-top", "180px");
				$(".dropdown2").css("margin-top", "180px");
				$(".dropdown4").css("margin-top", "180px");
				
				state = false;
			} else {
				$(".dropdown-menubar").css("display", "none");
				$(".toggle-img").css("margin-top", "40px");
				$(".dropdown1").css("margin-top", "-10px");
				$(".dropdown2").css("margin-top", "-10px");
				$(".dropdown4").css("margin-top", "-10px");
				state = true;
			}
		});

		
		messageView();
		confirmBtnClick();

	});
	
	function messageView(){
		
		$(".dropdown2").hover(function(){
			$('.total-count').empty();
			$('.scrollBlind').empty();
			var count = 0;
			$.ajax({
				type: "POST",
				url: "./message_view.nhn",
				success: function(rdata){
					$(rdata).each(function(index, item){
						var output = '';
						output += '<div class="mail-content">';
						if(item.eb_itemnum.indexOf('CP')){
							output += '<a href="' + "./common_product_cont.nhn?eb_itemnum=" 
									+ item.eb_itemnum + '&eb_state=cont" class="mail-text">';
						} else if(item.eb_itemnum.indexOf('SP')){
							output += '<a href="' + "./special_product_cont.nhn?eb_itemnum=" 
							+ item.eb_itemnum + '&page=1&eb_state=cont" class="mail-text">';
						}
						output += '<span class="mail-desc">물품 1건이 낙찰되었습니다.</span></a>';
						output += '<button class="button1 approvebtn confirm-color"'
							+ 'value="el_num=' + item.el_num + '&eb_itemnum=' + item.eb_itemnum 
							+ '&el_request=' + item.el_request  + '&el_response=' + '${sessionScope.id}' + '">'
							+ '<span class="hover">확인</span></button>';
						output += '</div>';
						$('.scrollBlind').append(output);
						count = count + 1;
					});
					$('.total-count').append(count);
				}
			});
		});
	}	
	
	function confirmBtnClick(){
		$('.scrollBlind').on("click", ".approvebtn", function(){
			messageData = $(this).val();
			$.ajax({
				type:"POST",
				data: messageData,
				url: "./message_confirm.nhn",
				success: function(result){
					alert("확인 되셨습니다.");
					history.go(0);
				}
			});
		})
	}

</script>
</head>
<body>
<div class="dropdown-menubar">
	<div class="down-menu down-menu1"><a href="./intro.nhn" style="color:white;">개요</a></div>
	<div class="down-menu down-menu2"><a href="./common_product_list_img.nhn" style="color:white;">일반물품</a></div>
	<div class="down-menu down-menu3"><a href="./special_product_list.nhn" style="color:white;">특별물품</a></div>
	<div class="down-menu down-menu4"><a href="./special_auction_list.nhn" style="color:white;">경매장</a></div>
	<div class="down-menu down-menu5"><a href="./review_list.nhn" style="color:white;">후기게시판</a></div>
	<div class="down-menu down-menu6"><a href="./notice_list.nhn" style="color:white;">고객센터</a></div>
</div>

<div class="header" id="myHeader">
	<div class="dropdown3">
		<img src="./resources/images/menu.png" class="toggle-img" id="toggle-img">
	</div>

<a href="./main.nhn" class="logo"><strong style="color:#F03C02">E</strong>asy<String style="color:#F03C02">A</String>uction.</a>
<div>
  <div class="header-right">
    <div class="menu-box">
	    <a href="./intro.nhn" class="right-menu right-menu1">개요</a>
	    <a href="./common_product_list_img.nhn" class="right-menu right-menu2">일반물품</a>
	    <a href="./special_product_list.nhn" class="right-menu right-menu3">특별물품</a>
	    <a href="./special_auction_list.nhn" class="right-menu right-menu4">경매장</a>
	    <a href="./review_list.nhn" class="right-menu right-menu5">후기</a>
	    <a href="./notice_list.nhn" class="right-menu right-menu6">고객센터</a>
    </div>
  </div>
 	<div class="sign-box">
 		<div class="dropdown4" style="height:15px;">
 			<a href="./mypage_like.nhn"><i class="fa fa-heart" aria-hidden="true"></i></a>
 		</div>
  		<div class="dropdown2" style="height: 15px;">
			<i class="fa fa-envelope"></i>
			<c:if test="${sessionScope.id != 'admin' }">
			<div class="dropdown-content2">
				<div class="drop-title"><strong class="total-count"></strong>개의 알림 있습니다.</div>
				<div class="scrollBlind">
					<div></div>
				</div>
			</div>
			</c:if>
			<span class="pulse pulse-content2" style="display:none;"></span>
		</div>
		<div class="dropdown1" style="height: 15px;">
			<c:if test="${sessionScope.id == null}">
				<a href="./member_agree.nhn" data-toggle="modal" class="sign-up"><i class="fa fa-user"></i> Sign Up</a>
		   	 	<a href="./member_login.nhn" data-toggle="modal" class="sign-in">Sign In</a>
	   	 	</c:if>
	   	 	<c:if test="${sessionScope.id != null}">
	   	 		<c:if test="${sessionScope.id != 'admin' }">
					<a href="./mypage.nhn" data-toggle="modal" class="sign-up"><i class="fa fa-user"></i> ${sessionScope.id}</a>
				</c:if>
				<c:if test="${sessionScope.id == 'admin' }">
					<a href="./admin.nhn" data-toggle="modal" class="sign-up"><i class="fa fa-user"></i> ${sessionScope.id}</a>
				</c:if>
		   	 	<a href="./member_logout.nhn" data-toggle="modal" class="sign-in sign-out">Logout</a>
	   	 	</c:if>
  		</div>
	</div>
</div>
</div>

</body>
</html>
