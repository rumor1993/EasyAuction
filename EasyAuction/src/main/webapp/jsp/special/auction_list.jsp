<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>MVC 게시판</title>
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/special/open_time.js"></script>
<script src="./resources/js/special/table_style.js"></script>
<script src="./resources/js/special/big_category_click2.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
	body{background: #efefef}
	#open_area{position:relative; top:50px; height:550px}
	#open_ready_area{position:relative;}
	#open_subject_area{margin-left: 200px}
	#open_ready_subject_area{margin-left: 200px}
	.open_table_class {table-layout:auto; box-shadow: 0px 0px 20px #000; width:200px; position:absolute; top:100px; background:white}
	.open_table_class tr:nth-child(3){height:50px}
	.open_ready_table_class {table-layout:auto; box-shadow: 0px 0px 20px #000; width:200px; position:absolute; top:100px; background:white}
	.open_ready_table_class tr:nth-child(3){height:50px}
	.open_ready_table_class tr:nth-child(4){border-top:1px solid silver;border-bottom:1px solid silver}
	.open_ready_table_class tr:nth-child(4) td:nth-child(1){border-right:1px solid silver}
	img{cursor:pointer}
	.bigbt:nth-child(1){margin-left: 200px}
	
	#category_area{position:relative; left:100px; }
	#small_category_area{border-bottom: 3px double silver; margin-left: 200px;
						width:1255px; padding:30px; text-align: center; display:none}
    #range_area a{font-size:12pt; padding:20px; font-weight:bolder}
	#range_area a:link { color: black; text-decoration: none;}
	#range_area a:visited { color: black; text-decoration: none;}
	#range_area a:hover { color: red; text-decoration: underline;}						
	#range_area{position:relative; left:1050px; padding:30px; width:700px}
	
	#subject{margin-left:200px; padding:30px}
	#subject a{font-size:20pt; font-weight: bolder;}
	#subject a:link { color: black; text-decoration: none;}
	#subject a:visited { color: black; text-decoration: none;}
	#subject a:hover { color: black;}		
	#wait_area{position:absolute; left:500px; top:180px}	
	#식품{ background: url(./resources/img/special/식품.jpg) no-repeat; background-size: 90px 70px;}
	#패션의류{ background: url(./resources/img/special/패션의류.jpg) no-repeat; background-size: 90px 70px;}
	#스포츠레저{ background: url(./resources/img/special/스포츠레저.jpg) no-repeat; background-size: 90px 70px;}
	#도서기타{ background: url(./resources/img/special/도서기타.jpg) no-repeat; background-size: 90px 70px;}
	#유아용품{ background: url(./resources/img/special/유아용품.jpg) no-repeat; background-size: 90px 70px;}
	#디지털컴퓨터{ background: url(./resources/img/special/디지털컴퓨터.jpg) no-repeat; background-size: 90px 70px;}
	#뷰티{ background: url(./resources/img/special/뷰티.jpg) no-repeat; background-size: 90px 70px;}
	#패션잡화{ background: url(./resources/img/special/패션잡화.jpg) no-repeat; background-size: 90px 70px;}
	#생활가전{ background: url(./resources/img/special/생활가전.jpg) no-repeat; background-size: 90px 70px;}
	#가구생활{ background: url(./resources/img/special/가구생활.jpg) no-repeat; background-size: 90px 70px;}
	#취미{ background: url(./resources/img/special/취미.jpg) no-repeat; background-size: 90px 70px;}
	#자동차공구{ background: url(./resources/img/special/자동차공구.jpg) no-repeat; background-size: 90px 70px;}
	
	/* 버튼디자인 */
	.enter_bt{border-radius: 5px; color:white;
		  background: linear-gradient(#776d6d, #292929); cursor:pointer; }
	.enter_bt2{border-radius: 5px; color:white;
		  background: linear-gradient(#776d6d, #292929); cursor:pointer; width:100px; height:40px; }		  
		  
	.ready_roomnum{font-size:8pt; color:#777777}
</style>
<script>
	function enterAuctionRoom(itemnum){
		var url = "./special_auction.nhn?eb_itemnum=" + itemnum;
		openWin = window.open(url, 
				"_new", "width=1150, height=700, resizable=no, scrollbars=no");
		return false;
	}
</script>
</head>

<body>
<jsp:include page="../main/header.jsp"/>
<div id="subject">
<a href="special_auction_list.nhn?"><img src="./resources/img/special/special2.png" style="width:250px; height:60px"></a>

</div>
<div id="wait_area">
	<input class="enter_bt2" type="button" value="의뢰등록" onclick="location.href='special_product_write.nhn'">
   	<input class="enter_bt2" type="button" value="검증리스트" onClick="location.href='special_product_list.nhn?eb_state=wait&page=${page}'">
   	<input class="enter_bt2" type="button" value="경매완료" onClick="location.href='special_product_list.nhn?eb_state=auctionfinish&page=${page}'">
</div>
<input type="hidden" id="ey_smallcategory" value="${ey_smallcategory}">
<input type="hidden" id="ey_bigcategory" value="${ey_bigcategory}">
<input type="hidden" id="range" value="${range}">
<div id="category_area">
<div id="big_category_area">
	<c:forEach var="bigct" items="${bigct}">
	<button id="${bigct.ey_bigcategory}" class="bigbt" style="width:90px; height:75px;"></button>
	<span>&nbsp;&nbsp;</span>
	</c:forEach>
</div>
<div id="small_category_area">
</div>
</div>
<div id="whole_product_area">
 <div id="open_area">
  <div id="open_subject_area">
	<h1>Today Auction Products</h1>
	<input type="hidden" id="item_count" value="${fn:length(list)}">

  </div>

	<c:set value="${list.size()}" var="listCnt"></c:set>
	<c:choose>
	<c:when test="${listCnt > 0}">
	<c:forEach var="list" items="${list}" varStatus="status">
	<input type="hidden" id="today_item_num${status.index}" value="${list.eb_itemnum}">

<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★오픈 테이블 시작 ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★  -->
	<table id="open_table${status.index}" class="open_table_class">
	<colgroup>
	<col width="40%"/>
	<col width="60%"/>
	</colgroup>
	<tr><td colspan="2" style="text-align: center; font-size:12pt; font-weight:bolder">
	<c:if test="${fn:substring(list.eb_audate,11,13) == '11'}">
	Room 1
	</c:if>
	<c:if test="${fn:substring(list.eb_audate,11,13) == '13'}">
	Room 2
	</c:if>
	<c:if test="${fn:substring(list.eb_audate,11,13) == '15'}">
	Room 3
	</c:if>
	<c:if test="${fn:substring(list.eb_audate,11,13) == '17'}">
	Room 4
	</c:if>
	<c:if test="${fn:substring(list.eb_audate,11,13) == '19'}">
	Room 5
	</c:if>
	</td></tr>
		<tr><td colspan="2" style="text-align: center" >
		<c:choose>
		<c:when test="${empty list.eb_file}">
			<img src="./resources/img/special/noimage.jpg" style="width:200px; height:170px"
	 		onClick="location.href=
	 		'special_auction_info.nhn?itemnum=${list.eb_itemnum}&ey_smallcategory=${ey_smallcategory}&ey_bigcategory=${ey_bigcategory}&range=${range}'">
		</c:when>
		<c:otherwise>
			<img src="./resources/upload${list.eb_file}" style="width:200px; height:170px"
	 		onClick="location.href=
	 		'special_auction_info.nhn?itemnum=${list.eb_itemnum}&ey_smallcategory=${ey_smallcategory}&ey_bigcategory=${ey_bigcategory}&range=${range}'">
		</c:otherwise>
		</c:choose>
	 	</td></tr>
	 	<tr><td colspan="2" style="text-align: center; font-size:15pt; font-weight: bolder;">
	 			${list.eb_itemname}
	 	</td></tr>
	 	
<!-- ★★★★★★★★★★★★★★★★★ 금일 오픈★★★★★★★★★★★★★★★★★  -->
<c:if test="${list.eb_state == '금일오픈'}">
	<input type="hidden" id="today_open_time${status.index}" value="${list.eb_audate}">

	 	
	 	<tr>
	 		<td>&nbsp;조회수 ${list.eb_hit} </td>
	 		<td>찜수 ${list.eb_attcount}</td>
	 	</tr>
	 	<tr>
			<td style="font-size:10pt; color:#656565">&nbsp;시작가</td>
	 		<td style="font-weight:bolder"> ${list.eb_stprice}원</td>
	 	</tr>	 	
	 	<tr>
	 		<td style="font-size:10pt; color:#656565">&nbsp;오픈</td>
	 		<td>
	 		${fn:substring(list.eb_audate,5,7)}/${fn:substring(list.eb_audate,8,10)}
	 		${fn:substring(list.eb_audate,11,13)}:${fn:substring(list.eb_audate,14,16)}
	 		</td>
	 	</tr>

	 	<tr>
	 		<td colspan="2" style="text-align: center; background:linear-gradient(to bottom, #d6d6d6, white, #d6d6d6)">
	 		<img src="./resources/img/special/시계.png" style="width:20px; height:20px;">
	 		<span id="today_remain_time${status.index}" style="font-weight:bolder"></span></td>
	 	</tr>		 	
</c:if>
<!-- ★★★★★★★★★★★★★★★★★ 오픈★★★★★★★★★★★★★★★★★  -->
<c:if test="${list.eb_state == '오픈'}">
<input type="hidden" id="real_open_time${status.index}" value="${list.eb_audate}">
	 	<tr>
	 	<td colspan="2" style="text-align: center; padding-bottom: 33px">
	 			<input type="button" class="enter_bt" value="경매 참가하기"
                    onClick="enterAuctionRoom('${list.eb_itemnum}')">
	 	</td></tr>	
	 	<tr>
	 		<td colspan="2" style="text-align: center; background:linear-gradient(to bottom, #d6d6d6, white, #d6d6d6)">
	 		<img src="./resources/img/special/시계.png" style="width:20px; height:20px;">
	 		<span style="font-weight:bolder; color:#ff0057">현재 진행중</span></td>
	 	</tr>		 	
</c:if>
	 	</table>
	 	 </c:forEach>
	</c:when>
	<c:otherwise>
	<img src="resources/img/special/nolist3.png" style="width:900px; height:250px; margin-left:450px;">
	</c:otherwise>
	</c:choose>
</div>

<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★경매 준비 리스트★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★  -->

<div id="open_ready_area">
<hr>
<div id="open_ready_subject_area">
<h1> Auction Ready Products</h1>
<input type="hidden" id="item_ready_count" value="${fn:length(ready_list)}">
</div>
<div id="range_area">
	<a href="special_auction_list.nhn?ey_smallcategory=${ey_smallcategory}&ey_bigcategory=${ey_bigcategory}&range=fastopen">오픈빠른순</a> I
	<a href="special_auction_list.nhn?ey_smallcategory=${ey_smallcategory}&ey_bigcategory=${ey_bigcategory}&range=highprice">최고가순</a> I
	<a href="special_auction_list.nhn?ey_smallcategory=${ey_smallcategory}&ey_bigcategory=${ey_bigcategory}&range=lowprice">최저가순</a> I
	<a href="special_auction_list.nhn?ey_smallcategory=${ey_smallcategory}&ey_bigcategory=${ey_bigcategory}&range=manyhits">조회수순</a> I
	<a href="special_auction_list.nhn?ey_smallcategory=${ey_smallcategory}&ey_bigcategory=${ey_bigcategory}&range=manydibs">찜수순</a>
</div>

	<c:set value="${ready_list.size()}" var="readyListCnt"></c:set>
	<c:choose>
	<c:when test="${readyListCnt > 0}">
	<c:forEach var="list" items="${ready_list}" varStatus="status" >
	<input type="hidden" id="open_time${status.index}" value="${list.eb_audate}">
	<input type="hidden" id="item_num${status.index}" value="${list.eb_itemnum}">
	<input type="hidden" id="product_state${status.index}" value="${list.eb_state}">
	
<table id="open_ready_table${status.index}" class="open_ready_table_class">
	<colgroup>
	<col width="45%"/>
	<col width="55%"/>
	</colgroup>
	<tr><td colspan="2" style="text-align: center; font-size:12pt; font-weight:bolder">
	<c:if test="${fn:substring(list.eb_audate,11,13) == '11'}">
	Ready<div class="ready_roomnum">(Room 1)</div>
	</c:if>
	<c:if test="${fn:substring(list.eb_audate,11,13) == '13'}">
	Ready<div class="ready_roomnum">(Room 2)</div>
	</c:if>
	<c:if test="${fn:substring(list.eb_audate,11,13) == '15'}">
	Ready<div class="ready_roomnum">(Room 3)</div>
	</c:if>
	<c:if test="${fn:substring(list.eb_audate,11,13) == '17'}">
	Ready<div class="ready_roomnum">(Room 4)</div>
	</c:if>
	<c:if test="${fn:substring(list.eb_audate,11,13) == '19'}">
	Ready<div class="ready_roomnum">(Room 5)</div>
	</c:if>
	</td></tr>
		<tr><td colspan="2" style="text-align: center">
	 	<c:choose>
		<c:when test="${empty list.eb_file}">
			<img src="./resources/img/special/noimage.jpg" style="width:200px; height:170px"
	 		onClick="location.href=
	 		'special_auction_info.nhn?itemnum=${list.eb_itemnum}&ey_smallcategory=${ey_smallcategory}&ey_bigcategory=${ey_bigcategory}&range=${range}'">
		</c:when>
		<c:otherwise>
			<img src="./resources/upload${list.eb_file}" style="width:200px; height:170px"
	 		onClick="location.href=
	 		'special_auction_info.nhn?itemnum=${list.eb_itemnum}&ey_smallcategory=${ey_smallcategory}&ey_bigcategory=${ey_bigcategory}&range=${range}'">
		</c:otherwise>
		</c:choose>
	 	</td></tr>
	 	<tr><td colspan="2" style="text-align: center; font-size:15pt; font-weight: bolder;">
	 			${list.eb_itemname}
	 	</td></tr>
	 	<tr>
	 		<td>&nbsp;조회수 ${list.eb_hit} </td>
	 		<td>&nbsp;찜수 ${list.eb_attcount}</td>
	 	</tr>
	 	<tr>
			<td style="font-size:10pt; color:#656565">&nbsp;시작가</td>
	 		<td style="font-weight:bolder"> ${list.eb_stprice}원</td>
	 	</tr>	 	
	 	<tr>
	 		<td style="font-size:10pt; color:#656565">&nbsp;오픈</td>
	 		<td>
	 		${fn:substring(list.eb_audate,5,7)}/${fn:substring(list.eb_audate,8,10)}
	 		${fn:substring(list.eb_audate,11,13)}:${fn:substring(list.eb_audate,14,16)}
	 		</td>
	 	</tr>

	 	<tr>
	 		<td colspan="2" style="text-align: center; background:linear-gradient(to bottom, #d6d6d6, white, #d6d6d6)">
	 		<img src="./resources/img/special/시계.png" style="width:20px; height:20px;">
	 		<span id="remain_time${status.index}" style="font-weight:bolder"></span></td>
	 	</tr>	
</table>	
</c:forEach>
	 	</c:when>
		<c:otherwise>
		<img src="./resources/img/special/nolist3.png" style="width:900px; height:250px; margin-left:450px;">
		</c:otherwise>
		</c:choose>
	 
 </div>
	 
</div>
<br><br><br><br>
<jsp:include page="../main/footer.jsp"/>
</body>

</html>