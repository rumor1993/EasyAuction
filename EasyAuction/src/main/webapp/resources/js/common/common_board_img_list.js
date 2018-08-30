$(function(){
$(".category_img").click(function(){
		var bigcategory = $(this).attr("id");
		location.href = "./get_category_list1.nhn?bigcategory="+bigcategory;
	})
	
	state = "empty";
	page = 1;
	startpage = 5;
	endpage= 8; 
	

	for ( i = 0; i < size; i++) {
		 str = ".hello" + i;
		 a = $(str).text();
		 end = new Date(a)
		 start = new Date()
		 diff = new Date(end - start);
		diff = diff / 1000;
		const daySec = 3600 * 24;


		currDay = diff / daySec;
		hours = (diff % daySec) / 3600;
		minutes = ((diff % daySec) % 3600) / 60;
		seconds = ((diff % daySec) % 3600) % 60;

		 hello = ".enddate" + i;
		 board_btn = ".board_btn" + i;
		$(hello).text(
				"남은시간 : " + parseInt(currDay) + "일 " + parseInt(hours)
						+ "시 " + parseInt(minutes) + "분 "
						+ parseInt(seconds) + "초");

		if (diff <= 0) {
			$(hello).css("color", "red")
			$(hello).val("경매종료")
			$(hello).text("경매가 종료 되었습니다.")

			$(board_btn).css("color", "red")
			$(board_btn).text("판매종료상품")
		}
	}
	 
setInterval(function() {
		for (var i = 0; i < size; i++) {
			var str = ".hello" + i;
			var a = $(str).text();
			var end = new Date(a)
			var start = new Date()
			var diff = new Date(end - start);
			diff = diff / 1000;
			const daySec = 3600 * 24;

			currDay = diff / daySec;
			hours = (diff % daySec) / 3600;
			minutes = ((diff % daySec) % 3600) / 60;
			seconds = ((diff % daySec) % 3600) % 60;

			var hello = ".enddate" + i;
			var board_btn = ".board_btn" + i;
			$(hello).text(
					"남은시간 : " + parseInt(currDay) + "일 " + parseInt(hours)
							+ "시 " + parseInt(minutes) + "분 "
							+ parseInt(seconds) + "초");

			if (diff <= 0) {
				$(hello).css("color", "red")
				$(hello).val("경매종료")
				$(hello).text("경매가 종료 되었습니다.")

				$(board_btn).css("color", "red")
				$(board_btn).text("판매종료상품")
			}
		}
	}, 1000);
});

function salesCompleteList(){
	location.href = "./common_product_list_img.nhn?state=complete";
}


출처: http://rocabilly.tistory.com/71 [프로그램이 좋다]
function salesList(){
	location.href = "./common_product_list_img.nhn";
}

function writeform() {
	location.href = "./common_product_write.nhn"
}

function bid(eb_itemnum) {
	location.href = "./common_product_cont.nhn?eb_itemnum=" + eb_itemnum
			+ "&state=cont"
}

function addclick() {
	state = $("#state").val();
	findname = $("#find_name").val();
	findfield = $("#find_field").val();

	page++;
	startpage = startpage + 4
	endpage = endpage + 4 
	$.ajax({
		url : "common_product_list_img.nhn",
		data : {
			"start" : startpage,
			"end" : endpage,
			"state" : "complete",
			"orderby" : state,
			"addclick" : "addclick",
			"find_name" : findname,
			"find_field" : findfield
		},
		success : function(data) {
			$("#append").append(data)
		}

	})
}
function addclick2() {
	state = $("#state").val();
	findname = $("#find_name").val();
	findfield = $("#find_field").val();

	page++;
	startpage = startpage + 4
	endpage = endpage + 4
	$.ajax({
		url : "common_product_list_img.nhn",
		data : {
			"start" : startpage,
			"end" : endpage,
			"state" : "complete2",
			"orderby" : state,
			"addclick" : "addclick",
			"find_name" : findname,
			"find_field" : findfield
		},
		success : function(data) {
			$("#append").append(data)
		}

	})
}
$(function(){
	   $(".category_img").mouseover(function(){
	      var category = $.trim($(this).attr("id"));
	      $.ajax({
	         type : "POST",
	         data : {"category" : category},
	         url : "get_small_category1.nhn",
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