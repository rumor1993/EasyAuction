<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- �ΰ����� �׸� -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
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
<title>Review -  �Խ���</title>
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
	
		<th colspan="2">Review ���� ������</th>
	</tr>
	
	
	<tr>
		<td><div>��й�ȣ</div></td>
		<td>
			<input name="er_pass" id="er_pass"
					type="password" size="5" maxlength="10" value="" class="form-control">
		</td>
	</tr>
	

	<tr class="center">
		<td colspan="2" class="h30 lime">
			<button type="submit" value="����" class="btn btn-danger btn-lg">����</button>
			<button type="reset" value="���" class="btn btn-danger btn-lg" onClick="history.go(-1)">���</button>
		</td>
	</tr>
	
</table>
</div>
</form>
</body>
</html>