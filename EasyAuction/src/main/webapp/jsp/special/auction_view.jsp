<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="./resources/css/bootstrap.css">
	<link rel="stylesheet" href="./resources/css/custom2.css">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	<title>특별 물품 경매장</title>
	<style>
		body{display:inline-block;margin:0 auto;}
		#messageList::-webkit-scrollbar {display: none;}
		.box-left{width:750px;float:left;}
		.box-right{width:370px;float:right;}
		.box-header{height:70px}
		.peoplecount{float:right;margin:5px 5px 0px 0px;}
		.bidding-room{height:662px;}
		.timeinfo{display:inline-block;font-size:5pt;color:gray;}
		.priceinfo{float:right;}
		.userinfo{display:inline-block;color:#F03C02;margin-top:-10px;}
		.user-area{margin:80px 0px 0px 10px;}
		.fa-user-secret{font-size:100px;margin:70px 0px 0px 170px;}
		.admin-area{margin-top:5px;}
		.admin-speech{width:150px;height:150px;margin:10px 0px 0px 100px;}
		.img-bid-product{width:200px; height:200px; margin:20px 0px 0px 170px;border:3px solid black}
		.balloon{display:inline-block;margin:-20px 0px 0px 60px;background:lightgray;
				border-radius:3px;width:40%;height:30px;padding:24px 0px;font-size:10pt;text-align: center;}
		.fa-user{font-size:80px; margin:10px 0px 0px 3px;color:gray;}
		.btn-flat{width:150px;height:50px;margin:0px 0px -20px 15px;font-size:15pt;}
		.direct-chat-msg{font-size:12pt;margin:5px 0px 35px 0px;}
		.ea-gavel{display:none;}
		.ea-gavel{transform: rotate(0deg); -webkit-transform: rotate(0deg);z-index:100;opacity:0.9;
	    	width: 120px;height: 120px;font-size: 120px;left: 270px;top:50px;color:#F03C02;
	    	position:absolute;
	    	-webkit-transition-property: width height background-color font-size left top transform -webkit-transform color;
	    	-webkit-transition-duration:0.5s;
	    	-webkit-transition-timing-function: ease-in-out;
	    	transition-property: width height background-color font-size left top transform -webkit-transformv color;
	    	transition-duration:0.5s;
	    	transition-timing-function: ease-in-out;
	    	-webkit-transform-origin: 100% 100%;-moz-transform-origin: 100% 100%;
			-o-transform-origin: 100% 100%;transform-origin: 100% 100%;}
		.ea-gavel1{transform: rotate(-45deg); -webkit-transform: rotate(-45deg);z-index:100;opacity:0.9;
	    	width: 120px;height: 120px;font-size: 120px;left: 270px;top:50px;color:#F03C02;
	    	position:absolute;
	    	-webkit-transition-property: width height background-color font-size left top transform -webkit-transform color;
	    	-webkit-transition-duration:0.5s;
	    	-webkit-transition-timing-function: ease-in-out;
	    	transition-property: width height background-color font-size left top transform -webkit-transformv color;
	    	transition-duration:0.5s;
	    	transition-timing-function: ease-in-out;
	    	-webkit-transform-origin: 100% 100%;-moz-transform-origin: 100% 100%;
			-o-transform-origin: 100% 100%;transform-origin: 100% 100%;}
		
	</style>
	<script src="./resources/js/jquery-3.3.1.js"></script>
	<script src="./resources/js/bootstrap.js"></script>
	<script type="text/javascript">
	var gavelnum = 0;
	var start = false;
	var btnState = "응찰불가";
	var intervalID;
	var infinit;
	var currPoint = 0;
	function updateTransition() {
		var el = document.querySelector("div.ea-gavel");
		gavelnum += 1
		if(gavelnum == 1){
			$(".ea-gavel").css("display", "block");
		} else if(gavelnum > 8){
			$(".ea-gavel").css("display", "none");
			clearInterval(intervalID);
		}
		
	  	if (el) {
	    	el.className = "ea-gavel1";
	  	} else {
	    	el = document.querySelector("div.ea-gavel1");
	    	el.className = "ea-gavel";
	  	}
	  	
	  	return el;
	}
		  
	function submitFunction(){
		if($("#sh_bidprice").val() == "" || $("#sh_bidprice").val() == null){
			$("#sh_bidprice").val(0);
		}
		
		if(start){
			if(btnState == "응찰가능"){
				$.ajax({
					type: "POST",
					url: "./special_auction_bid.nhn",
					data: $(".form_bidprice").serialize()
				});
			} else if(btnState == "응찰불가"){
				return false;
			}
		} else {
			alert('아직 안되요');
			return false;
		}
	}
	
	function cancelFunction(){
		$.ajax({
			type: "GET",
			url: "./special_auction_getout.nhn",
			data: "eb_itemnum=" + $("#eb_itemnum").val(),
			success:function(result){
				window.close();
			}
		
		});
	}
	
	function autoClosingAlert(selector, delay){
		var alert = $(selector).alert();
		alert.show();
		window.setTimeout(function(){
			alert.hide()
		}, delay);
	}
	
	function chatListFunction(){
		var arrPrice = null;
		var sendData = "esl_num=" + $("#esl_num").val() + "&sh_bidnum=" + $("#sh_bidnum").val()
				+ "&eb_itemnum=" + $("#eb_itemnum").val() + "&eb_itemname=" + $("#eb_itemname").val()
				+ "&sh_bidprice=" + $("#sh_bidprice").val() + "&sh_buyer=" + "admin" + "&sh_comment=" + $("#sh_comment").val()
		$.ajax({
			type: "POST",
			url: "./special_auction_adcomment.nhn",
			data: sendData,
			success: function(data){
				$("#messageList").html("");
				if(data == "") return;
				arrPrice = new Array(data.length);
				$(data).each(function(index, item){
					arrPrice[index] = item.sh_bidprice;
					addChat(item.sh_buyer, item.sh_comment, item.sh_biddate, arrPrice[index]);
					
					if(item.sh_adkey == '입찰'){
						start = true;
					} else if (item.sh_adkey == '종료'){
						clearInterval(infinit);
						intervalID = window.setInterval(updateTransition, 700);
						
					}
				});
				
				for(var i = 0; i < arrPrice.length; i++){
					for(var j = i; j < arrPrice.length; j++){
						if(arrPrice[i] < arrPrice[j]){
							var changePrice = arrPrice[i];
							arrPrice[i] = arrPrice[j];
							arrPrice[j] = changePrice;
						}
					}
				}
				
				$("#sh_bidprice").val(arrPrice[0]);
				$(".priceinfo").html($("#sh_bidprice").val() + "원");
				currentPrice();
			}
		});
	}
	
	function currentPrice(){
		
		$.ajax({
			type: "POST",
			url: "./special_auction_compare.nhn",
			success: function(result){
				currPoint = result.em_point;
			}
		});
		
		$.ajax({
			type: "POST",
			url: "./special_auction_price.nhn",
			data: $(".form_bidprice").serialize(),
			success: function(result){
				if(result.sh_buyer != null && result.sh_buyer != ""){
					$(".userinfo").html(result.sh_buyer);
					$(".tell-us").html("님이 입찰되셨습니다.");
				}
				if(currPoint < $("#sh_bidprice").val()){
					$(".bidbtn").css("background", "gray");
					btnState = "응찰불가";
				} else {
					if(result.sh_bidprice == $("#sh_bidprice").val() && 
							result.sh_buyer == $("#sh_buyer").val()){
						$(".bidbtn").css("background", "gray");
						btnState = "응찰불가";
					} else {
						$(".bidbtn").css("background", "#bd362f");
						btnState = "응찰가능";
					}
				}
				
			}
		});
		
		
	}
	
		
	function addChat(chatName, chatContent, chatTime, chatPrice){
		
		$('#messageList').append('<div class="direct-chat-msg">'
				+ '<div class="direct-chat-info clearfix">'
				+ '<span class="direct-chat-name pull-left">' + chatName + '</span>'
				+ '<span class="direct-chat-timestamp pull-right">' + chatTime + '</span>'
				+ '</div>'
				+ '<div>' + chatContent + "</div></div>");
	
		$('#messageList').scrollTop($('#messageList')[0].scrollHeight);
	}

	
	function getUserCount(){
		
		$.ajax({
			type:"GET",
			url: "./special_auction_usercount.nhn",
			data: "eb_itemnum=" + $("#eb_itemnum").val(),
			success: function(result){
				if(result <= 30){
					for(var j = 1; j <= result; j++){
						var userCount = ".fa-user" + j;
						$(userCount).css("color", "black");
					}
					for(var j = (result*1 + 1); j <= 30; j++){
						var userCount = ".fa-user" + j;
						$(userCount).css("color", "gray");
					}
				} else {
					$(".fa-user").css("color", "black")
				}
				$(".peoplecount").html(result + "명");
			}
		});
	}
	
	function biddingClock(){
		var cal = document.getElementById("calendarinfo");
		var clock = document.getElementById("clockinfo");	//출력할 장소 선택
		var currentDate = new Date();	//현재시간
		var calendar = currentDate.getFullYear() + ". " + (currentDate.getMonth()+1) + ". " + currentDate.getDate()	//현재날짜
		var amPm = 'AM';	//초기값 AM
		var currentHours = addZeros(currentDate.getHours(), 2);
		var currentMinute = addZeros(currentDate.getMinutes(), 2);
		var currentSeconds = addZeros(currentDate.getSeconds(), 2);
		
		if(currentHours >= 12){
			amPm = "PM";
			currentHours = addZeros(currentHours - 12, 2);
		}
		
		cal.innerHTML = calendar;
		clock.innerHTML = currentHours + "시 " + currentMinute + "분 " + currentSeconds + "초";
	}
	
	function addZeros(num, digit) { // 자릿수 맞춰주기
  		var zero = '';
  		num = num.toString();
  		if (num.length < digit) {
  	 		for (i = 0; i < digit - num.length; i++) {
  	    	zero += '0';
  	    	}
  	  	}
  	  	return zero + num;
  	}
	
	function getInfiniteChat(){
		infinit = setInterval(function(){
			getUserCount();
			biddingClock();
			chatListFunction();
		}, 1000);
	}
	
	
	$(document).ready(function(){
		
		$(".priceinfo").html($('#sh_bidprice').val());
		getInfiniteChat();
	});

	</script>
	
</head>
<body>

<div class="bootstrap snippets">
	
    <div class="col-md-3">
	    <div class="box-left">
		    <div class="box box-danger direct-chat direct-chat-primary">
	        <div class="box-body">
	          <!-- Conversations are loaded here -->
	          <div class="direct-chat-messages bidding-room">
	          	<div class="admin-area">
	          		<img src="./resources/images/businessman-behind-podium-giving-a-speech.png" class="admin-speech">
	          		<img src="./resources/upload${board.eb_file}" class="img-bid-product">
	          		<span class="peoplecount">0명</span>
	          	</div>
	          	<div class="balloon"><h3 class="userinfo"></h3><span class="tell-us"></span></div>
	          	<div class="ea-gavel"><i class="fa fa-legal" aria-hidden="true"></i></div>
	          	<div class="user-area">
		          	<c:forEach var="i" begin="1" end="30">
		          		<i class="fa fa-user fa-user${i}" aria-hidden="true"></i>
		          	</c:forEach>
	          	</div>
	          </div>
	        </div>
		  </div>
	    </div>
      <!-- DIRECT CHAT PRIMARY -->
      <div class="box-right">
	      <div class="box box-danger direct-chat direct-chat-primary">
	        <div class="box-header with-border">
	          <h2 class="priceinfo">0원</h2>
	          <div class="timeinfo">
		          <h5 id="calendarinfo"></h5>
		    	  <h4 id="clockinfo"></h4>
	          </div>
	        </div>
	        <!-- /.box-header -->
	        <div class="box-body">
	          <!-- Conversations are loaded here -->
	          <div class="direct-chat-messages" id="messageList">
	          </div>
	          <!--/.direct-chat-messages-->
	        </div>
	        <!-- /.box-body -->
	        <div class="box-footer">
	          <form action="#" method="post" class="form_bidprice">
	          	<input type="hidden" name="sh_bidnum" id="sh_bidnum" value="${shlist.sh_bidnum}">
			  	<input type="hidden" name="esl_num" id="esl_num" value="${shlist.esl_num}">
			  	<input type="hidden" name="eb_itemnum" id="eb_itemnum" value="${shlist.eb_itemnum}">
			  	<input type="hidden" name="eb_itemname" id="eb_itemname" value="${shlist.eb_itemname}">
	          	<input type="hidden" name="sh_buyer" id="sh_buyer" class="form-control" value="${sessionScope.id}" readonly>
	            <div class="input-group">
	              <input type="hidden" name="sh_bidprice" id="sh_bidprice" value="${shlist.eb_stprice}">
	              <input type="hidden" name="sh_comment" id="sh_comment" class="form-control">
	                 <span class="input-group-btn">
	           			<button type="button" class="btn btn-danger btn-flat bidbtn" onClick="submitFunction()">응찰하기</button>
	           			<button type="button" class="btn btn-inverse btn-flat exitbtn" onClick="cancelFunction()">나가기</button>
	           		</span>
	            </div>
	            <div class="clearfix"></div>
	          </form>
	           
	        </div>
	        <!-- /.box-footer-->
	      </div>
	      <!--/.direct-chat -->
	    </div>
    </div>
</div>
<script type="text/javascript">
		
	</script>

</body>
</html>