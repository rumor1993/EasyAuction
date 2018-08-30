<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="resources/js/mypage/mypage_pointlist.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/mypage/mypage_pointlist.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style>
#point_list{
width:95%;
height: 250px;
text-align: center;
border: 2px solid black;
}
.table-form1{padding:0px 100px;}
</style>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<%@ include file="/jsp/mypage/mypage_header.jsp" %>
	<div class="table-form1">
	<table border="1px solid black" id="point_list" style="margin-top: 80px; margin-left: 38px">
	
		<tr style="height: 40px;">
			<th style="text-align: center;"><div>#</div></th>
			<th style="text-align: center;"><div>신청포인트</div></th>
			<th style="text-align: center;"><div>기존 포인트</div></th>
			<th style="text-align: center;"><div>충전/반환</div></th>			
			<th style="text-align: center;"><div>신청 날짜</div></th>	
			<th style="text-align: center;"><div>단계</div></th>			
		</tr>
		<c:set var="num" value="${listcount-(page-1)*limit}" />
		<c:forEach var="point" items="${pointlist }" varStatus="status">
			<tr>
				<td>
					${status.count}
				</td>
				<td>
					${point.eg_recoin}(원)
				</td>
				<td>
					${point.eg_orgcoin}(원)
				</td>
				<td>
					${point.eg_apply}
				</td>
				<td>
					${point.eg_date}
				</td>
				
				<c:if test="${point.eg_state=='대기'}">
				<td>
					<div style="width:50px; border: solid black 0px; border-radius:3px;color:white; margin: 0 auto; background: #26DAD2">${point.eg_state}</div>
				</td>
				</c:if>
				<c:if test="${point.eg_state=='완료'}">
			    <td>
					<div style="width:50px; border: solid black 0px; border-radius:3px;color:white; margin: 0 auto; background: #F03C02";>${point.eg_state}</div>
				</td>
				</c:if>
			</tr>
		</c:forEach>
		<!-- 구매 내역이 없을 때 -->
		<c:if test="${listcount == 0 }">
			<tr>
				<td colspan="6" style="text-align: center;">
				<font size=2>포인트 충전 내역이 없습니다.</font>
				</td>
			</tr>
		</c:if>
		<!-- 페이지 처리 -->
		<tr class="paging" >
			<td colspan="6" style="text-align: center;  height: 40px; ">
			
			<c:if test="${page <= 1 }">
		   	 	이전&nbsp;
		   	</c:if> 
		   	 
		    <c:if test="${page > 1 }">
				<a href="./mypage_pointlist.nhn?page=${page-1}">이전</a>
			</c:if> 
			<c:forEach var="a" begin="${startpage}" end="${endpage }">
			
				<c:if test="${a == page }">
			   	 	${a}
			   	</c:if>
			   	
				<c:if test="${a != page }">
					<a href="./mypage_pointlist.nhn?page=${a}">${a}</a>
				</c:if>
				</c:forEach> 
				<c:if test="${page >= maxpage }">
					&nbsp;다음
			   </c:if> 
			   
			   <c:if test="${page < maxpage }">
					<a href="./bbs_list.nhn?page=${page+1 }">&nbsp;다음</a>
			   </c:if>
			  </td>
		</tr>

		
	</table>
	</div>
	<br><br><br><br><br>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>