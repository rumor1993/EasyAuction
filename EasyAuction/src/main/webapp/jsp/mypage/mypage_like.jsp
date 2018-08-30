<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="resources/js/mypage/mypage_main.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style>
#like_list{
border: 2px solid black;
margin-top: 80px;
margin-left:38px;
width: 95%;
line-height: normal;
height: 250px;
}
.table-form1{padding:0px 100px;}
</style>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<%@ include file="/jsp/mypage/mypage_header.jsp" %>
	<div class="table-form1">
	<table border="1px solid black" id="like_list">
	
		<tr style="height: 40px">
			<th style="text-align: center;"><div>#</div></th>
			<th style="text-align: center;"><div>구분</div></th>
			<th width="20%" style="text-align: center;"><div>이미지</div></th>
			<th style="text-align: center;"><div>물품번호</div></th>
			<th style="text-align: center;"><div>물품명</div></th>			
			<th style="text-align: center;"><div>현재가</div></th>			
		</tr>
		<c:set var="num" value="${listcount-(page-1)*limit}" />
		<c:forEach var="like" items="${likelist }">
			<c:if test="${like.ea_kind  == '특별' }">
			<tr style="height: 130px; text-align: center" varStatus="status">
				<td>
					${status.count}
				</td>
				<td>
				     ${like.ea_kind} 경매
				</td>
				<td>
				<img src="./resources/upload${like.eb_file}" style="width: 100px; height: 100px;">
				</td>
				<td>
					<a href="special_auction_info.nhn?itemnum=${like.eb_itemnum}">${like.eb_itemnum}</a>
				</td>
				<td>
					${like.eb_itemname}
				</td>
				<td>
					${like.eb_laprice}
				</td>
			</tr>
			</c:if>
			
			<c:if test="${like.ea_kind  == '일반' }">
			<tr style="height: 130px; text-align: center">
				<td>
					${like.ea_num}
				</td>
				<td>
				     ${like.ea_kind} 경매
				</td>
				<td>
				<img src="resources/upload${like.eb_file}" style="width: 100px; height: 100px;">
				</td>
				<td>
					<a href="common_product_cont.nhn?eb_itemnum=${like.eb_itemnum}">${like.eb_itemnum}</a>
				</td>
				<td>
					${like.eb_itemname}
				</td>
				<td>
					${like.eb_laprice}
				</td>
			</tr>
			</c:if>
			
		</c:forEach>
		<!-- 구매 내역이 없을 때 -->
		<c:if test="${listcount == 0 }">
			<tr>
				<td colspan="9" style="text-align: center">
				<font size=2>구매 내역이 없습니다.</font>
				</td>
			</tr>
		</c:if>
		<!-- 페이지 처리 -->
		<tr class="paging" style="height: 40px">
			<td colspan="9" style="text-align: center"><c:if test="${page <= 1 }">
		   	 	이전&nbsp;
		   	 </c:if> <c:if test="${page > 1 }">
					<a href="./mypage_like.nhn?page=${page-1}">이전</a>
				</c:if> <c:forEach var="a" begin="${startpage}" end="${endpage }">
					<c:if test="${a == page }">
			   	 	${a}
			   	 </c:if>
					<c:if test="${a != page }">
						<a href="./mypage_like.nhn?page=${a}">${a}</a>
					</c:if>
				</c:forEach> <c:if test="${page >= maxpage }">
				&nbsp;다음
			</c:if> <c:if test="${page < maxpage }">
					<a href="./mypage_like.nhn?page=${page+1 }">&nbsp;다음</a>
				</c:if></td>
		</tr>

		
	</table>
	</div>
	<br><br><br><br><br>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>