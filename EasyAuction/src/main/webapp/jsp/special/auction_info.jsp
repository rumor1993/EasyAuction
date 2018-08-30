<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
#subject{margin-left:200px; padding:30px;margin-bottom: -30px;}
#subject a{font-size:20pt; font-weight: bolder;}
#subject a:link { color: black; text-decoration: none;}
#subject a:visited { color: black; text-decoration: none;}
#subject a:hover { color: black;}		
#wait_area{position:absolute; left:500px; top:180px}	
#info_area{position:relative; left:400px; width:1000px; top:50px}
#info_subject_area{border-bottom:3px double silver; }
#basket_area{position:absolute; top:100px}
#info_content_area{position:absolute; top:200px; }
#info_image{position:absolute; left:100px; }
#info_table{position:absolute; left:500px; table-layout: auto; border-collapse: collapse; top:0px; width:550px}
#info_table tr{height:50px}
#info_table tr:nth-child(1){border-bottom: 1px solid silver}
#info_table th{background:#e0dddd; width:100px;}
#info_table td{padding:10px}
#noheart_area{position:fixed; left:40%; top:30%;   display:none; z-index:10}
#yesheart_area{position:fixed; left:40%; top:31%;  display:none; z-index:10}

#board_cont_area{position: relative;width: 1000px;margin-left: 25%;margin-bottom: 50px;}
#board_cont_subject_area{border-bottom: 3px double silver;}

.enter_bt2{border-radius: 5px; color:white;
		  background: linear-gradient(#776d6d, #292929); cursor:pointer; width:100px; height:40px; }
#auction-body{height:900px;}
.footer-distributed{
 	position:relative;
 	margin-top:0px !important;
 }  
</style>
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/special/open_time_info.js"></script>
<script src="./resources/js/special/dibs.js"></script>
<script>
function reverify(){
	if(confirm("재검증 요청을 하시겠습니까?") == true){
		location.href='special_reverify.nhn?itemnum='+$("#item_num").val()
	}
	
}


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
<div id="auction-body">
<div id="subject">
<a href="special_auction_list.nhn?"><img src="./resources/img/special/special2.png" style="width:250px; height:60px"></a>

</div>
<div id="wait_area">
	<input class="enter_bt2" type="button" value="의뢰등록" onclick="location.href='special_product_write.nhn'">
   	<input class="enter_bt2" type="button" value="검증리스트" onClick="location.href='special_product_list.nhn?eb_state=wait&page=${page}'">
   	<input class="enter_bt2" type="button" value="경매완료" onClick="location.href='special_product_list.nhn?eb_state=auctionfinish&page=${page}'">
</div>
<div id="info_area">
  <div id="info_subject_area">
	<h1>${board.eb_itemname}</h1>
  </div>
<div id="basket_area">
<c:choose>
<c:when test="${basket_check == 'yes'}">
<img src="./resources/img/special/yesheart.png" style="width:70px; height:70px" onClick="return basket_cancel();">
</c:when>
<c:otherwise>
<img src="./resources/img/special/noheart.png" style="width:70px; height:70px" onClick="return basket_register();">
</c:otherwise>
</c:choose>
</div>
<div id="noheart_area">
<img src="./resources/img/special/noheart.png" style="width:200px; height:200px">
</div>
<div id="yesheart_area">
<img src="./resources/img/special/yesheart.png" style="width:200px; height:200px">
</div>

<div id="info_content_area">
<c:choose>
		<c:when test="${empty board.eb_file}">
			<img src="./resources/img/special/noimage.jpg" style="width:400px; height:300px">
		</c:when>
		<c:otherwise>
			<img src="./resources/upload${board.eb_file}" style="width:400px; height:300px">
		</c:otherwise>
		</c:choose>
	 
<input type="hidden" id="item_num" value="${board.eb_itemnum}">
<input type="hidden" id="ey_smallcategory" value="${ey_smallcategory}">
<input type="hidden" id="ey_bigcategory" value="${ey_bigcategory}">
<input type="hidden" id="range" value="${range}">
<c:if test="${board.eb_state == '오픈'}">
<table id="info_table">
	<tr>
		<th>시작가</th> 
		<td>${board.eb_stprice} </td>
		<td><img src="./resources/img/special/시계.png" style="width:20px; height:20px;">
		<span style="font-weight:bolder; color:#ff0057">현재 진행중</span>
		</td>
	</tr>
	
	<tr>
		<th>판매자</th> 
		<td colspan="2">${board.em_id}</td>
	</tr>
	
	<tr>
		<th>물품번호</th> 
		<td colspan="2">${board.eb_itemnum}</td>
	</tr>
	<tr>
		<th>찜수</th> 
		<td><div id="eb_attcount_area">${board.eb_attcount}</div></td>
	</tr>
	
	<tr>
		<th>원산지</th> 
		<td>${board.eb_madein}</td>
	</tr>
	
	<tr>
		<td><input class="enter_bt2" type="button" value="참가하기"
			onClick="enterAuctionRoom('${board.eb_itemnum}')"></td>
		<td>
		<input class="enter_bt2" type="button" value="목록 돌아가기" 
		onClick="location.href=
		'special_auction_list.nhn?itemnum=${list.eb_itemnum}&ey_smallcategory=${ey_smallcategory}&ey_bigcategory=${ey_bigcategory}&range=${range}'">
		</td>
	</tr>

	</table>
</c:if>
<c:if test="${board.eb_state != '오픈'}">
<input type="hidden" id="open_time" value="${board.eb_audate}">	 
<table id="info_table">
	<colgroup>
	<col width="20%"/>
	<col width="45%"/>
	<col width="35%"/>
	</colgroup>
	<tr>
		<th>시작가</th> 
		<td>${board.eb_stprice} </td>
		<td><img src="./resources/img/special/시계.png" style="width:20px; height:20px;"><span id="remain_time"></span></td>
	</tr>
	
	<tr>
		<th>판매자</th> 
		<td colspan="2">${board.em_id}</td>
	</tr>
	
	<tr>
		<th>물품번호</th> 
		<td colspan="2">${board.eb_itemnum}</td>
	</tr>
	
	<tr>
		<th>경매 시작일</th> 
		<td colspan="2">${board.eb_audate}</td>
	</tr>
	
	<tr>
		<th>찜수</th> 
		<td colspan="2"><div id="eb_attcount_area">${board.eb_attcount}</div></td>
	</tr>
	
	<tr>
		<th>원산지</th> 
		<td colspan="2">${board.eb_madein}</td>
	</tr>
	
	<tr>
			<td colspan="3">
				<input class="enter_bt2" type="button" value="참가하기">
			<c:if test="${board.em_id == sessionScope.id || sessionScope.id == 'admin'}">
				<input class="enter_bt2" type="button" value="재검증하기" onClick="return reverify();">
			</c:if>	
				<input class="enter_bt2" type="button"value="목록 돌아가기" 
				onClick="location.href=
				'special_auction_list.nhn?itemnum=${list.eb_itemnum}&ey_smallcategory=${ey_smallcategory}&ey_bigcategory=${ey_bigcategory}&range=${range}'">
			</td>
	</tr>
	<tr>
		<td colspan="3">* 경매 시작시간이 되면 참가하기 버튼이 활성화 됩니다.</td>
	</tr>
	</table>
</c:if>
</div>
</div>
</div>
<div id="board_cont_area">
<div id="board_cont_subject_area">
<h1>상품정보</h1>
</div>
${board.eb_cont}
</div>


<jsp:include page="../main/footer.jsp"/>
</body>
</html>