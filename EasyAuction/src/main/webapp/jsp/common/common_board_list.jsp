<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/auction/resources/css/common/common_board_list.css"> 
<head>
<title>일반경매 물품 게시판형 리스트</title>
<script type="text/javascript">

	function writeform(){
		location.href = "./common_product_write.nhn"
	}
</script>
<style>
.review-title{opacity:0.9;background:black;width:100%;height:110px;
		margin:0px 0px 30px 0px;padding:30px 70px;z-index:1}
.review-title-addr{font-size:30pt;float:right;margin-right:35%;z-index:100;color:white;}
.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
.fa-home{color:white;font-size:15pt;}
#search{margin-top:30px}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"></jsp:include>
	<div class="review-title">
		<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;Common > &nbsp;List Page </span>
		<span class="review-title-addr" style="font-family: 'Pacifico', cursive;">Common List</span>
	</div>
	<form  method="get" action="common_product_list_img.nhn">
		<div id="search">
			<select name="find_field">
				<option value="em_id">판매자</option>
				<option value="eb_itemname">상품명</option>
				<option value="eb_cont">내용</option>
			</select> <input type="text" name="find_name" placeholder="검색어를 입력해주세요">
			<button>
				<i class="material-icons">search</i>
			</button>
		</div>
	</form>
	<div id="category">
		<div id="displayChange">
			<span id="list"> <a href="./common_product_list_img.nhn?state=img"> 앨범형으로 보기 <i class="material-icons">list</i> </a></span>
			<span id="list"> <a href="#" onclick="writeform()" > 등록하기 <i class="material-icons">content_paste</i> </a></span>
	
		</div>
		<div id="select_category">
			<span> <a href="./common_product_list_img.nhn?orderby=hit"> 인기경매순</a> </span>
			<span> <a href="./common_product_list_img.nhn?orderby=old"> 마감임박순</a> </span>
			<span> <a href="./common_product_list_img.nhn?orderby=new"> 신규경매순</a> </span>
			<span> <a href="./common_product_list_img.nhn?orderby=high"> 높은가격순</a> </span>
			<span> <a href="./common_product_list_img.nhn?orderby=row"> 낮은가격순</a> </span>
		</div>
		
	</div> 
	<h3>게시판</h3>
	<table id="board" class=table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
		</thead>
		
		<c:forEach var="list" items="${boardlist }">	
		<tbody>
			<tr>
				<td>${list.eb_boardnum }</td>
				<td><img width="100px" height="50" alt="물품이미지" src="./resources/upload${list.eb_file }" ><a href="./common_product_cont.nhn?eb_itemnum=${list.eb_itemnum }&state=cont">${list.eb_itemname }</a></td>
				<td>${list.eb_stdate }</td>
				<td>${list.em_id }</td>
				<td>${list.eb_hit }</td>
			</tr>
		</tbody>
		</c:forEach>
	</table>
	
	<div id="divPaging">
		<tr class="h30 lime center btn">
				<td colspan=5>
					<c:if test="${page <= 1 }">
					 이전&nbsp;
					 </c:if>
				<c:if test="${page > 1 }">
					<a href="./common_product_list.nhn?page=${page-1 }">이전</a>
				</c:if>
				
				<c:forEach var="a" begin="${startpage }" end="${endpage }">
					<c:if test="${a==page }">
						${a } 
					</c:if>
					
					<c:if test="${a!=page }">
						<a href="./common_product_list.nhn?page=${a }">${a }</a>
					</c:if>
				</c:forEach>
				<c:if test="${page >= maxpage }">
					&nbsp;다음
				</c:if>
				
				<c:if test="${page < maxpage }">
					<a href="./common_product_list.nhn?page=${page+1 }">다음</a>
				</c:if>
				
				
			</tr>	
	</div>
	
	<form  method="get" action="common_product_find_ok.nhn?">
		<div id="search">
			<select name="find_field">
				<option value="em_id">판매자</option>
				<option value="eb_itemname">상품명</option>
				<option value="eb_cont">내용</option>
			</select> <input type="text" name="find_name" placeholder="검색어를 입력해주세요">
			<button>
				<i class="material-icons">search</i>
			</button>
			<input type="hidden" name="list" value="list"> 
		</div>
	</form>
	<input class="btn btn-default" type="button" value="등록하기" onclick="writeform()" style="margin-bottom: 100px">
		<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>