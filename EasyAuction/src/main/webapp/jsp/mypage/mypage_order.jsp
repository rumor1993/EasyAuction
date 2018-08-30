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
	
	/* var order_date = $('#order_date').val();
    var a =order_date.split('-')[0];
    var b =order_date.split('-')[1];
    var c =order_date.split('-')[2];
	var c1 = c.split(' ')[0];
	
	var day1 = new Date(a,b,c1);
	alert(day1.getMonth()); */
})


</script>
<style>
#order_list{
	border: 2px solid black;
	width:95%;
}
.mypage-order-page{margin:0px 0px 700px 0px;}
</style>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<%@ include file="/jsp/mypage/mypage_header.jsp" %>
<div class="mypage-order-page">
<input type="hidden" value="0" id="statenum">
		<div id='four'>	
			<table border="1px solid gray" id="order_list" class="table-responsive" style="height: 250px">
				<tr style="text-align: center;">
					<th width="3%" style="text-align: center; height: 40px;"><div>#</div></th>
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
				<c:set var="num" value="${listcount-(page-1)*limit}" />
				
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
						<td>${order.ep_date} <input type="hidden" id="order_date" name="order_date" value="${order.ep_date}">
						</td>
						<td>
						<div id="deliveryColl" class="wid_w">
						<c:if test="${empty order.ed_company }">
									<div>
									<img src="resources/images/mypage/wait.png" style="width: 50px; height: 50px;"><br>
									현재 배송 정보가 없습니다.<br> 판매자가 배송 정보 입력 시<br> 배송 조회가 가능 합니다.</div>
								</c:if>
								<c:if test="${!empty order.ed_company}">
								                <input type="hidden" value="${order.ed_company}" id="check_company">
								        업체명 <select id="_jsDeliveryCorpListHiddenSelBox" name="_jsDeliveryCorpListHiddenSelBox" class="select_box_order${order.ep_num}">
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
							<input type="hidden" id="itemnum1" value="${order.eb_itemnum}">
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
					
					<script>
					var order_date = $('#order_date').val();
				    var a =order_date.split('-')[0];
				    var b =order_date.split('-')[1];
				    var c =order_date.split('-')[2];
					var c1 = c.split(' ')[0];
					
					var day1 = new Date(a,b,c1);
					
					
					var today = new Date();
					var dd = today.getDate();
					var mm = today.getMonth()+1; //January is 0!
					var yyyy = today.getFullYear();

					if(dd<10) {
					    dd = '0'+dd
					} 

					if(mm<10) {
					    mm = '0'+mm
					} 
					
					
					var day2 = new Date(yyyy,mm,7);
					var test = day2-day1;
					
					var itemnum =$('#itemnum1').val();
					var tem = "."+itemnum;
					var num=0;
					if(test>=259200000){
						//취소 확정
						var state = $('#statenum').val();
						
						$.ajax({
						type:"post",
						url:"result_ok.nhn",
						data: {"itemnum":itemnum},
						success: function(data){
							if(data=="1"){
								alert("확정시키기");
								state = parseInt(state)+1;
								$('#statenum').val(state);
							}
							
							
							
				
		},
		error:function(request,status,error){
	        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	
	})
					}
					
					
					</script>
				</c:forEach>
					<!-- 구매 내역이 없을 때 -->
				<c:if test="${listcount == 0 }">
					<tr>
						<td colspan="10" style="test-align: center"><font size=2>구매 내역이 없습니다.</font></td>
					</tr>
				</c:if>	
				<!-- 페이지 처리 -->
				<tr class="paging" >
					<td colspan="10" style="text-align: center;height: 40px;">
						<c:if test="${page <= 1 }">이전&nbsp;</c:if> 
			   	 		<c:if test="${page > 1 }"><a href="./mypage_order.nhn?page=${page-1}">이전</a></c:if> 
						<c:forEach var="a" begin="${startpage}" end="${endpage }">
							<c:if test="${a == page }">${a}</c:if>
							<c:if test="${a != page }"><a href="./mypage_order.nhn?page=${a}">${a}</a></c:if>
						</c:forEach> 
						<c:if test="${page >= maxpage }">&nbsp;다음</c:if> 
						<c:if test="${page < maxpage }"><a href="./mypage_order.nhn?page=${page+1 }">&nbsp;다음</a></c:if>
					</td>
				</tr>

			
			</table>
			</div>
			
			<script>
				var num11 = $('#statenum').val();
				
				if(num11!="0"){
					
					location.href="mypage_order.nhn";
				}
				
			</script>
</div>
<br><br><br><br>
<jsp:include page="../main/footer.jsp"/>
</body>

</html>
