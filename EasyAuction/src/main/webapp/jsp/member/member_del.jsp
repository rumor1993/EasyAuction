<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
<script src="./resources/js/jquery-3.3.1.js"></script>
<script>
 function check(){
	 if($.trim($("#del_cont").val())==""){
		 alert("탈퇴사유를 입력하세요!");
		 $("#del_cont").val("").focus();
		 return false;
	 }
	 if($.trim($("#pwd").val())==""){
		 alert("비밀번호를 입력하세요!");
		 $("#pwd").val("").focus();
		 return false;
	 }
 }
</script>
</head>
<body>
<div id="del_wrap">
	 <h2 class="del_title">회원탈퇴</h2>
	 <form method="post" action="member_del_ok.nhn" onsubmit="return check()">
			<table id="del_t">
				<tr>
					<th>회원아이디</th>
					<td>${d_id}</td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td>${d_name}</td>
				</tr>
				<tr>
					<th>탈퇴사유</th>
					<td><textarea name="del_cont" id="del_cont" rows="7" cols="30"
						class="input_box"></textarea>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd" id="pwd"
						size="14" class="input_box"></td>
				</tr>
			</table>

			<div id="del_menu">
				<input type="submit" value="회원탈퇴" class="input_button"> 
				<input type="reset" value="탈퇴취소" class="input_button"
					onclick="history.go(-1);">
			</div>
	 </form>
	</div>
</body>
</html>