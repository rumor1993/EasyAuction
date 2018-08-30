<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>경매 물품 상세보기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/auction/resources/css/common/common_product_cont.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="/auction/resources/js/common/common_product_cont.js"></script>
<style>
.review-title{opacity:0.9;background:black;width:100%;height:110px;
		margin:0px 0px 30px 0px;padding:30px 70px;z-index:1}
.review-title-addr{font-family: 'Pacifico', cursive;font-size:30pt;float:right;margin-right:35%;z-index:100;color:white;}
.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
.fa-home{color:white;font-size:15pt;}
</style>
</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>
<div class="review-title">
		<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;Common > &nbsp;View Page </span>
		<span class="review-title-addr" style="font-family: 'Pacifico', cursive;">Common View</span>
	</div>	
<script>
		 acutionStartDate = new Date('${boardcont.eb_audate}');
		 check = ${Check };
		 end = new Date($('#bidladate').val());
</script>
<img id="basket_heart2" src="./resources/images/heart_black.png">
	<div class="table-responsive" id="table_box">

		<table border="1" class="table" id="pro_table">

			<h3>
				경매 물품 &nbsp;<img id="basket_heart"
					src="./resources/images/heart_black.png" width="50px" height="50px">
			</h3>

			<tr>
				<td id="image_box" rowspan="10"><img alt="이미지"
					src="./resources/upload${boardcont.eb_file }" width="60%"
					height="400px"></td>
				<th>최고입찰가</th>
				<td id=tabletd class="laprice">${boardcont.eb_laprice}</td>
			</tr>

			<tr>
				<th>최고입찰자</th>
				<td id=tabletd class="buyer">${buyer }</td>
			</tr>

			<tr>
				<th>시작가</th>
				<td id=tabletd class="stprice">${boardcont.eb_stprice}</td>
			</tr>

			<tr>
				<th>즉시입찰가</th>
				<td id=tabletd>${boardcont.eb_drprice}</td>
			</tr>

			<tr>
				<th>물품번호</th>
				<td id=tabletd>${boardcont.eb_itemnum}</td>
			</tr>


			<tr>
				<th>물품명</th>
				<td id=tabletd>${boardcont.eb_itemname}</td>
			</tr>

			<tr>
				<th>경매기간</th>
				<td id=tabletd class="biddate">${boardcont.eb_audate} ~ ${boardcont.eb_ladate}</td>
				<input type="hidden" id="bidladate" value="${boardcont.eb_ladate}">
			</tr>

			<tr>
				<th>남은시간</th>
				<td id=tabletd class="ladate"></td>
			</tr>

			<tr>
				<th>입찰 수</th>
				<td id=tabletd class="bidcount">${boardcont.eb_bidcount }</td>
			</tr>

			<tr>
				<th>관심 수</th>
				<td id=tabletd class="attcount">${boardcont.eb_attcount }</td>
			</tr>

		</table>
		<div>
			
			<input id="btnBasket" class="btn btn-default pull-right" type="button" value="찜하기" onclick="ea_basket()">
			 <input id="btnCurrBid" class="btn btn-default pull-right" type="button" data-toggle="modal" data-target="#myModal2" value="즉시입찰">
			 <input id="btnBid" class="btn btn-default pull-right" type="button" data-toggle="modal" data-target="#myModal" value="입찰하기">
		</div>
	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span> 
					</button>
					<h4 class="modal-title" id="myModalLabel">입찰하기</h4>
				</div>
				<div class="modal-body">
					<b class="laprice2">현재 최고 입찰가는 ${boardcont.eb_laprice}원 입니다.</b><br>
					<br>

					<p>
						<label>입찰금액&nbsp;:&nbsp;</label><input type="text" id="bidprice"
							name="bidprice" placeholder="입찰 금액을 입력 해주세요">
					</p>
					<label class="errorlabel"></label>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="ea_bid()">입찰</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">나가기</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span> 
					</button>
					<h4 class="modal-title" id="myModalLabel">즉시입찰하기</h4>
				</div>
				<div class="modal-body">
					<b class="laprice2">즉시입찰가는${boardcont.eb_drprice} 원 입니다.</b><br>
					<br>

					<p>
						<label>입찰금액&nbsp;:&nbsp;</label>
						<input type="text" id="fastbid" name="fastbid" value="${boardcont.eb_drprice}" readonly="readonly">
					</p>
					<label class="errorlabel"></label>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="ea_fastbid()">즉시입찰</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">나가기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="table-responsive" id="table_box">
		<table border="1" class="table">
			<h3>판매자 정보 & 배송정보</h3>

			<tr>
				<th>판매자 ID</th>
				<td>${boardcont.em_id }</td>
			</tr>

			<tr>
				<th>판매자 구매후기</th>
				<td><a href="./review_find_ok.nhn?find_field=em_id&find_name=${boardcont.em_id }">판매자 후기 내역</a></td>
			</tr>
			<tr>
				<th>배송방법</th>
				<td>착불</td>
			</tr>

			<tr>
				<th>배송비용</th>
				<td>기본 2500원 (물건에 따라 비용이 변경될 수 있습니다.)</td>
			</tr>
		</table>
	</div>

	<div class="table-responsive" id="table_box">
		<table border="1" class="table">
			<h3>상세 물품 내용</h3>

			<tr>
				<td>${boardcont.eb_cont }</td>
			</tr>
		</table>
		<input id="btn" class="btn btn-default pull-right" type="button"
			value="목록보기" onclick="btn_list()">
	</div>


	<form id="Atted">
		<!-- 찜하기 테이블에 들어갈 값 -->
		<input id="ea_user" name="ea_user" value="${id }" type="hidden">
		<input id="ea_kind" name="ea_kind" value="${boardcont.eb_kind}"type="hidden">
		 <input id="eb_itemnum" name="eb_itemnum" value="${boardcont.eb_itemnum }" type="hidden">
	</form>

	<form id="eb_ghouse">
		<input id="eb_boardnum" name="eb_boardnum" value="${boardcont.eb_boardnum }" type="hidden"> 
		<input id="eb_itemnum" name="eb_itemnum" value="${boardcont.eb_itemnum }" type="hidden"> 
		<input id="gh_buyer" name="gh_buyer" value="${id }" type="hidden"> 
		<input id="gh_bidprice"name="gh_bidprice" type="hidden">
		<input id="bidTimeAdd"name="bidTimeAdd" type="hidden">
	</form>
	
	<form id="ea_plist" action="common_product_purchase.nhn">
		<input id="ep_kind" name="ep_kind" value="일반" type="hidden">
		<input id="ep_user" name="ep_user" value="${id }" type="hidden">
		<input id="ep_seller" name="ep_seller" value="${boardcont.em_id }" type="hidden">
		<input id="eb_boardnum" name="eb_boardnum" value="${boardcont.eb_boardnum }" type="hidden">
		<input id="eb_itemnum" name="eb_itemnum" value="${boardcont.eb_itemnum }" type="hidden">
		<input id="eb_itemname" name="eb_itemname" value="${boardcont.eb_itemname }" type="hidden">
		<input id="eb_file" name="eb_file" value="${boardcont.eb_file }" type="hidden">
		<input id="ep_price" name="ep_price" value="" type="hidden">
		<input id="ep_result" name="ep_result" value="구매완료" type="hidden">
	</form>	
	<br><br><br><br><br>
	<br><br><br><br><br>
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>