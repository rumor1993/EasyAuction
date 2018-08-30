	$(function(){
		$("#eb_wait_btn").click(function(){
			var page = $("#page").val();
			var itemnum = $("#eb_itemnum").val();
			$.ajax({
				type : "POST",
				data : "eb_itemnum="+itemnum+"&page="+page,
				url :"special_product_wait.nhn",
				cache: false,
				headers : {"cache-control":"no-cache","pragma":"no-cache"},
				success : function(response){
					location.href='special_product_cont.nhn?eb_itemnum='+itemnum+'&eb_boardnum='+data+'&page='+response+'&state=cont'
				}
					
			});
		})
	})
	$(function(){
		$("#eb_checking_btn").click(function(){
			var data = $("#eb_boardnum").val();
			var page = $("#page").val();
			var itemnum = $("#eb_itemnum").val();
			$.ajax({
				type : "POST",
				data : "eb_itemnum="+itemnum+"&eb_boardnum="+data+"&page="+page,
				url :"special_product_checking.nhn",
				cache: false,
				headers : {"cache-control":"no-cache","pragma":"no-cache"},
				success : function(response){
					location.href='special_product_cont.nhn?eb_itemnum='+itemnum+'&eb_boardnum='+data+'&page='+response+'&state=cont'
				}
				
			});
		})
	})
	
	$(function(){
		$("#eb_finish_btn").click(function(){
			var data = $("#eb_boardnum").val();
			var page = $("#page").val();
			var itemnum = $("#eb_itemnum").val();
			$.ajax({
				type : "POST",
				data : "eb_itemnum="+itemnum+"&eb_boardnum="+data+"&page="+page,
				url :"special_product_finish.nhn",
				cache: false,
				headers : {"cache-control":"no-cache","pragma":"no-cache"},
				success : function(response){
					location.href='special_product_cont.nhn?eb_itemnum='+itemnum+'&eb_boardnum='+data+'&page='+response+'&state=cont'
				}
				
			});
		})
	})