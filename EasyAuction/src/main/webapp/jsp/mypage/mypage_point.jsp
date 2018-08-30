<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Easy Auction 충전소</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./resources/js/mypage/mypage_point.js"></script>
<style>
#topBlackBar {border-top: 50px solid #000;}
#eg_orgcoin{margin-left:20px;}
#eg_recoin{margin-left:35px;}
#total{margin-left:50px;}
input{border:1px solid #F03C02}
.submitbtn{border-radius:3px;background-color:#F03C02;color:white;
		margin-left:35%;width:100px;}
</style>
</head>
<body>
	<div id="topBlackBar">
		<h3>Easy Auction 충전소</h3>
	</div>
<hr>
<form name="insertForm">
기존 포인트 <input type="number" readonly="readonly" value="${point}" id="eg_orgcoin" name="eg_orgcoin">원<br><br>
충전 금액 <input type="number" id="eg_recoin" name="eg_recoin"  onkeyup="changeRecoin()">원<br><br>
총 금액 <input type="number" id="total" name="total" readonly="readonly">원<br><br>
<div>포인트 충전은 계좌이체 또는 무통장 입금으로 가능합니다.<br>
요청을 한 뒤 입금을 해주시면 2시간 이내에 충전되고 당일 안에 입금 내역이 없을 시 자동으로 취소됩니다.</div><br>
<input type="button" value="요청" class="submitbtn" onclick="fn_editFL(event)">
</form>
</body>
</html>