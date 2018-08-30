<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>공지사항</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function check2() {
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
h1 {
	color: #F03C02;
	margin-left:10%;
}
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
</style>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div class="review-title">
		<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;Notice > &nbsp;Edit Page </span>
		<span class="review-title-addr" style="font-family: 'Pacifico', cursive;">Notice Edit</span>
	</div>
<div id="boardwrite_wrap">
<form action="notice_edit_ok.nhn" method="post" enctype="multipart/form-data"
		onsubmit="return check()" style="margin-bottom: 50px;">
	<input type="hidden" name="en_num" value="${bcont.en_num}">
	<input type="hidden" name="page" value="${page}">
		<br>
	<h1>공지사항 글수정</h1>
	<table>
		<tr>
			<td><div>게시자</div></td>
			<td>
				<input name="en_admin" id="en_admin" readOnly
						type="text" value="${bcont.en_admin}">
			</td>
		</tr>
		<tr>
			<td><div>제목</div></td>
			<td><input name=en_sub id="en_sub" type="text" value="${bcont.en_sub}">
		</tr>
		<tr>
			<td><div>내용</div></td>
			<td>
			<pre id="preview"><textarea name="en_cont" id="en_cont"
				  cols="56" rows="15">${bcont.en_cont}</textarea></pre>
			</td>
		</tr>
		<tr>
			<td><div>첨부된 파일</div></td>
			<td>${bcont.en_original}</td>
		</tr>	
		<tr>
			<td><div>첨부 파일</div></td>
			<td>
			<input type="file" id="upfile" name="uploadfile"> 
			</td>
		</tr>
	</table>
		<br><br>
		<div class="center" style="text-align:center">
				<button type=submit class="nbutton1">등록</button>
				<button type=reset class="nbutton1" onClick="history.go(-1);">취소</button>
		</div>
	</form>
	<br><br><br>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>
