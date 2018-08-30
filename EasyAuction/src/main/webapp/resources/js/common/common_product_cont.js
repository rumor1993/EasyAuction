	$(function(){
 		diff = 0;
 		
		if(check==1){
			$("#btnBasket").val("찜하기취소")
			$("#basket_heart").attr("src","./resources/images/heart.png")
		}
		

		 start = new Date()
		diff = new Date(end-start);
		diff = diff / 1000;
		const daySec = 3600 * 24;
	

	 	console.log(diff)
	 	$("#bidTimeAdd").val(diff)
	 	
		currDay = diff / daySec;
	 	hours    = (diff % daySec) / 3600 ; 
	 	minutes  = ((diff % daySec) % 3600) / 60; 	 
	 	seconds  = ((diff % daySec) % 3600) % 60;
	 	
	 	$(".ladate").text(parseInt(currDay) + "일 " + parseInt(hours) + "시 " + parseInt(minutes) + "분 " + parseInt(seconds) + "초");
	 	
		if(diff <= 0){ 
			$('#btnBid').css("background-color","#80808082")
			$('#btnBid').css("color","red")
			$('#btnBid').val("경매종료")
			$('#btnBid').attr("data-target","#")
			$(".ladate").text("경매가 종료 되었습니다.")
			$("#btnBasket").css("background-color","#80808082")
			$("#btnBasket").css("color","red")
			$('#btnBasket').attr("onclick","#")
			$('#btnCurrBid').css("color","red")
			$('#btnCurrBid').css("background-color","#80808082")
			
		}
		
		if(start <= acutionStartDate){
			$("#btnBid").css("display","none")
		}else{
			$('#btnCurrBid').css("display","none")
		}
		
		var refreshIntervalId = setInterval(function(){
			var end = new Date($('#bidladate').val()) 
			var start = new Date()
			diff = new Date(end-start);
			diff = diff / 1000;
			const daySec = 3600 * 24;
		

		 	console.log(diff)
		 	$("#bidTimeAdd").val(diff)
		 	
			currDay = diff / daySec;
		 	hours    = (diff % daySec) / 3600 ; 
		 	minutes  = ((diff % daySec) % 3600) / 60; 	 
		 	seconds  = ((diff % daySec) % 3600) % 60;
		 	
		 	$(".ladate").text(parseInt(currDay) + "일 " + parseInt(hours) + "시 " + parseInt(minutes) + "분 " + parseInt(seconds) + "초");
		 	
			if(diff <= 0){ 
				$('#btnBid').css("background-color","#80808082")
				$('#btnBid').css("color","red")
				$('#btnBid').val("경매종료")
				$('#btnBid').attr("data-target","#")
				$(".ladate").text("경매가 종료 되었습니다.")
				$("#btnBasket").css("background-color","#80808082")
				$("#btnBasket").css("color","red")
				$('#btnBasket').attr("onclick","#")
				$('#btnCurrBid').css("color","red")
				$('#btnCurrBid').css("background-color","#80808082")
				$('#btnCurrBid').attr("data-target","#")
			}
		}, 1000)
	}) 

	function btn_list(){
		history.back();
	}
 	
 	function ea_fastbid(){
 	
 		var fastbid = $("#fastbid").val();
 		$("#ep_price").val(fastbid);
 		$("#ea_plist").submit()
 	}
	
	$('#myModal').modal("toggle");
	// 반대로 모달상태를 전환함
	
	$('#myModal2').modal("toggle");
	// 반대로 모달상태를 전환함
	
	function ea_basket(){
		$.ajax({
			url : "common_product_basket.nhn",
			type : "get",
			data : $("#Atted").serialize(),
			dataType : "json",
			success : function(data){
					console.log(data)
				 	$("#btnBasket").val(data.message)
				 	
					$('#basket_heart2').css("display","block");		
					if($("#btnBasket").val()==("찜하기취소")){
						$("#basket_heart").attr("src","./resources/images/heart.png")
						$("#basket_heart2").attr("src","./resources/images/heart.png")
						$('#basket_heart2').animate({opacity: '0'}, 1000);
						
						}else{
						$("#basket_heart").attr("src","./resources/images/heart_black.png")
						$("#basket_heart2").attr("src","./resources/images/heart_black.png")
						$('#basket_heart2').animate({opacity: '0'}, 1000);
					}
					$(".attcount").text(data.attcount)
			},error : function(){
				alert("에러")
			}
		});

		$('#basket_heart2').animate({opacity: '1'});
		
		
	}
	
	
		
	function ea_bid(){
		var regexp = /^[0-9]*$/

			bp = parseInt($("#bidprice").val()); // 입력한값
			stp = parseInt($(".stprice").text()); // 시작가
			lap = parseInt($(".laprice").text()); // 최고입찰가
			
			
			if( !regexp.test(bp) ) {
				$("#bidprice").val(v.replace(regexp,''));
				$(".errorlabel").text("숫자만 입력해주세요")
				$(".errorlabel").css("color","red")
				return false
			} 
			
			
			if(stp > bp){
				$(".errorlabel").text("입찰 시작가 보다 높은 값을 입력하세요")
				$(".errorlabel").css("color","red")
			}else if(lap > bp){
				
			$(".errorlabel").text("최고 입찰가 보다 높은 값을 입력하세요")
			$(".errorlabel").css("color","red")
			$("#bidprice").focus()
		}else{
		
		$("#gh_bidprice").val(bp)
		
		$.ajax({
			url : "common_product_bid.nhn",
			type : "get",
			data : $("#eb_ghouse").serialize(),
			dataType: 'json',
			success : function(data){ 
					console.log(data)
					$(".buyer").text(data.buyer);
					$(".laprice").text(data.bidprice);
					$(".laprice2").text("현재 최고 입찰가는 " + data.bidprice + "원 입니다.");
					$(".bidcount").text(data.bidcount);

				
					$(".errorlabel").text("입찰에 성공 했습니다.")
					$(".errorlabel").css("color","blue")
					$(".biddate").text(data.BidAddAadate +'~'+ data.BidAddLadate)
					$('#bidladate').val(data.BidAddLadate)
				
					setTimeout(function(){ 
						$('#myModal').modal("hide")					
					},1000);
					
			},error : function(){
				alert("에러")
			}
		});
		}
	}

	