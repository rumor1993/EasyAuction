<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "../main/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>MVC 게시판</title>
<link href="./resources/css/form.css" rel="stylesheet">
<style>
.review-title{opacity:0.9;background:black;width:92.5%;height:50px;
		margin:0px 0px 30px 0px;padding:50px 70px;z-index:1}
.review-title-addr{font-size:30pt;float:left;z-index:100;color:white;}
.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
.fa-home{color:white;font-size:15pt;}
.special-delete-form{margin:50px;}
</style>
</head>
<body>
	<div class="review-title">
		<span class="review-title-addr">Special Delete</span>
		<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;Special > &nbsp;Delete Page </span>
	</div>	
	<div class="special-delete-form">
<form action="special_product_del.nhn" method="post" name="boardform">
	<input type="hidden" name="eb_itemnum" id="eb_itemnum" value="${boarddata.eb_itemnum }">
	<input type="hidden" name="eb_boardnum" id="eb_boardnum" value="${boarddata.eb_boardnum}">
	<input type="hidden" name="page" id="page" value="${page}">
<table>
	<tr>
		<td><div>비밀번호</div></td>
		<td>
			<input name="eb_pass" id="eb_pass"
					type="password" size="5" maxlength="10" value="">
		</td>
	</tr>
	

	<tr class="center">
		<td colspan="2" class="h30 lime">
			<input type="submit" value="삭제">
			<input type="reset" value="취소" onClick="history.go(-1)">
		</td>
	</tr>
</table>
</form>
</div>
<br><br><br><br>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>