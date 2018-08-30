<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>FAQ 게시판</title>

<script src="./resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	 $(document).ready(function(){
		 $('.del_sub').click(function(){
				var answer = confirm("삭제 하시겠습니까?");
				
				if(answer == true){
					location.href="./faq_del_ok.nhn";
				} else{
					return false;
				}
			})
	 });
</script>
<script type="text/javascript">
	function viewHidden(ef_num){
		var str = ".hidden" + ef_num;
		var status = $(str).css("display"); 
		 if (status == "none") { 
			 $(str).css("display", ""); 
		 } else { 
			 $(str).css("display", "none"); 
		 } 
	}
	
    function chattingWindow(){
     window.open('./main_chat.nhn', 'popup', 
     'width=400, height=650, top=50, left=100, toolbar=no,scrollbars=yes,resizable=yes,fullscreen=no');
  	}
</script>
<style>
.bonmun {
	margin: 0px 100px 50px 200px;
}

.qq{
	wdith:20px;
	height:20px;
}
.qq1{
	wdith:20px;
	height:20px;
	float:right;
}
.faqListIcons{
	float:right;
}
.list{
	width:500px;
	height:"500px";
}
.inquiry-search {
    overflow: hidden;
    height: 65px;
    margin-bottom: 40px;
    padding: 15px 19px 0;
    border: 1px solid #ccc;
    border-right: 1px solid #aeaeae;
    border-bottom: 1px solid #9d9d9d;
    vertical-align:middle;
}
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
#condition{
	width: 300px; /* 원하는 너비설정 */
	padding: .8em .5em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	border: 1px solid #999;
	appearance: none;
}
.list {
	width: 90%;
	border: 1px solid black
}
tr{
	border-bottom: 1px solid #F8F8F8;
	line-height: 28px;
}
a {
	text-decoration: none
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
	vertical-align:middle;
}
.contcont{
	text-align:left;
	background-color:#f3f3f3;
}
.review-title{opacity:0.9;background:black;height:50px;
		margin:0px 0px 30px 0px;padding:30px 70px;z-index:1}
.review-title-addr{font-size:30pt;float:right;margin-right:35%;z-index:100;color:white;}
.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
.fa-home{color:white;font-size:15pt;}
</style>
</head>
<jsp:include page="../main/header.jsp"/>
<body>
	<div class="review-title">
		<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;FAQ > &nbsp;List Page </span>
		<span class="review-title-addr" style="font-family: 'Pacifico', cursive;">FAQ List</span>
	</div>
<div class="bonmun">

 <ul>
  <li><a href="./notice_list.nhn">공지사항</a></li>
  <li><a href="./faq_list.nhn" class="active" >FAQ</a></li>
  <li><a href="#" onClick="chattingWindow();">실시간 채팅</a></li>
  <li><a href="./review_list.nhn">후기 게시판</a></li>
</ul>

<div class="tab-pane" id="nav-profile">
	 <br><br>
	 <h2>FAQ 게시판 - 자주 묻는 질문</h2>
	 
	 <form class="loadForm" method='get' action="faq_write.nhn">
         <span class="nbutton-span">
           <c:if test="${sessionScope.id == 'admin'}">
            <button id="notice_write" class="nbutton1">글쓰기</button>
            <button type=reset class="nbutton1" onClick="history.go(-1);">뒤로가기</button>
            </c:if>
         </span>   
     </form>
     <br><br>
	 	<div class="inquiry-search">
	 	<form method="get" action="faq_find_ok.nhn">
	 		<label for="inquirySearch">
	 		<img src="http://pics.auction.co.kr/customer/title_inquiry.gif" alt="자주찾는 문의">
	 		</label>&nbsp;&nbsp;&nbsp;
	 		
			<input type="text" class="txt" id="condition" name="condition" title="자주찾는 문의"
				placeholder="배송, 회원가입, 입찰, 특별">
			<button type="submit" class="nbutton1">검색</button>
			</form>
		</div>
		
	<div id="boardlist_wrap">
    <table class="list list-table" style="text-align:center">
   		<tr>
			<th colspan="2">Category</th>
			<th colspan="3">LIST</th>
			<th>${page2} 페이지 / 글 개수 : ${listcount2}</th>
			
		</tr>
      <c:forEach var="b2" items="${boardlist2}">
      <c:set var="num" value="${listcount2-(page2-1) * limit2}"/>
      <tr>
         <td class="news-td" colspan="1">
         	<div>${b2.ef_cate}</div>
         </td>
         <td class="target1" colspan="4" style="text-align:left !important">
            <div class="target${b2.ef_num}">
         	<a href="#" id="viewhidden" onclick="viewHidden('${b2.ef_num}')" class="button">
            <img class="qq" src="./resources/images/QQ.jpg">
