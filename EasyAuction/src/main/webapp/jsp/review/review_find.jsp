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
<style>

img {
	width: 200px;
	height: 200px;
	text-align: right;
	border-radius: 50px;
}

.title {
	color: grey;
	font-size: 50px;
	text-align: center;
}

button {
	border: none;
	outline: 0;
	display: inline-block;
	padding: 8px;
	color: white;
	background-color: #000;
	text-align: center;
	cursor: pointer;
	width: 100%;
	font-size: 18px;
}

.album {
	margin: 0 auto;
	width: 95%
}

.review-write, .mainImage{
	font-size:22pt;
	
}

.review-write{
background-color:#F03C02
}
.mainImage:hover {
	opacity: 0.7;
}

.review-write:hover {
	opacity: 0.7;
}

.img1 {
	width: 16px;
	height: 16px;
	border-radius: 0px;
}

form{
    display: block;
    margin-top: 0em;
   margin-left:75%	
    }
.review-search-form{margin-top:10px;margin-bottom:60px;border-radius:10px;}
.review-title{opacity:0.9;background:black;width:100%;height:150px;
		margin:0px 0px 30px 0px;padding:50px 70px;z-index:1}
.review-title-addr{font-size:30pt;float:left;z-index:100;color:white;}
.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
.fa-home{color:white;font-size:15pt;}
#table_second{margin-bottom:30px;}
</style>

<title>MVC 게시판</title>
<script src="resources/js/jquery-3.3.1.js"></script>
<script>
$(function(){
	var limit; 
	var search_index;
	var text;
	
	$("#viewcount").change(function(){
		limit = $("#viewcount option:selected").val();
		
		$.ajax({
			type : "POST",
			data : {"limit" : limit, "state":"ajax"},
			url : "./review_find_ok.nhn",
			cache:false,
			headers : {"cache-control" : "no-cache",
						"pragma" : "no-cache"},
			success : function(data){
				//alert(data);
				$("#list_table").empty().prepend(data);
			},
			error : function(){
				alert("에러");
			}
		})
	})
	
	$("#viewcount").val("${limit}").attr('selected','selected');
	
	$("#find_field").val("${find_field}").attr('selected','selected');
});
function find_check(){
	if($.trim($("#find_name").val())==""){
		alert("검색어를 입력하세요!");
		$("#find_name").val("").focus();
		return false;
	}
}
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<div class="review-title">
	<span class="review-title-addr">Review Search</span>
	<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;Review > &nbsp;Search Page </span>
</div>
<div class="review-search-form">
<div>
<script>

</script>

<form method="get" action="review_find_ok.nhn" onsubmit="return find_check()">
<table id="table_second">
	<tr>
		<th>
			<select class="form-control"name="find_field" id="find_field">
				<option value="em_id">작성자</option>
				<option value="er_sub">글 제목</option>
			
			</select>
			
		</th>
		<td>
		<input name="find_name" id="find_name" size="18" class="input_box" value="${find_name}">
		<input type="submit" value="검색하기" class="input_box">
		</td>
	</tr>
	</table>
</form>
</div>
<table id="list_table">
<!-- 레코드가 없으면 -->
<c:if test="${listcount ==0 }">
	<tr>
		<td colspan="4">Review find</td>
		<td style="text-align:right">
			<font size=2>검색된 글이 없습니다.</font>
		</td>
	</tr>
</c:if>
</table>
<!-- 레코드가 있으면 -->
	<table class="album">
		<c:set var="num" value="${listcount-(page-1) * 12}" />
		<%--4개 씩 --%>
		<c:set var="i" value="0" />
		<c:set var="j" value="4" />
		<c:forEach var="b" items="${reviewlist}">

			<c:if test="${i % j == 0}">
				<tr>
			</c:if>

			<td><c:set var="num" value="${num-1}" /> <%-- 첨부파일 썸네일 --%>
				<div style="text-align: center">
					<a href="./review_cont.nhn?num=${b.er_num}&page=${page}&state=cont">
						<c:if test="${b.er_file != null}">

							<img src="./resources/upload${b.er_file}">
						</c:if> <%--첨부 파일이 없을 때 썸네일 이미지 --%> <c:if test="${b.er_file == null}">
							<img src="./resources/images/review/no1.png">
							<br>
						</c:if>
					</a>
				</div> <%--게시물 형식 --%>
				<div style="text-align: center; font-weight: bold">
					<a href="./review_cont.nhn?num=${b.er_num}&page=${page}&state=cont" class="mainImage">
						<font size=4>${b.er_sub}</font>
					</a>
				</div>
				<div style="text-align: center">
					<font size=3>조회 ${b.er_hit} | ${b.er_date}</font>
				</div>
				<div style="text-align: center">

					<font size=2>${b.em_id} |[${b.er_kind}] ${b.er_itemname}</font>
				</div> <br> <br></td>
			<c:if test="${i % j == j - 1}">

			</c:if>
			<c:set var="i" value="${i + 1}" />
		</c:forEach>

		<tr>
			<td colspan="5" style="text-align: center"><c:if
					test="${page<=1}">
				이전&nbsp;
			</c:if> <c:if test="${page>1}">
					<a href="./review_list.nhn?page=${page-1}">이전</a>
				</c:if> <c:forEach var="a" begin="${startpage}" end="${endpage}">
					<c:if test="${a==page}">
					${a}
				</c:if>
					<c:if test="${a!=page}">
						<a href="./review_list.nhn?page=${a}">${a}</a>
					</c:if>
				</c:forEach> <c:if test="${page>=maxpage}">
				다음&nbsp;
			</c:if> <c:if test="${page<maxpage}">
					<a href="./review_list.nhn?page=${page+1}">다음</a>
				</c:if></td>
		</tr>


	
</table>
<br>
<div id="reviewfind">
	
			<a href="./review_list.nhn" style="text-align: center" id="write" class="review-write">
		<button class="btn btn-danger btn-lg">전체글보기</button> <br>
	</a>
</div>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>