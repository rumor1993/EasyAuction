<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Easy Auction ������</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">    
  function changeRecoin(){
	  var orgin = parseInt($('#eg_orgcoin').val());
	  var recoin = parseInt($('#eg_recoin').val());
      var total = orgin - recoin;
      if(total<recoin){
    	  alert('�ٽ� �Է����ּ���');
    	  $( '#total' ).val(orgin);
    	  $('#eg_recoin').val("");
    	  $('#eg_recoin').focus();
      }
      else{
      $( '#total' ).val(total);
      
      }
  }
  
  function fn_editFL(e)
  {
  	e.preventDefault();
  	 var orgin = parseInt($('#eg_orgcoin').val());
  	  var recoin = parseInt($('#eg_recoin').val());
  	$.ajax(
  	{
  		url : 'mypage_return_ok.nhn',
  		data : {"eg_orgcoin":orgin,"eg_recoin":recoin},
  		success : function(xh)
  				{	
  					window.close();
  				},
          complete : function(){
          	opener.document.location.href="mypage_pointlist.nhn"
          }				
  	});
  	
  	
  	
  }  
</script>
<style>
#topBlackBar {border-top: 50px solid #000;}
#eg_orgcoin{margin-left:20px;}
#eg_recoin{margin-left:35px;}
#total{margin-left:50px;}
input{border:1px solid #F03C02}
.submitbtn{border-radius:3px;background-color:#F03C02;color:white;
		margin-left:35%;width:100px;}
</style>
</head>
<body>
	<div id="topBlackBar">
		<h3>Easy Auction ������</h3>
	</div>
	<form action="mypage_return_ok.nhn">
		<br> ���� ����Ʈ <input type="number" readonly="readonly" value="${point }" id="eg_orgcoin" name="eg_orgcoin">��<br>
		<br> ��ȯ �ݾ� <input type="number" id="eg_recoin" name="eg_recoin" onkeyup="changeRecoin()">��<br>
		<br> �� �ݾ� <input type="number" id="total" name="total" readonly="readonly">��<br>
		<br> ����Ʈ ��ȯ�� ȸ�����Խ� ����Ͻ� ���·� �Աݵ˴ϴ�.<br> ��ȯ ��û�� �� �� 2�ð� �̳��� ��ȯ�˴ϴ�.<br>
		<br>
		<br> <input type="submit" class="submitbtn" value="��û" onclick="fn_editFL(event)">
	</form>

</body>
</html>