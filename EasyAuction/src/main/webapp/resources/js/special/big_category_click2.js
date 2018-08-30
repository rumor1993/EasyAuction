

$(function(){
	$(".bigbt").mouseover(function(){
		var category = $.trim($(this).attr("id"));
		$.ajax({
			type : "POST",
			data : {"category" : category},
			url : "get_small_category.nhn",
			cache:false,
		    headers : {"cache-control":"no-cache","pragma":"no-cache"},
			success : function(response){
					$("#small_category_area").show();
					$("#small_category_area").empty().prepend(response);
				}
			})
	})
	$("#small_category_area").mouseleave(function(){
		$("#small_category_area").hide();
	});
	
	
	$(".bigbt").click(function(){
		var category = $(this).attr("id");
		location.href='special_auction_list.nhn?ey_bigcategory='+category
	
	})
})
