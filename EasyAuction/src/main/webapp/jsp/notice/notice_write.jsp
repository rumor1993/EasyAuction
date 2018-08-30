<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>공지사항</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function check() {
	if ($.trim($("#en_sub").val()) == "") {
		alert("제목을 입력하세요!");
		$("#en_sub").val("").focus();
		return false;
	}
	
	if ($.trim($("#en_cont").val()) == "") {
		alert("글 내용을 입력하세요!");
		$("#en_cont").val("").focus();
		return false;
	}
</script>
<style>
table{
	margin:0 auto;
	width:80% ;
	border-collapse:collapse;
	}
tr:nth-child(1){
	border-top:2px solid #F03C02; 
}
tr{
	border-bottom:1px solid #cdc9c9;
	height:60px;
}
td:nth-child(1){
	width:15%;    
	background-color: #f1f1f1;
	border-bottom:1px solid #cdc9c9;
	text-align:center;
}
textarea{
	width:100%;
	heigth:1800px;
	border-right:0px;
}
input, td, th{
	font-family:돋음; 
	font-size:20; 
}
h1 {
	color: #F03C02;
	margin-left:10%;
}
input[type=submit],input[type=reset]{border-radius:5px}

.nbutton1 {
	width: 120px;
	height: 30px;
	padding-left: 10px;
	font-size: 18px;
	color: #F03C02;
	border: 1px solid #F03C02;
	border-radius: 3px;
	background-color: white;
	cursor:pointer;
}
.review-title{opacity:0.9;background:black;height:50px;
		margin:0px 0px 30px 0px;padding:30px 70px;z-index:1}
.review-title-addr{font-size:30pt;float:right;margin-right:35%;z-index:100;color:white;}
.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
.fa-home{color:white;font-size:15pt;}
	.head-title{width:200px;}
</style>
</head>
<jsp:include page="../main/header.jsp"/>
<body>
	<div class="review-title">
		<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;Notice > &nbsp;Write Page </span>
		<span class="review-title-addr" style="font-family: 'Pacifico', cursive;">Notice Write</span>
	</div>
<form action="notice_write_ok.nhn" method="post" enctype="multipart/form-data" 
	  name="boardform" onsubmit="return check()">
		<br>
	<h1>공지사항 글쓰기</h1>
	<table>
		<tr>
			<td><div>게시자</div></td>
			<td>
				<input name="en_admin" id="en_admin" readOnly
						type="text" size="6" maxlength="30" value="admin" 
						style="text-align:center">
			</td>
		</tr>
		<tr>
			<td><div>제목</div></td>
			<td><input name=en_sub id="en_sub"type="text"maxlength="100"></td>
		</tr>
		<tr>
			<td><div>내용</div></td>
			<td><pre id="preview"><textarea name="en_cont" id="en_cont"  cols="67" rows="22"></textarea></pre>
			</td>
		</tr>
		<tr>
			<td>
				<div>파일 첨부</div>
			</td>
			<td>
				<input type="file" id="uploadfile" name="uploadfile" >
			</td>
		</tr>
	</table>
		<br><br>
		<div class="center" style="text-align:center">
				<button type=submit class="nbutton1">등록</button>
				<button type=reset class="nbutton1" onClick="history.go(-1);">취소</button>
		</div>
</form>
<br><br><br><br>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>
