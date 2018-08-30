<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style>
#sale_list {
	border: 2px solid black;
	margin-top: 80px;
	margin-left: 38px;
	width: 95%;
	height: 200px;
	line-height: normal;
}
.table-form{padding:0px 100px;}
</style>
</head>
<script>
	function sub(a, b, c) {
		var test = ".select_box" + c;
		var test2 = "#ed_delinum" + c;
		
		var receive_id = a;
		var eb_itemnum = b;
		var ed_company = $(test).val();
		var ed_delinum = $(test2).val();
		
		if(ed_company == '0'){
			alert('업체명을 선택해주세요.');
			ed_company == "";
			return false;
		}
		
		if(ed_delinum == ''){
			alert('송장 번호를 입력해주세요.');
			ed_delinum =='';
			return false;
		}
		
		$.ajax({

			type : "post",
			url : "mypage_sale_submit.nhn",
			data : {
				"receive_id" : receive_id,
				"eb_itemnum" : eb_itemnum,
				"ed_company" : ed_company,
				"ed_delinum" : ed_delinum
			},
			success : function(data) {
				alert("입력되었습니다");
				location.href = "mypage_sale.nhn";
			},
			error : function() {
				alert("error");
			}
		})
	}
</script>
<body>
<jsp:include page="../main/header.jsp"/>
	<%@ include file="/jsp/mypage/mypage_header.jsp"%>
	<div class="table-form">
	<table border="1px solid black" id="sale_list" style="height: 250px">

		<tr>
			<th width="3%" style="text-align: center; height: 40px;"><div>#</div></th>
			<th style="text-align: center;"><div>구분</div></th>
			<th style="text-align: center;"><div>물품사진</div></th>
			<th style="text-align: center;"><div>구매자</div></th>
			<th style="text-align: center;"><div>물품번호</div></th>
			<th style="text-align: center;"><div>물품명</div></th>
			<th style="text-align: center;"><div>가격</div></th>
			<th style="text-align: center;"><div>주문일자</div></th>
			<th width="20%" style="text-align: center;"><div>배송정보</div></th>
		</tr>
		<c:set var="num" value="${listcount-(page-1)*limit}" />
		<c:forEach var="sale" items="${salelist }" varStatus="status">
			<tr style="text-align: center;">
				<td>${status.count}</td>
				<td>${sale.es_kind}</td>
				<td><img src="resources/upload${sale.eb_file}" style="width: 100px; height: 100px;"></td>
				<td><input type="text" id="receive_id" name="receive_id" value="${sale.es_buyer}" readonly="readonly"
					style="border: none; width: 100%; text-align: center"></td>
				<td><input type="text" id="eb_itemnum" name="eb_itemnum"
					value="${sale.eb_itemnum}" readonly="readonly" style="border: none; width: 100%; text-align: center"></td>
				<td>${sale.eb_itemname}</td>
				<td>${sale.es_price}원</td>
				<td>${sale.es_date}</td>
				<c:if test="${empty sale.ed_company}">
					<td>업체명&nbsp;<select id="ed_company" name="ed_company"
						class="select_box${sale.es_num}" style="width: 75%">
							<option value="0">----업체명을 선택하세요----</option>
							<option value="경동택배">경동택배</option>
							<option value="대한항공">대한항공</option>
							<option value="동부택배">동부택배</option>
							<option value="로젠택배">로젠택배</option>
							<option value="범한판토스">범한판토스</option>
							<option value="우체국택배">우체국택배</option>
							<option value="일양로지스택배">일양로지스택배</option>
							<option value="천일택배">천일택배</option>
							<option value="한덱스택배">한덱스택배</option>
							<option value="한의사랑택배">한의사랑택배</option>
							<option value="한진택배">한진택배</option>
							<option value="현대택배">현대택배</option>
							<option value="CJ 대한통운택배">CJ 대한통운택배</option>
							<option value="CVSnet편의점택배">CVSnet편의점택배</option>
							<option value="DHL택배">DHL택배</option>
							<option value="FedEx택배">FedEx택배</option>
							<option value="GTX로지스택배">GTX로지스택배</option>
							<option value="KG옐로우캡택배">KG옐로우캡택배</option>
							<option value="KGB택배">KGB택배</option>
							<option value="OCS택배">OCS택배</option>
							<option value="TNT Express">TNT Express</option>
							<option value="UPS택배">UPS택배</option>
					</select><br><br> 송장 번호&nbsp;<input type="text" id="ed_delinum${sale.es_num}" name="ed_delinum" style="width: 70%"> <br> <br> 
						<input type="button" value="입력" onclick="sub('${sale.es_buyer }','${sale.eb_itemnum}','${sale.es_num}');"
						style="background: #5c4ac7; width: 95%; border-radius:5px;border: 0px; color:white;">
					</td>

				</c:if>


				<c:if test="${!empty sale.ed_company}">
					<td>업체명 : ${sale.ed_company}<br> 송장 번호 :
						${sale.ed_delinum}
					</td>

				</c:if>

			</tr>
		</c:forEach>

		<!-- 구매 내역이 없을 때 -->
		<c:if test="${listcount == 0 }">
			<tr>
				<td colspan="9" style="text-align: center"><font size=2>판매
						내역이 없습니다.</font></td>
			</tr>
		</c:if>

		<!-- 페이지 처리 -->
		<tr class="paging">
			<td colspan="9" style="text-align: center;height: 40px;"><c:if
					test="${page <= 1 }">
		   	 	이전&nbsp;
		   	 </c:if> <c:if test="${page > 1 }">
					<a href="./mypage_sale.nhn?page=${page-1}">이전</a>
				</c:if> <c:forEach var="a" begin="${startpage}" end="${endpage }">
					<c:if test="${a == page }">
			   	 	${a}
			   	 </c:if>
					<c:if test="${a != page }">
						<a href="./mypage_sale.nhn?page=${a}">${a}</a>
					</c:if>
				</c:forEach> <c:if test="${page >= maxpage }">
				&nbsp;다음
			</c:if> <c:if test="${page < maxpage }">
					<a href="./mypage_sale.nhn?page=${page+1 }">&nbsp;다음</a>
				</c:if></td>
		</tr>


	</table>
	</div>
	<br><br><br><br><br>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>