<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">

#review_write_wrap{
	padding:100px;
}

/* #close {
	display: none
} */
#btn btn-primary btn-lg{
	background-color:#f03c02
}
.review-write-form{border:2px solid lightgray;margin-bottom:30px;border-radius:10px;}
.review-title{opacity:0.9;background:black;width:100%;height:150px;
		margin:0px 0px -40px 0px;padding:50px 70px;z-index:1}
.review-title-addr{font-size:30pt;float:left;z-index:100;color:white;}
.review-title-img{float:right;z-index:100;color:white;margin-top:20px;}
.fa-home{color:white;font-size:15pt;}
</style>
<title>Insert title here</title>

<script src="resources/js/jquery-3.3.1.js"></script>
<script>
	$(function() {
		
		$(".er_kind").val("${review.er_kind}");
		
		$('#upfile').change(function() {
			var inputfile = $(this).val().split('\\');
			$('#close').show();
			$('#filevalue').text(inputfile[inputfile.length - 1])

		});
		$("#close").click(function() {
			$('#filevalue').text('');
			$("#close").hide();
			$('#upfile').val('');
		});

		
	})
	function check(){
	
		
		if($("#er_pass").val() == ''){
			alert('비밀번호를 입력해 주세요')
			$("#er_pass").focus();
			return false;
		}
		
		if($("#er_sub").val() == ''){
			alert('제목을 입력해 주세요')
			$("#er_sub").focus();
			return false;
		}
		var tmp = $("#er_cont").val().replace(/\s|　/gi, '');
		
		if(tmp == ''){
			alert('내용을 입력해 주세요')
			$("#er_cont").focus();
			return false;
		}
		
	}

</script>

</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div class="review-title">
		<span class="review-title-addr">Review Write</span>
		<span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;Review > &nbsp;Write Page </span>
	</div>
	
	<div id="review_write_wrap">
		
		<form method="post" action="./review_write_ok.nhn"
			onsubmit="return check()" enctype="multipart/form-data">
			<input type="hidden" name="er_itemnum" class="er_itemnum" id="er_itemnum" value="${review.er_itemnum}">
			<input type="hidden" name="er_itemname" class="er_itemname" id="er_itemname" value="${review.er_itemname}">
			<table class="table table-striped">
				
				<tr>
					<th>물품종류
					
					<th><select class="form-control" name="er_kind" class="er_kind" id="er_kind">

							<option value="일반">일반물품</option>
							<option value="특별">특별물품</option>
					</select>
				</tr>
					
				<tr>
				
					<th>글쓴이</th>
					<td><input name=em_id id="em_id" size="14" class="form-control"
						value="${sessionScope.id}" readonly></td>
					
				</tr>


				<tr>

					<th>비밀번호</th>
					<td><input type="password" name="er_pass" id="er_pass"
						size="14" class="form-control"></td>
				</tr>

				<tr>
					<th>제목</th>
					<td><input type="text" name="er_sub" id="er_sub" size="40"
						class="form-control"></td>
				</tr>

				<tr>
					<th>내용</th>
					<td><textarea name="er_cont" id="er_cont" rows="10" cols="40"
							class="form-control"></textarea></td>
				</tr>

				<tr>
					<td><div>첨부파일</div></td>
					<td><label for="upfile"><img
							src="resources/images/review/file_open.png" alt="파일열기"
							style="width: 30px; height: 30px;"></label> <input type="file"
						name="uploadfile" id="upfile" style="display: none"> <span
						id="filevalue"></span>&nbsp; <span id="close"><img
							src="resources/images/review/cancel.png"
							style="width: 30px; height: 30px;"></span></td>
				</tr>

			
			</table>
			<div id="review_write_menu" style="text-align: center" id="write">
				<button type="submit" value="등록" class="btn btn-danger btn-lg">등록</button> 
				<button type="reset" value="취소" class="btn btn-danger btn-lg"
					onclick="history.back();">취소</button>
			</div>
			
		</form>
	</div>
	
<jsp:include page="../main/footer.jsp"/>
</body>
</html>