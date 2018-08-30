<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
    $("#gita").click(function(){
        var chk = $(this).is(":checked");
        if(chk == true){
        	$('#eu').show();
        }else{
        	$('#eu').hide();
        }
       
    });
});

function cancel(e){
	  if( $(":checkbox[name='chkList']:checked").length!=1 ){
	    alert("체크는 하나만 가능합니다.");
	    $(":checkbox[name='chkList']:checked").attr("checked", false);
	    return false;
	  }
	  if( $('#gita').is(":checked")==true){
			var text = $('#eu').val();
	    	if(text==''){
	    		alert('사유를 입력해주세요.');
	    		$('#eu').focus();
	    		return false;
	    	}
	  }
	  if( $('#agree').is(":checked")==false){
	    		alert('약관의 동의해주세요.');
	    		return false;
	    		
	  }
	  e.preventDefault();
	  var reason =  $(":checkbox[name='chkList']:checked").val();
	  var detail = 'none';
	  var page = $('#page').val();
	  alert(page);
	  var itemnum = $('#itemnum').val();
	  if(reason == '기타'){
		  detail = $('#eu').val();
	  }
	  $.ajax({
		  url:'order_cancel.nhn',
		  data : {"reason":reason, "detail":detail,"page":page,"itemnum":itemnum},
		  success : function(data){
			  window.close();
			  alert('취소 되었습니다.');
		  },
		  complete : function(){
	        	opener.document.location.href="mypage_order.nhn?page=${page}";
		  },
		  error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   }
	  });
	 
	}
</script>
<style>
#topBlackBar {
	border-top: 50px solid #000;
}
</style>
</head>
<body>
	
	<div id="topBlackBar">
		<h3>CANCEL</h3>
	</div>
	<hr>
	<div>
		<form action="order_cancel.nhn" onsubmit="return cancel(event);">
		<input type="hidden" id="page" name="page" value="${page}">
	<input type="hidden" id="itemnum" name="itemnum" value="${itemnum}">
		<div>
			<input type="checkbox" value="제품하자및손상" name="chkList">제품 하자및 손상<br> 
			<input type="checkbox" value="제품파손" name="chkList">제품 파손<br> 
			<input type="checkbox" value="가품" name="chkList">가품<br> 
			<input type="checkbox" value="미배송" name="chkList">미배송<br> 
			<input type="checkbox" value="상품설명누락" name="chkList">상품 설명 누락<br> 
			<input type="checkbox" value="단순변심 " name="chkList">단순 변심 <br> 
			<input type="checkbox" value="기타" id="gita" name="chkList">기타<br>
			<br>
			<textarea rows="5%" cols="100%" style="display: none" id="eu" name="eu"></textarea>
		</div>
		<div>
		        제품에 이상있을 경우 절차를 통해 확인 후 취소가 되고 <br>
			단순 변심으로 인한 취소일 경우 패널티가 적용됩니다.
			<br> 패널티는 3번 이상 취소 하실 경우 30일 동안 로그인 불가합니다.<br> 
			<input type="checkbox" value="약간 동의" id="agree">약관 동의<br>
			<input type="submit" value="취소하기" 
				style="border:1px solid #F03C02; color: #F03C02; background-color:white; margin-top: 10px;">
		</div>
</form>
	</div>
</body>
</html>