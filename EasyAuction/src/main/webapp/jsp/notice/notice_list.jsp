<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항 게시판</title>
 <script src="./resources/js/jquery-3.3.1.js"></script>
<link href="./resources/css/notice.css" rel="stylesheet">
<style>
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	border: 1px solid #e7e7e7;
	background-color: #f3f3f3;
}

li {
	float: left;
}

li a {
	display: block;
	color: #666;
	width:150px;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover:not (.active ) {
	background-color: #ddd;
}

li a.active {
	color: white;
	background-color: #F03C02;
}

.nbutton1 {
	width: 120px !important;
	height: 30px !important;
	padding-left: 10px !important;
	font-size: 18px !important;
	color: #F03C02 !important;
	border: 1px solid #F03C02 !important;
	border-radius: 3px !important;
	background-color: white !important;
	cursor: pointer !important;
}

.bonmun {
	margin: 0px 100px 50px 200px;
}

td:nth-child(2):hover {
	background-color: #F8F8F8
}

.target { /* 한 줄 자르기 */
	line-height: 2;
	display: inline-block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	vertical-align: middle;
}

a {
	text-decoration: none
}

.list {
	width: 90%;
	border: 1px solid #F8F8F8;
}

select{
	width: 200px; /* 원하는 너비설정 */
	padding: .8em .5em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%; /* 네이티브 화살표 대체 */
	border: 1px solid #999;
	border-radius: 0px; /* iOS 둥근모서리 제거 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}
#find_name{
	width: 300px; /* 원하는 너비설정 */
	padding: .8em .5em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	border: 1px solid #999;
	appearance: none;
}
.search-form{margin-top:30px;}
.review-title{opacity:0.9;background:black;height:50px;
		margin:0px 0px 30px 0px;padding:30px 70px;z-index:1}
.review-title-addr{font-size:30pt;float:right;margin-right:35%;z-index:100;color:white;}
.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
.fa-home{color:white;font-size:15pt;}
.head-title{width:200px;}
</style>
<script>
	$(document).ready(function(){

		$("#view_count").val("${limit}").prop("selected", true);
		$("#view_count").change(function(){

 			var limit = $("#view_count option:selected").val();
			$.ajax({
				type : "POST",
				data : {"limit" : limit},
				url : "./notice_list.nhn",
				cache : false,
				headers : {"cache-control" : "no-cache",
							"pragma" : "no-cache"},
				success : function(data){
					$("body").html(data);
				},
				error : function(request, status, error){
					alert("data-error");
				}
			}); 
		});
	})
</script>
<script>
     function chattingWindow(){
      window.open('./main_chat.nhn', 'popup', 
      'width=400, height=650, top=50, left=100, toolbar=no,scrollbars=yes,resizable=yes,fullscreen=no');
   }
  </script>
</head>
<jsp:include page="../main/header.jsp"/>	
<body>
	<div class="review-title">
		<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;Notice > &nbsp;List Page </span>
		<span class="review-title-addr" style="font-family: 'Pacifico', cursive;">Notice List</span>
	</div>
<div class="bonmun">  

 <ul>
  <li><a href="./notice_list.nhn" class="active">공지사항</a></li>
  <li><a href="./faq_list.nhn" >FAQ</a></li>
  <li><a href="#" onClick="chattingWindow();">실시간 채팅</a></li>
  <li><a href="./review_list.nhn">후기 게시판</a></li>
</ul>

<div class="tab-content" id="nav-tabContent">
  <div class="tab-pane fade active show " id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
  	<br><br>
  	<h2>공지사항</h2>
  	
         <form class="loadForm" method='get' action="notice_write.nhn">
         <span class="nbutton-span">
           <c:if test="${sessionScope.id == 'admin'}">
            <button id="notice_write" class="nbutton1">글쓰기</button>
            <button type=reset class="nbutton1" onClick="history.go(-1);">뒤로가기</button>
            </c:if>
         </span>   
         </form>
         <br><br>
         
         <!-- 게시판 리스트 -->
<div id="boardlist_wrap">
   <table class="list list-table" style="text-align:center">
   <tr>
			<th colspan="3">공지사항list</th>
			<th colspan="2">${page} 페이지 / 글 개수 : ${listcount}</th>
		</tr>
         <tr>
            <th width="10%"><div>번호</div></th>
            <th width="40%"><div>제목</div></th>
            <th width="15%"><div>작성자</div></th>
            <th width="20%"><div>날짜</div></th>
            <th width="15%"><div>조회수</div></th>
         </tr>
      <c:set var="num" value="${listcount-(page-1) * limit}"/>
      <c:forEach var="b" items="${boardlist}">
      <tr>
         <td class="news-td" >
            <c:out value="${num}"/>   <%-- num 출력 --%>
            <c:set var="num" value="${num-1}"/>   <%-- num = num - 1 --%>
         </td>
         <td class="target1" style="text-align:left !important">
            <div class="target">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <a href="./notice_cont.nhn?en_num=${b.en_num}&page=${page}&state=cont">
          		${b.en_sub}</a>
            </div>
         </td>
         <td>
            <div class="mun">${b.en_admin}</div>
         </td>
         <td>
            <div>${b.en_date}</div>
         </td>
         <td>
            <div>${b.en_hit}</div>
         </td>
      </tr>
      </c:forEach>
      
 	<tr class="lime">
         <td colspan=5 style="text-align: center">
            <c:if test="${page <= 1}">
                     이전 |&nbsp;
            </c:if> 
            
            <c:if test="${page > 1}">
               <a href="./notice_list.nhn?page=${page-1}">이전 |</a>
            </c:if> 
            
            <c:forEach var="a" begin="${startpage}" end="${endpage}">
               <c:if test="${a == page}">
                  ${a}
               </c:if>
               
               <c:if test="${a != page}">
               <a href="./notice_list.nhn?page=${a}">${a}</a>
               </c:if>
            </c:forEach> 
            <c:if test="${page >= maxpage}">
               &nbsp;&nbsp;| 다음
            </c:if> 
            <c:if test="${page < maxpage}">
            <a href="./notice_list.nhn?page=${page + 1}">&nbsp;&nbsp;| 다음</a>
            </c:if>
         </td>
      </tr>
      
        <!-- 레코드가 없으면 -->
      <c:if test="${listcount == 0}">
         <tr>
            <td></td>
            <td style="text-align: center" colspan="3">
               <font size=2>등록된 글이 없습니다.</font>
            </td>
         </tr>
      </c:if>
      		<tr>
				<td colspan="5" style="text-align:right">
					<select id="view_count">
						<option value="3">3줄 보기</option>
						<option value="5">5줄 보기</option>
						<option value="7">7줄 보기</option>
						<option value="10" selected>10줄 보기</option>
					</select>
				</td>
			</tr>
   </table>
   <div id="boardfind">
		<script src="./resources/js/jquery.js"></script>
		<script>
			function find_check(){
				if($.trim($("#find_name").val()) == ""){
					alert("검색어를 입력하세요!");
					$("#find_name").val("").focus();
					return false;
				}
			}
		</script>
		<form method="get" action="notice_find_ok.nhn"
			onsubmit="return find_check()" class="search-form">
			<table>
				<tr>
					<th>
						<select name="find_field">
							<option value="notice_subject">제목</option>
							<option value="notice_name">작성자</option>
							<option value="notice_content">내용</option>
						</select>
					</th>
					<td>
						<input name="find_name" id="find_name" size="18"
							class="input_box">
						<input type="submit" value="검색" class="nbutton1">
					</td>
				</tr>
			</table>
		</form>
		
		</div>
	 </div>
  	</div>
	  <!-- ====================Notice End===================== -->
</div> <!-- tab-content end -->
</div>	<!-- bonmun end -->
<br>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>