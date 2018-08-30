<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>Insert title here</title>

</head>
<!-- <link rel="stylesheet" href="/auction/resources/css/bootstrap.css">

<script src="/auction/resources/js/bootstrap.js"></script>
<script src="/auction/resources/js/jquery.js"></script> -->

<script src="http://code.jquery.com/jquery.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>

<!-- 스마트 에디터 부분 -->
<script type="text/javascript"
	src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script src="/auction/resources/js/common/common_board_write.js"></script>
<link rel="stylesheet" href="/auction/resources\css\common\common_product_write.css"> 
<style>
.review-title{opacity:0.9;background:black;width:100%;height:110px;
		margin:0px 0px 30px 0px;padding:30px 70px;z-index:1}
.review-title-addr{font-size:30pt;float:right;margin-right:40%;z-index:100;color:white;}
.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
.fa-home{color:white;font-size:15pt;}
</style>
<body>
	<jsp:include page="../main/header.jsp"></jsp:include>
	<div class="review-title">
		<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;Common > &nbsp;Write Page </span>
		<span class="review-title-addr" style="font-family: 'Pacifico', cursive;">Common Write</span>
	</div>	
	<div class="container">

		<h3>물품 정보</h3>
		<br>
		<form id="frm" method="post" action="./common_product_write_ok.nhn"
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="itemname">물품 명</label> <input type="text"
					class="form-control" id="eb_itemname" name="eb_itemname"
					placeholder="물품명을 입력하세요">
			</div>



			<div class="form-group">
				<label for="itemname">글 비밀번호</label> <input type="text"
					class="form-control" id="eb_pass" name="eb_pass"
					placeholder="글 수정시 사용할 비밀번호를 입력하세요">
			</div>

			<div class="form-group">
				<label for="cont">물품 설명</label>
				<textarea name="eb_cont" id="eb_cont" rows="10" cols="100"
					style="width: 766px; height: 412px;"></textarea>
				<!-- <input type="text" class="form-control" id="eb_cont" placeholder="물품 내용을 적어주세요"> -->
			</div>
			<div class="form-group">
				<label for="madein">원산지</label> <input type="text"
					class="form-control" id="eb_madein" name="eb_madein"
					placeholder="원산지를 선택해주세요" readonly="readonly"> <select
					class="form-control" id="madein">
					<option value="">선택해주세요</option>

					<option value="한국">한국</option>
					<option value="미국">미국</option>
					<option value="중국">중국</option>
					<option value="일본">일본</option>
					<option value="기타">기타</option>
				</select>
			</div>

			<div class="form-group">
				<label for="madein">카테고리</label> <input type="text"
					class="form-control" id="eb_categorynum" name="eb_categorynum"
					placeholder="카테고리를 선택해주세요" readonly="readonly"> <select
					class="form-control" id="bigcategory">
					<option value="">대분류</option>
					<option value="패션의류">패션의류</option>
					<option value="패션잡화">패션잡화</option>
					<option value="유아용품">유아용품</option>
					<option value="가구생활">가구/생활</option>
					<option value="식품">식품</option>
					<option value="취미">취미</option>
					<option value="디지털컴퓨터">디지털/컴퓨터</option>
					<option value="스포츠레저">스포츠/레저</option>
					<option value="뷰티">뷰티</option>
					<option value="생활가전">생활가전</option>
					<option value="자동차공구">자동차공구</option>
					<option value="도서기타">도서/기타</option>
				</select> <select class="form-control" id="ey_categorynum"
					name="ey_categorynum">
					<option id="smallcategory" value="">소분류</option>
					<c:forEach var="c" items="${category }">
						<option value="${c.ey_categorynum }">${c.ey_smallcategory }</option>
					</c:forEach>
				</select>
			</div>

			<div class="form-group">
				<label for="upfile">이미지 등록 <img
					src="/auction/resources/images/file_open.png" alt="파일열기"></label> <input
					type="file" class="form-control" id="eb_file" name="uploadfile"
					placeholder="경매물품에 대한 이미지를 넣어주세요">
			</div>

			<h3 id="header3">경매 설정</h3>
			<br>

			<div class="form-group">
				<label for="drprice">즉시입찰가</label> <input type="text"
					class="form-control" id="eb_drprice" name="eb_drprice"
					placeholder="물품 내용을 적어주세요">
			</div>

			<div class="form-group">
				<label for="stprice">경매 시작가</label> <input type="text"
					class="form-control" id="eb_stprice" name="eb_stprice"
					placeholder="경매 시작가를 입력해주세요">
			</div>

			<div class="form-group">
				<label for="stdate">경매 시작일</label> <input type="text"
					class="form-control" id="eb_audate" name="eb_stdate"
					value="경매 시작일에 경우 등록날짜 기준 24시간 후 진행 됩니다." readonly="readonly">
			</div>

			<div class="form-group">
				<label for="ladate">경매 종료일</label> <input type="text"
					class="form-control" id="eb_ladate" name="eb_ladate"
					value="경매 종료일은 경매 시작일로 부터 7일후에 종료 됩니다." readonly="readonly">

			</div>


			<input id="btn" class="btn btn-default pull-right" type="button"
				value="취소하기"> <input id="save"
				class="btn btn-default pull-right" type="submit" value="등록하기">
			<br>
		</form>
	</div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>