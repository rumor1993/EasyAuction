<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/auction/resources/css/bootstrap.css">
<link rel="stylesheet" href="/auction/resources/css/common/common_board_img_list.css">
<script src="/auction/resources/js/common/common_board_img_list.js"></script>
<link href="https://fonts.googleapis.com/css?family=Doppio+One|Nanum+Gothic" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lancelot" rel="stylesheet">

<script src="/auction/resources/js/bootstrap.js"></script>
<head>
<title>일반경매 물품 앨범형 리스트</title> 
<script type="text/javascript">
	var size = ${boardlist.size()};
</script>

<Style>
@media only screen and (max-width: 600px) {
	.review-title-addr{margin-top:-60px}
   .category_img{
   	margin-top: 10px;
    width: 50px;
    height: 50px;
   }
   
   #select_category{
   margin-top: 50px;
	font-size: 12.5px;
    margin-bottom: 10px;
   }
   img{
       height: 100px;
       width: 100px;
   }
   
   .divladate{
   	display: none;
   }
   .divaudate{
   	display: none;
   }
   
   #img_board{
   padding: 20px;
   width: 250px;
    font-size: 10px;
    margin-left:-50px;
    margin-right: 2px;
    font-weight:bolder;
   }
   
   .material-icons{
       display: none;
   }
   .divemid{
   	display: none;
   }
}
#append{padding:10px 100px;}
.review-title{opacity:0.9;background:black;height:10px;
		margin:0px 0px 30px 0px;padding:50px 70px;z-index:1}
.review-title-addr{font-size:30pt;float:right;margin-right:35%;z-index:100;color:white;}
.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
.fa-home{color:white;font-size:15pt;}
#search{margin-top:30px}
</Style>
</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>
<div class="review-title">
		<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;Common > &nbsp;List Page </span>
		<span class="review-title-addr" style="font-family: 'Pacifico', cursive;">Common List</span>
	</div>	
<input type="hidden" id="state" value="${state}">
<input type="hidden" id="find_field" value="${find_field}">
<input type="hidden" id="find_name" value="${find_name}">
	<form  method="get" action="common_product_list_img.nhn">
		<div id="search">
			<select name="find_field">
				<option value="eb_itemname">상품명</option>
				<option value="em_id">판매자</option>
				<option value="eb_cont">내용</option>
			</select> <input type="text" name="find_name" placeholder="검색어를 입력해주세요">
			<button>
				<i class="material-icons">search</i>
			</button>
		</div>
	</form>
	<div id="category">
		<div id="displayChange">
			<span id="list"> <a href="./common_product_list.nhn?state=board"> 리스트로 보기 <i class="material-icons">list</i> </a></span>
			<span id="list"> <a href="#" onclick="writeform()" > 등록하기 <i class="material-icons">content_paste</i> </a></span>
			<c:if test="${complete=='성공'}">
			<span id="salesList"> <a href="#" onclick="salesList()" > 판매목록  <i class="material-icons">content_paste</i> </a></span>
			</c:if>
			
			<c:if test="${complete=='실패'}">
			<span id="salesCompleteList"> <a href="#" onclick="salesCompleteList()" > 판매완료목록 <i class="material-icons">content_paste</i> </a></span>
			</c:if>
		</div>
		<div id="select_category">
			<span> <a href="./common_product_list_img.nhn?orderby=hit"> 인기경매순</a> </span>
			<span> <a href="./common_product_list_img.nhn?orderby=old"> 마감임박순</a> </span>
			<span> <a href="./common_product_list_img.nhn?orderby=new"> 신규경매순</a> </span>
			<span> <a href="./common_product_list_img.nhn?orderby=high"> 높은가격순</a> </span> 
			<span> <a id="a2" href="./common_product_list_img.nhn?orderby=row"> 낮은가격순</a> </span>
		</div>
		
	</div> 
	<div id="bigcategory">
		<div id="bigcategoryca">
			<span><img id="패션의류" class="category_img" alt="물품이미지" src="./resources/images/category/Fashion_Clothing.jpg"></span> 
			<span><img id="패션잡화" class="category_img" alt="물품이미지" src="./resources/images/category/Fashion_goods.jpg"></span> 
			<span><img id="식품" class="category_img" alt="물품이미지" src="./resources/images/category/food.jpg"></span> 
			<span><img id="스포츠레저" class="category_img" alt="물품이미지" src="./resources/images/category/sports.jpg"></span> 
			<span><img id="도서기타" class="category_img" alt="물품이미지" src="./resources/images/category/Etc.jpg"></span> 
			<span><img id="유아용품" class="category_img" alt="물품이미지" src="./resources/images/category/Baby_goods.jpg"></span> 
			<span><img id="디지털컴퓨터" class="category_img" alt="물품이미지" src="./resources/images/category/computer.jpg"></span> 
			<span><img id="뷰티" class="category_img" alt="물품이미지" src="./resources/images/category/beauty.jpg"></span> 
			<span><img id="가구생활" class="category_img" alt="물품이미지" src="./resources/images/category/Home_Appliances.jpg"></span> 
			<span><img id="생활가전" class="category_img" alt="물품이미지" src="./resources/images/category/Furniture_Living.jpg"></span> 
			<span><img id="취미" class="category_img" alt="물품이미지" src="./resources/images/category/hobby.jpg"></span> 
			<span><img id="자동차공구" class="category_img" alt="물품이미지" src="./resources/images/category/Car_tool.jpg"></span> 
		</div>
		<div id="small_category_area"></div>
	</div>
	
	<div id="append">
	<c:forEach var="b" items="${boardlist }" begin="${start }" end="${end }" varStatus="status">
	<div id="img_board" class="ima_board">
		<div id="product">
			 
			<i class="material-icons">alarm</i><div id="enddatealarm" class="enddate${status.index }"></div>
			
			<img alt="물품이미지" src="./resources/upload${b.eb_file }" onclick="bid('${b.eb_itemnum }')" >
			<div>
				<span> [ 물품번호 ] </span>
				<span> ${b.eb_itemnum } </span>
			</div>	
			<div>
				<span> [ 물품이름 ] </span>
				<c:set var="nameleng" value="${fn:length(b.eb_itemname)}"/>
				<c:if test="${nameleng > 8}">
					<span> ${b.eb_itemname.substring(0,8) }... </span> 
				</c:if>
				
				<c:if test="${nameleng < 8}">
				<span> ${b.eb_itemname } </span>
				</c:if>
			</div>

			<div class="divaudate">
				<span> [ 경매시작 ] </span>
				<span> ${b.eb_audate } </span>
			</div>
			
			<div class="divladate">
				<span> [ 경매종료 ] </span>
				<span class="hello${status.index }"> ${b.eb_ladate }  </span>
			</div> 
			
			<div class="divemid">
				<span> [ 판매자 ] </span>
				<span> ${b.em_id } </span>
			</div>
			<div>
				<span> [ 조회수 ] </span>
				<span > ${b.eb_hit } </span>
				<span><button id="board_btn" class="board_btn${status.index }" onclick="bid('${b.eb_itemnum }')">입찰하러가기</button></span>
			</div>
		</div>
	</div>
	</c:forEach> 
	</div>
	<c:if test="${complete=='성공'}">
		<div id="addclick" onclick="addclick()"><i class="material-icons">control_point</i></div>
	</c:if>
	<c:if test="${complete=='실패'}">
		<div id="addclick" onclick="addclick2()"><i class="material-icons">control_point</i></div>
	</c:if>
	<jsp:include page="../main/footer.jsp"></jsp:include>
	</body>
</html>