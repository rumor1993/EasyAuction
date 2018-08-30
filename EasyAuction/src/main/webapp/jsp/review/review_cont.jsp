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

.table1{
	padding:150px;margin-top:-150px;margin-bottom:-120px;
}
.img-locate{text-align:center;}
.img-files{width:70%;height:500px}
.review-cont{padding:40px;border: 2px solid lightgray;border-radius: 10px;}
.review-title{opacity:0.9;background:black;width:100%;height:110px;
		margin:-40px 0px 30px 0px;padding:30px 70px;z-index:1}
.review-title-addr{font-size:30pt;float:right;margin-right:35%;z-index:100;color:white;}
.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
.fa-home{color:white;font-size:15pt;}
</style>
<title>Review - 상세보기</title>

<body>

<jsp:include page="../main/header.jsp"/>
<div id="top"></div>
 <c:set var="reviewdata" value="${reviewdata}"/>
<br><br>
	<div class="review-title">
		<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;Review > &nbsp;View Page </span>
		<span class="review-title-addr" style="font-family: 'Pacifico', cursive;">Review View</span>
	</div>
<div class="table1">
<!-- <table  class="table table-bordered" border="1"> -->
	
	<div class="review-cont">
	<div>
		<label>글쓴이</label> 
		<input class="form-control" readonly value="${reviewdata.em_id}">
	</div>
	<br>
	<div>
		<label>제목</label> 
		<input class="form-control" readonly value="${reviewdata.er_sub}">
	</div>
	
	<br>
	
	<c:if test="${!empty reviewdata.er_file }">
	<div>
	
		<label>첨부파일</label>
			
		<a readonly class="form-control" href="./review_filedown.nhn?filename=${reviewdata.er_file}&original=${reviewdata.er_original}">
			<img src="resources/images/review/down.png" width="10px">${reviewdata.er_original}</a>
		 	<br>
	<br>
		<div class="img-locate">
			<img class="img-files"  src="./resources/upload${reviewdata.er_file}">
		</div>
		</div>
	</c:if> 
	
	<br>
	<div>
		<label>내용</label> 
		<textarea rows="10" class="form-control"  readonly value="">${reviewdata.er_cont}</textarea>
	</div>
	
	<br>
		</div>
		</div>
	<div  style="text-align: center; font-weight: bold">
	<c:if test="${sessionScope.id == reviewdata.em_id|| sessionScope.id == 'admin' }">
	<button type="button" value="수정" class="btn btn-danger btn-lg"
onclick="location.href='review_cont.nhn?num=${reviewdata.er_num}&page=${page}&state=edit'">수정</button>
	<button type="button" value="삭제" class="btn btn-danger btn-lg"
onclick="location.href='review_cont.nhn?num=${reviewdata.er_num}&page=${page}&state=del'">삭제</button>
	</c:if>
	<button type="button" value="목록" class="btn btn-danger btn-lg"
onclick="location.href='review_list.nhn?&page=${page}'">목록</button>
		</div>
	<br><br><br><br><br>
<jsp:include page="../main/footer.jsp"/>

</body>
</html>