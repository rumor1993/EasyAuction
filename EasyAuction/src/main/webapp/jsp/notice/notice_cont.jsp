<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="./resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	 $(document).ready(function(){
		 $('.del_sub').click(function(){
				var answer = confirm("삭제 하시겠습니까?");
				
				if(answer == true){
					location.href="./notice_del_ok.nhn";
				} else{
					return false;
				}
			})
	 });
</script>
<title>이지옥션 | 고객센터</title>
<style>
table{
   box-sizing:border-box;
}
h1 {
	color: #F03C02;
	margin-left:10%;
}
.viewCont {
   margin: 0 auto;
   width: 80%;
   border-collapse: collapse;
   height: 20%;
   font-size:12pt;
   line-height:30px;
   border:1px solid black;
}
tr td{
   border-bottom: 1px solid black;
   margin: 0 auto;
}
td:nth-child(1){
	width:20%
}
a {
	text-decoration: none
}
.down{
   float:right;
   margin-right:9.5%;
   border-bottom: 1px solid #1E90FF;
}
.sub{
   border-top: 3px solid gray;
   border-bottom: 1px solid gray;
   width: 81%;
   margin: 0 auto;
}
.nbutton1 {
	width: 120px;
	height: 30px;
	padding-left: 10px;
	font-size: 18px;
	color: #F03C02;
	border: 1px solid #F03C02;
	border-radius: 3px;
	background-color: white;
	cursor:pointer;
}
#boardcont_menu{
	text-align:center}
	
.review-title{opacity:0.9;background:black;height:50px;
	margin:0px 0px 50px 0px;padding:30px 70px;z-index:1}
.review-title-addr{font-size:30pt;float:right;margin-right:35%;z-index:100;color:white;}
.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
.fa-home{color:white;font-size:15pt;}
</style>
</head>
<jsp:include page="../main/header.jsp"/>
	<div class="review-title">
		<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;Notice > &nbsp;View Page </span>
		<span class="review-title-addr" style="font-family: 'Pacifico', cursive;">Notice View</span>
	</div>
<body>
	<div id="boardcont_wrap" style="width:100%">
		<h1 class="boardcont_title" style="width:370px">
			게시물 내용보기</h1>
	<div class="sub">
		<h3>&nbsp;&nbsp;${bcont.en_sub}</h3>
         <h4>&nbsp;&nbsp;글쓴이 ${bcont.en_admin}&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;작성일 ${bcont.en_date}
            &nbsp;&nbsp; 조회수 ${bcont.en_hit}</h4>
	</div>
	<br>
	<div class="down">
	<c:if test="${!empty bcont.en_file}">
	<a href="./download.file?path=${bcont.en_file}&original=${bcont.en_original}">
					${bcont.en_original}</a>
					</c:if>
	</div>
	<br><br>
		<table class="viewCont">
			<tr>
				<td>
               <c:if test="${empty bcont.en_file}">
                  <pre>${bcont.en_cont}</pre>
               </c:if>
               
               <c:if test="${!empty bcont.en_file}">
                  <pre>${bcont.en_cont}</pre>
                  <img src="./resources/upload${bcont.en_file}" width=500px; height=300px>
               </c:if>
            </td>
			</tr>
		</table>
		<br><br>
		
		<div id="boardcont_menu">  <!-- style="margin-left:200px" -->
		<c:if test="${sessionScope.id == 'admin'}">
			<input type="button" value="수정" class="nbutton1"
				onclick="location='notice_cont.nhn?en_num=${bcont.en_num}&page=${page}&state=edit'">
			
			<a href="./notice_del_ok.nhn?en_num=${bcont.en_num}" class="del_sub">
			<input type="button" value="삭제" class="nbutton1"></a>
		</c:if>	
			<input type="button" value="목록" class="nbutton1"
				onclick="location='notice_list.nhn?en_num=${bcont.en_num}&page=${page}'">
		</div>
	</div>
	<br><br><br><br>
	<br><br><br><br>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>