<!-- 제목 --> <strong>${b2.ef_sub}</strong></a>
			

			<c:if test="${sessionScope.id == 'admin'}">
				<div class="qq1">
	<!-- 수정 -->	<a href="./faq_edit.nhn?ef_num=${b2.ef_num}&page2=${page2}" id="btn" class="edit_sub">
				<img src="./resources/images/pen.png" class="qq"></a>
				 |&nbsp;&nbsp;&nbsp;
				<a href="./faq_del_ok.nhn?ef_num=${b2.ef_num}" class="del_sub">
	<!-- 삭제 --><img src="./resources/images/x_mark.png" class="qq1"></a>
				</div>
			</c:if>
            </div>
         </td>
      </tr>
      <tr id="hidden" class="hidden${b2.ef_num} contcont" style="display:none">
      	<th colspan="3"></th>
      	<td class="cont1234" colspan="2">
      	
      	<%--첨부 파일이 있을 때 --%>
         <div id="cont1234${b2.ef_num}" >
               <c:if test="${b2.ef_file != null}">
   <!-- 내용 -->   <pre><img class="qq" src="./resources/images/AAA.jpg">${b2.ef_cont}
                  <img src="./resources/upload${b2.ef_file}" height="200px" width="200px"></pre>
               </c:if>
            
         <%--첨부 파일이 없을 때 --%>
               <c:if test="${b2.ef_file == null}">
                  <pre><img class="qq" src="./resources/images/AAA.jpg">${b2.ef_cont}</pre>
               </c:if>
            </div>
         </td>
      </tr>
      </c:forEach>
      
      <tr class="lime">
         <td colspan=5 style="text-align: center">
            <c:if test="${page2 <= 1}">
                     이전 |&nbsp;
            </c:if> 
            
            <c:if test="${page2 > 1}">
               <a href="./faq_list.nhn?page2=${page2-1}">이전 |</a>
            </c:if> 
            
            <c:forEach var="a2" begin="${startpage2}" end="${endpage2}">
               <c:if test="${a2 == page2}">
                  ${a2}
               </c:if>
               
               <c:if test="${a2 != page2}">
               <a href="./faq_list.nhn?page2=${a2}">${a2}</a>
               </c:if>
            </c:forEach> 
            <c:if test="${page2 >= maxpage2}">
               &nbsp;| 다음
            </c:if> 
            <c:if test="${page2 < maxpage2}">
            <a href="./faq_list.nhn?page2=${page2 + 1}">&nbsp;| 다음</a>
            </c:if>
         </td>
      </tr>
        <!-- 레코드가 없으면 -->
      <c:if test="${listcount2 == 0}">
         <tr>
            <td></td>
            <td style="text-align: center" colspan="3">
               <font size=2>등록된 글이 없습니다.</font>
            </td>
         </tr>
      </c:if>
   	</table>
	</div>
		<!-- ====================FAQ End===================== -->
	</div> <!-- tab-content end -->
</div>	<!-- bonmun end -->
<br><br><br><br>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>