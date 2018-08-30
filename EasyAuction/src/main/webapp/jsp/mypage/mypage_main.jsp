<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="resources/js/mypage/mypage_main.js"></script>
<script type="text/javascript" src="resources/js/mypage/mypage_delivery.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/mypage/mypage_main.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	var check = $('#check_company').val();
	$("#_jsDeliveryCorpListHiddenSelBox option[value='"+check+"']").attr("selected","selected");
})

function sub(a,b,c){
	var test = ".select_box" + c;
	var test2 = "#ed_delinum"+c;
	
	var receive_id =a;
	var eb_itemnum =b;
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
		
		type:"post",
		url:"mypage_sale_submit.nhn",
		data:{"receive_id":receive_id,"eb_itemnum":eb_itemnum,"ed_company":ed_company,"ed_delinum":ed_delinum},
		success: function(data){
			alert("입력되었습니다");
			location.href="mypage_sale.nhn";
		},
		error: function(){
			alert("error");
		}
	}) 
}
</script>
<style type="text/css">
#order_list1 {
	height: 150px;
	width:90%;
	margin-top: 10px;
	margin-left: 38px;
	text-align: center;
}

#sale_list1 {
	height: 150px;
	width:90%;
	margin-top: 10px;
	margin-left: 38px;
	text-align: center;
}
#review_list{
	height: 150px;
	width:90%;
	margin-top: 10px;
	margin-left: 38px;
	text-align: center;
}
.body-all{padding:0px 100px;}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<%@ include file="/jsp/mypage/mypage_header.jsp"%>
	<div class="body-all">
	
	<div id="table1">
		<h5
			style=" width:100px;border-bottom: 1px solid black; margin-left: 38px; margin-top: 90px; font-weight: bolder; margin-bottom: 0px; ">주문조회</h5>
		<div>
			<a style="margin-left: 88%;" href="mypage_order.nhn">전체보기</a>
		</div>
		<table border="1px solid gray" id="order_list1" class="table-responsive">
			<tr style="text-align: center; height: 40px">
				<th width="3%" style="text-align: center;"><div>#</div></th>
				<th style="text-align: center;"><div>구분</div></th>
				<th style="text-align: center;"><div>물품 사진</div></th>
				<th style="text-align: center;"><div>물품 번호</div></th>
				<th style="text-align: center;"><div>물품 명</div></th>
				<th style="text-align: center;"><div>판매자</div></th>
				<th style="text-align: center;"><div>가격</div></th>
				<th style="text-align: center;"><div>주문 일자</div></th>
				<th style="text-align: center;"><div>배송 정보</div></th>
				<th style="text-align: center;"><div>구매 확정</div></th>
			</tr>
			<c:forEach var="order" items="${orderlist }" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${order.ep_kind}</td>
						<td>
						<img src="./resources/upload${order.eb_file}" style="width: 100px; height: 100px;"></td>
						<td>${order.eb_itemnum}</td>
						<td>${order.eb_itemname}</td>
						<td>${order.ep_seller}</td>
						<td>${order.ep_price}(원)</td>
						<td>${order.ep_date}
						</td>
						<td>
						<div id="deliveryColl" class="wid_w">
						<c:if test="${empty order.ed_company }">
									<div>
									<img src="./resources/images/mypage/wait.png" style="width: 50px; height: 50px;"><br>
									현재 배송 정보가 없습니다.<br> 판매자가 배송 정보 입력 시<br> 배송 조회가 가능 합니다.</div>
								</c:if>
								<c:if test="${!empty order.ed_company}">
								                <input type="hidden" value="${order.ed_company}" id="check_company">
								        업체명 &nbsp;<select id="_jsDeliveryCorpListHiddenSelBox" name="_jsDeliveryCorpListHiddenSelBox" class="select_box_order${order.ep_num}" style="margin-bottom: 10px">
											<option value="0">선택해 주세요</option>
											<option value="1">경동택배</option>
											<option value="2">대한항공</option>
											<option value="3">동부택배</option>
											<option value="4">로젠택배</option>
											<option value="5">범한판토스</option>
											<option value="6">우체국택배</option>
											<option value="7">일양로지스택배</option>
											<option value="8">천일택배</option>
											<option value="9">한덱스택배</option>
											<option value="10">한의사랑택배</option>
											<option value="11">한진택배</option>
											<option value="12">현대택배</option>
											<option value="13">CJ 대한통운택배</option>
											<option value="14">CVSnet편의점택배</option>
											<option value="15">DHL택배</option>
											<option value="16">FedEx택배</option>
											<option value="17">GTX로지스택배</option>
											<option value="18">KG옐로우캡택배</option>
											<option value="19">KGB택배</option>
											<option value="20">OCS택배</option>
											<option value="21">TNT Express</option>
											<option value="22">UPS택배</option>
										</select><br>
										송장 번호&nbsp;<input type="text" id="ed_delinum${order.ep_num}" name="ed_delinum" value="${order.ed_delinum }" > <br> <br> 
                                 <input type="button" value="조회" onclick="sub2('${order.ed_delinum}','${order.ep_num}');" style="border: 1px solid #F03C02; background: white; color:#F03C02; width: 75%">
								</c:if>		
					</div>
						</td>
						<td>
						<c:if test="${order.ep_result == '미확정' }">
						<div class="${order.eb_itemnum}">
						   <input type="button" value="확정" id="result_ok" name="result_ok" onclick="r_ok('${order.eb_itemnum}', '${order.ep_seller}')" style=" border: 0px; border-radius:5px; background: #ddd; width:68px; "><br><br>
							<input type="button" value="취소" onclick="popupAction_cancel('${order.eb_itemnum}');" style=" border: 0px; border-radius:5px; background: #ddd; width:68px; ">
						</div>   
						</c:if>
						<c:if test="${order.ep_result == '확정' }">
							<input type="button" value="확정완료" id="result_ok" name="result_ok" readonly="readonly" style="background: #F03C02; color:white; border: 0px; border-radius:5px;cursor: default;"><br><br>
							<input type="button" value="후기작성" id="review_write" name="review_write" style="background: #26dad2; color:white; border: 0px; border-radius:5px;" onclick="location.href='review_write.nhn?em_id=${sessionScope.id}&er_kind=${order.ep_kind}&er_itemnum=${order.eb_itemnum}&er_itemname=${order.eb_itemname}'">
						</c:if>
						<c:if test="${order.ep_result == '취소대기' }">
							<input type="button" value="취소대기" id="result_ok" name="result_ok" readonly="readonly" style="background: #ddd; border: 0px; color:white; cursor: default; border-radius:5px;">
						</c:if>
						<c:if test="${order.ep_result == '취소완료' }">
							<input type="button" value="취소완료" id="result_ok" name="result_ok" readonly="readonly" style="background: #F03C02; border: 0px; color:white; cursor: default; border-radius:5px;">
						</c:if>
						
						</td>			

					</tr>
				</c:forEach>

			<!-- 구매 내역이 없을 때 -->
			<c:if test="${orderlistcount == 0}">
				<tr>
					<td colspan="10" style="test-align: right"><font size=2>구매
							내역이 없습니다.</font></td>
				</tr>
			</c:if>

		</table>
	</div>
	<div id="table2">
		<h5
			style="width:100px;border-bottom: 1px solid black; margin-left: 38px; margin-top: 60px; font-weight: bolder; margin-bottom: 0px">판매조회</h5>
		<a style="margin-left: 88%;" href="mypage_sale.nhn">전체보기</a>
		<table border="1px solid black" id="sale_list1" class="table-responsive">

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
			<c:forEach var="sale" items="${salelist }" varStatus="status">
				<tr style="text-align: center;">
					<td>${status.count}</td>
					<td>${sale.es_kind}</td>
					<td><img src="./resources/upload${sale.eb_file}" style="width: 100px; height: 100px;"></td>
					<td><input type="text" id="receive_id" name="receive_id" value="${sale.es_buyer}" readonly="readonly" style="border: none; width: 100%; text-align: center"></td>
					<td><input type="text" id="eb_itemnum" name="eb_itemnum" value="${sale.eb_itemnum}" readonly="readonly" style="border: none; width: 100%; text-align: center"></td>
					<td>${sale.eb_itemname}</td>
					<td>${sale.es_price}원</td>
					<td>${sale.es_date}</td>
					<c:if test="${empty sale.ed_company}">
						<td>업체명<select id="ed_company" name="ed_company"
							class="select_box${sale.es_num}" style="margin-bottom: 10px; width: 80%">
								<option value="0">선택해 주세요</option>
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
						</select><br> 송장 번호
						<input type="text" id="ed_delinum${sale.es_num}" name="ed_delinum"> <br> <br> 
							<input type="button" value="입력" style="background: #5c4ac7; width: 95%; border-radius:5px;border: 0px; color:white;" onclick="sub('${sale.es_buyer }','${sale.eb_itemnum}','${sale.es_num}');" style="border: 1px solid black; background: #ddd ">
						</td>

					</c:if>


					<c:if test="${!empty sale.ed_company}">
						<td>업체명 : ${sale.ed_company}<br> 
						        송장 번호 : ${sale.ed_delinum}
						</td>

					</c:if>

				</tr>
			</c:forEach>

			<!-- 구매 내역이 없을 때 -->
			<c:if test="${salelistcount == 0 }">
				<tr>
					<td colspan="9" style="text-align: center"><font size=2>판매
							내역이 없습니다.</font></td>
				</tr>
			</c:if>
		</table>
	</div>
	<div id="table3">
	<h5 style="width:100px;border-bottom: 1px solid black; margin-left: 38px; margin-top: 60px; font-weight: bolder; margin-bottom: 0px">후기</h5>
	<a style="margin-left: 88%;" href="mypage_review.nhn">전체보기</a>
	<table border="1px solid black" id="review_list" class="table-responsive">
		<tr style="height: 40px;">
			<th style="text-align: center;"><div>#</div></th>
			<th style="text-align: center;"><div>구분</div></th>
			<th width="20%" style="text-align: center;"><div>이미지</div></th>
			<th style="text-align: center;"><div>물품번호</div></th>
			<th style="text-align: center;"><div>물품명</div></th>			
			<th style="text-align: center;"><div>제목</div></th>			
			<th style="text-align: center;"><div>리뷰 남긴 시간</div></th>			
		</tr>
			<c:forEach var="review" items="${reviewlist }" varStatus="status">	
			<tr style="height: 130px; text-align: center">
				<td>
					${status.count}
				</td>
				<td>
				     ${review.er_kind} 경매
				</td>
				<td>
				<img src="resources/upload${review.er_file}" style="width: 100px; height: 100px;">
				</td>
				<td>
					<a href="review_cont.nhn?num=${review.er_num}&page=1&state=cont">${review.er_itemnum}</a>
				</td>
				<td>
					${review.er_itemname}
				</td>
				<td>
					${review.er_sub}
				</td>
				<td>
					${review.er_date}
				</td>
			</tr>
		</c:forEach>
		
		<!-- 구매 내역이 없을 때 -->
		<c:if test="${reviewcount == 0 }">
			<tr>
				<td colspan="9" style="text-align: center">
				<font size=2>구매 내역이 없습니다.</font>
				</td>
			</tr>
		</c:if>
		</table>
	</div>
	</div>
		<br><br><br><br><br>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>