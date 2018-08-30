<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>FAQ 수정</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
		/* 파일첨부 이미지 보기 */
        $(function() {
            $("#uploadfile").on('change', function(){
                readURL(this);
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
                }
            if (input.files.width > 300) { // holder width
            	input.files.width = 300;
              }
              reader.readAsDataURL(input.files[0]);
            }
        }
</script>
<style>
table{
	margin:0 auto;
	width:80% ;
	border-collapse:collapse;
}
h1 {
	color: #F03C02;
	margin-left:10%;
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
.review-title{opacity:0.9;background:black;height:50px;
		margin:0px 0px 30px 0px;padding:30px 70px;z-index:1}
.review-title-addr{font-size:30pt;float:right;margin-right:35%;z-index:100;color:white;}
.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
.fa-home{color:white;font-size:15pt;}
</style>
</head>

<body>
<jsp:include page="../main/header.jsp"/>
	<div class="review-title">
		<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;FAQ > &nbsp;Edit Page </span>
		<span class="review-title-addr" style="font-family: 'Pacifico', cursive;">FAQ Edit</span>
	</div>
<form action="faq_edit_ok.nhn" method="post" style="margin-bottom:50px;"
	enctype="multipart/form-data" name="boardform">
		<br>
	<h1>FAQ 수정</h1>
	<table>
		<tr>
			<td><div>게시자</div></td>
			<td>
				<input name="ef_admin" id="ef_admin" readOnly
						type="text" size="6" maxlength="30" value="admin" 
						style="text-align:center" width="60px">
				<input type="hidden" value="${faq.ef_num}" name="ef_num">
				<input type="hidden" value="${page2}" name="page2">
			</td>
		</tr>
		<tr>
			<td><div>카테고리</div></td>
			<td>
				<select name="ef_cate" id="ef_cate">
				<c:forEach var="t" items="${faq.ef_cate}" begin="0" end="16">
						<option value="${t}" selected>${t}</option>
							</c:forEach>
				 	      <option value="">=카테고리 선택=</option>
				 	      <option value="나의정보관리">나의정보관리</option>
				 	      <option value="주문">주문</option>
				 	      <option value="결제">결제</option>
				 	      <option value="배송">배송</option>
				 	      <option value="취소/환불">취소/환불</option>
				 	      <option value="반품/교환">반품/교환</option>
				 	      <option value="서비스/기타">서비스/기타</option>
				 	      <option value="안전거래">안전거래</option>
		 	    </select>
		 	</td>
		<tr>
		<tr>
			<td><div>제목</div></td>
			<td><input name=ef_sub id="ef_sub"type="text"maxlength="100" value="${faq.ef_sub}"
			style="width:490px"></td>
		</tr>
		<tr>
			<td><div>내용</div></td>
			<td>
			<pre id="preview"><textarea name="ef_cont" id="ef_cont"  cols="67" rows="22">${faq.ef_cont}</textarea></pre>
			</td>
		</tr>
		<tr>
			<td><div>첨부된 파일</div></td>
			<td>${faq.ef_original}</td>
		</tr>
		<tr>
			<td>
				<div>파일 첨부</div>
			</td>
			<td>
				<input type="file" id="uploadfile" name="uploadfile" >
				<img id="blah" src="#" alt="your image" width=100px height=100px/>

			</td>
		</tr>
	</table>
		<br><br>
		<div class="center" style="text-align:center">
				<button type=submit class="nbutton1">등록</button>
				<button type=reset class="nbutton1" onClick="history.go(-1);">취소</button>
		</div>
<br><br><br>
</form>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>
