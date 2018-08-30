<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file = "../main/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 리스트 </title>
<script src="./resources/js/jquery-3.3.1.js"></script>
<style>
#waitbt{position:absolute; right:320px;}
#checkingbt{position:absolute; right:240px;}
#finishbt{position:absolute; right:150px;}
#finishlistbt{position:absolute; left:200px}
.review-title{opacity:0.9;background:black;width:100%;height:110px;
		margin:0px 0px 30px 0px;padding:30px 70px;z-index:1}
.review-title-addr{font-size:30pt;float:right;margin-right:35%;z-index:100;color:white;}
.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
.fa-home{color:white;font-size:15pt;}
#special_list{margin-top:20px;}
.special-wrap td{vertical-align:middle !important;font-size:13pt;}
.special-wrap td:nth-child(1){width:8%;text-align:center;}
.special-wrap td:nth-child(2){font-weight:bold;}
</style>
<script>
	$(document).ready(function(){
		$(".img-thumbnail").mouseover(function(){
			$(this).css("border", "1px solid #F03C02");
		});
		$(".img-thumbnail").mouseout(function(){
			$(this).css("border", '1px solid rgba(0,0,0,.075)');
		})
	});
</script>
</head>
<body>
   <div class="review-title">
		<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;Special > &nbsp;List Page </span>
		<span class="review-title-addr" style="font-family: 'Pacifico', cursive;">Special List</span>
	</div>
  <div class="special-wrap" style="padding:10px 150px;" >
  <div >
  	<input class="btn btn-danger" type="button" value="특별물품 의뢰등록" onclick="location.href='special_product_write.nhn'">
  	<input id="finishlistbt" style="left:300px;" class="btn btn-danger" type="button" value="특별경매 목록으로 가기" onClick="location.href='special_auction_list.nhn'">
   	<input id="waitbt" class="btn btn-danger" type="button" value="대기" onClick="location.href='special_product_list.nhn?eb_state=wait'">
   	<input id="checkingbt" class="btn btn-danger" type="button" value="검증중" onClick="location.href='special_product_list.nhn?eb_state=checking'">
   	<input id="finishbt" class="btn btn-danger" type="button" value="검증완료" onClick="location.href='special_product_list.nhn?eb_state=finish'">
   	
  </div> 
   <div id="special_list" style="border:3px solid lightgray; border-radius:5px;">
   <table class="table table-condensed" >
   	<c:if test="${listcount !=0 }">
     <thead>
         <tr>
            <th>번호</th>
            <th>제목</th>
            <th class="text-center">작성일</th>
            <th class="text-center">작성자</th>
            <th class="text-center">검증상태</th>
            <th class="text-center">조회수</th>
         </tr>
      </thead> 
      
        
      <tbody>
      	<c:forEach var="list" items="${list}" varStatus="i"> 
         <tr>
            <td>${listcount - ((page - 1) * 10) - i.index}</td>
           
           	<c:if test="${list.eb_file != null}">
           	<td>
           	<img src="./resources/upload${list.eb_file }" style="width:150px; height:150px;" class="img-thumbnail"
           	onClick="location.href='special_product_cont.nhn?eb_itemnum=${list.eb_itemnum }&page=${page}&state=cont'">
           		&nbsp;&nbsp;&nbsp;${list.eb_itemname}</td>
           	</c:if>
           	<c:if test="${list.eb_file == null}">
           	<td>
           	<img src="./resources/images/no.jpeg"  style="width:150px; height:150px;" class="img-thumbnail"
           	onClick="location.href='special_product_cont.nhn?eb_itemnum=${list.eb_itemnum }&page=${page}&state=cont'">
           		&nbsp;&nbsp;&nbsp;${list.eb_itemname}</td>
           	</c:if>
           	
           	<td class="text-center">${list.eb_stdate}</td>
            <td class="text-center">${list.em_id }</td>
            <td class="text-center">${list.eb_state}</td>
            <td class="text-center">${list.eb_hit }</td>
         </tr>
         </c:forEach>
      
      
      <tr>
		<td colspan="5" style="text-align: center;">
			<c:if test="${page<=1}">
				이전&nbsp;
			</c:if>
			<c:if test="${page>1}">
				<a class="btn btn-default" role="button" href="./special_product_list.nhn?page=${page-1}&eb_state=${eb_state}">이전</a>
			</c:if>
			
			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a==page}">
					${a}
				</c:if>
				<c:if test="${a!=page}">
				<a class="btn btn-default" role="button" href="./special_product_list.nhn?page=${a}&eb_state=${eb_state}">${a}</a>
				</c:if>
			</c:forEach>

			<c:if test="${page>=maxpage}">
				다음&nbsp;
			</c:if>
			<c:if test="${page<maxpage}">
				<a class="btn btn-default" role="button" href="./special_product_list.nhn?page=${page+1}&eb_state=${eb_state}">다음</a>
			</c:if>
		</td>		
	</tr>
	</tbody>
	</c:if>
   </table>
</div>
	</div>
  
   <br><br><br><br>
    <jsp:include page="../main/footer.jsp"/>
</body>
</html>