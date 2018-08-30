<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항 삭제</title>
<link href="./resources/css/board.css" rel="stylesheet">
<script src="./resources/js/jquery-3.3.1.js"></script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="boardwrite_wrap">
		<h2 class="boardwrite_title">게시물 삭제</h2>
		<h1>삭제 하시겠습니까?</h1>
		<form name="deleteForm" action="./notice_del_ok.nhn" method="post">
			<input type="hidden" name="en_num" value="${bcont.en_num}">
			<input type="hidden" name="page" value="${page}">
			
			<div id="boarddel_menu">
				<input type="submit" value="삭제">
				<input type="reset" value="취소" onclick="history.go(-1)">
			</div>
		</form>
	</div>
</body>
</html>