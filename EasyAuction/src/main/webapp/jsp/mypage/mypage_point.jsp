<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Easy Auction ������</title>
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
		<h3>Easy Auction ������</h3>
	</div>
<hr>
<form name="insertForm">
���� ����Ʈ <input type="number" readonly="readonly" value="${point}" id="eg_orgcoin" name="eg_orgcoin">��<br><br>
���� �ݾ� <input type="number" id="eg_recoin" name="eg_recoin"  onkeyup="changeRecoin()">��<br><br>
�� �ݾ� <input type="number" id="total" name="total" readonly="readonly">��<br><br>
<div>����Ʈ ������ ������ü �Ǵ� ������ �Ա����� �����մϴ�.<br>
��û�� �� �� �Ա��� ���ֽø� 2�ð� �̳��� �����ǰ� ���� �ȿ� �Ա� ������ ���� �� �ڵ����� ��ҵ˴ϴ�.</div><br>
<input type="button" value="��û" class="submitbtn" onclick="fn_editFL(event)">
</form>
</body>
</html>