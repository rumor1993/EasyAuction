

$(function(){
	var date = new Date()
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	if(month < 10){
		 month = '0'+month
	 }
	var day = date.getDate();
	if(day < 10){
		 day = '0'+day
	 }
	var sysdate = year+"-"+month+"-"+day;
	var sysdate_substring = sysdate.substring(0,4)+sysdate.substring(5,7)+sysdate.substring(8,10);
	
	var open_time = $("#open_time").val();
	var open_time_mill = new Date($("#open_time").val()).getTime();
	var open_substring = open_time.substring(0,4)+open_time.substring(5,7)+open_time.substring(8,10)
	var ey_smallcategory = $("#ey_smallcategory").val();
	var ey_bigcategory = $("#ey_bigcategory").val();
	var range = $("#range").val();
	
	setInterval(function (){
		var systime = new Date().getTime();
		var itemnum = $("#item_num").val();
			var remain_time = open_time_mill-systime;
			var days = Math.floor(remain_time/1000/60/60/24);
			var hours = Math.floor(remain_time/1000/60/60)-(days*24);
			var minutes = Math.floor(remain_time/1000/60)-(days*24*60)-(hours*60);
			var second = Math.floor(remain_time/1000)-(days*24*60*60)-(hours*60*60)-(minutes*60);
			$("#remain_time").empty().html(days+'일 ' + hours+"시간 " + minutes+"분 " + second+"초");
			if(days == 0){
				$("#remain_time").empty().html(hours+"시간 " + minutes+"분 " + second+"초");
				if(hours == 0){
					$("#remain_time").empty().html(minutes+"분 " + second+"초");
				}
			}
			
			if(remain_time < 0){
				$("#remain_time").empty().html("오픈중");
				location.href='special_auction_info_open.nhn?itemnum='+itemnum+'&ey_smallcategory='+ey_smallcategory+'&ey_bigcategory='+ey_bigcategory+'&range='+range
			}
			if(open_substring < sysdate_substring){
				location.href='special_auction_info_finish.nhn?itemnum='+itemnum+'&ey_smallcategory='+ey_smallcategory+'&ey_bigcategory='+ey_bigcategory+'&range='+range
			}

	}, 1000);
})

	

