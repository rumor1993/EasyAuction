<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "../main/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="./resources/js/special/wait_update.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
	.table_responsive{padding:0px 100px;}
	.table{border:2px solid black;}
	.table th{font-size:15pt;text-align:center;vertical-align:middle !important;border-right:2px solid black;}
	.btn-kind1{margin-top:20px;margin-left:30%;}
	.input_button{width:12%;height:50px;background-color:#F03C02;color:white;
			border:0px solid black;border-radius:10px;margin:0px 20px;}
	.input_button:hover{background-color:gray;color:black;}
	.review-title{opacity:0.9;background:black;width:100%;height:110px;
			margin:0px 0px 0px 0px;padding:30px 70px;z-index:1}
	.review-title-addr{font-size:30pt;float:right;margin-right:35%;z-index:100;color:white;}
	.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
	.fa-home{color:white;font-size:15pt;}
</style>
</head>
<body>
  <div class="review-title">
		<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;Special > &nbsp;View Page </span>
		<span class="review-title-addr" style="font-family: 'Pacifico', cursive;">Special View</span>
	</div>
<c:set var="board" value="${boarddata}"/>
<br><br>
<div class="table_responsive">
<table border='1' class="table">
	<tr>
		<th>물품번호</th>
		<td>${board.eb_itemnum }</td>
	</tr>
	<tr>
		<th>글번호</th>
		<td>${board.eb_boardnum }</td>
	</tr>
	<tr>
		<th>검증상태</th>
		<td><div id="eb_wait_area">${board.eb_state}</div></td>
	</tr>
	<tr>
		<th width="20%">글쓴이</th> 
		<td>${board.em_id}</td>
	</tr>
	<tr>
		<th>글 비밀번호</th>
		<td>${board.eb_pass }</td>
	</tr>
	<tr>
		<th>물품이름</th> 
		<td>${board.eb_itemname}</td>
	</tr>
	<tr>
		<th>내 용</th> 
		<td>${board.eb_cont}</td>
	</tr>
		<tr>
			<th>메인이미지</th>
			<td>
				<c:choose>
				   <c:when test="${empty board.eb_file}">
				    &nbsp;
				   </c:when>
				   <c:otherwise>
				   <img src="resources/upload${board.eb_file}" style="width:100px; height:100px">
				   </c:otherwise>
				</c:choose>
			</td>	
		</tr>	
	<tr>
		<th>원산지</th>
		<td>${board.eb_madein }</td>
	</tr>
	<tr>
		<th>희망 경매일</th>
		<td>${board.eb_choicedate}</td>
	</tr>
	<tr>
		<th>희망 가격</th>
		<td>${board.eb_stprice }원</td>
	</tr>
	</table>
	</div>
	<div class="btn-kind1">
		<c:if test="${sessionScope.id == board.em_id || sessionScope.id == 'admin' }">
			<input type="button" value="수정" class="input_button" 
			onclick="location.href='special_product_cont.nhn?eb_itemnum=${board.eb_itemnum}&eb_boardnum=${board.eb_boardnum}&page=${page}&state=edit'">
			<input type="button" value="삭제" class="input_button" 
			onclick="location.href='special_product_cont.nhn?eb_itemnum=${board.eb_itemnum}&eb_boardnum=${board.eb_boardnum}&page=${page}&state=del'">
		</c:if>
		<input type="hidden" value="${board.eb_itemnum}" id="eb_itemnum">
		<input type="hidden" value="${board.eb_boardnum}" id="eb_boardnum">
		<input type="hidden" value="${page}" id="page">
		<c:if test="${sessionScope.id == 'admin' }">
			<c:if test="${board.eb_state == '대기' }">
			<input type="button" value="검증하기" class="input_button" onClick="location.href=
				'special_product_wait.nhn?eb_itemnum=${board.eb_itemnum}&page=${page}&eb_state=${board.eb_state}'">
			</c:if>
			<c:if test="${board.eb_state == '검증중' }">
			<input type="button" value="검증완료" class="input_button" onClick="location.href=
				'special_product_wait.nhn?eb_itemnum=${board.eb_itemnum}&page=${page}&eb_state=${board.eb_state}'">
			</c:if>
			<c:if test="${board.eb_state == '검증완료' }">
			<input type="button" value="특별오픈준비" class="input_button" onClick="location.href=
				'special_product_open_ready.nhn?eb_itemnum=${board.eb_itemnum}'">
			</c:if>
		</c:if>
		<input type="button" value="목록" class="input_button" 
	onclick="location.href='special_product_list.nhn?&page=${page}'">
	</div>	

<br><br><br>
<br><br><br>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>