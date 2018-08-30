	function basket_register(){
		var data = $("#item_num").val();
		$.ajax({
			type : "POST",
			data : "eb_itemnum="+data,
			dataType : "json",
			url : "special_product_basket.nhn",
			cache:false,
		    headers : {"cache-control":"no-cache","pragma":"no-cache"},
			success : function(response){
				$("#eb_attcount_area").empty().append(response);
				
			}
					  
		})
		$("#basket_area").empty().html("<img src='resources/img/special/yesheart.png' style='width:70px; height:70px' onClick='basket_cancel()'>")
		$('#yesheart_area').fadeIn("slow");
		$('#yesheart_area').fadeOut("slow");
	}
	
	function basket_cancel(){
		var data = $("#item_num").val();
		$.ajax({
			type : "POST",
			data : "eb_itemnum="+data,
			dataType : "json",
			url : "special_product_basket.nhn",
			cache:false,
		    headers : {"cache-control":"no-cache","pragma":"no-cache"},
			success : function(response){
				$("#eb_attcount_area").empty().append(response);
				
			}
					  
		})
		$("#basket_area").empty().html("<img src='resources/img/special/noheart.png' style='width:70px; height:70px' onClick='basket_register()'>")
		$('#noheart_area').fadeIn("slow");
		$('#noheart_area').fadeOut("slow");
	}

	

