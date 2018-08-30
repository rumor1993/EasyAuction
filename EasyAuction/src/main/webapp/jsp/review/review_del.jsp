<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">

   
  .table1{
	padding:100px;
	}
.review-title{opacity:0.9;background:black;width:100%;height:110px;
	margin:0px 0px 0px 0px;padding:30px 70px;z-index:1}
.review-title-addr{font-size:30pt;float:right;margin-right:35%;z-index:100;color:white;}
.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
.fa-home{color:white;font-size:15pt;}
</style>
<title>Review -  게시판</title>
<script src="./resouces/js/jquery-3.3.1.js"></script>
<link href="resources/css/form.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div class="review-title">
		<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;Review > &nbsp;Delete Page </span>
		<span class="review-title-addr" style="font-family: 'Pacifico', cursive;">Review Delete</span>
	</div>
<form action="review_del.nhn" method="post" name="reviewform">
	<input type="hidden" name="er_num" id="er_num" value="${reviewdata.er_num}">
	<input type="hidden" name="page" id="page" value="${page}">
	<div class="table1">
<table >
	<tr class="center">
	
		<th colspan="2">Review 삭제 페이지</th>
	</tr>
	
	
	<tr>
		<td><div>비밀번호</div></td>
		<td>
			<input name="er_pass" id="er_pass"
					type="password" size="5" maxlength="10" value="" class="form-control">
		</td>
	</tr>
	

	<tr class="center">
		<td colspan="2" class="h30 lime">
			<button type="submit" value="삭제" class="btn btn-danger btn-lg">삭제</button>
			<button type="reset" value="취소" class="btn btn-danger btn-lg" onClick="history.go(-1)">취소</button>
		</td>
	</tr>
	
</table>
</div>
</form>
</body>
</html>