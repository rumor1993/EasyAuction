<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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

form{padding:100px;}
/* #close{display:none} */
.review-title{opacity:0.9;background:black;width:100%;height:110px;
		margin:0px 0px -50px 0px;padding:30px 70px;z-index:1}
.review-title-addr{font-size:30pt;float:right;margin-right:35%;z-index:100;color:white;}
.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
.fa-home{color:white;font-size:15pt;}
</style>
<title>Review  게시판</title>
<script src="resources/js/jquery-3.3.1.js"></script>
<script>
	$(function(){
		$('#upfile').change(function(){
		      var inputfile=$(this).val().split('\\');
		        $('#close').show();
		        $('#filevalue').text(inputfile[inputfile.length-1])
		        
		   });
		   $("#close").click(function(){
		      $('#filevalue').text('');
		      $("#close").hide();
		      $('#upfile').val('');
		      $('.er_original').val('');
		      $('.er_file').val('');
		   });
	
		   
	})
</script>

</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div class="review-title">
		<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;Review > &nbsp;Write Page </span>
		<span class="review-title-addr" style="font-family: 'Pacifico', cursive;">Review Write</span>
	</div>
<c:set var="reviewdata" value="${reviewdata}"/>
<form action="./review_edit_ok.nhn" method="post" enctype="multipart/form-data"
		onsubmit="return check()">
<input type="hidden" name="er_num" value="${reviewdata.er_num}">
<input type="hidden" name="page" value="${page}">

<table  class="table table-striped">
	<tr>
		<td><div>글쓴이</div></td>
		<td>
			<input name="em_id" id="em_id" readOnly class="form-control"
					type="text" size="50" maxlength="10" value="${reviewdata.em_id}">
		</td>
	</tr>
	
	<tr>
		<td><div>비밀번호</div></td>
		<td>
			<input name="er_pass" id="er_pass"
					type="password" size="50" maxlength="10" value="" class="form-control">
		</td>
	</tr>
	
	<tr>
		<td><div>제 목</div></td>
		<td>
			<input name="er_sub" id="er_sub"
					type="text" size="50" maxlength="100" class="form-control" value="${reviewdata.er_sub}">
		</td>
	</tr>
	<tr>
		<td><div>내 용</div></td>
		<td>
			<textarea name="er_cont" id="er_cont"
				class="form-control"cols="67" rows="15">${reviewdata.er_cont}</textarea>
		</td>
	</tr>
	
	<tr>
		<td><div>첨부파일</div></td>
		<td>
			<label for="upfile"><img src="resources/images/review/file_open.png" alt="파일열기"
          	style="width:30px; height:30px;"></label>
            <input type="file" name="uploadfile" id="upfile"
            style="display:none">
            <input type="hidden" class="er_original" name="er_original" value="${reviewdata.er_original}">
            <input type="hidden" class="er_file" name="er_file" value="${reviewdata.er_file}">
            <span id="filevalue">${reviewdata.er_original}</span>&nbsp;
            <span id="close"><img src="resources/images/review/cancel.png"
            style="width:30px; height:30px;"></span>
		</td>
	</tr>	
	
</table>
	<div class="center"  style="text-align: center; font-weight: bold">
		<br>
		<div class="h30 lime">
			<button type="submit" value="등록" class="btn btn-danger btn-lg">등록</button>
			<button type="reset" value="취소" onClick="history.go(-1)" class="btn btn-danger btn-lg">취소</button>
		</div>
	</div>
</form>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>